<%@page import="org.slf4j.LoggerFactory"%>
<%@page import="org.slf4j.Logger"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="com.longtime.common.spring.SpringContextUtil"%>
<%@page import="com.longtime.ajy.support.weixin.WeiXinAPIHelper"%>
<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%!
MwebHelper mwebHelper = new MwebHelper();
Logger logger = LoggerFactory.getLogger("com.longtime.ajy.mweb.wx_oauth_redirect.jsp");
%>
<%
// 1. 获取 code 
// 2. 通过code获取 openid
// 3. 将openid 写入 cookie 
// 4. redirect 到callback
String fail_page = request.getContextPath() + "/m/error/wx_oauth_error.xhtml";

String  code = request.getParameter("code");
String  domain = request.getParameter("domain");

if(StringUtils.isBlank(code) || StringUtils.isBlank(domain)){
	logger.debug("code or domain is empty.  code=[{}],domain=[{}]", code,domain);
	response.sendRedirect(fail_page);
	return ;
}



/*
String appid = Constant.WX_AJY_APPID;
String secret = Constant.WX_AJY_APPSECRET;
WeiXinAPIHelper.OAuthBaseInfo baseInfo = WeiXinAPIHelper.getOAuthBaseInfo(appid, secret, code);
logger.debug("get oauth base info. data=[{}]", baseInfo);
if(null==baseInfo || StringUtils.isBlank(baseInfo.getOpenid())){
	response.sendRedirect(fail_page);
	return ;
}

String openId = baseInfo.getOpenid();
*/

String openId = MwebHelper.getOpenIdByOauthCode(code, domain);
if( StringUtils.isBlank(openId)){
	response.sendRedirect(fail_page);
	return ;
}
MwebHelper.flushCurrentOpenId(request, response, openId);
String callback = request.getParameter("callback");
logger.debug("get openid success. to redirect. openid=[{}] redirect=[{}]", openId,callback);
response.sendRedirect(callback);
%>
<%--
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires"   content="0">
</head>
<body>
<h1><a href="<%=callback%>">点击继续</a></h1>
<c:redirect url="<%=callback%>"/>

<script type="text/javascript">
	window.location.href='<%=callback%>';
</body>
</html>
 --%>