<%@page import="com.longtime.ajy.support.SubDomainHelper"%>
<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
     <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>恒天登录页</title>
        <meta name="keywords" content=""/>
        <meta name="description" content=""/>
        <style type="text/css">
            * {
                margin: 0;
                padding: 0
            }
            html {
                overflow-y: hidden;
            }
            body {
                font-family: "microsoft yahei", "Arial";
                width: 100%;
                overflow-y: hidden;
            }
            a {
                color: #333;
                text-decoration: none;
            }
            img {
                border: none;
            }
            ul, ol {
                list-style: none;
            }
            p {
                margin-bottom: 12px;
            }
            body {
                min-width: 980px;
                min-height: 600px;
            }
            input, textarea, div {
                outline: medium;
            }
            .clear {
                clear: both
            }
            #header {
                width: 100%;
                height: 84px;
                background: #fff url(${basepath }/static/chtwm/img/logo.png) 18px center no-repeat;
                background-size: auto 76px;
            }
            #content {
                width: 100%;
                position: relative;
            }
            #content img {
                width: 100%;
                display: block;
            }
            #content .login-box {
                width:240px;
                position: absolute;
                right:13%;
                top:25px;
                z-index: 50;
            }
            .login-box .image{
                width:100%;
                height:140px;
                background: url(${basepath }/static/chtwm/img/logo.png) center center no-repeat;
                background-size:auto 130px;
            }
            .login-box .holder{
                margin-top:22px;
                width:100%;
                height:38px;
            }
            .login-box .holder input{
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
                display: block;
                color:#999;
                width: 100%;
                height:38px;
                font-size:18px;
                padding:6px 8px;
                line-height: 24px;
                border:1px solid #ccc;
                border-radius:3px;
                box-shadow: 1px 1px 5px #ccc;
            }
            .login-box input:focus{
                box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset, 0 0 8px rgba(37, 134, 239, 0.6);
                transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s;
            }
            .login-box input.error{
                border-color:#C26468;
            }
            .login-box input.error:focus{
                box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset, 0 0 8px rgba(194, 100, 104, 0.6);
                transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s;
            }
            .login-box .btn-login{
                height:44px;
                line-height:44px;
                text-align: center;
                color:#fff;
                font-size:18px;
                background: #e34c4c;
                cursor: pointer;
                border-radius:3px;
                box-shadow: 1px 1px 5px #ccc;
            }
            .login-box .btn-login:hover{
                opacity: 0.8;
            }
            .login-box .err{
                height: 20px;
                line-height: 20px;
                color:#9d1302;
                font-size:14px;
                text-align: left;
            }
            .login-box .forget{
                width:100%;
                margin-top:28px;
                height: 20px;
                line-height: 20px;
            }
            .login-box .forget a{
                color:#9d1302;
                font-size:14px;
                float:right;
                text-decoration: underline;
            }
            #footer {
                width: 100%;
                height: 84px;
                background: #fff;
            }

            #footer .rightInfo {
                text-align: right;
                width: 280px;
                float: right;
                color: #999;
                font-size: 16px;
                height: 84px;
                line-height: 84px;
                background: url(${basepath }/static/chtwm/img/tel.png) center center no-repeat;
                background-size: auto 24px;
            }

            
        </style>
        <script type="text/javascript">
