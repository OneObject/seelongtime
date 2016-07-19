package com.longtime.ajy.support.bean;

import me.chanjar.weixin.mp.api.WxMpConfigStorage;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class WxMpInRedisConfigStorage extends AbstractWxInRedisConfigStorage implements WxMpConfigStorage {

	private static Logger logger = LoggerFactory.getLogger(WxMpInRedisConfigStorage.class);

	//缓存accessToken的key
	protected String getTokenKey() {
		return String.format("wxmp_at_%s", this.getAppId());
	}

	protected String getExpiresKey() {
		return String.format("wxmp_at_ttl_%s", this.getAppId());
	}

	//缓存jsapiTicket的key
	protected String getJsapiTicketKey() {
		return String.format("wxmp_jst_%s", this.getAppId());
	}

	protected String getjsapiTicketExpiresKey() {
		return String.format("wxmp_jst_ttl_%s", this.getAppId());
	}
	
	
	public static WxMpInRedisConfigStorage buildWxMpConfigStorage(String appId,String appSecret,String token,String aeskey) {
		
		if(StringUtils.isBlank(appId) || StringUtils.isBlank(appSecret)){
			throw new IllegalArgumentException("appid and appSecret must not null.");
		}
		
		WxMpInRedisConfigStorage config = new WxMpInRedisConfigStorage();
		config.setAppId(appId);      // 设置微信号的appid
		config.setSecret(appSecret);  // 设置微信号的app corpSecret
		config.setToken(token);       // 设置微信号应用的token
		config.setAesKey(aeskey);      // 设置微信应用的EncodingAESKey
			
		return config;
	}

}
