<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="com.longtime.common.utils.UAgentInfo"%>
<%@page import="org.apache.commons.lang3.exception.ExceptionUtils"%>
<%@page import="java.util.Arrays"%>
<%@page import="com.longtime.common.dao.Repository"%>
<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true" %>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%response.setStatus(200);
boolean isMobile = false;
String userAgent = request.getHeader("User-Agent");
String httpAccept = request.getHeader("Accept");
if (StringUtils.isBlank(userAgent) && StringUtils.isBlank(httpAccept)) {

}else{
	UAgentInfo detector = new UAgentInfo(userAgent, httpAccept);
	isMobile =  detector.isMobilePhone || detector.isTierTablet || detector.isTierIphone;
}
pageContext.setAttribute("isMobile", isMobile);
%>

<!DOCTYPE html>
<html>
<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="format-detection" content="telephone=no" />
    
    <style type="text/css">
		section.busy{padding:55px 0px 0px 0px;width:100%;text-align:center;overflow:hidden;}
		section.busy img{width:135px;}
		section.busy span{margin-top:27px;font-size:16px;display:block;color:#999;}
		section.b_back{padding:60px 0px 30px 0px;overflow:hidden;text-align:center;}
		section.b_back span{display:inline-block;height:36px;line-height:36px;border-radius:5px;text-align:center;width:88px;text-align:center;font-size:14px;border:1px solid #c4c4c4;color:#999;}  
		
    </style>
	<title>404</title>
	<script type="text/javascript">
		//if(window.top.location != window.location){
		//	window.top.location.href = window.location.href;
		//}
	</script>
</head>

<body>
	
    <article class="scroll">
        <section class="busy">
        	<div>
                <img src="${basepath}/static/img/busy.png"/>
                <span>您访问的页面不存在...</span>
            </div>  
        </section>    
        <section class="b_back">    
            <span class="c" onclick="javascript:history.go(-1);">返回</span>
            <c:if test="${!isMobile }">
            	<a style="display:block;text-align:center;margin-top:20px;color:#999;" href="${basepath}">去首页>></a>  
            </c:if>
        </section>
    </article>
    
    
    <footer class="footer">
    
    
    </footer>
</body>
</html>
