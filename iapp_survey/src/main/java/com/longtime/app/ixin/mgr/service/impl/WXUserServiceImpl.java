package com.longtime.app.ixin.mgr.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.app.ixin.api.WeiXinAPIHelper.WXUserInfo;
import com.longtime.app.ixin.mgr.dao.WXUserDao;
import com.longtime.app.ixin.mgr.model.WXUser;
import com.longtime.app.ixin.mgr.service.WXUserService;

@Service("wxUserService")
public class WXUserServiceImpl implements WXUserService{
	
	@Resource(name = "wxUserDao")
	private WXUserDao wxUserDao;

	@Override
	public WXUser loadById(String id) {
		return this.wxUserDao.loadById(id);
	}

	@Override
	public void add(WXUserInfo wxUserInfo,String domain) {
		this.wxUserDao.add(wxUserInfo,domain);
	}


}
