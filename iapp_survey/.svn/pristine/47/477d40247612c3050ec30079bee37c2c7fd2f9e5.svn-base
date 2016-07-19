<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>活动列表</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="${basepath}/static/font-awesome-4.0.3/css/font-awesome.min.css">
    <link rel="stylesheet" href="${basepath}/static/m/bootstrap.min.css">
    <link rel="stylesheet" href="${basepath}/static/m/bootstrap-theme.css">
    <link rel="stylesheet" href="${basepath}/static/m/new.css">
</head>
<body>
    <div class="activitybox">
        <ul>
        <c:if test="${empty activitylist }"><div class="well well-small" style="margin:20px 10px 5px;">没有活动</div></c:if>
        <c:if test="${not empty activitylist }">
        <c:forEach var="activitymodel" items="${activitylist}">
            <li class="activity-item">
                <div class="activity-item-img">
                    <img src="${basepath}/static/img/activity.png">
                </div>
                <div class="activity-item-content">
                    <span class="activity-name">${activitymodel.name}</span>
                    <span class="activity-jianjie">${activitymodel.content}</span>
                    <span class="activity-others"><d:formatDate currentTime="${activitymodel.startDate }" format="MM-dd HH:mm"/>
                                                                                                                                        至<d:formatDate currentTime="${activitymodel.endDate}" format="MM-dd HH:mm"/></span>
                </div>
                <!--<div class="activity-control">-->
                    <!--<span class="avctivity-state green">正在进行</span>-->
                    <!--<span class="avctivity-done">我来投票</span>-->
                <!--</div>-->
            </li>
            </c:forEach>
            </c:if>
        </ul>
    </div>
    <script type="text/javascript" src="${basepath}/static/m/jquery-2.1.0.min.js"></script>
    <script type="text/javascript" src="${basepath}/static/m/weixin.js"></script>
</body>
</html>