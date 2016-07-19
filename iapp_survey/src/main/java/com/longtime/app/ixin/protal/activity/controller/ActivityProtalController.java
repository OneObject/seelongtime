package com.longtime.app.ixin.protal.activity.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.longtime.ajy.support.service.CreditServiceWrapper;
import com.longtime.app.base.util.Constant;
import com.longtime.app.ixin.mgr.model.ActivityApplyRecord;
import com.longtime.app.ixin.mgr.model.ActivityInfo;
import com.longtime.app.ixin.mgr.model.ActivityItem;
import com.longtime.app.ixin.mgr.model.RewardActivity;
import com.longtime.app.ixin.mgr.model.RewardCardItem;
import com.longtime.app.ixin.mgr.model.RewardRuleContainer;
import com.longtime.app.ixin.mgr.service.IActivityItemService;
import com.longtime.app.ixin.mgr.service.IActivityService;
import com.longtime.app.ixin.mgr.service.IRewardService;
import com.longtime.app.ixin.protal.WXOauthFilter;
import com.longtime.app.ixin.protal.WXOauthFilter.Util;
import com.longtime.app.ixin.protal.activity.vo.ApplyRewardVO;
import com.longtime.common.utils.LoginSessionHelper;


@Controller
@RequestMapping("/protal/activity/")
public class ActivityProtalController {

	@Resource(name="activityService")
	private IActivityService activityService;
	@Resource(name="rewardService")
	private IRewardService rewardService;
	
	@Resource(name = "activityItemService")
	private IActivityItemService activityItemService;
	
	@RequestMapping("activitylist")
	public String activitylist(HttpServletRequest request,ModelMap modelMap){
		String domain=LoginSessionHelper.getCurrentDomain(request);
		List<ActivityInfo> list=activityService.getUnclosedActivityList(domain);
		modelMap.put("activitylist",list);
		return "protal/activity/activitylist";
	}
	
	
	
	@RequestMapping("activitypage")
	public String applyActivityPage(HttpServletRequest request, ModelMap model) {
		String id = request.getParameter("activityId");
		
		
		boolean isSign = "sign".equals(request.getParameter("code")); // 是否签到
		
		// 从cookie获取openid
		ActivityInfo info = activityService.getActivityById(id);
		String openId = WXOauthFilter.Util.getCurrentUserOpenIdFromCookie(request, info.getDomain());
		
		if(StringUtils.isBlank(openId)){
			openId = request.getParameter("openId");
		}
		
		ActivityApplyRecord record = activityService.getSpecifiedApplyRecord(id, openId);
		if(null!=record){
			model.put("baseuid", record.getBaseuid());
		}
		model.put("currTime", new Date().getTime());
		model.put("info", info);
		model.put("record", record);
		model.put("openId", openId);
		return (isSign)? "protal/activity/activitysign":"protal/activity/activityapply";
	}
	
	@RequestMapping("apply")
	@ResponseBody
	public int apply(HttpServletRequest request) {
		String domain = LoginSessionHelper.getCurrentDomain(request);
		String activityId = request.getParameter("activityId");
		String openId = request.getParameter("openId");
		String baseuid = request.getParameter("baseuid");
		int result = activityService.applyActivity(activityId, openId,baseuid);
		//报名获取积分
		CreditServiceWrapper.createCreditLogForOpenId(openId,Constant.CREDIT_ACTION_ACTIVITY_APPLY, activityId, domain);
		return result;
	}
	
	@RequestMapping("signin")
	@ResponseBody
	public boolean signin(HttpServletRequest request) {
		String domain = LoginSessionHelper.getCurrentDomain(request);
		String activityId = request.getParameter("activityId");
		String openId = request.getParameter("openId");
		String code = request.getParameter("code");
		String baseuid = request.getParameter("baseuid");
		boolean flag = activityService.signin(activityId, openId, code,baseuid);
		//报名获取积分
		CreditServiceWrapper.createCreditLogForOpenId(openId,Constant.CREDIT_ACTION_ACTIVITY_SIGNIN, activityId, domain);
		return flag;
	}
	
