package com.longtime.app.base.dao.impl;

import org.springframework.stereotype.Repository;

import com.longtime.app.base.dao.UserOrgDao;
import com.longtime.app.base.model.UserOrg;
import com.longtime.common.dao.BaseDAOImpl;

@Repository("userOrgDao")
public class UserOrgDaoImpl extends BaseDAOImpl<UserOrg,String> implements UserOrgDao{
    
}
