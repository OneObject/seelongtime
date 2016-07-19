<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="org.slf4j.LoggerFactory"%>
<%@page import="org.slf4j.Logger"%>
<%@page import="com.longtime.ajy.session.Contants"%>
<%!
Logger logger = LoggerFactory.getLogger("com.longtime.ajy.mweb.oauth_dingtalk_redirect.jsp");
%>
<%
String callback = request.getParameter("callback");
String domain = request.getParameter("domain");

if(callback==null){
    callback = String.format("%s%s",request.getContextPath(),"/m/h5/index.xhtml");
}
logger.debug("fdomain  to redirect. domain=[{}] redirect=[{}]", domain,callback);
request.setAttribute("callback", callback);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>跳转中...</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires"   content="0">
<!-- jquery js -->
<script type="text/javascript"	src="<%=request.getContextPath()%>/static/player/js/jquery-1.8.3.js"></script>
<script type="text/javascript"	src="<%=request.getContextPath()%>/static/player/js/jquery.cookie.js"></script>
<script type="text/javascript" src="https://oapi.fosun.com/m/js/fosun_oapi_login-2.0.0_v2.js"></script>
<script type="text/javascript">
	//$.cookie("<%=Contants.COOKIE_KEY_EXT%>", "songshaopu@longtimeit.com",{path:"/"});
	//alert("inputLogin_test.html ready");
	fosun_oapi_login.getDDAccount(function(user){
		//alert("inputLogin_test.html getuser:"+user.appUID+"/"+user.fullname+"/"+user.email);
		var name = user.fullname;
		var email = user.email;
		$.cookie("<%=Contants.COOKIE_KEY_EXT%>", email,{path:"/"}); 
		//alert("<%=callback%>");
		window.location.href='<%=callback%>';
	}); 
</script>
</head>
<body>
${callback}
</body>
</html>