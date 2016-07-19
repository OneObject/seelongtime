package com.longtime.app.base.controller;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.longtime.app.base.model.TopicConfig;
import com.longtime.app.base.service.TopicConfigService;
import com.longtime.common.utils.LoginSessionHelper;
@Controller
@RequestMapping("/base/admin/topicconfig/")
public class TopicConfigController {
     
	@Resource
	private TopicConfigService topicConfigService;
	
	@RequestMapping(value="add",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> add(HttpServletRequest request){
		String id=request.getParameter("id");
		String title=request.getParameter("title");
		String cover=request.getParameter("cover");
		String descript=request.getParameter("descript");
		String domain=LoginSessionHelper.getCurrentDomain(request);
		
		Map<String,Object> map=new HashMap<String, Object>();
		
		TopicConfig topicConfig=getTopicConfig(title, cover, descript, domain);
		
		if(StringUtils.isNotBlank(id)){
			topicConfig.setId(id);
			this.topicConfigService.update(topicConfig);
			map.put("msg",true);
			map.put("id",id);
		}else{
        String result=this.topicConfigService.insert(topicConfig);		
        if(StringUtils.isBlank(result)){
           map.put("msg",false);	
        }else{
        	map.put("msg",true);
        	map.put("id",result);
        }
		}        
		return map;
	}
	private TopicConfig getTopicConfig(String title,String cover,String descript,String domain){
		
		TopicConfig topicConfig=new TopicConfig();
		
		topicConfig.setTitle(title);
		topicConfig.setCover(cover);
		topicConfig.setDescript(descript);
		topicConfig.setDomain(domain);
		
		return topicConfig;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
