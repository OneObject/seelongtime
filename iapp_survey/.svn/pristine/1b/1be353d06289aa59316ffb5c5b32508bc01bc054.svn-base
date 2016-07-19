package com.longtime.app.ixin.mgr.channel.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.client.fluent.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.longtime.app.ixin.mgr.channel.model.ChannelResourceEntity;
import com.longtime.app.ixin.mgr.channel.model.ResourceVO;
import com.longtime.app.ixin.mgr.channel.service.ChannelResourceService;
import com.longtime.common.utils.Page;

@Controller
@RequestMapping("/mgr/channelresource")
public class ChannelResourceController {
	
	private static final Logger logger = LoggerFactory.getLogger(ChannelResourceController.class);
	
	@Resource
	private ChannelResourceService channelResourceService;
    
	
	
	@RequestMapping("tolink")
	public String tolink(HttpServletRequest request,ModelMap model){
		String channelid=request.getParameter("id");
		String restype=request.getParameter("restype");
		if(StringUtils.isBlank(channelid)){
			logger.debug("id can not be null");
			return "mgr/channel/index";
		}
		model.put("id",channelid);
		model.put("restype",restype);
		return "mgr/channel/link";
	}
	
	@RequestMapping("toSortResource")
	public String toSortResource(HttpServletRequest request,ModelMap model){
		String channelid=request.getParameter("id");
		
		List<ChannelResourceEntity> list = this.channelResourceService.getlist(channelid);
		
		model.put("id",channelid);
		model.put("list",list);
		if (CollectionUtils.isEmpty(list)) {
			
			model.put("num", 0);
		}else{
			model.put("num", list.size());
			
		}
		
		return "mgr/channel/sortlist";
	}
	
	@RequestMapping(value="linkedresource",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> linkedresource(HttpServletRequest request){
		String type=request.getParameter("type");
		String channelid=request.getParameter("channelid");
		
		String currentpage=request.getParameter("currentpage");
		String searchContent = request.getParameter("searchContent");
		
		int pagesize=10000;
		
		List<ChannelResourceEntity> list=this.channelResourceService.getChannelResourceEntities(Integer.valueOf(type),channelid,Integer.valueOf(currentpage),pagesize, null,searchContent);
		
		int total=this.channelResourceService.gettotal(channelid,Integer.valueOf(type),searchContent);
		
		Map<String,Object> map=new HashMap<String, Object>();
		
		Page page=new Page(Integer.valueOf(currentpage), pagesize);
		page.setTotal_size(total);
		
		map.put("list",list);
		map.put("pager",page);
		
		return map;
	}
	
	
	@RequestMapping(value="savesort",method=RequestMethod.POST)
	@ResponseBody
	public boolean savesort(HttpServletRequest request){
		String json = request.getParameter("list");
		List<ResourceVO> list= JSON.parseArray(json, ResourceVO.class);
		
		boolean flag = this.channelResourceService.batchUpdate(list);
	
		return flag;
	}
	
	
	@RequestMapping(value="link")
	@ResponseBody
	public boolean link(HttpServletRequest  request){
		String channelid=request.getParameter("channelid");
		String resourceidstr=request.getParameter("resourceidstr");
		String restype=request.getParameter("restype");
		String titlestr=request.getParameter("titlestr");
		String coverstr=request.getParameter("coverstr");
		String removestr=request.getParameter("removestr");
		
		String[] resourceids=resourceidstr.split(",");
		String[] titles=titlestr.split(",");
		String[] covers=coverstr.split(",", resourceids.length);
		String[] removes=null;
		if(StringUtils.isNotBlank(removestr)){
			removes=removestr.split(",");
		}
		int num=0;
		if(removes!=null && removes.length>0){
			for(int i=0;i<removes.length;i++){
				String[] str=removes[i].split("_");
				num=num+this.channelResourceService.deleteById(str[1]);
			}
		}
		
        if(StringUtils.isNotBlank(restype) && StringUtils.isNotBlank(resourceidstr)){
		int back=this.channelResourceService.batchinsert(channelid, resourceids,titles,covers,Integer.valueOf(restype));
		if(back>0){
			return true;
		}
        }else{
        	if(num>0){
        		return true;
        	}
        }
		return false;
	}
	
	@RequestMapping(value="deletelink")
	@ResponseBody
	public boolean deletelink(HttpServletRequest request){
		String id=request.getParameter("id");
		if(StringUtils.isNotBlank(id)){
			int back=this.channelResourceService.deleteById(id);
			if(back>0){
				return true;
			}
		}
		return false;
	}
	
	
	
	
}
