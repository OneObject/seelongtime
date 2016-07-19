<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>用户签到</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no"/>
    <style type="text/css">
        html,body{margin: 0px;padding: 0px;background-color: #eeeeee}
        .container{
            max-width: 760px;
            padding: 8px;
        }
        .item{
            display: block;
            overflow: hidden;
            text-align: center;
            color: #53575e;
            margin-top: 30%;
        }
    </style>
</head>
<body>
    <div class="container">
        <c:if test="${flag eq 'success' }">
        	<div class="item">
            	<img src="${basepath }/static/img/done.png">
            	<h1>您已签到成功！</h1>
        	</div>
        </c:if>
        <c:if test="${flag eq 'signed' }">
        	<div class="item">
        		<img src="${basepath }/static/img/done.png">
            	<h1>您已经签到过了！</h1>
            </div>
        </c:if>
        <c:if test="${flag eq 'none' }">
        	<div class="item">
        		<img src="${basepath }/static/img/none.png">
            	<h1>未到签到时间！</h1>
         	</div>
        </c:if>
        <c:if test="${flag eq 'fail' }">
        	<div class="item">
        		<img src="${basepath }/static/img/fail.png">
            	<h1>无法签到！</h1>
           	</div>
        </c:if>
</div>
</body>
</html>