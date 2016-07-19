package com.longtime.app.ixin.mgr.praise.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.longtime.app.ixin.mgr.praise.model.PraiseStudentVo;
import com.longtime.app.ixin.mgr.praise.service.PraiseStudentService;
import com.longtime.app.ixin.mgr.topic.model.TopicStudentEntity;
import com.longtime.app.ixin.mgr.topic.service.TopicService;
import com.longtime.common.utils.LoginSessionHelper;
import com.longtime.common.utils.Page;

@Controller
@RequestMapping("mgr/praise")
public class PraiseStudentController {
   
	@Resource
	private PraiseStudentService praiseStudentService;
	@Resource
	private TopicService topicService;
	
	@RequestMapping("praiseindex")
	public String praiseindex(HttpServletRequest request,ModelMap model){
		String resid=request.getParameter("resid");
		String meta=request.getParameter("meta");
		String restype=request.getParameter("restype");
		if(StringUtils.isNotBlank(restype)){
		if(Integer.valueOf(restype)==2){
			TopicStudentEntity topicStudentEntity=this.topicService.getTopicStudentEntity(resid);
			model.put("entity",topicStudentEntity);
		}else if(Integer.valueOf(restype)==1){
		}
		}
		model.put("resid",resid);
		model.put("restype",restype);
		model.put("meta",meta);
		return "mgr/praise/praiseindex";
	}
	
	@RequestMapping("praiselist")
	public String praiselist(HttpServletRequest request,ModelMap model)
	{  
		String domain=LoginSessionHelper.getCurrentDomain(request);
		
		String searchval=request.getParameter("searchval");
		
		String resid=request.getParameter("resid");
		
		String restype=request.getParameter("restype");
		
		int currPage=getCurrpage(request);
		
		int totalSize=this.praiseStudentService.gettotal(Integer.valueOf(restype), domain, resid, searchval);
		
		int pagesize=10;
		
		Page page = new Page();
		page.setCurrent_page(currPage);
		page.setTotal_size(totalSize);
		page.setPage_size(pagesize);
		model.put("pager", page);
		
		List<PraiseStudentVo> list=this.praiseStudentService.getlist(domain, resid, searchval, page, Integer.valueOf(restype));
		model.put("list",list);
		return "/mgr/praise/praiselist";
	}
	
	private int getCurrpage(HttpServletRequest request) {
		String currpage = request.getParameter("currPage");
		return NumberUtils.toInt(currpage, 1);
		
	}
	
}
