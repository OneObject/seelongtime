package com.longtime.app.base.dao.impl;

import org.springframework.stereotype.Repository;

import com.longtime.app.base.dao.RoleDao;
import com.longtime.app.base.model.Role;
import com.longtime.common.dao.BaseDAOImpl;

@Repository("roleDao")
public class RoleDaoImpl  extends BaseDAOImpl<Role, String> implements RoleDao{

}
