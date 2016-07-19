package com.longtime.app.base.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.app.base.dao.TenantDao;
import com.longtime.app.base.model.Tenant;
import com.longtime.app.base.service.TenantService;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;

@Service("tenantService")
public class TenantServiceImpl extends BaseService4HImpl<Tenant, String> implements TenantService{

	@Resource(name = "tenantDao")
	private TenantDao tenantDao;
	
	@Override
	public BaseDAO<Tenant, String> getDAO() {
		return this.tenantDao;
	}


}
