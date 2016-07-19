<%@page import="org.slf4j.LoggerFactory"%>
<%@page import="org.slf4j.Logger"%>
<%@page import="com.longtime.app.ixin.api.WeiXinAPIHelper"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="com.longtime.app.ixin.protal.WXOauthFilter"%>
<%@page import="com.longtime.common.spring.SpringContextUtil"%>
<%@page import="com.longtime.app.ixin.mgr.service.ITokenService"%>
<%@page import="com.longtime.app.ixin.mgr.model.TokenInfo"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%!
 	ITokenService tokenService =(ITokenService) SpringContextUtil.getBean("tokenService");

	Logger logger = LoggerFactory.getLogger("com.longtime.app.wx_oauth_redirect.jsp");
	
%>
<%


// 1. 获取 code 
// 2. 通过code获取 openid
// 3. 将openid 写入 cookie 
// 4. redirect 到callback


String fail_page = request.getContextPath() + WXOauthFilter.WX_OAUTH_FAIL_PAGE;

String  code = request.getParameter("code");
String  domain = request.getParameter("domain");

if(StringUtils.isBlank(code) || StringUtils.isBlank(domain)){
	response.sendRedirect(fail_page);
	
	return ;
}



/*

String appid = WXOauthFilter.ajy_app_id;
String secret = WXOauthFilter.ajy_app_secret;
WeiXinAPIHelper.OAuthBaseInfo baseInfo = WeiXinAPIHelper.getOAuthBaseInfo(appid, secret, code);

if(null==baseInfo || StringUtils.isBlank(baseInfo.getOpenid())){
	
	response.sendRedirect(fail_page);
	
	return ;
}
String openId = baseInfo.getOpenid();
*/
String openId = WXOauthFilter.Util.getOpenIdByOauthCode(code, domain);

if(StringUtils.isBlank(openId)){
	response.sendRedirect(fail_page);
	return ;
}
/*
String key = String.format("%s%s",WXOauthFilter.USER_OPENID_KEY_PREIX,domain);
Cookie cookie = new Cookie(key,openId); 
cookie.setMaxAge(86400);  //秒 60*60*24
cookie.setPath("/");
response.addCookie(cookie);
*/
WXOauthFilter.Util.setCurrentUserOpenIdToCookie(response, domain, openId);
String callback = request.getParameter("callback");
logger.debug("get openid success. to redirect. openid=[{}] redirect=[{}]", openId,callback);
response.sendRedirect(callback);
%>
