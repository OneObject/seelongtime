package com.longtime.app.base.cookie;

import com.longtime.ajy.support.HttpServletHelper;
import com.longtime.app.base.model.Tenant;
import com.longtime.app.base.model.User;
import com.longtime.app.base.service.TenantService;
import com.longtime.app.base.service.UserService;
import com.longtime.app.base.util.Constant;
import com.longtime.app.util.MD5;
import com.longtime.common.spring.SpringContextUtil;
import com.longtime.common.utils.LoginSessionHelper;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CookieReceipt implements Contants {

    private static Logger logger = LoggerFactory.getLogger(CookieReceipt.class);

    public CookieReceipt(HttpServletRequest request, HttpServletResponse response){
        this.request = request;
        this.response = response;
    }

    private HttpServletRequest  request;

    private HttpServletResponse response;
    
    private UserService userService;
    
    private TenantService tenantService;
    
    
    public boolean validate(){
    	String uid=getCookie(request,Contants.COOKIE_KEY_UID);
		String tid=getCookie(request,Contants.COOKIE_KEY_TID);
		String sid=getCookie(request,Contants.COOKIE_KEY_SID);
		String domain=getCookie(request,Contants.COOKIE_KEY_DOMAIN);
		//cookie中有值
		if(StringUtils.isNotBlank(uid) || StringUtils.isNotBlank(tid) || StringUtils.isNotBlank(sid) || StringUtils.isNotBlank(domain)){
			return MD5.encodeMd5(String.format("%s_%s%s",uid,tid,CookieReceipt.COOKIE_MAX_AGE)).equals(sid) || MD5.encodeMd5(String.format("%s_%s%s",uid,tid,CookieReceipt.COOKIE_MIN_AGE)).equals(sid);
		}
    	
    	return false;
    }

    public  void store() {
    	 String uid=LoginSessionHelper.getCurrentUserId(request);
    	 String tid=LoginSessionHelper.getCurrentTenant(request).getId();
    	 
    	  String remberme = request.getParameter("remberme");
          
          int cookie_expire_seconds = Contants.COOKIE_MAX_AGE;//默认7天
          if(remberme == null || !Boolean.valueOf(remberme)){//选了false  缓存1天，cookie-1
          	cookie_expire_seconds = Contants.COOKIE_MIN_AGE;
          }
    	 
    	String sid=uid+"_"+tid+cookie_expire_seconds;
    	 
        addCookieHttpOnly(COOKIE_KEY_DOMAIN, StringUtils.trimToEmpty(LoginSessionHelper.getCurrentDomain(request)),cookie_expire_seconds, response);
        addCookieHttpOnly(COOKIE_KEY_UID,StringUtils.trimToEmpty(uid), cookie_expire_seconds, response);
        addCookieHttpOnly(COOKIE_KEY_TID,StringUtils.trimToEmpty(LoginSessionHelper.getCurrentTenant(request).getId()), cookie_expire_seconds, response);
        addCookieHttpOnly(COOKIE_KEY_SID,StringUtils.trimToEmpty(MD5.encodeMd5(sid)), cookie_expire_seconds, response);
    }

    public  void destory() {
        delCookieHttpOnly(COOKIE_KEY_DOMAIN, response);
        delCookieHttpOnly(COOKIE_KEY_UID, response);
        delCookieHttpOnly(COOKIE_KEY_TID, response);
        delCookieHttpOnly(COOKIE_KEY_SID, response);
    }
    
    public  User getUser(){
    	 User user =new User();
         
         if(userService==null){
         	userService=(UserService) SpringContextUtil.getBean("userService");
         }
         user=this.userService.get(getCookie(request,COOKIE_KEY_UID));
         
         return user;
    }
    
    
    public Tenant getTenant(){
    	Tenant tenant=new Tenant();
    	 if(tenantService==null){
         	tenantService=(TenantService)SpringContextUtil.getBean("tenantService");
         }
         tenant=this.tenantService.get(getCookie(request,COOKIE_KEY_TID));
         return tenant;
    }
    
    private static final String cookie_domain = Constant.COOKIE_DOMAIN;

    private static String getCookieDomain() {
        return StringUtils.isBlank(cookie_domain) ? null : cookie_domain;
    }

    private static void addCookieHttpOnly(String key, String value, HttpServletResponse response) {

        if (StringUtils.isBlank(key)) {
            return;
        }
        Cookie cookie = new Cookie(key, value);
        cookie.setMaxAge(COOKIE_MAX_AGE);
        cookie.setPath(COOKIE_PATH);
        if (StringUtils.isNotBlank(getCookieDomain())) {
            cookie.setDomain(getCookieDomain());
        }
        HttpServletHelper.addCookieHttpOnly(response, cookie);

    }

    private static void addCookieHttpOnly(String key, String value, int time, HttpServletResponse response) {
        if (StringUtils.isBlank(key)) {
            return;
        }
        Cookie cookie = new Cookie(key, value);
        cookie.setMaxAge(time);
        cookie.setPath(COOKIE_PATH);
        if (StringUtils.isNotBlank(getCookieDomain())) {
            cookie.setDomain(getCookieDomain());
        }
        HttpServletHelper.addCookieHttpOnly(response, cookie);

    }

    
    private void delCookieHttpOnly(String key, HttpServletResponse response) {
        Cookie cookie = new Cookie(key, null);
        cookie.setMaxAge(0);
        cookie.setPath(COOKIE_PATH);
        if (StringUtils.isNotBlank(getCookieDomain())) {
            cookie.setDomain(getCookieDomain());
        }
        HttpServletHelper.addCookie(response, cookie);

    }

    public  static String getCookie(HttpServletRequest request, String key) {
        return HttpServletHelper.getCookie(request, key);
    }

}
