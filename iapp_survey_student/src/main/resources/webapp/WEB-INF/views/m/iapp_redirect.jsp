<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="org.slf4j.LoggerFactory"%>
<%@page import="org.slf4j.Logger"%>
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
Logger logger = LoggerFactory.getLogger("com.longtime.ajy.mweb.iapp_redirect.jsp");
%>
<%
String callback = request.getParameter("callback");
String domain = request.getParameter("domain");
logger.debug("fdomain  to redirect. domain=[{}] redirect=[{}]", domain,callback);
request.setAttribute("callback", callback);
%>
<script type="text/javascript">
	//window.location.href='<%=callback%>';
</script>
<c:redirect url="${callback}"></c:redirect>
</body>
</html>