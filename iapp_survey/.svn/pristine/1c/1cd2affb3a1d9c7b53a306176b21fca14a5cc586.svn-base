package com.longtime.ajy.support.bean;

import me.chanjar.weixin.common.bean.WxAccessToken;
import com.longtime.common.spring.SpringContextUtil;
import com.telecom.ctu.platform.common.cache.CacheService;
import java.util.concurrent.atomic.AtomicBoolean;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

abstract class AbstractWxInRedisConfigStorage {

	private static Logger logger = LoggerFactory.getLogger(AbstractWxInRedisConfigStorage.class);

	protected volatile String appId;
	protected volatile String secret;
	protected volatile String token;
	protected volatile String accessToken;
	protected volatile String aesKey;
	protected volatile long expiresTime;
	protected volatile String oauth2redirectUri;

	protected volatile String http_proxy_host;
	protected volatile int http_proxy_port;
	protected volatile String http_proxy_username;
	protected volatile String http_proxy_password;

	protected volatile String jsapiTicket;
	protected volatile long jsapiTicketExpiresTime;

	private static volatile AtomicBoolean init = new AtomicBoolean(false);

	private static CacheService cacheService;

	private static void init() {
		if (init.get()) {
			return;
		}
		synchronized (init) {
			if (init.get()) {
				return;
			}
			if (null == cacheService) {
				cacheService = (CacheService) SpringContextUtil.getBean("lt.cacheService");
			}
			init.set(true);
		}
	}

	public String getAccessToken() {
		init();
		String accessTokenInRedis = cacheService.get(getTokenKey());
		logger.debug(String.format("accessToken=%s", accessTokenInRedis));
		return accessTokenInRedis;
	}

	public long getExpiresTime() {
		init();
		Long time = cacheService.get(getExpiresKey());
		logger.debug(String.format("expiresTime=%s", time));
		return (null == time) ? 0 : time;
	}

	public boolean isAccessTokenExpired() {
		return System.currentTimeMillis() > this.getExpiresTime();
	}

	public void updateAccessToken(WxAccessToken accessToken) {
		this.updateAccessToken(accessToken.getAccessToken(), accessToken.getExpiresIn());
	}

	public synchronized void updateAccessToken(String accessToken, int expiresInSeconds) {
		long expiresTime = System.currentTimeMillis() + (expiresInSeconds - 200) * 1000L;
		init();
		if (StringUtils.isBlank(accessToken)) { //清除
			//isCreateToken.set(false);
			cacheService.remove(getTokenKey());
			cacheService.remove(getExpiresKey());
			return;
		}
		cacheService.put(getTokenKey(), 7200, accessToken);
		cacheService.put(getExpiresKey(), 7200, expiresTime);
	}

	public void setAccessToken(String accessToken) {
		init();
		cacheService.put(getTokenKey(), 7200, accessToken);
	}

	public void setExpiresTime(long expiresTime) {
		init();
		cacheService.put(getExpiresKey(), 7200, expiresTime);
	}

	public void expireAccessToken() {
		updateAccessToken(null, 0);
	}

	public String getJsapiTicket() {
		init();
		String jsapiTicketInRedis = cacheService.get(getJsapiTicketKey());
		logger.debug(String.format("jsapiTicketInRedis=%s", jsapiTicketInRedis));
		return jsapiTicketInRedis;

	}

	public void setJsapiTicket(String jsapiTicket) {
		init();
		cacheService.put(getJsapiTicketKey(), 7200, jsapiTicket);
	}

	public long getJsapiTicketExpiresTime() {
		init();
		Long time = cacheService.get(getjsapiTicketExpiresKey());
		logger.debug(String.format("jsapiTicketExpiresTime=%s", time));
		return (null == time) ? 0 : time;
	}

	public void setJsapiTicketExpiresTime(long jsapiTicketExpiresTime) {
		init();
		cacheService.put(getjsapiTicketExpiresKey(), 7200, jsapiTicketExpiresTime);
	}

	public boolean isJsapiTicketExpired() {
		return System.currentTimeMillis() > getJsapiTicketExpiresTime();
	}

	public synchronized void updateJsapiTicket(String jsapiTicket, int expiresInSeconds) {
		// 预留200秒的时间
		init();
		if (StringUtils.isBlank(jsapiTicket)) { //清除
			//isCreateToken.set(false);
			cacheService.remove(getJsapiTicketKey());
			cacheService.remove(getjsapiTicketExpiresKey());
			return;
		}

		long jsapiTicketExpiresTime = System.currentTimeMillis() + (expiresInSeconds - 200) * 1000L;
		cacheService.put(getJsapiTicketKey(), 7200, jsapiTicket);
		cacheService.put(getjsapiTicketExpiresKey(), 7200, jsapiTicketExpiresTime);
	}

	public void expireJsapiTicket() {
		updateJsapiTicket(null, 0);
	}

	public String getToken() {
		return this.token;
	}

	public String getAesKey() {
		return this.aesKey;
	}

	public String getOauth2redirectUri() {
		return this.oauth2redirectUri;
	}

	public String getHttp_proxy_host() {
		return this.http_proxy_host;
	}

	public int getHttp_proxy_port() {
		return this.http_proxy_port;
	}

	public String getHttp_proxy_username() {
		return this.http_proxy_username;
	}

	public String getHttp_proxy_password() {
		return this.http_proxy_password;
	}

	public String getAppId() {
		return this.appId;
	}

	public String getSecret() {
		return this.secret;
	}
	
	

	public void setAppId(String appId) {
		this.appId = appId;
	}

	public void setSecret(String secret) {
		this.secret = secret;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public void setAesKey(String aesKey) {
		this.aesKey = aesKey;
	}

	//缓存accessToken的key
	abstract String getTokenKey();

	abstract String getExpiresKey();

	//缓存jsapiTicket的key
	abstract String getJsapiTicketKey();

	abstract String getjsapiTicketExpiresKey();

}
