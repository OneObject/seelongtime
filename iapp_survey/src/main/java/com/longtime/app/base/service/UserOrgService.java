package com.longtime.app.base.service;

import java.util.List;

import com.longtime.app.base.model.UserOrg;
import com.longtime.common.service.BaseService;

public interface UserOrgService extends BaseService<UserOrg,String> {

	void updateUserOrg(String id, List<String> oids);
    
}
