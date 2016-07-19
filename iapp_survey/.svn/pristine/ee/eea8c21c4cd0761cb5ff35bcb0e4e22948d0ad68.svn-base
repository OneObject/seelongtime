package com.longtime.app.base.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.longtime.app.base.dao.UserOrgDao;
import com.longtime.app.base.model.UserOrg;
import com.longtime.app.base.service.UserOrgService;
import com.longtime.app.util.IdGenerator;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;

@Service("userOrgService")
public class UserOrgServiceImpl extends BaseService4HImpl<UserOrg,String> implements UserOrgService {
    
	@Resource
	private UserOrgDao userOrgDao;
	
	@Override
	public BaseDAO<UserOrg, String> getDAO() {
		return this.userOrgDao;
	}
	
	
	@Override
	public void updateUserOrg(String uid, List<String> oids) {
		if(CollectionUtils.isEmpty(oids)){
			String hql = "delete from UserOrg where uid=?";
			this.userOrgDao.execute(hql, uid);
			return;
		}
		
		Map<String, Object> params = Maps.newHashMap();
		params.put("uid", uid);
		List<UserOrg> userOrgs = this.userOrgDao.list(params);
		
		List<String> adds = getAdds(oids,userOrgs);
		for (String oid : adds) {
			UserOrg userOrg = new UserOrg();
			userOrg.setId(IdGenerator.nextId32().toString());
			userOrg.setUid(uid);
			userOrg.setOid(oid);
			this.userOrgDao.insert(userOrg);
		}
		
		for(UserOrg userOrg : userOrgs){
			if(!oids.contains(userOrg.getOid())){
				this.userOrgDao.delete(userOrg);
			}
		}
	}

	private List<String> getAdds(List<String> oids, List<UserOrg> userOrgs) {
		List<String> adds = Lists.newArrayList();
		for(String oid : oids){
			boolean has = false;
			for(UserOrg userOrg : userOrgs){
				if(oid.equals(userOrg.getOid())){
					has = true;
					break;
				}
			}
			if(!has){
				adds.add(oid);
			}
		}
		return adds;
	}
}
