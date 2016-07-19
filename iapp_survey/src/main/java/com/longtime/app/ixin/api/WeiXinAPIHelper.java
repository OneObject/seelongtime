package com.longtime.app.ixin.api;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.io.Charsets;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSONObject;
import com.longtime.app.ixin.utils.HttpsKit;

public class WeiXinAPIHelper {

    private static final Logger logger = LoggerFactory.getLogger(WeiXinAPIHelper.class);
    
    
    public static final String OAUTH_CODE_BASEINFO = "snsapi_base";
    
    private static final String WEIXIN_API_ROOT_URL = " https://api.weixin.qq.com/cgi-bin";
	
	private static final String WEIXIN_API_USER_INFO_URI = "https://api.weixin.qq.com/cgi-bin/user/info";

	public static String getAccessToken(String appid, String appsecret) {

		String url = String.format("%s/token?grant_type=client_credential&appid=%s&secret=%s",
			WEIXIN_API_ROOT_URL,
			appid,
			appsecret);
		String accessToken = null;
		InputStream is = null;
		HttpURLConnection http = null;
		try {
			URL urlGet = new URL(url);
			http = (HttpURLConnection) urlGet.openConnection();

			configConnection(http, "GET");

			http.connect();

			is = http.getInputStream();
			int size = is.available();
			byte[] jsonBytes = new byte[size];
			is.read(jsonBytes);
			String message = new String(jsonBytes, "UTF-8");

			logger.debug("get access_token. appid=[{}],appsecret=[{}] . response=[{}]",appid,appsecret,message);
			JSONObject demoJson = JSONObject.parseObject(message);
			accessToken = demoJson.getString("access_token");

		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(null!=is){
			try {
				is.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}
			if(null!=http){
				http.disconnect();
			}
		}
		return accessToken;
	}

	/**
	 * 创建Menu
	 * 
	 * @Title: createMenu
	 * @Description: 创建Menu
	 * @param @return
	 * @param @throws IOException 设定文件
	 * @return int 返回类型
	 * @throws
	 */
	public static JSONObject createMenu(String appid, String appsecret, String menuData) {
		String access_token = getAccessToken(appid, appsecret);

		String action = String.format("%s/menu/create?access_token=%s", WEIXIN_API_ROOT_URL, access_token);
		HttpURLConnection http = null;
		try {
			URL url = new URL(action);
			http = (HttpURLConnection) url.openConnection();

			configConnection(http, "POST");
			http.connect();
			OutputStream os = http.getOutputStream();
			os.write(menuData.getBytes("UTF-8"));//传入参数    
			os.flush();
			os.close();

			InputStream is = http.getInputStream();
			int size = is.available();
			byte[] jsonBytes = new byte[size];
			is.read(jsonBytes);
			String message = new String(jsonBytes, "UTF-8");
			JSONObject demoJson = JSONObject.parseObject(message);
			logger.debug(message);
			
			return demoJson;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(null!=http){
				http.disconnect();
			}
		}
		return null;
	}

	private static void configConnection(HttpURLConnection conn, String method) throws ProtocolException {
		conn.setRequestMethod(method);
		conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
		conn.setDoOutput(true);
		conn.setDoInput(true);
		conn.setConnectTimeout(10000);
		conn.setReadTimeout(10000);
	}

	/**
	 * 删除当前Menu
	 * 
	 * @Title: deleteMenu
	 * @Description: 删除当前Menu
	 * @param @return 设定文件
	 * @return String 返回类型
	 * @throws
	 */
	public static String deleteMenu(String appid, String appsecret) {
		String access_token = getAccessToken(appid, appsecret);

		String action = String.format("%s/menu/delete?access_token=%s", WEIXIN_API_ROOT_URL, access_token);

		try {
			URL url = new URL(action);
			HttpURLConnection http = (HttpURLConnection) url.openConnection();

			configConnection(http, "GET");

			http.connect();
			OutputStream os = http.getOutputStream();
			os.flush();
			os.close();

			InputStream is = http.getInputStream();
			int size = is.available();
			byte[] jsonBytes = new byte[size];
			is.read(jsonBytes);
			String message = new String(jsonBytes, "UTF-8");
			JSONObject jsonObject = JSONObject.parseObject(message);
			String errcode = jsonObject.getString("errcode");
			if("0".equals(errcode)){
				return "删除自定义菜单成功";
			} else {
				logger.error(String.format("删除自定义菜单失败，原因是:%s", jsonObject.get("errmsg")));
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "删除自定义菜单失败";
	}
	
	

	public static WXUserInfo  getUserInfo(String appId,String appSecret,String openId){
		
	    if(StringUtils.isBlank(appId) || StringUtils.isBlank(appSecret)){
	        return null;
	    }
		String accessToken = getAccessToken(appId, appSecret);
		
		if(StringUtils.isBlank(accessToken)){
			return null;
		}
		return getUserInfo(accessToken, openId);
		
	}
	
	
	
	//获取关注者的用户信息
	private static WXUserInfo getUserInfo(String accessToken, String openid)  {
        
        if(StringUtils.isBlank(accessToken)){
            return null;
        }
	    
		Map<String, String> params = new HashMap<String, String>();
		params.put("access_token", accessToken);
		params.put("openid", openid);
		String jsonStr = null;
		try {
			jsonStr = HttpsKit.get(WEIXIN_API_USER_INFO_URI, params);
			
			logger.debug("get userinfo . response=[{}]",jsonStr);
		} catch (Exception e) {
			logger.error(String.format("get userinfo due to fail. openid=[%s]",openid), e);
		}
		if(StringUtils.isNotEmpty(jsonStr)){
			JSONObject obj = JSONObject.parseObject(jsonStr);
			if(obj.get("errcode") != null){
				return null;
			}
			WXUserInfo user = JSONObject.toJavaObject(obj, WXUserInfo.class);
			return user;
		}
		return null;
	}
	

	public static void main(String[] args) {

		String appid = "wx2c45ee10e5f75767";

		String appsecret = "a7453ea8e4655bc920a9c94c026fd695";
		System.out.println(getAccessToken(appid, appsecret));

	}
	
	
	

	
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
			  
		
	}
	
	
	public static class WXUserInfo {

 		private int subscribe;
		private String openid;
		private String nickname;
	    private int sex;
	    private String language;
	    private String city;
	    private String province;
	    private String country;
	    private String headimgurl; 
	    private Long subscribe_time;
	    
		public int getSubscribe() {
			return subscribe;
		}
		public void setSubscribe(int subscribe) {
			this.subscribe = subscribe;
		}
		public String getOpenid() {
			return openid;
		}
		public void setOpenid(String openid) {
			this.openid = openid;
		}
		public String getNickname() {
			return nickname;
		}
		public void setNickname(String nickname) {
			this.nickname = nickname;
		}
		public int getSex() {
			return sex;
		}
		public void setSex(int sex) {
			this.sex = sex;
		}
		public String getLanguage() {
			return language;
		}
		public void setLanguage(String language) {
			this.language = language;
		}
		public String getCity() {
			return city;
		}
		public void setCity(String city) {
			this.city = city;
		}
		public String getProvince() {
			return province;
		}
		public void setProvince(String province) {
			this.province = province;
		}
		public String getCountry() {
			return country;
		}
		public void setCountry(String country) {
			this.country = country;
		}
		public String getHeadimgurl() {
			return headimgurl;
		}
		public void setHeadimgurl(String headimgurl) {
			this.headimgurl = headimgurl;
		}
		public Long getSubscribe_time() {
			return subscribe_time;
		}
		public void setSubscribe_time(Long subscribe_time) {
			this.subscribe_time = subscribe_time;
		}
	}

	
}
