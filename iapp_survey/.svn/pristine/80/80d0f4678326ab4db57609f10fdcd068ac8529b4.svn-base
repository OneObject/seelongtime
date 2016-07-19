<%@page contentType="text/html; charset=utf-8" %>
<%@page language="java" import="com.longtime.app.config.Constants"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>排行榜</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="${basepath }/static/frame/fonticon/css/font-awesome.min.css">
    <link rel="stylesheet" href="${basepath }/static/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${basepath }/static/plugins/bootstrap/css/bootstrap-theme.css">
    <link rel="stylesheet" href="${basepath }/static/ixin/css/new.css">
</head>
<body>
<div class="ranklist">
    <header>
        <%-- 
         <img src="http://img0.aijiayou.com/${rank.cover}-360x200" class="img-responsive" >
           --%>
         <img src="<%=Constants.IMG_SERVER_DOWNLOAD %>${rank.cover}-360x200" class="img-responsive" >
        <span class="rank-name-bg">
        </span>
        <span class="rank-name-font">
           ${rank.title}
        </span>
    </header>
    <section>
        <ul>
        
        
		<c:forEach items="${rank.items }" var="item" varStatus="vs">
				<li>
                <div class="userinfo">
                    <div class="img-num">
                        <%-- 
                        <img src="http://img0.aijiayou.com/${item.img}-180x180">
                        --%>
                        <img src="<%=Constants.IMG_SERVER_DOWNLOAD %>${item.img}-180x180">
                        <c:choose>
                        	<c:when test="${vs.index==0}"><span class="label label-danger"></c:when>
                        	<c:when test="${vs.index==1}"><span class="label label-success"></c:when>
                        	<c:when test="${vs.index==2}"><span class="label label-warning"></c:when>
                        	<c:otherwise><span class="label label-info"></c:otherwise>
                        </c:choose>
                        NO.${vs.index+1 }
                        </span>
                    </div>
                    <div class="rankinfo">
                        <span class="username">${item.title}</span>
                        <span class="userscore">${item.remark}</span>
                    </div>
                </div>
            </li>					        
        
        </c:forEach>
        </ul>
    </section>
</div>
<script type="text/javascript" src="${basepath}/static/ixin/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${basepath}/static/ixin/js/weixin.js"></script>
</body>
</html>
<%@include file="/WEB-INF/jsp/include/student/wx.jsp"%>
<%@include file="/WEB-INF/jsp/include/analysis.jsp"%>