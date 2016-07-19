package com.longtime.app.base.dao.impl;

import org.springframework.stereotype.Repository;

import com.longtime.app.base.dao.AclRoleDao;
import com.longtime.app.base.model.AclRole;
import com.longtime.common.dao.BaseDAOImpl;

@Repository("aclRoleDao")
public class AclRoleDaoImpl extends  BaseDAOImpl<AclRole, Long> implements AclRoleDao{

}
