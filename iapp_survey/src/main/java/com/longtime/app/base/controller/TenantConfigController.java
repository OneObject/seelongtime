package com.longtime.app.base.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.jdbc.datasource.lookup.IsolationLevelDataSourceRouter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.longtime.app.base.model.ModuleConfig;
import com.longtime.app.base.model.ModuleEntity;
import com.longtime.app.base.model.ModuleEntityVO;
import com.longtime.app.base.model.Tenant;
import com.longtime.app.base.model.TenantConfig;
import com.longtime.app.base.model.TopicConfig;
import com.longtime.app.base.service.ModuleConfigService;
import com.longtime.app.base.service.ModuleService;
import com.longtime.app.base.service.TenantConfigService;
import com.longtime.app.base.service.TenantService;
import com.longtime.app.base.service.TopicConfigService;
import com.longtime.app.ixin.mgr.fodder.service.FodderService;
import com.longtime.common.utils.LoginSessionHelper;
import com.longtime.common.utils.QueryCondition;
import com.longtime.common.utils.ResultSet;
import com.myctu.platform.utils.NumberUtils;
import com.telecom.ctu.platform.common.cache.CacheService;

@Controller
@RequestMapping("/base/admin/tenantconfig/")
public class TenantConfigController {
	
	@Resource
	private TenantService tenantService;
	@Resource
	private FodderService fodderService;
	@Resource
	private TenantConfigService tenantConfigService;
	@Resource(name = "lt.cacheService")
	private CacheService cacheService;
	@Resource
	private ModuleService moduleService;
	@Resource
	private ModuleConfigService moduleConfigService;
	@Resource
	private TopicConfigService topicConfigService;
	
