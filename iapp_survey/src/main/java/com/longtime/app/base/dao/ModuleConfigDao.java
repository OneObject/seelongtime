package com.longtime.app.base.dao;

import java.util.List;

import com.longtime.app.base.model.ModuleConfig;
import com.longtime.common.dao.BaseDAO;

public interface ModuleConfigDao extends BaseDAO<ModuleConfig, String>{
	/**
	 * 获取当前域下的模块配置信息
	 * @param domain
	 * @return
	 */
	public List<ModuleConfig> getByDomain(String domain);
	
	
	/**
	 * 根据domain和id获取对象
	 * @param domain
	 * @param id
	 * @return
	 */
	public ModuleConfig getByDomainAndId(String domain, String id);
	
	/**
	 * 根据domain、module修改模块的isopen状态
	 * @return
	 */
	public int updateModuleConfigIsopen(String domain,String moduleid,boolean isopen);
}
