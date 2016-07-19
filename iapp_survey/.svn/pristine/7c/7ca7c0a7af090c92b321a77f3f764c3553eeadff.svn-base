<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport">
        <meta content="yes" name="apple-mobile-web-app-capable">
        <meta content="black" name="apple-mobile-web-app-status-bar-style">
</head>
<body>

<%

String domain = request.getParameter("domain");
Cookie cook[] = request.getCookies(); 

String current_domain_openid = "";
for(int i = 0;i < cook.length;i++){ 
 if(cook[i].getName().equals("wx_oauth_openid_"+domain)){ 
	 current_domain_openid = cook[i].getValue(); 
	 
	 %>
	 
	 <%=cook[i].getName() %> : <%=cook[i].getValue() %>  <br>
	 
	 <%
 } 
} 

%>

<br>
<p>


<p>

current domain cookie:<%=current_domain_openid %><br>


<p>
</body>
</html>