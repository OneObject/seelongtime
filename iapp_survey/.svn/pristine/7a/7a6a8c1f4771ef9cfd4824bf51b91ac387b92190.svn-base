<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>积分排行榜</title>
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
        <img src="${basepath }/static/img/creditrank.png" class="img-responsive" >
        <span class="rank-name-bg">
        </span>
        <span class="rank-name-font">
           	积分排行榜
        </span>
    </header>
    <section>
        <ul>
        
        
		<c:forEach items="${ranktoplist }" var="item" varStatus="vs">
				<li>
                <div class="userinfo">
                    <div class="img-num">
                        <img src="http://www.aijiayou.com:80/student/user/avatar/${item.uid }.xhtml?style=80x80">
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
                        <span class="username">姓名：${item.username}</span>
                        <span class="userscore">总积分：${item.credit}</span>
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