if(self!=top){top.location=self.location;} 
</script>
    </head>
    <body>
    <div id="header"></div>
    <div class="clear"></div>
    <div id="content">
        <img src="${basepath }/static/chtwm/img/login_bg.jpg"/>
        <div class="login-box">
            <div class="image"></div>
            <form role="form" id="denglu" method="post" action="${basepath}/login.xhtml">
            <input type="hidden" name="domain"  value="<%=SubDomainHelper.getSubDomain() %>"/>
		<input type="hidden" id="timestamp" name="timestamp" value="<%=System.currentTimeMillis() %>"/>
            <div class="holder user">
                <input type="text" placeholder="请输入账号" id="username" name="username" value="${loginForm.username }"/>
            </div>
            <div class="holder psd">
                <input type="password" class="error" id="password" placeholder="请输入密码"/>
                <input type="hidden"  name="password" id="submitPwd"/>
            </div>
          	<c:if test="${not empty loginForm and loginForm.code !='success'}">
            <div class="holder err">
			
				
				  <c:choose>
		                	<c:when test="${loginForm.code=='empty'}">输入信息不完整</c:when>
		                	<c:when test="${loginForm.code=='pwdfial'}">账号或密码错误</c:when>
		                	<c:when test="${loginForm.code=='disable'}">账号被禁用</c:when>
		                	<c:when test="${loginForm.code=='expire'}">账号已过期</c:when>
		                	<c:when test="${loginForm.code=='ineffective'}">账号未生效</c:when>
		                	<c:when test="${loginForm.code=='already_bind'}">账号已被绑定</c:when>
		                	<c:when test="${loginForm.code=='unequal_domain'}">账号在本公司不存在</c:when>
		                	<c:when test="${loginForm.code=='timeexpire'}">请刷新页面再次登录</c:when>
		          </c:choose>
				</div>
			</c:if>
			<c:set var="logoutstatus" value="<%=MwebHelper.getLogoutStatus(request)%>" />
			<c:if test="${ empty loginForm and logoutstatus == 'invalid'}">
             	<div class="err">账号在他处登录或登录状态过期</div>
            </c:if>
             <input type="hidden" name="remberme" id="remberme" value="false" />
               <div class="holder btn-login" onclick="dl_yanzheng()">
               	 登录
            </div>
              <div class="forget">
                <a href="${basepath }/m/h5/findpwd.xhtml">忘记密码？</a>
            </div>
			
	</form>
			</div>
         
            
        </div>
        <div class="clear"></div>
    </div>
    
    <div class="clear"></div>
    <div id="footer">
        <div class="rightInfo"></div>
    </div>
    
    <script type="text/javascript" src="${basepath}/static/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="${basepath}/static/js/jquery.md5.js"></script>
    <script type="text/javascript">
    
   window.onload = function () {
        var $window = $(window);
        var $body = $("body");
        var $footer = $("#footer");
        window.onmousewheel = scrollFunc;
        window.onresize = changeFooter;
        changeFooter();
        function changeFooter() {
            setTimeout(function () {
                var h1 = $window.height();
                var h2 = $body.height() - 84;
                if ((h1 - h2) > 84) {
                    $body.css({"position": "static"});
                    $footer.css({"position": "static"});
                } else {
                    $body.css({"position": "static"});
                    $footer.css({"position": "absolute", "left": "0px", "bottom": "0px",'z-index': '100'});
                }
            }, 50);
        }
        function scrollFunc(event) {
            return false;
        }
    }; 
    	function dl_yanzheng(){	
    		if($.trim($("#username").val()) == "" && $.trim($("#password").val()) == "" ){
               $("#username").addClass("error");
               $("#password").addClass("error");
               return;
    		}else{
               $("#username").removeClass("error");
               $("#password").removeClass("error");          
    		}
            if($.trim($("#username").val()) == "" ){
               $("#username").addClass("error");
               return;
            }else{
               $("#username").removeClass("error");
            }
            if($.trim($("#password").val()) == "" ){
               $("#password").addClass("error");
               return;
            }else{
            	$("#password").removeClass("error");
            }
            var timestamp = $("#timestamp").val();
            var password = $("#password").val();
            if(typeof(timestamp) != "undefined" && timestamp != null && timestamp!="" ){
            	password = $.md5(password+timestamp);
            }
            $("#submitPwd").val(password);
            //进一步验证或者登录进入
            $("#denglu").submit();
                
            
        }
    </script>
    
    </body>
</html>