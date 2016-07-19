package com.longtime.app.ixin.mgr.dao;

import com.longtime.app.base.model.User;
import com.longtime.app.ixin.mgr.model.IXinUser;

public interface IXinUserDao {
	
	public IXinUser loadByOpenId(String openid);

	public void saveOrUpdate(IXinUser user);
	
	String getUidByOpenIdAndDomain(String openid,String domain);
	
	public IXinUser getIxinUserByBaseId(String baseid,String domain);
	
	int deleteByid(String id);
	
	User  getUserByDopenId(String d_openId,String domain);
}
