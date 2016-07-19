package com.longtime.ajy.support.weixin;

import com.longtime.ajy.support.SpringContextUtil;
import com.telecom.ctu.platform.common.cache.CacheService;
import java.util.concurrent.atomic.AtomicBoolean;
import me.chanjar.weixin.common.bean.WxAccessToken;
import me.chanjar.weixin.cp.api.WxCpConfigStorage;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class WxCpInRedisConfigStorage implements WxCpConfigStorage {
	
	private static Logger logger = LoggerFactory.getLogger(WxCpInRedisConfigStorage.class);
	
	//private static Map<String, WxCpInRedisConfigStorage> map = new ConcurrentHashMap<String, WxCpInRedisConfigStorage>();
	
	//private volatile AtomicBoolean isCreateToken = new AtomicBoolean(false); //是否生成了accesss token
	
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

	public static void setCacheService(CacheService cacheService) {
		WxCpInRedisConfigStorage.cacheService = cacheService;
	}

	protected volatile String corpId;
	protected volatile String corpSecret;

	protected volatile String token;
	protected volatile String accessToken;
	protected volatile String aesKey;
	protected volatile String agentId;
	protected volatile long expiresTime;

	protected volatile String oauth2redirectUri;

	protected volatile String http_proxy_host;
	protected volatile int http_proxy_port;
	protected volatile String http_proxy_username;
	protected volatile String http_proxy_password;

	public String getAccessToken() {
		if(!init.get()){
			init();
		}
		String accessTokenInRedis = cacheService.get(getTokenKey());
		logger.debug(String.format("accessToken=%s", accessTokenInRedis));
		return accessTokenInRedis;
	}

	public long getExpiresTime() {
		if(!init.get()){
			init();
		}
		Long time = cacheService.get(getExpiresKey());
		logger.debug(String.format("expiresTime=%s", time));
		return (time==null)?0:time;
	}
	
	
	public boolean isAccessTokenExpired() {
		
		return System.currentTimeMillis() > this.getExpiresTime();
	}

	public void expireAccessToken() {
		updateAccessToken(null,0);
	}

	public synchronized void updateAccessToken(WxAccessToken accessToken) {
		updateAccessToken(accessToken.getAccessToken(),
				accessToken.getExpiresIn());
	}

	public synchronized void updateAccessToken(String accessToken,
			int expiresInSeconds) {
		this.expiresTime = System.currentTimeMillis() + (expiresInSeconds - 200) * 1000l;
		if(!init.get()){
			init();
		}
		if(StringUtils.isBlank(accessToken)){ //清除
			//isCreateToken.set(false);
			cacheService.remove(getTokenKey());
			cacheService.remove(getExpiresKey());
			return;
		}
		cacheService.put(getTokenKey(),7200, accessToken);
		cacheService.put(getExpiresKey(),7200, expiresTime);
		//isCreateToken.set(true);
	}
	
	
	public void setAccessToken(String accessToken) {
		if(!init.get()){
			init();
		}
		cacheService.put(getTokenKey(), 7200, accessToken);
	}

	public void setExpiresTime(long expiresTime) {
		if(!init.get()){
			init();
		}
		cacheService.put(getExpiresKey(), 7200, expiresTime);
	}
	

	//缓存accessToken的key
	private String getTokenKey() {
		return String.format("wxcp_at_%s", this.corpId);
	}
	private String getExpiresKey(){
		return String.format("wxcp_at_ttl_%s", this.corpId);
	}

	public String getCorpId() {
		return this.corpId;
	}

	public String getCorpSecret() {
		return this.corpSecret;
	}

	public String getToken() {
		return this.token;
	}

	

	public void setCorpId(String corpId) {
		this.corpId = corpId;
	}

	public void setCorpSecret(String corpSecret) {
		this.corpSecret = corpSecret;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getAesKey() {
		return aesKey;
	}

	public void setAesKey(String aesKey) {
		this.aesKey = aesKey;
	}

	

	public String getAgentId() {
		return agentId;
	}

	public void setAgentId(String agentId) {
		this.agentId = agentId;
	}

	@Override
	public String getOauth2redirectUri() {
		return this.oauth2redirectUri;
	}

	public void setOauth2redirectUri(String oauth2redirectUri) {
		this.oauth2redirectUri = oauth2redirectUri;
	}

	public String getHttp_proxy_host() {
		return http_proxy_host;
	}

	public void setHttp_proxy_host(String http_proxy_host) {
		this.http_proxy_host = http_proxy_host;
	}

	public int getHttp_proxy_port() {
		return http_proxy_port;
	}

	public void setHttp_proxy_port(int http_proxy_port) {
		this.http_proxy_port = http_proxy_port;
	}

	public String getHttp_proxy_username() {
		return http_proxy_username;
	}

	public void setHttp_proxy_username(String http_proxy_username) {
		this.http_proxy_username = http_proxy_username;
	}

	public String getHttp_proxy_password() {
		return http_proxy_password;
	}

	public void setHttp_proxy_password(String http_proxy_password) {
		this.http_proxy_password = http_proxy_password;
	}

	@Override
	public String toString() {
		return "WxCpInMemoryConfigStorage{" + "corpId='" + corpId + '\''
				+ ", corpSecret='" + corpSecret + '\'' + ", token='" + token
				+ '\'' + ", accessToken='" + accessToken + '\'' + ", aesKey='"
				+ aesKey + '\'' + ", agentId='" + agentId + '\''
				+ ", expiresTime=" + expiresTime + ", http_proxy_host='"
				+ http_proxy_host + '\'' + ", http_proxy_port="
				+ http_proxy_port + ", http_proxy_username='"
				+ http_proxy_username + '\'' + ", http_proxy_password='"
				+ http_proxy_password + '\'' + '}';
	}

	public static WxCpInRedisConfigStorage buildWxCpConfigStorage(String appId,String appSecret,String agentid,String token,String aeskey) {
		
		if(StringUtils.isBlank(appId) || StringUtils.isBlank(appSecret)){
			throw new IllegalArgumentException("appid and appSecret must not null.");
		}
		
		WxCpInRedisConfigStorage config = new WxCpInRedisConfigStorage();
		config.setCorpId(appId);      // 设置微信企业号的appid
		config.setCorpSecret(appSecret);  // 设置微信企业号的app corpSecret
		config.setAgentId(agentid);     // 设置微信企业号应用ID
		config.setToken(token);       // 设置微信企业号应用的token
		config.setAesKey(aeskey);      // 设置微信企业号应用的EncodingAESKey
			
		return config;
	}

}
