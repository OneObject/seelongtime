package com.longtime.ajy.mweb.h5web;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.longtime.ajy.model.ActivityItem;
import com.longtime.ajy.mweb.model.VoteEntity;
import com.longtime.ajy.mweb.service.VoteService;
import com.longtime.ajy.support.HttpServletHelper;
import com.longtime.common.model.search.Filter;
import com.longtime.common.model.search.Pageable;
import com.longtime.common.model.search.ResultSet;
import com.longtime.common.model.search.Search;
import com.longtime.common.model.search.Sort;

/**
 * 投票
 * 
 */
@Controller
@RequestMapping(value = "/m/h5/vote")
public class VoteController {

	@Resource
	private VoteService voteService;

	/**
	 * 投票,调研列表页面
	 * 
	 * @param request
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "index")
	public String toVoteListPage(@RequestParam(value = "activityid", required = true) String activityId,
			@RequestParam(value = "type", required = false) String type, HttpServletRequest request, ModelMap modelMap) {
		modelMap.put("activityId", activityId);
		modelMap.put("type", type);
		if ("1".equals(type)) {// 投票
			return "/m/h5/vote/votelist";
		} else if("2".equals(type)) {//调研
			return "/m/h5/vote/surveylist";
		}
		return "/m/h5/vote/votelist";
	} 

	/**
	 * 获取投票,调研列表
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "list")
	@ResponseBody
	public ResultSet<VoteEntity> getVoteList(@RequestParam(value = "activityid", required = true) String activityId,
			HttpServletRequest request, ModelMap modelMap) {
//		Pageable page = HttpServletHelper.assembyPage(request);
//		String type = request.getParameter("type");
//		Search search = Search.newInstance();
//		search.addEqualFilter("aid", activityId);
//		search.addEqualFilter("restype", type);
//		List<ActivityItem> activityItems = this.activityItemService.list(search);
//		long count = 0;
//		List<VoteEntity> list= Collections.EMPTY_LIST;;
//		if (CollectionUtils.isNotEmpty(activityItems)) { 
//			List<String> ids = new ArrayList<String>();
//			for (ActivityItem item : activityItems) {
//				ids.add(item.getResid());
//			}
//			search = Search.newInstance();
//			search.addFilter(Filter.in("id", ids));
//			search.addEqualFilter("del", VoteEntity.ISDEL_NO);
//			search.addSort(new Sort("createTime", true));
//			count = this.voteService.count(search);
//			list = this.voteService.list(search, page);
//		}
//		ResultSet<VoteEntity> rs = new ResultSet<VoteEntity>(list, page, count);
		return null;
	}

}
