<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="com.longtime.common.filter.XssFilter"%>
<%@page import="org.apache.commons.lang3.BooleanUtils"%>
<%@page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html lang="en" id="top" class="no-js">
<head>
<meta charset="utf-8">
<title>xssfilter开关</title>
</head>
<body>
<%
String code = request.getParameter("code");

if("ajy".equals(code)){
	
	String stropen = request.getParameter("open");
	
	if(StringUtils.isNotBlank(stropen)){
		if("true".equals(stropen)){
			 XssFilter.ISOPEN = true;
		}
		if("false".equals(stropen))
		{
			XssFilter.ISOPEN = false;
		}
	}
	%>
	xss过滤是否打开：<%=XssFilter.ISOPEN%>
	
	<%
}
%>
</body>
</html>