package com.longtime.app.base.service;

import java.util.List;

import net.sf.json.JSONArray;

import com.longtime.app.base.model.AclRole;
import com.longtime.app.base.model.AclRoleResource;
import com.longtime.app.base.model.AclRoleUser;
import com.longtime.common.service.BaseService;

public interface AclService extends BaseService<AclRole, Long>{

	List<Long> getDomainResource(String domain, Integer type);

	List<Long> getUserResourceIds(String uid, String domain);
	
	List<Long> getResourceIdsByRoleId(String id);
	
	public JSONArray getCanDisplayResourceTree(List<Long> ids,String domain);

	void deleteResourceByRoleId(long roleid);

	void addAclRoleResource(AclRoleResource entity);

	List<String> getUidsByRoleId(String id);

	boolean deleteRoleUserByUidAndRoleId(String uid, String rid);

	void addAclRoleUser(AclRoleUser entity);

	boolean checkUserHasOtherRoleByUid(String uid);

	boolean checkIsHadUsersByRoleId(long long1);


	
}
