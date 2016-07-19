<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html>
<head>
<title><sitemesh:title/></title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
 <link rel="shortcut icon" type="image/ico" href="${basepath }/static/img/favicon.ico">
<link rel="stylesheet" href="${staticpath}/static/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${basepath}/static/plugins/fonticon/css/font-awesome.min.css">
<link rel="stylesheet" href="${staticpath}/static/css/frame.css">
<link rel="stylesheet" href="${staticpath}/static/css/style.css">
<script>
var basepath='${basepath}';
</script>
<script type="text/javascript" src="${staticpath}/static/js/jquery-2.1.0.min.js"></script>
<script type="text/javascript" src="${staticpath}/static/plugins/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${staticpath }/static/m/common.js"></script>
<sitemesh:head/>
<sitemesh:usePage id="sitemeshPage" />
<%
String menu_path = sitemeshPage.getProperty("meta.menu_path");
if(null!=menu_path && !"".equals(menu_path)){
	String[] paths = menu_path.split("\\.");
	for(String path :paths){
		request.setAttribute("menu_"+path, "active");
	}
}
%>
</head>
<body>
<%@ include file="/WEB-INF/layouts/header.jsp"%>
<section class="body">
    <%@ include file="/WEB-INF/layouts/menu.jsp"%>
    <article class="main" id="main-container">
        <!--主要内容区域-->
		<sitemesh:body/>
		<!-- end -->
    </article>
</section>
<%@ include file="/WEB-INF/layouts/footer.jsp"%>
</body>
</html>
<sitemesh:getProperty property="page.extra_js" /><%--html结束后的js内容. 如下 
<!-- 自定义的内容 -->
<content tag="extra_js">  
<script>
alert(1);
</script>
</content> 
--%>
<%@ include file="/WEB-INF/include/analysis.jsp"%>