package com.longtime.app.base.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.longtime.app.base.controller.vo.OrganizationVo;
import com.longtime.app.base.model.BaseGroupRelation;
import com.longtime.app.base.model.BaseGroupRule;
import com.longtime.app.base.model.BaseGroupRuleConfig;
import com.longtime.app.base.model.JobLevelEntityVo;
import com.longtime.app.base.service.GroupRuleConfigService;
import com.longtime.app.base.service.GroupRuleService;
import com.longtime.app.base.service.JobLevelService;
import com.longtime.app.base.service.OrganizationService;
import com.longtime.common.utils.LoginSessionHelper;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.QueryCondition;
import com.longtime.common.utils.ResultSet;
import com.myctu.platform.utils.NumberUtils;

@Controller
@RequestMapping("/base/admin/grouprule")
public class GroupRuleController {
    
	@Resource
	private GroupRuleService groupRuleService;
	
	@Resource
	private OrganizationService organizationService;
	

	@Resource
	private GroupRuleConfigService groupRuleConfigService;
	
	@Resource
	private JobLevelService jobLevelService;
	
	@RequestMapping(value="rulelist")
	public String rulelist(HttpServletRequest request ,ModelMap model){
		
		String domain=LoginSessionHelper.getCurrentDomain(request);
		String gid=request.getParameter("gid");
		int currentpage=NumberUtils.toInt(request.getParameter("currentpage"),Page.CURRENTPAGE_DEFAULT);
		int pagesize=NumberUtils.toInt(request.getParameter("pagesize"),Page.PAGESIZE_DEFAULT);
		String propertyname=request.getParameter("propertyname");
		
		String pageFn=request.getParameter("pageFn");
		
		Page page=new Page(currentpage,pagesize);
		
		QueryCondition queryCondition=new QueryCondition();
		
		queryCondition.addFilterEqual("domain",domain);
		queryCondition.addFilterEqual("gid",gid);
		
		if(StringUtils.isNotBlank(propertyname)){
			queryCondition.addFilterLike("property","%"+propertyname+"%");
		}
		
		ResultSet<BaseGroupRule> rs=this.groupRuleService.list(queryCondition, page);
		
		if(rs!=null && rs.getItems()!=null && rs.getItems().size()>0){
			model.put("list",rs.getItems());
			model.put("page",rs.getPage());
		}else {
			model.put("list",Lists.newArrayList());
			model.put("page",page);
		}
		
		model.put("pageFn",pageFn);
		return "/base/admin/usergroup/rulelist";
	}
	
	@RequestMapping(value="toadd")
    public String add(HttpServletRequest request,ModelMap model){
		
		String id=request.getParameter("id");
		
		model.put("id",id);
		
		return "/base/admin/usergroup/addrule";
	}	
	
	@RequestMapping(value="getruleconfig",method=RequestMethod.POST)
	@ResponseBody
	public Map<Object,Object> getRuleConfigs(HttpServletRequest request){
		String domain=LoginSessionHelper.getCurrentDomain(request);
		List<BaseGroupRuleConfig> configs = this.groupRuleConfigService.getListByDomain(domain);
		
		List<String> list=Lists.newArrayList();
		Map<Object,Object> map=Maps.newHashMap();
		
		if(CollectionUtils.isNotEmpty(configs)){
		     for(BaseGroupRuleConfig baseGroupRuleConfig: configs){
		    	 if(!list.contains(baseGroupRuleConfig.getEntityname())){
		    		 list.add(baseGroupRuleConfig.getEntityname());
		    	 }
		     }
		     map.put("list",list);
		     map.put("grouplist",configs);
		}
		
		return map;
	}
	
	
	@RequestMapping(value="ruleadd",method=RequestMethod.POST)
	@ResponseBody
	public boolean ruleadd(HttpServletRequest request){
		
       String domain=LoginSessionHelper.getCurrentDomain(request);
		
		String ruletype=request.getParameter("ruletype");
		String rulename=request.getParameter("rulename");
		String rulemethod=request.getParameter("rulemethod");
		String rulevalues=request.getParameter("rulevalues");
		String gid=request.getParameter("gid");
		
		if(StringUtils.isBlank(ruletype) || StringUtils.isBlank(rulename) || StringUtils.isBlank(rulemethod)){
			return false;
		}
		
		BaseGroupRule baseGroupRule=new BaseGroupRule();
		
		if(StringUtils.isNotBlank(rulevalues)){
			baseGroupRule=getBaseGroupRule(gid, domain, Integer.valueOf(rulemethod), rulename,Integer.valueOf(ruletype), rulevalues);
		}
		
		String id=this.groupRuleService.insert(baseGroupRule);
		
		if(StringUtils.isBlank(id)){
			return false;
		}
		
		return true;
	}
	
	/**
	 * 得到树型数据
	 * @param request
	 * @return
	 */
	@RequestMapping(value="gettreelist",method=RequestMethod.POST)
	@ResponseBody
	public String getTreeList(HttpServletRequest request){
		
		
		String domain=LoginSessionHelper.getCurrentDomain(request);
		
		String ruletype=request.getParameter("ruletype");
		
		String str="";
		
		if(StringUtils.isNotBlank(ruletype)){
			//组织树
			if(Integer.valueOf(ruletype)==BaseGroupRelation.ORG_TYPE){
				
				List<OrganizationVo> list = new ArrayList<OrganizationVo>();
		         organizationService.getlistToJson2(list,null, request);
		         JSONArray array = JSONArray.fromObject(list);
		         str=array.toString();
		         
			}else if(Integer.valueOf(ruletype)==BaseGroupRelation.JOBLEVEL_TYPE){
				 List<JobLevelEntityVo> jobLevelEntityVos=this.jobLevelService.getJobLevelEntityVos(getJobLevelRootId(request),new String[]{}, domain);
		         JSONArray array=JSONArray.fromObject(jobLevelEntityVos);
		         str=array.toString();
		         
			}
		}
		return str;
	}
	
	@RequestMapping(value="del",method=RequestMethod.POST)
	@ResponseBody
	public boolean del(HttpServletRequest request){
		
		String id=request.getParameter("id");
		if(StringUtils.isBlank(id)){
			return false;
		}
		
		return this.groupRuleService.deleteById(id);
	}
	
	private BaseGroupRule getBaseGroupRule(String gid,String domain,int operation,String property,int type,String value){
		BaseGroupRule baseGroupRule=new BaseGroupRule();
		
		baseGroupRule.setGid(gid);
		baseGroupRule.setDomain(domain);
		baseGroupRule.setOperation(operation);
		baseGroupRule.setProperty(property);
		baseGroupRule.setType(type);
		baseGroupRule.setValue(value);
		
		return baseGroupRule;
	}
	
	 private String getJobLevelRootId(HttpServletRequest req) {
			return JobLevelController.getJobLevelRootId(req);
		}
	
}
