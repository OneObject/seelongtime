package com.longtime.app.base.dao.impl;

import org.springframework.stereotype.Repository;

import com.longtime.app.base.dao.AclResourceDomainDao;
import com.longtime.app.base.model.AclResourceDomain;
import com.longtime.common.dao.BaseDAOImpl;

@Repository("aclResourceDomainDao")
public class AclResourceDomainDaoImpl extends  BaseDAOImpl<AclResourceDomain, Long> implements AclResourceDomainDao{

}
