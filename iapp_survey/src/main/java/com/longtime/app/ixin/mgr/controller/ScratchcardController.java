package com.longtime.app.ixin.mgr.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Lists;
import com.longtime.app.ixin.mgr.channel.model.ChannelResourceEntity;
import com.longtime.app.ixin.mgr.channel.model.ChannelResourceVo;
import com.longtime.app.ixin.mgr.fodder.service.FodderService;
import com.longtime.app.ixin.mgr.model.RewardActivity;
import com.longtime.app.ixin.mgr.model.RewardExplain;
import com.longtime.app.ixin.mgr.model.RewardRuleContainer;
import com.longtime.app.ixin.mgr.model.RewardRuleContainerVO;
import com.longtime.app.ixin.mgr.service.IRewardService;
import com.longtime.common.utils.LoginSessionHelper;
import com.longtime.common.utils.Page;

/**
 * 刮刮卡
 *
 */
@Controller
@RequestMapping("/mgr/scratchcard/")
public class ScratchcardController {

	private static final Logger logger = LoggerFactory.getLogger(ScratchcardController.class);
	@Resource(name="rewardService")
	private IRewardService rewardService;
	@Resource(name="fodderService")
	private FodderService fodderService;
	
	@RequestMapping("createscratchcard")
	public String createScratchcard(HttpServletRequest request,ModelMap model){
		Map<String,String> params = fodderService.getRequiredParams();
		String token = null;
		if(MapUtils.isNotEmpty(params)){
			token =params.get("uploadToken");
		}
		model.put("uptoken", token);
		return "/mgr/ixin/lottery/scratchcardcreate";
	}
	
