<%@page import="com.longtime.ajy.session.SessionHelper"%>
<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%
MwebHelper.flushCurrentOpenId(request, response, null);

SessionHelper.removeSession(request, response);

%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
</head>
<body >
清理成功！
</body>
</html>
