package com.longtime.app.ixin.mgr.controller;


import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.longtime.app.ixin.mgr.fodder.service.FodderService;
import com.longtime.app.ixin.mgr.service.AutoResponseRuleService;
import com.longtime.app.ixin.mgr.service.IXinRuleService;
import com.longtime.app.ixin.protocol.Rule;
import com.longtime.common.utils.LoginSessionHelper;


@Controller("iXinRuleController")
@RequestMapping("/mgr/ixinrule/")
public class IXinRuleController {
	
	private static final Logger logger = LoggerFactory.getLogger(IXNoFilterController.class);

	
	@Resource(name="iXinRuleService")
	private IXinRuleService iXinRuleService;
	
	@Resource
	private AutoResponseRuleService autoResponseRuleService;
	
	
	@RequestMapping("/validateaddfindkey")
	@ResponseBody
	public boolean validateFindKey(HttpServletRequest request, ModelMap model){
		String skey = request.getParameter("skey");
		String domain = LoginSessionHelper.getCurrentDomain(request);
		Rule rule = this.iXinRuleService.findBySkey(skey,domain);
		if (rule!=null) {
			return true;	
		}
		return false;
	}
	@RequestMapping("/validatekeywords")
	@ResponseBody
	public boolean validateKeywords(HttpServletRequest request, ModelMap model){
		String keywords = request.getParameter("skey");
		String keyword = request.getParameter("key");
		String id = request.getParameter("id");
		String domain = LoginSessionHelper.getCurrentDomain(request);
		
		while(keywords.indexOf("，") >= 0){
			keywords = keywords.replace("，", ",");
		}
	    while(keywords.indexOf(",,") >= 0){
	        keywords = keywords.replace(",,", ",");
	    }
	    if(keywords.startsWith(",")){
	        keywords = keywords.substring(1, keywords.length());
	    }
	    if(keywords.endsWith(",")){
	        keywords = keywords.substring(0, keywords.length()-1);
	    }
	    List<String> list = new ArrayList<String>();
	    if (StringUtils.isBlank(keyword)) {	        	
	    	list = this.autoResponseRuleService.findAllSkey(domain);
	    }else{
	        list = this.autoResponseRuleService.getOtherSkey(domain,id);	
	    }
		 List<String> list1 = this.iXinRuleService.findAllSkey(domain);
		 
		 String[] keys = keywords.split(",");
		 for (String key : keys) {
			for (String s1 :list1) {
				if (key.equals(s1)) {
					return true;
				}
			}
			for (String s2 : list) {
				if(key.equals(s2)){
					return true;
				}
			}
		}		
		return false;
	}
}