	@RequestMapping("addRewardFirstStep")
	public String saveScratchCardFirstStep(HttpServletRequest request,ModelMap model){
		String domain = LoginSessionHelper.getCurrentDomain(request);
		String title1 = request.getParameter("title1");
		String picUrl1 = request.getParameter("picUrl1");
		String content1 = request.getParameter("content1");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String keys = request.getParameter("keys");
		String replyContent = request.getParameter("hid_replyContent");
		String content=request.getParameter("content");//兑奖说明
		String rewardType = request.getParameter("rewardType");//抽奖类型
		
		RewardActivity reward = new RewardActivity();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		try {
			reward.setStartDate(df.parse(startDate).getTime());
			reward.setEndDate(df.parse(endDate).getTime());
			reward.setCreateDate(new Date().getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		reward.setExplain1(new RewardExplain(title1, content1, picUrl1));
		
		reward.setExplain2(new RewardExplain(title1, content, picUrl1));
		
		if(!StringUtils.isBlank(keys)) {
			reward.setKey(keys.toLowerCase());
		}
		reward.setReplyContent(replyContent);
		reward.setIsCreateFinish(0);
		reward.setIsDelete(0);
		rewardType="0";
		if ("0".equals(rewardType)) {
			reward.setRewardType(RewardActivity.REWARD_TYPE_CARD);
		}else{
			reward.setRewardType(RewardActivity.REWARD_TYPE_ROCK);
		}
		reward.setDomain(domain);
		String id = rewardService.addRewardFirstStep(reward);
		if(!StringUtils.isBlank(id)){
			model.put("id", id);
			model.put("title1", title1);
			return "/mgr/ixin/lottery/jiangxiangshezhi";
		}
		return "/mgr/ixin/lottery/scratchcardcreate";
	}
	/*
	@RequestMapping("addRewardSecondStep")
	public String saveScratchCardSecondStep(HttpServletRequest request,ModelMap model){
		String id = request.getParameter("id");
		String title2 = request.getParameter("title2");
		String picUrl2 = request.getParameter("picUrl2");
		String content2 = request.getParameter("content2");
		RewardExplain explain = new RewardExplain(title2, content2, picUrl2);
		if(!StringUtils.isBlank(id)) {
			String ids = rewardService.addRewardSecondStep(id, explain);
			model.put("id", id);
			if(!StringUtils.isBlank(ids)){
				return "/mgr/ixin/lottery/jiangxiangshezhi";
			}
			return "/mgr/ixin/lottery/creatcard_stemp2";
		}
		return "mgr/ixin/lottery/rewardindex";
		
	}*/
	
	@RequestMapping("addRewardThirdStep")
	@ResponseBody
	public String saveScratchCardThirdStep(@RequestBody RewardRuleContainerVO reward, HttpServletRequest request){
		String domain = LoginSessionHelper.getCurrentDomain(request);
		reward.setDomain(domain);
		boolean result = rewardService.addRewardThirdStep(reward);
		if(result) {
			if(!"1".equals(reward.getToNext())){
				return "success";
			} else {
				return reward.getRewardId();
			}
		} else {
			return null;
		}
	}
	
	@RequestMapping("addNewContainer")
	public String addNewContainer(HttpServletRequest request,ModelMap model){
		String id = request.getParameter("rewardId");
		model.put("id", id);
		return "/mgr/ixin/lottery/jiangxiangshezhi";
	}
	
	@RequestMapping("scratchcardindex")
	public String listScratchcard(HttpServletRequest request,ModelMap model){
		
		return "mgr/ixin/lottery/rewardindex";
	}
	
	@RequestMapping("deletereward")
	@ResponseBody
	public String deleteReward(HttpServletRequest request,ModelMap map){
		String id = request.getParameter("id");
		boolean flag = rewardService.deleteRewardById(id);
		if(flag)
			return "true";
		else 
			return "";
	}
	
	@RequestMapping("stoprewardactive")
	@ResponseBody
	public String stopRewardActive(HttpServletRequest request,ModelMap model){
		String id = request.getParameter("rewardId");
		boolean flag = rewardService.stopRewardActive(id);
		if(flag)
			return "true";
		else
			return "";
	}
	
	@RequestMapping("recordindex")
	public String recordIndex(HttpServletRequest request,ModelMap model){
		String id = request.getParameter("id");
		model.put("rewardId", id);
		return "mgr/ixin/lottery/recordindex";
	}
	
	@RequestMapping("modifyrewardpage")
	public String modifyScratchcard(HttpServletRequest request,ModelMap model){
		String id = request.getParameter("id");
		RewardActivity reward = rewardService.getRewardById(id);
		Map<String,String> params = fodderService.getRequiredParams();
		String token = null;
		if(MapUtils.isNotEmpty(params)){
			token =params.get("uploadToken");
		}
		model.put("reward", reward);
		model.put("uptoken", token);
		return "/mgr/ixin/lottery/rewardmodifystep1";
	}
	
	@RequestMapping(value="modifyrewardfirststep",method=RequestMethod.POST )
	public String modifyScratchCardFirstStep(HttpServletRequest request,ModelMap model){
		String id = request.getParameter("rewardId");
		String title1 = request.getParameter("title1");
		String picUrl1 = request.getParameter("picUrl1");
		String content1 = request.getParameter("content1");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String keys = request.getParameter("keys");
		String replyContent = request.getParameter("hid_replyContent");
		String content=request.getParameter("content");//兑奖说明
		String rewardType = request.getParameter("rewardType");
		RewardActivity reward = new RewardActivity();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String domain = LoginSessionHelper.getCurrentDomain(request);
		reward.setId(id);
		rewardType = "0";
		if ("0".equals(rewardType)) {
			reward.setRewardType(RewardActivity.REWARD_TYPE_CARD);
		}else{
			reward.setRewardType(RewardActivity.REWARD_TYPE_ROCK);
		}

		try {
			reward.setStartDate(df.parse(startDate).getTime());
			reward.setEndDate(df.parse(endDate).getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		reward.setExplain1(new RewardExplain(title1, content1, picUrl1));
		reward.setExplain2(new RewardExplain(title1, content, picUrl1));
		if(!StringUtils.isBlank(keys)) {
			reward.setKey(keys.toLowerCase());
		}
		reward.setDomain(domain);
		reward.setReplyContent(replyContent);
		boolean flag = rewardService.modifyRewardFirstStep(reward);
		reward = rewardService.getRewardById(id);
		if(flag){
			List<RewardRuleContainer> containers = rewardService.getRewardRuleContainers(id);
			model.put("reward", reward);
			model.put("containers", containers);
			return "mgr/ixin/lottery/rewardmodifystep3";
		}
		return "redirect:modifyrewardpage.xhtml?id="+id;
	}
	/*
	@RequestMapping("modifyrewardsecondstep")
	public String modifyScratchCardSecondStep(HttpServletRequest request,ModelMap model){
		String id = request.getParameter("id");
		String title2 = request.getParameter("title2");
		String picUrl2 = request.getParameter("picUrl2");
		String content2 = request.getParameter("content2");
		RewardExplain explain = new RewardExplain(title2, content2, picUrl2);
		if(!StringUtils.isBlank(id)) {
			String ids = rewardService.addRewardSecondStep(id, explain);
			if(!StringUtils.isBlank(ids)){
				RewardActivity reward = rewardService.getRewardById(id);
				List<RewardRuleContainer> containers = rewardService.getRewardRuleContainers(id);
				model.put("reward", reward);
				model.put("containers", containers);
				return "mgr/ixin/lottery/rewardmodifystep3";
			}
			return "mgr/ixin/lottery/rewardindex";
		}
		return "mgr/ixin/lottery/rewardindex";
		
	}*/
	
	@RequestMapping("toModifyContainers")
	public String toModifyContainers(HttpServletRequest request,ModelMap model){
		String id = request.getParameter("id");
		RewardActivity reward = rewardService.getRewardById(id);
		List<RewardRuleContainer> containers = rewardService.getRewardRuleContainers(id);
		model.put("reward", reward);
		model.put("containers", containers);
		return "mgr/ixin/lottery/rewardmodifystep3";
	}
	
	@RequestMapping("modifyContainer")
	public String modifyContainer(HttpServletRequest request,ModelMap model){
		String id = request.getParameter("id");
		RewardRuleContainer container = rewardService.getRewardRuleContainerById(id);
		model.put("container", container);
		model.put("maxWeight", container == null ?0:(container.getItems()== null ?0:container.getItems().size()));
		return "mgr/ixin/lottery/modifyContainer";
		
	}
	
	@RequestMapping("toAddContainer")
	public String toAddContainer(HttpServletRequest request,ModelMap model){
		String id = request.getParameter("id");
		model.put("id", id);
		return "/mgr/ixin/lottery/jiangxiangshezhi";
		
	}
	
	@RequestMapping("deleteContainer")
	@ResponseBody
	public String deleteContainer(HttpServletRequest request,HttpServletResponse response){
		String id = request.getParameter("id");
		if(StringUtils.isBlank(id)){
			return null;
		}
		boolean result = rewardService.deleteRewardRuleContainer(id);
		if(result) {
			return "success";
		} else {
			return null;
		}
	}
	
	@RequestMapping("updateContainer")
	@ResponseBody
	public String updateContainer(@RequestBody RewardRuleContainerVO reward, HttpServletRequest request){
		boolean result = rewardService.updateContainer(reward);
		if(result) {
			return "success";
		} else {
			return null;
		}
	}
	
	@RequestMapping("modifyrewardthirdstep")
	@ResponseBody
	public String modifyScratchCardThirdStep(@RequestBody RewardActivity reward, HttpServletRequest request){
		boolean result = rewardService.modifyRewardThirdStep(reward);
		if(result) {
			return "success";
		} else {
			return null;
		}
	}
	
	@RequestMapping("rewardlist")
	@ResponseBody
	public List<ChannelResourceVo> rewardlist(HttpServletRequest request){
		int currentpage=NumberUtils.toInt(request.getParameter("currentpage"),Page.CURRENTPAGE_DEFAULT);
		int pagesize=NumberUtils.toInt(request.getParameter("pagesize"),Page.PAGESIZE_DEFAULT);
		String param=request.getParameter("param");
		String domain=LoginSessionHelper.getCurrentDomain(request);
		
		Page pager=new Page(currentpage,pagesize);
		int totalsize=this.rewardService.getRewardCount(domain, param);
		pager.setTotal_size(totalsize);
		
		List<RewardActivity> rewardActivities=this.rewardService.getRewardByDomain(domain, currentpage, pagesize, param);
		
		List<ChannelResourceVo> list=Lists.newArrayList();
		
		if(rewardActivities!=null && rewardActivities.size()>0){
			for(RewardActivity rewardActivity:rewardActivities){
				ChannelResourceVo channelResourceVo=new ChannelResourceVo();
				
				channelResourceVo.setCover(rewardActivity.getExplain1().getPicUrl());
				channelResourceVo.setCreatetime(rewardActivity.getCreateDate());
				channelResourceVo.setPager(pager);
				channelResourceVo.setRemark(rewardActivity.getExplain1().getContent());
				channelResourceVo.setResourceid(rewardActivity.getId());
				channelResourceVo.setTitle(rewardActivity.getExplain1().getTitle());
				channelResourceVo.setType(ChannelResourceEntity.REWARD_RESTYPE);
				channelResourceVo.setCreatorName(rewardActivity.getCreatorName());
				channelResourceVo.setCreator(rewardActivity.getCreator());
				list.add(channelResourceVo);
			}
		}
		return list;
	}
	
	
	
	
}
