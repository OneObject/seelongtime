<%@page import="org.slf4j.LoggerFactory"%>
<%@page import="org.slf4j.Logger"%>
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
Logger logger = LoggerFactory.getLogger("com.longtime.ajy.mweb.redirect.jsp");
%>
<%
String callback = (String)request.getAttribute("callback");
String domain = (String)request.getAttribute("domain");
logger.debug("fdomain  to redirect. domain=[{}] redirect=[{}]", domain,callback);
%>
<script type="text/javascript">
	window.location.href='<%=callback%>';
</script>
</body>
</html>