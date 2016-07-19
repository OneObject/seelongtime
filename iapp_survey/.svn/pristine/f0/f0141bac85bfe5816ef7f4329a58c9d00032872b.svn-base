package com.longtime.app.ixin.mgr.service;

import com.longtime.app.base.model.User;
import com.longtime.app.ixin.mgr.model.IXinUser;

public interface IXinUserService {

	
	/**
	 * 通过opendid 获取微信用户信息，如果没有，则新增，同时调用微信用户接口获取用户信息
	 * @param openId
	 * @param domain
	 * @return
	 */
	public IXinUser getIxinUserOrInsert(String openId,String domain);
	
	public IXinUser getIxinUserByOpenId(String openId);

	public void saveOrUpdate(IXinUser user);
	
	public IXinUser getIxinUserByBaseId(String baseid,String domain);
	String getUid(String openId,String domain);
	
	int deleteByid(String id);
	
	
	User  getUserByDopenId(String d_openId,String domain);
}
