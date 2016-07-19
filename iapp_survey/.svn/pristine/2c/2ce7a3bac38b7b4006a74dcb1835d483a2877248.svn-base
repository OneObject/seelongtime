package com.longtime.app.admin.template.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Lists;
import com.longtime.app.admin.template.model.DomainTemplate;
import com.longtime.app.admin.template.model.Template;
import com.longtime.app.admin.template.model.TemplateVO;
import com.longtime.app.admin.template.service.TemplateService;
import com.longtime.common.utils.LoginSessionHelper;

@Controller
@RequestMapping("/base/admin/template")
public class TemplateController {

	/**
	 * 风格关联的模版发生变化后，更新风格和模块之间的关系
	 * @param request
	 * @param response
	 * @return
	 */
	@Resource(name = "templateService")
	private TemplateService templateService;
	

	@RequestMapping("/templateindex")
	public String list(HttpServletRequest request,HttpServletResponse response,ModelMap map){
		String domain = LoginSessionHelper.getCurrentDomain(request);
		String tab = request.getParameter("tab");
		if (StringUtils.isBlank(tab)) {
			tab="module";
		}
		List<TemplateVO> list =  templateService.listAllModule(domain);
		if (CollectionUtils.isEmpty(list)) {
			list = Lists.newArrayList();
			return "base/admin/template/template";
		}
		map.put("list", list);
		map.put("tab", tab);
		return "base/admin/template/template";
	}
	
	
	
	@RequestMapping(value="todetail")
	@ResponseBody
	public List<Template> votelist(HttpServletRequest request){
		  String mid = request.getParameter("mid");
		  
		  String domain=LoginSessionHelper.getCurrentDomain(request);
		  
		  if (StringUtils.isBlank(mid)) {
			return null;
		  }
		  List<Template> list = templateService.listTemplateByMid(mid,domain);
		  return list;
	}
	
	
	@RequestMapping(value="modify")
	@ResponseBody
	public boolean modify(HttpServletRequest request){
		String domain = LoginSessionHelper.getCurrentDomain(request);
		String mid = request.getParameter("mid");
		String tid = request.getParameter("tid");
		if (StringUtils.isBlank(mid)||StringUtils.isBlank(tid)) {
			return false;
		}
		
		
		DomainTemplate dt = templateService.getDomainTemplate(domain, mid);
		if (dt!=null&&dt.getTid().equals(tid)) {
			return true;
		}
		
		templateService.deleteDomainTemplate(domain, mid);
		DomainTemplate dtemplate = new DomainTemplate();
		dtemplate.setDomain(domain);
		dtemplate.setMid(mid);
		dtemplate.setTid(tid);
		boolean bo = templateService.addDomainTemplate(dtemplate);
		
		return bo;
	}
}
