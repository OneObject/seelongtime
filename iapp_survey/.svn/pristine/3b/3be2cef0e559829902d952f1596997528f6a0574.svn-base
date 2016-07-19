package com.longtime.app.base.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.app.base.dao.RoleDao;
import com.longtime.app.base.model.Role;
import com.longtime.app.base.service.RoleService;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;

@Service("roleService")
public class RoleServiceImpl  extends BaseService4HImpl<Role, String> implements RoleService{

	@Resource
	private RoleDao roleDao; 
	
	@Override
	public BaseDAO<Role, String> getDAO() {
		// TODO Auto-generated method stub
		return roleDao;
	}


}
