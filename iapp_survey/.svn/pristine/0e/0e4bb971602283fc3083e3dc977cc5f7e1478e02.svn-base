package com.longtime.app.base.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.longtime.app.base.dao.UserRoleDao;
import com.longtime.app.base.model.UserRole;
import com.longtime.common.dao.BaseDAOImpl;

@Repository("userRoleDao")
public class UserRoleDaoImpl extends  BaseDAOImpl<UserRole, String> implements UserRoleDao{
	@Override
	public List<UserRole> listRoleIdByUserId(String userId) {
		// TODO Auto-generated method stub
		
		StringBuffer HQL = new StringBuffer("select entity from UserRole entity where entity.isdel=0 and entity.userId.id=?");
		List<UserRole> list = this.list(HQL.toString(),userId);
        
		return list;
	}
}