	@RequestMapping("cardreward")
	public String cardReward(HttpServletRequest request, ModelMap model) {
		String id = request.getParameter("rewardId"); //抽奖id
		
		String userId = Util.getCurrentUserOpenIdFromCookie(request);
		if(StringUtils.isBlank(userId)){
			userId = request.getParameter("openId");
		}
		
		RewardActivity reward = rewardService.getRewardById(id);
		
		
		boolean flag = true; // 状态标记，是否跳转到刮奖页面
		String str = "";//如果不能参加抽奖，用于提示
		
/*		
		//  为sml沙龙活动控制，必须签到活动报名才能刮奖
		List<ActivityApplyRecord> records = activityService.getAllRecordByUid(userId);
		
		if(records == null || records.isEmpty()) {
			str = "本次活动仅限微信签到用户参与，请先签到，签到后您将获得抽奖资格。";
			model.put("str", str);
			return "protal/reward/weiqiandao";
		}
*/		
		
/*
 * 如果刮刮卡是活动中的，则判断用户是否签到活动		
 */
		List<ActivityItem> list = this.activityItemService.listBySid(reward.getId());
		if(!CollectionUtils.isEmpty(list)){
			boolean isSign = false;
			for(ActivityItem activityItem : list){
				ActivityInfo activityInfo = this.activityService.getActivityById(activityItem.getAid());
				if (activityInfo==null){
					continue;
				}
				//先判断活动是否需要签到
				if (activityInfo.getSignin()==1){
					// 判断用户是否签到
					ActivityApplyRecord tmp = activityService.getSpecifiedApplyRecord(activityItem.getAid(),userId);
					if(tmp != null && 1==tmp.getIsSignin()){
						isSign = true;
					}
				}else{
					//如果活动无需签到，则可以直接抽奖
					isSign = true;
				}
				if (isSign){
					break;
				}
			}
			if(!isSign){
				// 没有签到
				str = "本次活动仅活动签到用户参与，请先签到，签到后您将获得抽奖资格。";
				model.put("str", str);
				return "protal/reward/weiqiandao";
			}
			
		}
		
		
		
		RewardRuleContainer rewardRuleContainer = rewardService.getRuleContainer(id);
		int applyCount = 0;
		if(rewardRuleContainer != null){
			applyCount = rewardService.getApplyCount(id,rewardRuleContainer.getId(), userId);
		}
		ApplyRewardVO vo = rewardService.getWinnerRecordByUid(id, userId);
		if(vo != null) {
			if(!StringUtils.isBlank(vo.getPhone())) {
				model.put("vo", vo);
				return "protal/reward/result";
			}
			model.put("iswining", 1);
		} else {
			if(reward.getStatus() == 0) {
				str = "抽奖活动还未开始！";
				flag = false;
			} else if(reward.getStatus() == 2) {
				flag = false;
				str = "抽奖活动已经结束！";
			} else if(rewardRuleContainer == null){
				flag = false;
				str = "本轮抽奖还未开始，敬请等待！";
			}else if(rewardRuleContainer.getMaxAttendNum() != 0 && rewardRuleContainer.getMaxAttendNum() <= applyCount) {
				str = "你已经用完了本轮抽奖机会，不能再参加了！";
				flag = false;
			}
			model.put("iswining", 0);
		}
	
		if(!flag) {
			model.put("str", str);
			return "protal/reward/weiqiandao";
		}
		
		List<RewardCardItem> awards = rewardService.getAwards(rewardRuleContainer.getId());
		
		model.put("vo", vo);
		model.put("reward", reward);
		model.put("awards", awards);
		model.put("applyCount", applyCount);
		model.put("openId", userId);
		model.put("container", rewardRuleContainer);
		if (reward.getRewardType().equals(RewardActivity.REWARD_TYPE_CARD)||vo != null) {
			return "protal/reward/guaguaka2";
		}else{
			return "protal/reward/rock";
		}
	}
	
	public static void main(String[] args) {
		System.out.println(System.currentTimeMillis());
	}
	
	@RequestMapping("applycardreward")
	@ResponseBody
	public ApplyRewardVO applyCardReward(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		String id = request.getParameter("rewardId");
		String userId = request.getParameter("openId");
		String containerId = request.getParameter("containerId");
		
		ApplyRewardVO vo = rewardService.applyCardReward(id, userId,containerId);
		if(vo != null)
			return vo;
		else
			return null;
	}
	@RequestMapping("detail")
	public String rewardDetail(HttpServletRequest request,ModelMap model) {
		
		String id = request.getParameter("rewardId");
		String userId = Util.getCurrentUserOpenIdFromCookie(request);
		if(StringUtils.isBlank(userId)){
			userId = request.getParameter("openId");
		}
		
		RewardActivity reward = rewardService.getRewardById(id);
		RewardRuleContainer rewardRuleContainer = rewardService.getRuleContainer(id);
		int applyCount = 0;
		if(rewardRuleContainer != null){
			applyCount = rewardService.getApplyCount(id,rewardRuleContainer.getId(), userId);
		}
		model.put("reward", reward);
		model.put("applyCount", applyCount);
		model.put("container", rewardRuleContainer);
		
		return "protal/reward/detail";
	}
	
	@RequestMapping("submitreward")
	@ResponseBody
	public boolean submitReward(HttpServletRequest request, ModelMap map){
		String code = request.getParameter("code");
		String awardId = request.getParameter("awardId");
		String recordId = request.getParameter("recordId");
		String tel = request.getParameter("tel");
		ApplyRewardVO vo = rewardService.doFinishReward(code, awardId, recordId, tel);
		//map.put("vo", vo);
		//return "protal/reward/result";
		
		return true;
	}
}
