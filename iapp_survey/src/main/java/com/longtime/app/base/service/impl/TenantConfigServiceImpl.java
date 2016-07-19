package com.longtime.app.base.service.impl;

import org.apache.commons.lang.StringUtils;

import com.longtime.app.base.dao.TenantConfigDao;
import com.longtime.app.base.model.TenantConfig;
import com.longtime.app.base.service.TenantConfigService;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

@Service("tenantConfigService")
public class TenantConfigServiceImpl extends BaseService4HImpl<TenantConfig, String> implements TenantConfigService{

	@Resource(name = "tenantConfigDao")
	private TenantConfigDao tenantConfigDao;

	@Override
	public BaseDAO<TenantConfig, String> getDAO() {
		return tenantConfigDao;
	}

	@Override
	public TenantConfig getByDomain(String domain) {
		return tenantConfigDao.getByDomain(domain);
	}

	@Override
	public TenantConfig doGetOrInsert(String domain) {
		if(StringUtils.isBlank(domain)){
			return null;
		}
		TenantConfig  config = getByDomain(domain);
		
		if(null==config){
			config = new TenantConfig();
			config.setId(domain);
			tenantConfigDao.insert(config);
		}
		
		return config;
	}
	
	
	
	

}
