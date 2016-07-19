package com.longtime.app.base.dao.impl;

import com.longtime.app.base.dao.TenantDao;
import com.longtime.app.base.model.Tenant;
import com.longtime.common.dao.BaseDAOImpl;
import java.util.List;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

@Repository("tenantDao")
public class TenantDaoImpl extends  BaseDAOImpl<Tenant, String> implements TenantDao{
	
	@Override
	public Tenant getByAccount(String account) {
		if(StringUtils.isBlank(account)){
			return null;
		}
		
		List<Tenant> list = this.list("from Tenant where adminAccount=?", StringUtils.lowerCase(account));
		
		if(null==list || list.isEmpty()){
			return null;
		}
		
		return list.get(0);
	}

}
