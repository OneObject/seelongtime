package com.longtime.ajy.support.weixin;

import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.cp.api.WxCpService;
import me.chanjar.weixin.cp.api.WxCpServiceImpl;
import me.chanjar.weixin.cp.bean.WxCpUser;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.longtime.ajy.mweb.model.TokenInfo;

public class WxCpAgent {
	
	private static final Logger logger = LoggerFactory.getLogger(WxCpAgent.class);
	
	private static WxCpService getWxCpService(TokenInfo tokenInfo) {
		WxCpInRedisConfigStorage config = WxCpInRedisConfigStorage.buildWxCpConfigStorage(tokenInfo.getAppId(),tokenInfo.getAppSecret(),tokenInfo.getAgentid(),tokenInfo.getToken(),tokenInfo.getAeskey());
		
		WxCpService wxCpService = new WxCpServiceImpl();
		wxCpService.setWxCpConfigStorage(config);
		
		return wxCpService;
	}
	
	
	public static String getOauthOpenId(String code,TokenInfo tokenInfo){
		WxCpService  wxCpService = getWxCpService(tokenInfo);
		
		
		
		try {
			
			wxCpService.getAccessToken();
			String[] res = wxCpService.oauth2getUserInfo(code);
			
			//String userId = res[0];
			//String deviceId = res[1];
			return res[0];
			
		} catch (WxErrorException e) {
			logger.error(String.format("oauth get userid due to error. code=[%s] token=[%s]", code,tokenInfo), e);
		}
		
		return StringUtils.EMPTY;
		
	}
	
	
	
	public static boolean authSuccess2Validate(String userId,TokenInfo tokenInfo){
		WxCpService  wxCpService = getWxCpService(tokenInfo);
		try {
			
			wxCpService.getAccessToken();
			wxCpService.userAuthenticated(userId);
			
			return true;
		} catch (WxErrorException e) {
			logger.error(String.format("qy two validate oauth  to error. userid=[%s] token=[%s]", userId,tokenInfo), e);
		}
		
		return false;
		
	}


	public static String getUserCover(String userid,TokenInfo tokenInfo) {
		WxCpService wxCpService = getWxCpService(tokenInfo);
		if(wxCpService == null){
			return null;
		}
		try {
			WxCpUser wxCpUser = wxCpService.userGet(userid);
			if(wxCpUser != null){
				return wxCpUser.getAvatar();
			}
		} catch (WxErrorException e) {
			logger.error(String.format("get wxCpUser due to error. userid=[%s] token=[%s]", userid,tokenInfo), e);
		}
		return null;
	}


	public static WxCpUser userGet(String userid, TokenInfo tokenInfo) {
		WxCpService wxCpService = getWxCpService(tokenInfo);
		if(wxCpService == null){
			return null;
		}
		try {
			WxCpUser wxCpUser = wxCpService.userGet(userid);
			if(wxCpUser != null){
				return wxCpUser;
			}
		} catch (WxErrorException e) {
			logger.error(String.format("get wxCpUser due to error. userid=[%s] token=[%s]", userid,tokenInfo), e);
		}
		
		return null;
	}

}