	public static String TENANTINFO_CACEK_KEY = "ti_%s";
	/**
	 * 进入企业配置初始化数据
	 * @param request
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="tenantindex")
     public String tenantindex(HttpServletRequest request,ModelMap modelMap){
		 String domain=LoginSessionHelper.getCurrentDomain(request);
		 
		 QueryCondition queryCondition=new QueryCondition();
		 queryCondition.addFilterEqual("domain",domain);
		 
		 ResultSet<TopicConfig> rs=this.topicConfigService.list(queryCondition);
		 
		 if(rs!=null && rs.getItems()!=null && rs.getItems().size()>0){
			 modelMap.put("topicconfig",rs.getItems().get(0));
		 }
		 
		 Tenant tenant=tenantService.get(domain);
		 TenantConfig tenantConfig=tenantConfigService.getByDomain(domain);
		 if(tenant==null){
			 tenant=new Tenant();
			 tenant.setId(domain);
		 }
		 
		 List<ModuleEntity> mlist =  moduleService.list();
		 List<ModuleEntityVO> mlistvo = new ArrayList<ModuleEntityVO>();
		 for (int i = 0; i < mlist.size(); i++) {
			 ModuleEntityVO moduleEntityVO = new ModuleEntityVO();
			 moduleEntityVO.setId(mlist.get(i).getId());
			 moduleEntityVO.setModulename(mlist.get(i).getModulename());
			 moduleEntityVO.setUrls(mlist.get(i).getUrls());
			 ModuleConfig moduleConfig = moduleConfigService.getByDomainAndId(domain,mlist.get(i).getId());
			 if (moduleConfig == null){
				 moduleConfig = new ModuleConfig();
				 moduleConfig.setIsopen(true);
			 }
			 moduleEntityVO.setModuleConfig(moduleConfig);
			 mlistvo.add(moduleEntityVO);
		 }
		 modelMap.put("domain",domain);
		 modelMap.put("tenant",tenant);
		 modelMap.put("tenantConfig",tenantConfig);
		 modelMap.put("mlistvo", mlistvo);
		 modelMap.put("result", fodderService.getRequiredParams());
		 
    	 return "/base/admin/tenantconfig/tenantConfig";
	}
	
	@RequestMapping(value="edittenant")
	public String edittenant(HttpServletRequest request,ModelMap modelMap){
		String id=request.getParameter("id");
		String tenantName=request.getParameter("tenantName");
		String coverPath=request.getParameter("coverPath");
		String logincover=request.getParameter("coverPath2");
		if(StringUtils.isBlank(id) || StringUtils.isBlank(tenantName)){
			return "/base/admin/tenantconfig/tenantConfig";
		}
		Tenant tenant=tenantService.get(id);
		if(tenant!=null){
			tenant.setName(tenantName);
			tenant.setLogo(coverPath);
			tenant.setLogincover(logincover);
			tenantService.update(tenant);
		}
		modelMap.put("tenant",tenant);
		modelMap.put("result",fodderService.getRequiredParams());
		return "redirect:tenantindex.xhtml";
	}
	
	/**
	 *
	 * 
	 * @param req
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "updatetenantsite", method = RequestMethod.POST)
	@ResponseBody
	public ModelMap updatetenantsite(HttpServletRequest request, ModelMap model) {
		String domain=LoginSessionHelper.getCurrentDomain(request);
		String isopen = request.getParameter("isopen");
		String isfoddershare = request.getParameter("isfoddershare");
		String isreply = request.getParameter("isreply");
		String isregister = request.getParameter("isregister");
		String isautosyn = request.getParameter("isautosyn");
		String syncfromwx = request.getParameter("syncfromwx");
		String replycontent = request.getParameter("replycontent");
		String color = request.getParameter("color");
		String shownavigation = request.getParameter("shownavigation");
		String host = request.getParameter("host");
		String port = request.getParameter("port");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String alias = request.getParameter("alias");
		
		
		String action = request.getParameter("action");
		
		
		TenantConfig teConfig =   tenantConfigService.get(domain);
        boolean isInsert = false;
        if(teConfig == null){
            teConfig = new TenantConfig();
            teConfig.setId(domain);
            isInsert = true;
        }
        
        
		if("updateReply".equals(action)){
		    teConfig.setReplycontent(replycontent);
            if("1".equals(isreply)){
                teConfig.setIsreply(true);
            }else{
                teConfig.setIsreply(false);
            }
		    
		}else{
		    
	
		
    		if (StringUtils.isBlank(isopen)){
    			isopen = "0";
    		}
    		
    		
    		if(isopen.equals("1")){
    			teConfig.setIsopen(true);
    		}else{
    			teConfig.setIsopen(false);
    		}
    		if(isautosyn.equals("1")){
    			teConfig.setIsautosyn(true);
    		}else{
    			teConfig.setIsautosyn(false);
    		}
    		if(syncfromwx.equals("1")){
    			teConfig.setSyncfromwx(true);;
    		}else{
    			teConfig.setSyncfromwx(false);
    		}
    		if (isfoddershare.equals("1")) {
    			teConfig.setIsfoddershare(true);
    		} else {
    			teConfig.setIsfoddershare(false);
    		}
    		if(isregister.equals("1")){
    			teConfig.setOpenregister(true);
    		}else{
    			teConfig.setOpenregister(false);
    		}
    		if(StringUtils.isNotBlank(color)){
    			if(!color.startsWith("#")){
    				color = String.format("#%s", color);
    			}
    			teConfig.setColor(color);
    		}
    		if("1".equals(shownavigation)){
    			teConfig.setShownavigation(true);
    		} else {
    			teConfig.setShownavigation(false);
    		}
    		
    		teConfig.setHost(host);
    		teConfig.setPort(NumberUtils.toInt(port));
    		teConfig.setUsername(username);
    		teConfig.setPassword(password);
    		teConfig.setAlias(alias);
		
	      
        }
		
		
		if(isInsert){
			tenantConfigService.insert(teConfig);
		} else {
			tenantConfigService.update(teConfig);
			cacheService.remove("mc_"+domain);
			cacheService.remove(String.format(String.format(TENANTINFO_CACEK_KEY, domain)));
		}
		
		return model;
	}
	@RequestMapping(value = "saveloginprompt", method = RequestMethod.POST)
	@ResponseBody
	public ModelMap saveLoginPrompt(HttpServletRequest request, ModelMap model){
		String login_prompt = request.getParameter("login_prompt");
		String domain=LoginSessionHelper.getCurrentDomain(request);
		TenantConfig teConfig =	tenantConfigService.get(domain);
		if (teConfig!=null) {
			teConfig.setLogin_prompt(login_prompt);
			tenantConfigService.update(teConfig);

			cacheService.remove(String.format(String.format(TENANTINFO_CACEK_KEY, domain)));
		}
		return model;
	}
	
	/**
	 * 用于接收用户提交的邮件模板信息的更新
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "updatemailmodule", method = RequestMethod.POST)
	@ResponseBody
	public ModelMap updateMailmodule(HttpServletRequest request, ModelMap model) {
		String domain = LoginSessionHelper.getCurrentDomain(request);
		String mailmodule = request.getParameter("mailmodule");
		TenantConfig tenantConfig = tenantConfigService.get(domain);
		
		mailmodule = mailmodule.replaceAll("＜", "<");
		mailmodule = mailmodule.replaceAll("＞", ">");
		
		boolean isInsert = false;
		if(tenantConfig == null) {
			tenantConfig = new TenantConfig();
			tenantConfig.setId(domain);
			isInsert = true;
		}
		
		tenantConfig.setMailmodule(mailmodule);
		
		if(isInsert) {
			tenantConfigService.insert(tenantConfig);
		} else {
			tenantConfigService.update(tenantConfig);
			
			cacheService.remove("mc_"+domain);
			cacheService.remove(String.format(String.format(TENANTINFO_CACEK_KEY, domain)));
		}
		
		return model;
	}
}
