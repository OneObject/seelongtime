package com.longtime.app.base.service.impl;

import com.longtime.app.base.model.Tenant;
import com.longtime.app.base.service.LoginService;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

@Service("vmBaseLoginService")
public class VMLoginServiceImpl implements LoginService {

	
	@Override
	public Tenant adminLogin(String loginName, String password, String domain) {
		
		if(StringUtils.isBlank(loginName) || StringUtils.isBlank(password)){
			return null;
		}
		
		Tenant tenant = new Tenant();
		tenant.setId(loginName);
		tenant.setName(loginName);
		tenant.setAdminAccount(loginName);
		tenant.setAdminPwd(password);
		return tenant;
	}

}
