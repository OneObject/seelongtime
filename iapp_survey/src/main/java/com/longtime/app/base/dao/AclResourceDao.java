package com.longtime.app.base.dao;

import java.util.List;

import com.longtime.app.base.model.AclResource;

import com.longtime.common.dao.BaseDAO;

public interface AclResourceDao extends BaseDAO<AclResource, Long>{

	List<AclResource> listByUid(String uid);

}
