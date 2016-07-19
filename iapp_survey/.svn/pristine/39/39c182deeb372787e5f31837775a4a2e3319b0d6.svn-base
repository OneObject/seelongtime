package com.longtime.app.base.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.app.base.dao.UserGroupDao;
import com.longtime.app.base.model.BaseGroup;
import com.longtime.app.base.service.UserGroupService;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;
@Service(value="userGroupService")
public class UserGroupServiceImpl extends BaseService4HImpl<BaseGroup,String> implements UserGroupService {
    
	@Resource
	private UserGroupDao userGroupDao;
	
	@Override
	public BaseDAO<BaseGroup, String> getDAO() {
		return this.userGroupDao;
	}

}
