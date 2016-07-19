package com.longtime.app.ixin.mgr.controller;

import com.longtime.app.base.model.User;
import com.longtime.app.base.service.UserService;
import com.longtime.app.ixin.mgr.model.ActivityApplyRecordVO;
import com.longtime.app.ixin.mgr.model.ActivityInfo;
import com.longtime.app.ixin.mgr.model.IXinUser;
import com.longtime.app.ixin.mgr.model.RewardActivity;
import com.longtime.app.ixin.mgr.model.RewardResultVO;
import com.longtime.app.ixin.mgr.service.IActivityService;
import com.longtime.app.ixin.mgr.service.IRewardService;
import com.longtime.app.ixin.mgr.service.IXinUserService;
import com.longtime.common.utils.LoginSessionHelper;
import com.longtime.common.utils.Page;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("ixNoFilterController")
@RequestMapping("/mgr/ixinnofilter/")
public class IXNoFilterController {
	private static final Logger logger = LoggerFactory
			.getLogger(IXNoFilterController.class);

	@Resource(name = "activityService")
	private IActivityService activityService;
	@Resource(name = "rewardService")
	private IRewardService rewardService;

	@Resource(name = "userService")
	private UserService userService;
	@Resource(name = "iXinUserService")
	private IXinUserService iXinUserService;

	@RequestMapping("activitylist")
	public String activityList(HttpServletRequest request, ModelMap model) {
		int currPage = Integer.parseInt(request.getParameter("currPage"));
		String domain = LoginSessionHelper.getCurrentDomain(request);
		List<ActivityInfo> list = activityService.getActivityList(domain,
				currPage);
		int totleSize = activityService.getActivityCount(domain);
		model.put("activityList", list);
		Page pager = new Page(currPage, 20);
		pager.setTotal_size(totleSize);
		model.put("pager", pager);
		return "mgr/ixin/activity/activitylist";
	}

	@RequestMapping("applyRecordList")
	public String applyRecordList(HttpServletRequest request, ModelMap model) {
		String domain = LoginSessionHelper.getCurrentDomain(request);
		int currPage = Integer.parseInt(request.getParameter("currPage"));
		String id = request.getParameter("id");
		List<ActivityApplyRecordVO> records = activityService
				.getApplyRecordByActivity(domain, id, currPage);
		int totleSize = activityService.getApplyCount(domain, id);
		model.put("records", records);
		Page pager = new Page(currPage, 20);
		pager.setTotal_size(totleSize);
		model.put("pager", pager);
		return "mgr/ixin/activity/recordlist";
	}

	@RequestMapping("activityDetail")
	public String detail(HttpServletRequest request, ModelMap model) {
		String id = request.getParameter("id");
		ActivityInfo info = activityService.getActivityById(id);
		model.put("info", info);
		return "mgr/ixin/activity/activitydetail";
	}

	@RequestMapping("getwinners")
	public String getWinners(HttpServletRequest request, ModelMap model) {
		String id = request.getParameter("id");
		int currPage = Integer.parseInt(request.getParameter("currPage"));
		List<RewardResultVO> list = rewardService.getWinners(id, currPage);
		if (!CollectionUtils.isEmpty(list)) {
			for (RewardResultVO vo : list) {
				vo.setName(vo.getBaseUid());
				System.out.println(vo.getBaseUid());
				String uid = vo.getBaseUid();
				if (uid != null) {
					User user = userService.get(vo.getBaseUid());
					if (user != null) {
						vo.setName(user.getName());
					}
				}
			}
		}

		int totleSize = rewardService.getWinCount(id);
		model.put("winners", list);
		Page pager = new Page(currPage, 20);
		pager.setTotal_size(totleSize);
		model.put("pager", pager);
		return "mgr/ixin/lottery/recordlist";
	}

	@RequestMapping("rewardlist")
	public String getRewardList(HttpServletRequest request, ModelMap model) {
		int currPage = Integer.parseInt(request.getParameter("currPage"));
		String domain = LoginSessionHelper.getCurrentDomain(request);
		List<RewardActivity> rewards = rewardService.getRewardByDomain(domain,
				currPage);
		int totleSize = rewardService.getRewardCount(domain);
		Page pager = new Page(currPage, 20);
		pager.setTotal_size(totleSize);
		model.put("rewards", rewards);
		model.put("pager", pager);
		return "mgr/ixin/lottery/rewardlist";
	}

}
