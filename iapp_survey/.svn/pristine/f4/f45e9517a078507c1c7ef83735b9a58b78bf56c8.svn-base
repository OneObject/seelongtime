package com.longtime.app.base.service;

import java.util.List;

import com.longtime.app.base.model.ModuleConfig;
import com.longtime.common.service.BaseService;

public interface ModuleConfigService extends BaseService<ModuleConfig, String>{
	/**
	 * 获取当前域下的模块配置信息
	 * @param domain
	 * @return
	 */
	public List<ModuleConfig> getByDomain(String domain);
	
	public ModuleConfig getByDomainAndId(String domain, String id);

	public int updateModuleConfigIsopen(String domain,String moduleid,boolean isopen);
}
