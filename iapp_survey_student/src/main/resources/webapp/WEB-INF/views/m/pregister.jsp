<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>注册</title>
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
</style>
</head>
<body>
	<div class="container">
		<c:if
			test="${not empty callback and not empty registerForm and registerForm.code =='success'}">
			<c:redirect url="${callback}"></c:redirect>
		</c:if>
		<c:if test="${ empty registerForm or registerForm.code !='success'}">
			<span class="title">请填写真实信息</span>
			<span id="hasNull" class="errormsh" style="display: none">请输入用户名、姓名和手机</span>
			<c:if
				test="${not empty registerForm and registerForm.code !='success'}">
				<span id="hasError" class="errormsh"> <c:choose>
						<c:when test="${registerForm.code=='empty'}">请完整输入注册信息</c:when>
						<c:when test="${registerForm.code=='exist'}">用户名或手机号已经被使用</c:when>
						<c:when test="${registerForm.code=='fail'}">注册失败</c:when>
						<c:when test="${registerForm.code=='illegal'}">用户名包含空格、特殊符号、中文或长度超过32个英文字符</c:when>
					</c:choose>
				</span>
			</c:if>
			<form id="registerForm" action="${basepath}/m/register.xhtml"
				method="post">
				<label> <input id="username" name="username" type="text" value="${registerForm.username }"
					placeholder="用户名">
				</label> 
				<label> <input id="name" name="name" type="text" value="${registerForm.name }"
					placeholder="姓名">
				</label> 
				<label> <input hidden="hidden" id="nickname" name="nickname" type="text" value="${registerForm.nickname }"
					placeholder="微信昵称">
				</label> 
				<label> <input id="mobile" type="tel" name="mobile"  value="${registerForm.mobile }"
					placeholder="手机">
				</label> <span class="submitbtn" id="submitbtn">提交</span> <input
					type="hidden" name="domain" value="${domain}" /> <input
					type="hidden" name="openid" value="${openid}" /> <input
					type="hidden" name="callback" value="${callback}" />
					
<%--临时添加 for 新奥   新注册用户默认禁用状态 --%>                
<c:if test="${domain eq 'ENN'}">
    <input type="hidden"  value="true"  name="disable"/>            
</c:if>

			</form>
		</c:if>
	</div>
	<script src="http://cdn.bootcss.com/zepto/1.1.3/zepto.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){ 
			setTimeout(function() {
				$("#hasError").hide();
			}, 2000);
		});
		$('#submitbtn').bind("click", function() {
			if ($("#username").val() == "" || $("#name").val() == ""
				|| $("#mobile").val() == "") {// || $("#nickname").val() == ""
				$("#hasNull").show(function(){
					var mleft = (document.body.clientWidth-$(".errormsh").width()-20)/2;
					$(".errormsh").css({
						left:mleft
					});
				});
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