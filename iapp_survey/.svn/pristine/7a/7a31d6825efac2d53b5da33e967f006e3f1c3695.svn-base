package com.longtime.app.base.controller;

import com.telecom.ctu.platform.common.cache.CacheService;
import java.util.UUID;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.longtime.app.base.model.ModuleConfig;
import com.longtime.app.base.service.ModuleConfigService;
import com.longtime.app.util.IdGenerator;
import com.longtime.common.utils.LoginSessionHelper;

@Controller
@RequestMapping("/base/admin/moduleconfig/")
public class ModuleConfigController {
	@Resource
	private ModuleConfigService moduleConfigService;
	
	
	@Resource(name = "lt.cacheService")
	private CacheService cacheService;
	
	 
    private static String CACHE_CONFIG_KEY = "mc_%s";
	
	/**
	 *
	 * 修改模块下的配置开放状态
	 * @param req
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "updatemoduleconfig", method = RequestMethod.POST)
	@ResponseBody
	public ModuleConfig updatemoduleconfig(HttpServletRequest request) {
		String domain = LoginSessionHelper.getCurrentDomain(request);
		String moduleid = request.getParameter("moduleid");
		if (StringUtils.isBlank(moduleid)){
			return null;
		}
		ModuleConfig moduleConfig = moduleConfigService.getByDomainAndId(domain, moduleid);
		if (moduleConfig == null){
			//添加
			moduleConfig = new ModuleConfig();
			moduleConfig.setId((IdGenerator.nextId32()).toString());
			moduleConfig.setDomain(domain);
			moduleConfig.setModuleid(moduleid);
			moduleConfig.setIsopen(false);
			moduleConfigService.insert(moduleConfig);
		}else{
			if (moduleConfig.isIsopen()){
				moduleConfig.setIsopen(false);
			}else{
				moduleConfig.setIsopen(true);
			}
			moduleConfigService.update(moduleConfig);
		}
		
		cacheService.remove(String.format(CACHE_CONFIG_KEY, domain));
		
		return moduleConfig;
	}
}
