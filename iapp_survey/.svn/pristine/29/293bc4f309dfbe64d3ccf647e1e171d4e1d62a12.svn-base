package com.longtime.app.base.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.common.collect.Lists;
import com.googlecode.genericdao.search.Filter;
import com.longtime.app.base.model.FeedBack;
import com.longtime.app.base.service.FeedBackService;
import com.longtime.common.utils.DateUtils;
import com.longtime.common.utils.LoginSessionHelper;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.QueryCondition;
import com.longtime.common.utils.QueryFilter;
import com.longtime.common.utils.ResultSet;
import com.longtime.common.utils.Sort;


@Controller
@RequestMapping("/base/admin/feedback/")
public class FeedBackController {
      
	@Resource
	private FeedBackService feedBackService;
	
	
	@RequestMapping("index")
	public String feedindex(HttpServletRequest request,ModelMap model){
		return "base/admin/feedback/feedback";
	}
	
	
	@RequestMapping("list")
	public String feedlist(HttpServletRequest request, ModelMap model){
		String domain=LoginSessionHelper.getCurrentDomain(request);
		String startTime=request.getParameter("startTime");
		String endTime=request.getParameter("endTime");
		int type = NumberUtils.toInt(request.getParameter("type"),-1);
		Long start = null;
		Long end = null;
		if (StringUtils.isNotBlank(startTime)) {
			 start = DateUtils.parseStringToLong(startTime);
		}
		if (StringUtils.isNotBlank(endTime)){
			end = DateUtils.parseStringToLong(endTime);
		}
		int currPage=getCurrpage(request);
		Page page=new Page();
		page.setCurrent_page(currPage);
		page.setPage_size(10);
		QueryCondition query = new QueryCondition();
		query.addFilterEqual("domain", domain);
		query.addSort(new Sort("createTime",Sort.ORDER_DES));
		if (type != -1) {
			query.addFilterEqual("type", type);
		}
		if (start!=null) {
			query.addFilter(new QueryFilter("createTime", start, Filter.OP_GREATER_OR_EQUAL));
		}
		if (end!=null) {
			query.addFilter(new QueryFilter("createTime",end,Filter.OP_LESS_OR_EQUAL));
		}
		ResultSet<FeedBack> rs = this.feedBackService.list(query, page);
		
		if(rs!=null && rs.getItems()!=null && rs.getItems().size()>0){
			model.put("list",rs.getItems());
			model.put("pager",rs.getPage());
		}else {
			model.put("list",Lists.newArrayList());
		}
		
		return "/base/admin/feedback/list";
	}
	
	@RequestMapping("/detail")
	public String detail(HttpServletRequest request, HttpServletResponse response, ModelMap model){
		String id = request.getParameter("id");
		FeedBack entity = this.feedBackService.get(id);
		model.put("entity", entity);
		return "/base/admin/feedback/detail";
		
	}
	
	private int getCurrpage(HttpServletRequest request) {
		String currpage = request.getParameter("currPage");
		
		return NumberUtils.toInt(currpage, 1);
		
	}
}
