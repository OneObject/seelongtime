package com.longtime.app.mobile.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.longtime.app.mobile.model.Mobile;
import com.longtime.app.mobile.service.MobileService;
import com.longtime.app.util.JsonEntity;
import com.myctu.platform.gateway.agent.query.QueryDTO;
import com.myctu.platform.repository.engine.domain.query.Page;
import com.myctu.platform.repository.engine.domain.query.ResultSet;

@Controller
@RequestMapping("/mobile/")
public class MobileController {

	@Resource
	private MobileService mobileService;
	
	@RequestMapping("versionList")
	public String versionList(HttpServletRequest request,ModelMap model){
		String pageNum = request.getParameter("pageNum");
		String numPerPage = request.getParameter("numPerPage");
		Page page = new Page();
		if(StringUtils.isNotBlank(pageNum)){
			page.setCurrent_page(Integer.valueOf(pageNum));
		}
		if(StringUtils.isNotBlank(numPerPage)){
			page.setPage_size(Integer.valueOf(numPerPage));
		}
		QueryDTO query = new QueryDTO();
		
		ResultSet<Mobile> rs = mobileService.listByPage(query.toMap(), page);
		System.out.println(JSONObject.fromObject(rs));
		model.put("rs", rs);
		
		return "mobile/versionList";
	}
	
	@RequestMapping("toadd")
	public String toadd(){
		return "mobile/add";
	}
	
	@RequestMapping("add")
	@ResponseBody
	public String add(Mobile mobile){
		mobileService.add(mobile);
		JsonEntity result = new JsonEntity();
		result.setCallbackType("closeCurrent");
		result.setNavTabId("version_list");
		return JSONObject.fromObject(result).toString();
	}
	
	@RequestMapping("delete")
	@ResponseBody
	public String delete(@RequestParam(value="id",required=true) String id){
		mobileService.delById(id);
		JsonEntity entity = new JsonEntity();
		return JSONObject.fromObject(entity).toString();
	}
	@RequestMapping("update")
	@ResponseBody
	public String update(Mobile mobile){
		mobileService.update(mobile);
		JsonEntity entity = new JsonEntity();
		entity.setCallbackType("closeCurrent");
		entity.setNavTabId("version_list");
		return JSONObject.fromObject(entity).toString();
	}
	@RequestMapping("toupdate")
	public String toupdate(@RequestParam(value="id",required=true)String id,ModelMap model){
		Mobile m = mobileService.loadById(id);
		model.put("mobile", m);
		return "mobile/update";
	}
	
	public static void main(String[] args) {
		List<Mobile> list = new ArrayList<Mobile>();
		System.out.println(list.isEmpty());
	}
}
