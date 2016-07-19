<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>用户登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no"/>
    <link rel="stylesheet" href="${basepath}/static/plugins/fonticon/css/font-awesome.min.css">
    <style type="text/css">

        html,body{margin: 0px;padding: 0px;background-color: #f8f8f8;}
        .container{position: absolute;width: 100%;height: 100%;background-color: #f8f8f8;}
        .login-box{position: absolute;top: 100px;left: 20px;display: block;overflow: hidden}
        .login-box label{display: block;border: 1px solid #DDDDDD;padding: 5px;overflow: hidden;background-color: #ffffff;margin-bottom: 30px;}
        .login-box label>.fa{height: 34px;display: block;overflow: hidden;width: 32px;font-size: 20px;line-height: 34px;text-align: center;float: left;color: #DDDDDD;border-right: 1px solid #DDDDDD;}
        .login-box label>input{width: 100%;height: 28px;border: none;-webkit-tap-highlight-color: rgba(0, 0, 0, 0);}
        .btn-login{display: block;overflow: hidden;line-height: 40px;font-size: 20px;text-align: center;background-color: #529bea;color: #ffffff;}
        .errormsg{color: #FE613E;display: block;overflow: hidden;padding: 10px;font-size: 14px;}
    </style>
</head>
<body>
    <div class="container">
        <div class="login-box">
        	<form action="${basepath}/m/h5/login.xhtml" method="post" id="loginForm">
	            <label>
	                <i class="fa fa-user"></i>
	                <input type="text" placeholder="请输入用户名" id="username" name="username" value="${loginForm.username }">
	            </label>
	            <label>
	                <i class="fa fa-unlock"></i>
	                <input type="password" placeholder="请输入密码" id="password" name="password">
	            </label>
	            	<span class="errormsg" id="hasNull" style="display: none;">请输入手机号/邮件和密码！</span>
	            <div id="error">
		            <c:if test="${not empty loginForm and loginForm.code !='success'}">
		               <c:choose>
		                	<c:when test="${loginForm.code=='empty'}"><span class="errormsg">请输入手机号/邮件和密码！</span></c:when>
		                	<c:when test="${loginForm.code=='pwdfial'}"><span class="errormsg">用户名或密码错误！</span></c:when>
		                	<c:when test="${loginForm.code=='disable'}"><span class="errormsg">手机号/邮件被禁用！</span></c:when>
		                	<c:when test="${loginForm.code=='expire'}"><span class="errormsg">账号已过期！</span></c:when>
		                	<c:when test="${loginForm.code=='ineffective'}"><span class="errormsg">账号未生效！</span></c:when>
		                	<c:when test="${loginForm.code=='already_bind'}"><span class="errormsg">账号已被绑定！</span></c:when>
		               </c:choose>
	                </c:if>
	            </div>
	            <span class="btn-login" onclick="submit()">登录</span> 
 	            <c:if test="${not empty tenantConfig && tenantConfig.openregister==true}">
                <div><a href="${basepath}/m/register.xhtml?domain=${tenantConfig.id}&openid=${openid}&callback=${callback}">注册账号</a></div>
                </c:if>
                &nbsp;
	            <input type="hidden"  name="domain" value="${domain}"/>
                <input type="hidden" name="callback" value="${callback}"/>
			</form>
        </div>
    </div>
    <script src="${basepath}/static/m_h5/js/zepto.min.js"></script>
    <script type="text/javascript">
        $(function(){
            var ww = document.body.clientWidth; 
            if(ww>320){
            	 $(".login-box").css({
                     width:ww-40
                 });
                 $("input").css({
                     width:ww-92
                 });
               }else if(ww <= 320){
            	   $(".login-box").css({
                       width:ww-40
                   });
                   $("input").css({
                       width:ww-102
                   });
        	}
           
        })
        $(window).resize(function(){
            var ww = document.body.clientWidth; 
            if(ww>320){
            	 $(".login-box").css({
                     width:ww-40
                 });
                 $("input").css({
                     width:ww-92
                 });
               }else if(ww <= 320){
            	   $(".login-box").css({
                       width:ww-40
                   });
                   $("input").css({
                       width:ww-102
                   });
        	}
           
        })
    </script>
    <script type="text/javascript">
        function submit(){
        	$("#error").hide();
        	$("#hasNull").hide();
            if($("#username").val() == "" ||$("#password").val() == ""){
            	$("#hasNull").show();
                $("#error").show();
            }else{
                /*提交操作*/
                $("#loginForm").submit();
            }
        }
	</script>
<%@ include file="/WEB-INF/include/analysis.jsp"%>
</body>
</html>