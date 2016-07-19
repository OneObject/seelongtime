<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" />
	<title>辅导任务</title>
	<link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/xw/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/xw/css/style.css">
</head>
<body>
	<header>
		<div class="back" onclick="gotoback();">
			<i class="fa icon-angle-left"></i>
		</div>
		<p>辅导任务</p>
	</header>

<c:if test="${not empty tasks }">
	<section class="list-wrap" style="display:block;">
	
		<c:forEach var="taskVo" items="${tasks}">
			<div class="list-wrap clear" onclick="goto('${basepath}/m/ext/enn/xw/taskdetail.xhtml?tuid=${taskVo.tuid }')">
					<div class="list-content fl">
						<h2>${taskVo.name }</h2>
						<p>指导人 : ${taskVo.teacherName }</p>
					</div>
					<div class="list-item fr" >
						<i class="fa icon-angle-right"></i>
					</div>
					<div class="list-rate fr">
						<c:if test="${taskVo.process==3 }">已完成</c:if>
						<c:if test="${taskVo.process<3 }">${taskVo.process }/3</c:if>
					</div>
			</div>
		</c:forEach>

	</section>
</c:if>
<c:if test="${ empty tasks }">
	<section class="data-normal" >
		暂无数据
	</section>
</c:if>	
	<script type="text/javascript" src="${basepath}/static/m/ext/enn/js/common.js"></script>
</body>
</html>