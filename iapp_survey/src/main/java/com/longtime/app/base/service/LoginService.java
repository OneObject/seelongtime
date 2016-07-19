package com.longtime.app.base.service;

import com.longtime.app.base.model.Tenant;

public interface LoginService {
	
		
	Tenant adminLogin(String loginName,String password,String domain);

}
