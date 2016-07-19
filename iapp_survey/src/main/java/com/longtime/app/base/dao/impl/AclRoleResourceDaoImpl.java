package com.longtime.app.base.dao.impl;

import org.springframework.stereotype.Repository;

import com.longtime.app.base.dao.AclRoleResourceDao;
import com.longtime.app.base.model.AclRoleResource;
import com.longtime.common.dao.BaseDAOImpl;

@Repository("aclRoleResourceDao")
public class AclRoleResourceDaoImpl extends  BaseDAOImpl<AclRoleResource, Long> implements AclRoleResourceDao{

}
