<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>用户信息修改</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no" />
<style type="text/css">
* {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
}

.container {
	padding: 10px;
	width: 100%;
	overflow: hidden;
	display: block;
}

label {
	width: 100%;
	display: block;
	margin-bottom: 20px;
}

label>input {
	width: 100%;
	line-height: normal;
	vertical-align: middle;
	font-size: 16px;
	border-radius: 8px;
	background-clip: padding-box;
	border: 1px solid #999999;
	padding: 10px 10px;
}

.submitbtn {
	display: block;
	overflow: hidden;
	line-height: 40px;
	font-size: 20px;
	text-align: center;
	background-color: #7fd256;
	color: #ffffff;
	border-radius: 8px;
	background-clip: padding-box;
}

.title {
	display: block;
	text-align: center;
	line-height: 30px;
	color: #999999
}

.errormsh {
	position: absolute;
	top: 10px;
	display: block;
	background-color: #FE613E;
	color: #ffffff;
	padding: 10px;
	z-index: 2;
	left: 26%;
}
.rightmsh {
	position: absolute;
	top: 10px;
	display: block;
	background-color: #7fd256;
	color: #ffffff;
	padding: 10px;
	z-index: 2; 
	left: 26%;
}
</style>
</head>
<body>
	<div class="container">
		<span id="successmsh" class="rightmsh" style="display: none">修改成功</span>
		<span id="hasNull" class="errormsh"	style="display: none">请输入工号、姓名和手机</span>
		<span id="hasError" class="errormsh" style="display: none"> 
			<c:choose>
					<c:when test="${code=='empty'}">请完整输入用户信息</c:when>
					<c:when test="${code=='exist'}">工号或手机号已经被使用</c:when>
					<c:when test="${code=='fail'}">修改</c:when>
			</c:choose>
		</span>
		<span class="title">用户信息修改</span> 
		<form id="registerForm" action="${basepath}/m/ixin/user/edit.xhtml"
			method="post">
			<label> <input id="username" name="username" type="text"
				value="${user.username }" placeholder="工号"></label> 
			<label> <input id="name" name="name" type="text"
				value="${user.name }" placeholder="姓名">
			</label> <label> <input id="mobile" type="tel" name="mobile"
				value="${user.mobile }" placeholder="手机">
			</label> <span class="submitbtn" id="submitbtn">提交</span> 
			<input type="hidden" name="uid" value="${user.id}" />
		</form>
	</div>
<script src="http://cdn.bootcss.com/zepto/1.1.3/zepto.min.js"></script>
<script type="text/javascript">
var flag = "${code}";
$(document).ready(function() {
	var mleft = (document.body.clientWidth - $(".errormsh").width() - 20) / 2;
	$(".errormsh").css({ left : mleft });
	var smleft = (document.body.clientWidth - $("#successmsh").width() - 20) / 2;
	$("#successmsh").css({	left : smleft });
	if(flag == "success"){
		$("#successmsh").show();
		setTimeout(function() {
			$("#successmsh").hide();
		}, 2000); 
	}
	if(flag != null && flag != "" && flag!= "success"){ 
		$("#hasError").show();
		setTimeout(function() {
			$("#hasError").hide();
		}, 2000);
	}
});
$('#submitbtn').bind("click",function() {
	if ($("#username").val() == "" || $("#name").val() == ""
					|| $("#mobile").val() == "") {
		$("#hasNull").show();
		setTimeout(function() {
			$("#hasNull").hide();
		}, 2000);
	} else {
		$("#submitbtn").html("提交中...")
		$("#submitbtn").unbind("click")
		$("#registerForm").submit();
	}
});
</script>
</body>
</html>