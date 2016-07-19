package com.longtime.app.ixin.mgr.service.impl;

import com.longtime.app.base.model.User;
import com.longtime.app.ixin.api.WeiXinAPIHelper;
import com.longtime.app.ixin.api.WeiXinAPIHelper.WXUserInfo;
import com.longtime.app.ixin.mgr.dao.IXinUserDao;
import com.longtime.app.ixin.mgr.model.IXinUser;
import com.longtime.app.ixin.mgr.model.TokenInfo;
import com.longtime.app.ixin.mgr.service.ITokenService;
import com.longtime.app.ixin.mgr.service.IXinUserService;
import javax.annotation.Resource;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service("iXinUserService")
public class IXinUserServiceImpl implements IXinUserService{
	
	
	private static Logger logger = LoggerFactory.getLogger(IXinUserServiceImpl.class );

	@Resource(name = "iXinUserDao")
	IXinUserDao iXinUserDao;
	
	@Resource(name="tokenService")
	ITokenService tokenService;
	
	@Override
	public IXinUser getIxinUserOrInsert(String openId,String domain) {
		
		IXinUser user =  getIxinUserByOpenId(openId);
		
		
		/* 暂时去掉
		 if(null==user || StringUtils.isBlank(user.getNickname())){
			
			WXUserInfo wxUser = getWeiXinUserInfo(openId, domain);
			
			if(null!=wxUser){
				
				if(null==user){
					user =new IXinUser();
				}
				user.setId(UUID.randomUUID().toString());
				user.setOpenid(openId);
				user.setNickname(wxUser.getNickname());
				user.setCompany(wxUser.getCountry());
				user.setHeadimgurl(wxUser.getHeadimgurl());
				user.setDomain(domain);
				user.setSex(wxUser.getSex());
				user.setUpdateTime(System.currentTimeMillis());
				saveOrUpdate(user);
			}
		}
		*/
		
		
		
		return user;
	}
	
	@Override
	public String getUid(String openId,String domain){
		if(StringUtils.isBlank(openId) || StringUtils.isBlank(domain)){
			return null;
		}
		
		return this.iXinUserDao.getUidByOpenIdAndDomain(openId, domain);
		
	}
	
	@Deprecated
	private WXUserInfo getWeiXinUserInfo(String openId,String domain){
		
		// 通过openid获取用户信息
		TokenInfo  tokenInfo = tokenService.queryByDomain(domain);
		
		logger.debug("get weixin config [{}]",tokenInfo);	
		String appId = tokenInfo.getAppId();
		String secret = tokenInfo.getAppSecret();
		
		if(StringUtils.isBlank(appId) || StringUtils.isBlank(secret)){
			return null;
		}
		
		// 调用微信接口获取
		return WeiXinAPIHelper.getUserInfo(appId,secret, openId);
		
	}
	
	@Override
	public IXinUser getIxinUserByOpenId(String openId) {
		
		
		
		return iXinUserDao.loadByOpenId(openId);
	}

	@Override
	public void saveOrUpdate(IXinUser user) {
		iXinUserDao.saveOrUpdate(user);
	}

	@Override
	public IXinUser getIxinUserByBaseId(String baseid, String domain) {
		// TODO Auto-generated method stub
		return iXinUserDao.getIxinUserByBaseId(baseid, domain);
	}

	@Override
	public int deleteByid(String id) {
		return this.iXinUserDao.deleteByid(id);
	}
	
	
	@Override
	public User  getUserByDopenId(String d_openId,String domain){
		
		if(StringUtils.isBlank(domain) || StringUtils.isBlank(d_openId)){
			return null;
		}
		return this.iXinUserDao.getUserByDopenId(d_openId, domain);
	}

}
