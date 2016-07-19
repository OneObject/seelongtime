package com.longtime.app.base.service.impl;

import com.longtime.app.base.dao.TenantDao;
import com.longtime.app.base.model.Tenant;
import com.longtime.app.base.service.LoginService;
import javax.annotation.Resource;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

@Service("baseLoginService")
public class LoginServiceImpl implements LoginService {

	@Resource(name="tenantDao")
	private TenantDao tenantDao;
	@Override
	public Tenant adminLogin(String loginName, String password, String domain) {
		
		if(StringUtils.isBlank(loginName) || StringUtils.isBlank(password)){
			return null;
		}
		
		Tenant tenant = tenantDao.getByAccount(loginName);
		
		if(null==tenant || !tenant.isEnable() || !StringUtils.equalsIgnoreCase(password, tenant.getAdminPwd())){
			return null;
		}

		return tenant;
	}

}
