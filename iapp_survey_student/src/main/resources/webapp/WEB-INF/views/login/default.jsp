<%@page import="com.longtime.ajy.model.Tenant"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.longtime.ajy.support.SubDomainHelper"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<!DOCTYPE html>
<html>
<%
	Tenant tenant = (Tenant)request.getAttribute("tenant");
	String url = "";
	if(tenant != null && StringUtils.isNotBlank(tenant.getLogincover())){
		url = Constant.IMG_SERVER_DOWNLOAD+tenant.getLogincover();
	}
	request.setAttribute("url", url);
%>
<c:set var="default_background" value="${basepath }/static/img/login/background.png"></c:set>
<head lang="en">
    <meta charset="UTF-8">
    <title>登录</title>
    <style>
        html,body{
            margin: 0px;
            padding: 0px;
            background-color: #fff;
        }
        .header{
            height:100px;
            width: 100%;
            background-color: #ffffff;
            position: absolute;
            z-index: 12;
        }
        .header>.logo{
            height: 70px;
            margin-top: 15px;
            margin-left: 100px;

        }
        .container{
            width: 100%;
            display: block;
            overflow: hidden;
            background-image: url("${empty tenant || empty tenant.logincover ?default_background :url}");
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-repeat: no-repeat;
            background-size:100%;
            min-width: 1024px;
        }
        .login-box{
            width: 30%;
            height:100%;
            background-color: #ffffff!important;
            position: absolute;
            z-index: 13;
            right: 0px;
            opacity: 0.6;
            filter:alpha(opacity=60);
        }
        .inputbox{
            padding: 30px;
            position: absolute;
            z-index: 30;
            right: 0px;
            width: 25%;
            top: 30%;
            color: #ffffff;
            font-family: "microsoft yahei";
        }
        .inputbox h1{
            font-size: 34px;;
        }
        .inputbox input{
            background-color: #ffffff;
            width: 80%;
            margin-bottom: 40px;
            font-size: 24px;
            color: #53575E;
            padding: 8px;;
            border: 1px solid #999;
        }
        .btn{
            background-color: #529bea;
            color: #ffffff;
            width: 200px;
            height: 50px;
            display: block;
            line-height: 50px;
            text-align: center;
            font-size: 24px;cursor: pointer;
        }
        .errormsg{
            display: block;
            margin-top: -10px;
            margin-bottom: 30px;
            color: #FE613E;
            width: 80%;
            padding: 10px;;
        }
    </style>
<script type="text/javascript">
if(self!=top){top.location=self.location;} 
</script>
    <script src="${basepath}/static/js/jquery-2.1.0.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="${basepath}/static/js/jquery.md5.js"></script>
</head>
<body>
    <%-- <div class="header">
		<c:if test="${empty tenant || empty tenant.logo}">
			<img src="${basepath }/static/img/login/logo.png" class="logo">
		</c:if>
        <c:if test="${not empty tenant.logo }">
        	<img src="<%=Constant.IMG_SERVER_DOWNLOAD %>${tenant.logo }" alt="logo"" class="logo">
        </c:if>
    </div> --%>
    <div class="container">
        <div class="login-box">
        </div>
        <div class="inputbox">
            <form role="form" id="denglu" method="post" action="${basepath}/login.xhtml">
            	<input type="hidden" name="domain"  value="<%=SubDomainHelper.getSubDomain() %>"/>
	            <input type="text" class="username" name="username" id="username" placeholder="用户名"/>
	            <input type="password" class="password"  id="password" placeholder="密码"/>
	            <input type="hidden"  name="password" id="submitPwd"/>
	            <input type="hidden" id="timestamp" name="timestamp" value="<%=System.currentTimeMillis() %>"/>
	            
	            <!--start 错误提示 --> 
	            <span class="errormsg" id="errormsg" style="${not empty loginForm and loginForm.code !='success' ? '' :'display:none;'}">
                    <c:choose>
	                	<c:when test="${loginForm.code=='empty'}">输入信息不完整</c:when>
	                	<c:when test="${loginForm.code=='pwdfial'}">账号或密码错误</c:when>
	                	<c:when test="${loginForm.code=='disable'}">账号被禁用</c:when>
	                	<c:when test="${loginForm.code=='expire'}">账号已过期</c:when>
	                	<c:when test="${loginForm.code=='ineffective'}">账号未生效</c:when>
	                	<c:when test="${loginForm.code=='already_bind'}">账号已被绑定</c:when>
	                	<c:when test="${loginForm.code=='unequal_domain'}">账号在本公司不存在</c:when>
	                	<c:when test="${loginForm.code=='expire'}">账号已过期</c:when>
	                	<c:when test="${loginForm.code=='timeexpire'}">请刷新页面再次登录</c:when>
                	</c:choose>
	            </span>
				<%--end 错误提示 --%>   
	            <span class="btn" onclick="dl_yanzheng()">登录</span>
            </form>
        </div>
    </div>
<script type="text/javascript">
function dl_yanzheng(){
    if($("#username").val() == "" || $("#password").val() == ""){
        $("#errormsg").html("用户名和密码不能为空");
        $("#errormsg").show();
    }else{

    	var timestamp = $("#timestamp").val();
        var password = $("#password").val();
        if(typeof(timestamp) != "undefined" && timestamp != null && timestamp!="" ){
        	password = $.md5(password+timestamp);
        }
        $("#submitPwd").val(password);
        
        //进一步验证或者登录进入
        $("#denglu").submit();
        
    }
 }
</script>    
</body>
</html>
<%@ include file="/WEB-INF/include/analysis.jsp"%>