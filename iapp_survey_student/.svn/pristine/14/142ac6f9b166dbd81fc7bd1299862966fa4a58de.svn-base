<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html>
<head>
<title><sitemesh:title/></title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
 <link rel="shortcut icon" type="image/ico" href="${basepath }/static/img/favicon.ico">
<link rel="stylesheet" href="${basepath}/static/plugins/fonticon/css/font-awesome.min.css">
<link rel="stylesheet" href="${staticpath}/static/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${staticpath}/static/plugins/bootstrap/css/bootstrap-theme.css">
<!-- <link rel="stylesheet" href="${staticpath}/static/m/new.css"> -->
<sitemesh:usePage id="sitemeshPage" />
<script type="text/javascript">
<%
String hideToolbar = sitemeshPage.getProperty("meta.hiddenWxToolbar");
if("true".equals(hideToolbar)){
%>

    //去掉底部的黑条
    document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
    	WeixinJSBridge.call('hideToolbar');
    });
<%	
}
%>
<%
String hideMenubar = sitemeshPage.getProperty("meta.hiddenWxMenubar");
hideMenubar = "true";
if("true".equals(hideMenubar)){
%>
    //去掉右上角选项
    document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
    	WeixinJSBridge.call('hideOptionMenu');
    });

<%	
}
%>

</script>
<script>
var basepath='${basepath}';
</script>
<script type="text/javascript" src="${staticpath}/static/js/jquery-2.1.0.min.js"></script>
<script type="text/javascript" src="${staticpath}/static/plugins/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${staticpath }/static/m/weixin.js"></script>
<script type="text/javascript" src="${staticpath }/static/m/common.js"></script>
<sitemesh:head/>

<%@ include file="/WEB-INF/include/analysis_baidu.jsp"%>

</head>
<body>
<%@ include file="/WEB-INF/layouts/m/header.jsp"%>
<!--主要内容区域-->
<sitemesh:body/>
<!-- end -->
<%@ include file="/WEB-INF/layouts/m/footer.jsp"%>
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