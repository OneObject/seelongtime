package com.longtime.app.base.dao;

import com.longtime.app.base.model.TenantConfig;
import com.longtime.common.dao.BaseDAO;

public interface TenantConfigDao extends BaseDAO<TenantConfig, String>{
	
	TenantConfig  getByDomain(String domain);

}
