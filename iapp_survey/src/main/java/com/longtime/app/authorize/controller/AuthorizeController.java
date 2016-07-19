/**
 * project : iapp
 * user created : yangwk
 * date created : 2013-9-16 - 下午1:31:52
 */
package com.longtime.app.authorize.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.longtime.app.authorize.model.AuthorizeModel;
import com.longtime.app.authorize.service.AuthorizeService;

/**
 * @since 2013-9-16
 * @author yangwk
 * 
 */
@Controller
@RequestMapping("/auth")
public class AuthorizeController {
	
	@Resource(name = "authorizeServiceMongo")
	private AuthorizeService authorizeService;
	
	private static Logger logger = LoggerFactory.getLogger(AuthorizeController.class);
	
	@RequestMapping("/toadd")
	public String toAdd(HttpServletRequest request,HttpServletResponse response,ModelMap model){
		String sid = request.getParameter("sid");
		//String params = request.getParameter("params");
		String type = request.getParameter("type");
		String category = request.getParameter("category");
		if(StringUtils.isBlank(sid) || StringUtils.isBlank(type) || StringUtils.isBlank(category)){
			logger.error("授权资源、授权资源类型、授权对象类型不能为空！");
			model.put("message", "授权资源、授权资源类型、授权对象类型不能为空！");
			return "message";
		}
		return "authorize/add";
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public boolean add(HttpServletRequest request,HttpServletResponse response,ModelMap model){
		String sid = request.getParameter("sid");
		String params = request.getParameter("params");
		String type = request.getParameter("type");
		String category = request.getParameter("category");
		if(StringUtils.isBlank(sid) || StringUtils.isBlank(params) 
				|| StringUtils.isBlank(type) || StringUtils.isBlank(category)){
			logger.error("授权资源、授权资源类型、授权对象、授权对象类型不能为空！");
			return false;
		}
		authorizeService.addAuth(sid,params,type,category);
		return true;
	}
	
	@RequestMapping("/detail")
	public String detail(HttpServletRequest request,HttpServletResponse response,ModelMap model){
		String sid = request.getParameter("sid");
		String category = request.getParameter("category");
		String typeStr = request.getParameter("type");
		String rname = request.getParameter("rname");
		if(StringUtils.isBlank(sid) || StringUtils.isBlank(category)){
			logger.error("授权资源id,授权资源类型不能为空！");
			model.put("message", "typeStr");
			return "message";
		}
		int type = 0;
		if(StringUtils.isNotBlank(typeStr)){
			type = Integer.valueOf(typeStr);
		}
		
		List<AuthorizeModel> list = authorizeService.listAuth(sid,type,Integer.valueOf(category),rname);
		
		model.put("sid", sid);
		model.put("category", category);
		model.put("type", type);
		model.put("rname", rname);
		model.put("list", list);
		return "authorize/detail";
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public boolean delete(HttpServletRequest request,HttpServletResponse response,ModelMap model){
		String ids = request.getParameter("ids");
		if(StringUtils.isBlank(ids)){
			logger.error("要删除的授权id不能为空！");
			return false;
		}
		
		this.authorizeService.delByIds(ids);
		return true;
	}
}
