package com.longtime.ajy.support.weixin;

import com.alibaba.fastjson.JSONObject;
import com.google.common.base.Charsets;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class WeiXinAPIHelper {

    private static final Logger logger = LoggerFactory.getLogger(WeiXinAPIHelper.class);
    
    
    public static final String OAUTH_CODE_BASEINFO = "snsapi_base";
    
    //private static final String WEIXIN_API_ROOT_URL = " https://api.weixin.qq.com/cgi-bin";
	
	//private static final String WEIXIN_API_USER_INFO_URI = "https://api.weixin.qq.com/cgi-bin/user/info";

	// oauth 
	/**
	 * 生成 oauth 地址
	 * https://open.weixin.qq.com/connect/oauth2/authorize?appid=APPID&redirect_uri=REDIRECT_URI&response_type=code&scope=SCOPE&state=STATE#wechat_redirect
	 */
	public static String  createOauthURL(String appid,String redirect_uri, String scope,String state){
		
		try {
			redirect_uri = URLEncoder.encode(redirect_uri, Charsets.UTF_8.toString());
		} catch (UnsupportedEncodingException e) {
			logger.warn("url encode due to fail.url="+redirect_uri, e);
		}
		return String.format("https://open.weixin.qq.com/connect/oauth2/authorize?appid=%s&redirect_uri=%s&response_type=code&scope=%s&state=%s#wechat_redirect", appid,redirect_uri,scope,state);
	}
	
	//通过oauth获取openid信息
	public static OAuthBaseInfo getOAuthBaseInfo(String appid,String secret, String code){
		
		String jsonStr = HttpsKit.get(String.format("https://api.weixin.qq.com/sns/oauth2/access_token?appid=%s&secret=%s&code=%s&grant_type=authorization_code",appid,secret,code));
		
		logger.debug("oauth get access_token. appid=[{}] secret=[{}] code=[{}].response=[{}]", appid,secret,code,jsonStr);
		
		if(StringUtils.isNotEmpty(jsonStr)){
			JSONObject obj = JSONObject.parseObject(jsonStr);
			if(obj.get("errcode") != null){
				return null;
			}
			OAuthBaseInfo info = JSONObject.toJavaObject(obj, OAuthBaseInfo.class);
			return info;
		}
		return null;
		
	}
	
	public static class OAuthBaseInfo{
		private String access_token;
		private int expires_in;
		private String refresh_token;
		private String openid;
		private String scope;
		public String getAccess_token() {
			return access_token;
		}
		public void setAccess_token(String access_token) {
			this.access_token = access_token;
		}
		public int getExpires_in() {
			return expires_in;
		}
		public void setExpires_in(int expires_in) {
			this.expires_in = expires_in;
		}
		public String getRefresh_token() {
			return refresh_token;
		}
		public void setRefresh_token(String refresh_token) {
			this.refresh_token = refresh_token;
		}
		public String getOpenid() {
			return openid;
		}
		public void setOpenid(String openid) {
			this.openid = openid;
		}
		public String getScope() {
			return scope;
		}
		public void setScope(String scope) {
			this.scope = scope;
		}
        @Override
        public String toString() {
            return String.format("OAuthBaseInfo [access_token=%s, expires_in=%s, refresh_token=%s, openid=%s, scope=%s]",
                                 access_token, expires_in, refresh_token, openid, scope);
        }
			  
		
	}
	
	

	
}
