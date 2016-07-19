<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" />
	<title>首页</title>
	<link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/xw/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/xw/css/style.css">
</head>
<body class="gray pt">
	<header>
		<div class="back">
			<i class="fa icon-angle-left"></i>
		</div>
		<p>个人信息</p>
	</header>

	<section class="index-wrap">
		<div class="index-wrap clear">
			<div class="pic fl">
				<img src="${basepath}/static/m/ext/enn/xw/img/img.jpg" alt="" />
			</div>
			<div class="text fl">
				<p>${user.name }</p>
				<p>${user.username }</p>
			</div>
		</div>
	</section>

<c:if test="${!isTeacher || isStudent }">
	<section class="com-list">
		<div class="wrap-list">
			<p>我要实践</p>
			<div class="list-line">
				
			</div>
		</div>
		<div class="wrap-list list-item"  onclick="goto('${basepath}/m/ext/enn/xw/mytask.xhtml')">
			<p class="clear">
				<span class="fl">实践任务</span>
				<span class="item fr">
					<i class="fa icon-angle-right"></i>
				</span>
			</p>
		</div>
	</section>
</c:if>
<c:if test="${isTeacher }">
	<section class="com-list">
		<div class="wrap-list">
			<p>我要辅导</p>
			<div class="list-line">
				
			</div>
		</div>
		<div class="wrap-list list-item"  onclick="goto('${basepath}/m/ext/enn/xw/studenttask.xhtml')">
			<p class="clear">
				<span class="fl">辅导任务</span>
				<span class="item fr">
					<i class="fa icon-angle-right"></i>
				</span>
			</p>
		</div>
	</section>
</c:if>	
<script type="text/javascript" src="${basepath}/static/m/ext/enn/js/common.js"></script>
</body>
</html>