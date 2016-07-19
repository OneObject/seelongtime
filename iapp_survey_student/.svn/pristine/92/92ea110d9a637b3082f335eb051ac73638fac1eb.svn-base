<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" />
	<title>任务详情</title>
	<link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/xw/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/xw/css/style.css">
</head>
<body class="gray pt">
	<header>
		<div class="back"  onclick="gotoback();">
			<i class="fa icon-angle-left"></i>
		</div>
		<p>实践任务</p>
	</header>
	<div class="task-intro-wrap">
		<h2>任务标题</h2>
		<p>${vo.tname }</p>
	</div>
	<div class="task-intro-wrap">
		<h2>任务描述</h2>
		<p><pre>${vo.tdescript }</pre></p>
	</div>
	
<c:forEach var="step" items="${vo.steps }">
	<section class="slide-wrap">
		<div class="slide-wrap clear">
			<p class="title fl">
				步骤${step.no} &nbsp; ${step.step }
			</p>
			<span class="fr">
				<i class="fa icon-double-angle-up"></i>
			</span>
		</div>
		<div class="slide-content" style="display:none;">
			<div class="content">
				<div class="tip">操作标准</div>
				<p><pre>${step.standard }</pre></p>
			</div>
			<div class="slide-active clear">
				<div class="tip">是否按照标准完成</div>
				<div class="activty fl">
					<span class="num">第一次</span>
					<span class="zt">${step.stuOneName }</span>
				</div>
			</div>
			<div class="slide-active clear">
				<div class="activty fl">
					<span class="num">第二次</span>
					<span class="zt">${step.stuTwoName }</span>
				</div>
			</div>
			<div class="slide-active clear">
				<div class="activty fl">
					<span class="num">第三次</span>
					<span class="zt">${step.stuThreeName }</span>
				</div>
			</div>
		</div>
	</section>
</c:forEach>


	<section class="textarea-show-box">
		<div class="tip">综合反馈</div>
		<div class="textarea-text">
			<p><pre>${vo.tudescript }</pre></p>
		</div>
	</section>


	<script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="${basepath}/static/m/ext/enn/js/common.js"></script>
	<script type="text/javascript">
		$(function (){
			$("div.slide-wrap").click(function (){
				if($(this).find('.fa').hasClass('icon-double-angle-up')) {
					$(this).find('.fa').removeClass('icon-double-angle-up').addClass('icon-double-angle-down');
				} else {
					$(this).find('.fa').removeClass('icon-double-angle-down').addClass('icon-double-angle-up');
				}

				$(this).siblings('.slide-content').slideToggle(300);
			})
		})
	</script>
</body>
</html>