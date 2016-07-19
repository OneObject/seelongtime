<%@page import="org.slf4j.LoggerFactory"%>
<%@page import="org.slf4j.Logger"%>
<%@ page import="com.longtime.ajy.mweb.MwebHelper" %>
<%@ page import="com.longtime.ajy.model.User" %>
<%@ page import="com.longtime.ajy.ext.enn.xwautologin.Config" %>
<%@ page import="com.longtime.ajy.ext.enn.xwautologin.XwSignature" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires"   content="0">
</head>
<body>
<%!
Logger logger = LoggerFactory.getLogger("com.longtime.ajy.mweb.icoach_redirect.jsp");
%>
<%
	User user = MwebHelper.getCurrentUser(request);


	String userName = user.getUsername();
	//userName="songshaopu";
	String appid = Config.appid;
	String appsecret = Config.appsecret;

	String url = "http://ennicoach.longtimeit.com/student/m/ext/enn/xw/index.xhtml";
	String callback = String.format("%s?%s",url, XwSignature.generateSignQueryString("", appid, appsecret, userName));

	boolean isWx = MwebHelper.isFromWeiXinBrowser(request);
	logger.debug(" redirect.  redirect=[{}]",callback);
%>
<%
	if(isWx){
%>
<script type="text/javascript">

	window.location.href='<%=callback%>';
</script>
<%
	}else{

%>
请在微信中访问
<%
	}
%>
</body>
</html>