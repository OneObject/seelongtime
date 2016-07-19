package com.longtime.ajy.session;

import com.longtime.ajy.student.config.Constant;
import com.longtime.ajy.support.HttpServletHelper;
import com.longtime.common.utils.encrypt.XorUtils;
import java.util.UUID;
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

    protected void store(LocalSession receipt) {
        
        store(receipt,COOKIE_MAX_AGE);
        /*
        addCookieHttpOnly(COOKIE_KEY_SID, StringUtils.trimToEmpty(receipt.getSid()), response);
        addCookieHttpOnly(COOKIE_KEY_FILTER_RECEIPT, toCookieValue(receipt.getLoginSession()), response);
        addCookieHttpOnly(COOKIE_KEY_DOMAIN, StringUtils.trimToEmpty(receipt.getDomain()), response);
        addCookieHttpOnly(COOKIE_KEY_OPNEID, StringUtils.trimToEmpty(receipt.getOpenId()), response);
        */
    }
    
    protected void store(LocalSession receipt, int cookie_expire_seconds) {
    	 addCookieHttpOnly(COOKIE_KEY_SID, StringUtils.trimToEmpty(receipt.getSid()), cookie_expire_seconds, response);
         addCookieHttpOnly(COOKIE_KEY_FILTER_RECEIPT, toCookieValue(receipt.getLoginSession()), cookie_expire_seconds, response);
         addCookieHttpOnly(COOKIE_KEY_DOMAIN, StringUtils.trimToEmpty(receipt.getDomain()), cookie_expire_seconds, response);
         addCookieHttpOnly(COOKIE_KEY_OPNEID, StringUtils.trimToEmpty(receipt.getOpenId()), cookie_expire_seconds, response);
         addCookieHttpOnly(COOKIE_KEY_EXT, StringUtils.trimToEmpty(receipt.getExt()), cookie_expire_seconds, response);
	}

    protected void destory() {
        this.delCookieHttpOnly(COOKIE_KEY_SID, response);
        this.delCookieHttpOnly(COOKIE_KEY_FILTER_RECEIPT, response);
        this.delCookieHttpOnly(COOKIE_KEY_DOMAIN, response);
        this.delCookieHttpOnly(COOKIE_KEY_OPNEID, response);
        this.delCookieHttpOnly(COOKIE_KEY_EXT, response);
    }

    protected LocalSession retrive() {
        LocalSession localSession = new LocalSession();
        String sid = getCookie(request, COOKIE_KEY_SID);
        String domain = getCookie(request, COOKIE_KEY_DOMAIN);
        String openId = getCookie(request, COOKIE_KEY_OPNEID);
        String ext = getCookie(request, COOKIE_KEY_EXT);

        String cookie_str = HttpServletHelper.getCookie(request, COOKIE_KEY_FILTER_RECEIPT);
        LoginSession loginSession = null;
        if (StringUtils.isNotBlank(cookie_str)) {
            loginSession = StringUtils.isNotBlank(cookie_str) ? fromCookieValue(cookie_str) : null;
        }
        //localSession.setSid(sid);
        localSession.setDomain(domain);
        localSession.setOpenId(openId);
        localSession.setExt(ext);
        if(null!=loginSession && StringUtils.equals(domain,loginSession.getDomain()) && StringUtils.equals(sid, loginSession.getSid())){
            localSession.setLoginSession(loginSession);  
        }else{
            this.delCookieHttpOnly(COOKIE_KEY_FILTER_RECEIPT, response);
        }
        return localSession;
    }

    private static final char encryptSeparate = '/';
    private static final String seralFormat = "%s|%s|%s|%s|%s";
    private static final int seralFormatItemSize = 5;
    private static String toCookieValue(LoginSession receipt) {
        if (null == receipt) {
            return null;
        }
        String str = String.format(seralFormat, StringUtils.trimToEmpty(receipt.getSid()),
                                   StringUtils.trimToEmpty(receipt.getUid()),
                                   StringUtils.trimToEmpty(receipt.getUname()),
                                   StringUtils.trimToEmpty(receipt.getDomain()), System.currentTimeMillis());
        return XorUtils.encrypt(0, encryptSeparate, str);
    }
    private static LoginSession fromCookieValue(String value) {
        if (StringUtils.isBlank(value)) {
            return null;
        }
        String str = XorUtils.decrypt(0, encryptSeparate, value);
        String[] items = str.split("\\|");
        if (items.length != seralFormatItemSize) {
            return null;
        }
        LoginSession receipt = new LoginSession();
        receipt.setSid(items[0]);
        receipt.setUid(items[1]);
        receipt.setUname(items[2]);
        receipt.setDomain(items[3]);
        return receipt;
    }

    private static final String cookie_domain = Constant.COOKIE_DOMAIN;

    private static String getCookieDomain() {
        return StringUtils.isBlank(cookie_domain) ? null : cookie_domain;
    }

    
    private static void addCookieHttpOnly(String key, String value, int cookie_expire_seconds,
 			HttpServletResponse response) {
        if (StringUtils.isBlank(key)) {
            return;
        }
        Cookie cookie = new Cookie(key, value);
        cookie.setMaxAge(cookie_expire_seconds);
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

    private static String getCookie(HttpServletRequest request, String key) {
        return HttpServletHelper.getCookie(request, key);
    }

    public static void main(String[] args) {
        CookieReceipt r = new CookieReceipt(null, null);

        LoginSession receipt = new LoginSession();
        receipt.setSid(UUID.randomUUID().toString());
        receipt.setUid("100");
        receipt.setUname("songsp@longtimeit.com");
        receipt.setDomain("ajy");
        String str = r.toCookieValue(receipt);
        System.out.println(r.toCookieValue(receipt));

        str="lt.receipt=99/51/53/100/56/50/56/48/57/51/99/55/52/51/49/48/98/57/50/52/98/53/54/97/100/51/56/55/53/54/98/49/124/49/124/29233/21152/27833/124/97/106/121/124/49/51/57/54/54/55/55/52/50/56/52/51/51/; path=/; domain=test1.web.com; HttpOnly";

        System.out.println(XorUtils.decrypt(0, encryptSeparate, str));

        receipt = r.fromCookieValue(str);

    }
}
