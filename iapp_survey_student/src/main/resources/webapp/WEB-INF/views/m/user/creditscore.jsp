<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <title>我的积分</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <style type="text/css">
        .wimg{
            width: 100%;
            height: auto;
        }
        .score{
            color: #ff9446;
            font-size: 8em;
        display: block;
            overflow: hidden;
            text-align: center;
            font-family: "microsoft yahei";
        }
    </style>
</head>
<body>
    <img src="${basepath }/static/m/img/score.png" class="wimg">
    <span >
        <c:if test="${empty uid }">你还未登录，请登录后查看！</c:if>
    </span>
    <span class="score">
    	<c:if test="${not empty uid }">${ajy:creditTotal(uid) }</c:if>
    </span>
    <c:if test="${not empty user }">
	   	<div style="display: block;font-size: 1.2em;padding: 10px;color:#bbb;width: 100%;height: 50px;text-align: center;">
		   	<span>${user.username }&nbsp;|&nbsp;</span>
		   	<c:if test="${not empty user.name }">
					<span>${user.name }</span>
			</c:if>
		</div>
	</c:if>
</body>