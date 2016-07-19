<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<%
	String redirect = request.getParameter("f");
%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->

<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<!-- /Added by HTTrack -->
<head>
<meta charset="utf-8" />
<title>管理员登录</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<meta name="MobileOptimized" content="320">
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link
	href="${basepath }/static/public/metronic.bootstrap/assets/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${basepath }/static/public/metronic.bootstrap/assets/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${basepath }/static/public/metronic.bootstrap/assets/plugins/uniform/css/uniform.default.css"
	rel="stylesheet" type="text/css" />
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css"
	href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<!-- END PAGE LEVEL SCRIPTS -->
<!-- BEGIN THEME STYLES -->
<link
	href="${basepath }/static/public/metronic.bootstrap/assets/css/style-metronic.css"
	rel="stylesheet" type="text/css" />
<link
	href="${basepath }/static/public/metronic.bootstrap/assets/css/style.css"
	rel="stylesheet" type="text/css" />
<link
	href="${basepath }/static/public/metronic.bootstrap/assets/css/style-responsive.css"
	rel="stylesheet" type="text/css" />
<link
	href="${basepath }/static/public/metronic.bootstrap/assets/css/plugins.css"
	rel="stylesheet" type="text/css" />
<link
	href="${basepath }/static/public/metronic.bootstrap/assets/css/themes/default.css"
	rel="stylesheet" type="text/css" id="style_color" />
<link
	href="${basepath }/static/public/metronic.bootstrap/assets/css/login.css"
	rel="stylesheet" type="text/css" />
<link
	href="${basepath }/static/public/metronic.bootstrap/assets/css/custom.css"
	rel="stylesheet" type="text/css" />
<!-- END THEME STYLES -->
<style type="text/css">
#warnBox {
	color: red;
	border: 1px solid;
	background-color: #FCF8E3;
	border-color: #FAEBCC;
	box-sizing: border-box;
	font-size: 16px;
	height: 44px;
	line-height: 44px;
	width: 640px;
	text-align: center;
	position: absolute;
	left: 50%;
	margin-left: -320px;
	top: 0px;
}
</style>
<script type="text/javascript">
	if (self != top) {
		top.location = self.location;
	}
</script>
</head>
<!-- BEGIN BODY -->
<body class="login">

	<div id="warnBox" style="display: none;">您的IE浏览器版本过低，请使用IE9+、Chrome、Firefox浏览器浏览本站!</div>
	<!-- BEGIN LOGO -->
	<div class="logo">
		<!--<img src="${basepath }/static/public/metronic.bootstrap/assets/img/logo-big.png" alt="" />   -->
	</div>
	<!-- END LOGO -->
	<!-- BEGIN LOGIN -->
	<div class="content">
		<!-- BEGIN LOGIN FORM -->
		<form class="login-form" action="${basepath }/mgr/login.xhtml" method="post">
			<input type="hidden" id="timestamp" name="timestamp" value="<%=System.currentTimeMillis()%>"/>
			<h3 class="form-title">登录</h3>
			<c:if test="${error_code eq -1}">
				<div class='alert alert-danger' style="">
					<button type="button" class="close" data-dismiss="alert"
						aria-hidden="true"></button>
					<span>用户名或密码错误.</span>
				</div>
			</c:if>
			<c:if test="${error_code eq -2}">
				<div class='alert alert-danger' style="">
					<button type="button" class="close" data-dismiss="alert"
						aria-hidden="true"></button>
					<span>用户不存在或没有权限.</span>
				</div>
			</c:if>
			<c:if test="${error_code eq -3}">
				<div class='alert alert-danger' style="">
					<button type="button" class="close" data-dismiss="alert"
						aria-hidden="true"></button>
					<span>请输入账号密码.</span>
				</div>
			</c:if>
			<c:if test="${error_code eq -4}">
				<div class='alert alert-danger' style="">
					<button type="button" class="close" data-dismiss="alert"
						aria-hidden="true"></button>
					<span>账号被禁用</span>
				</div>
			</c:if>
			<c:if test="${error_code eq -5}">
				<div class='alert alert-danger' style="">
					<button type="button" class="close" data-dismiss="alert"
						aria-hidden="true"></button>
					<span>请刷新页面后再次登录</span>
				</div>
			</c:if>
			<div class="form-group">
				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				<label class="control-label visible-ie8 visible-ie9">用户名</label>
				<div class="input-icon">
					<i class="icon-user"></i> <input
						class="form-control placeholder-no-fix" type="text"
						autocomplete="off" placeholder="用户名" name="username"
						value="${username }" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label visible-ie8 visible-ie9">密码</label>
				<div class="input-icon">
					<i class="icon-lock"></i> <input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="密码" id="password" />
					
					<input type="hidden" id="submitPwd" name="password" />
				</div>
			</div> 
			<div class="form-actions">
			 	 <label class="checkbox"  style="position:relative;left:20px;top:-10px;" title="为了您的账户安全，请勿在网吧或其它公共场合使用该功能">
 				<input type="hidden" name="remberme" id="remberme" value="false">
				<input  type="checkbox" id="isrember">
					记住我
				</label>  
				<button onclick="dl_yanzheng();" id="denglu" class="btn green pull-right">
					登录 <i class="m-icon-swapright m-icon-white"></i>
				</button>
			</div>
		</form>
		<!-- END LOGIN FORM -->
	</div>
	<!-- END LOGIN -->
	<!-- BEGIN COPYRIGHT -->
	<div class="copyright">2014 &copy; Longtime. Admin Portal.</div>
	<!-- END COPYRIGHT -->
	<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
	<!-- BEGIN CORE PLUGINS -->
	<!--[if lt IE 9]>
	<script src="${basepath }/static/public/metronic.bootstrap/assets/plugins/respond.min.js"></script>
	<script src="${basepath }/static/public/metronic.bootstrap/assets/plugins/excanvas.min.js"></script> 
	<![endif]-->
	<script
		src="${basepath }/static/public/metronic.bootstrap/assets/plugins/jquery-1.10.2.min.js"
		type="text/javascript"></script>
	<script
		src="${basepath }/static/public/metronic.bootstrap/assets/plugins/jquery-migrate-1.2.1.min.js"
		type="text/javascript"></script>
	<script
		src="${basepath }/static/public/metronic.bootstrap/assets/plugins/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<script
		src="${basepath }/static/public/metronic.bootstrap/assets/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js"
		type="text/javascript"></script>

	<script type="text/javascript"
		src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
	
	
	<script src="${basepath }/static/js/jquery.md5.js" type="text/javascript"></script>
	<!-- END PAGE LEVEL SCRIPTS -->
	<script>
		jQuery(document).ready(function() {
			var ie = !-[ 1, ];
			var warn = document.getElementById("warnBox");
			if (ie) {
				warn.style.display = "block";
			}
			App.init();
			Login.init();
		});
		function dl_yanzheng(){
	        if( $("#isrember").is(':checked')){
				$("#remberme").val("true");
	        }else{
				$("#remberme").val("false");
	        }
	        
	        var timestamp = $("#timestamp").val();
            var password = $("#password").val();
            if(typeof(timestamp) != "undefined" && timestamp != null && timestamp!="" && password!=""){
            	password = $.md5(password+timestamp);
            }
            
            $("#submitPwd").val(password);
            
	        
	        $("#denglu").submit();
		}
	</script>
	<!-- END JAVASCRIPTS -->
	<!-- END BODY -->
	
</html>
<%@include file="/WEB-INF/jsp/include/analysis.jsp"%>