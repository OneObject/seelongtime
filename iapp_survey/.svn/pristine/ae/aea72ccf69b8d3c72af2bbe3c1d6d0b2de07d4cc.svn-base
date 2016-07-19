package com.longtime.app.ixin.mgr.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.longtime.app.ixin.mgr.service.StudyService;

@Controller("mgrNoticeController")
@RequestMapping("/mgr/notice")
public class NoticeController {
	@Resource(name="studyService")
	private StudyService studyService;
	
	@RequestMapping("index")
	public String index(){
		
		return "mgr/ixin/notice/index";
	}
	
	@RequestMapping("add")
	public String add(HttpServletRequest request,ModelMap model){
		
		return "redirect:/mgr/fodder/add.xhtml?columnId=ixinnotice";
	}

	@RequestMapping("del")
	@ResponseBody
	public void del(HttpServletRequest request,ModelMap model){
		String id = request.getParameter("id");
		String baseId = request.getParameter("baseId");
		studyService.delById(id,baseId);
	}
}
