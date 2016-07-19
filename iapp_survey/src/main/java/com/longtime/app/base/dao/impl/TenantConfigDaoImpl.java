package com.longtime.app.base.dao.impl;

import com.longtime.app.base.dao.TenantConfigDao;
import com.longtime.app.base.model.TenantConfig;
import com.longtime.common.dao.BaseDAOImpl;
import org.springframework.stereotype.Repository;

@Repository("tenantConfigDao")
public class TenantConfigDaoImpl extends  BaseDAOImpl<TenantConfig, String> implements TenantConfigDao{

	@Override
	public TenantConfig getByDomain(String domain) {
		return this.get(domain);
	}

	
}
