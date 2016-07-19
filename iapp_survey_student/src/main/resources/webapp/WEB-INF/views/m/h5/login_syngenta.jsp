<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="format-detection" content="telephone=no" />
    
    <link rel="stylesheet" href="${basepath}/static/plugins/font-awesome-4.1.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="${basepath}/static/m_h5/css/common.css" >
    <link rel="stylesheet" href="${basepath}/static/m_h5/css/color.css" >
    <style type="text/css">
   	 		section.login a.loging{background:#ccc;}
			section.login a.loging i{display:inline-block;margin-left:10px;font-size:20px;}
			section.pro{padding:8px;box-sizing:border-box;width:100%;} 
			section.pro .introBox{box-sizing:border-box;border:1px solid #ccc;border-radius:2px;padding:14px 8px;font-size:14px;line-height:22px;}
 			section.pro .agreeBtn{font-size: 18px;width: 100%;height: 38px;line-height: 38px;color: #fff;display: block;text-align: center;margin: 14px 0px 18px;background: #9acf60;}   
    		section.pro .disagree{font-size:12px;color:#529bea;}
    </style>  
    <%
		response.setHeader("Pragma","No-cache");
		response.setHeader("Cache-Control","No-cache"); 
		response.setDateHeader("Expires", -1); 
		response.setHeader("Cache-Control", "No-store");
		
		String uid = MwebHelper.getCurrentUid();
		if(StringUtils.isNotBlank(uid) && !MwebHelper.DEFAULT_UID.equals(uid) && !uid.startsWith("l_")){
			request.getRequestDispatcher("/m/h5/index.xhtml").forward(request, response);
		}
	%>
    
    <style type="text/css">
   	 		section.login a.loging{background:#ccc;}
			section.login a.loging i{display:inline-block;margin-left:10px;font-size:20px;}   
    </style>
<title>用户登录</title>
<script type="text/javascript">
document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
	WeixinJSBridge.call('hideToolbar');
});
//去掉右上角选项
document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
	WeixinJSBridge.call('hideOptionMenu');
});
</script>
<%-- 页面风格设置 --%>
<%@ include file="/WEB-INF/include/m_h5_setting.jsp"%>
</head>

<body>
	<div id="promise" style="display: none;">
		<header>保密协议</header>
        <article class="scroll">
        	 <section class="pro">
				<div class="introBox">
					此平台仅限先正达员工内部使用，其内容应予以保密。如果您不是或者不再是先正达员工，请退出登录、删除此公众帐号或软件，但仍需对您从该平台上了解的信息保密。对于泄密给先正达造成损失的，先正达保留追究法律责任的权利。此平台上的所有信息包括文字、图片、影音视频等均限于先正达公司内部交流，未经公司内部授权审批，任何人不得将此平台上的内容外传。信息泄漏造成的损失和法律责任将由泄漏人承担。请确认知悉上述内容并承诺遵守此保密协议。
				</div>
				<div class="agreeBtn" onclick="comfirm();">同意</div>
				<div class="disagree">不同意请退出</div>
				</section>
        </article>
	</div>	
	
	<div id="login" style="display: none;">
		<header>
	    	<%--<div class="back"><a href="#"><i class="fa fa-angle-left"></i></a></div>--%>
	        用户登录
	    </header>
	    
	    <article class="scroll">
	    <form method="post" action="${basepath}/m/h5/login.xhtml" id="loginForm" method="post">
	    <section class="login">
	    	<div><input type="text" placeholder="账号" id='username'  name="username" value="${loginForm.username }"/></div>
	        <div><input type="password" placeholder="密码" id='password'  name="password" /></div>
	         
	         <p class="error" id="nullinputerror">请输入账号和密码</p>
	   		 <c:if test="${not empty loginForm and loginForm.code !='success'}">
		                    <c:choose>
		                	<c:when test="${loginForm.code=='empty'}"><p class="error" style="display: block;" >请输入账号和密码</p></c:when>
		                	<c:when test="${loginForm.code=='pwdfial'}"><p class="error" style="display: block;" >账号或密码错误</p></c:when>
		                	<c:when test="${loginForm.code=='disable'}"><p class="error" style="display: block;" >账号被禁用</p></c:when>
		                	<c:when test="${loginForm.code=='expire'}"><p class="error" style="display: block;" >账号已过期</p></c:when>
		                	<c:when test="${loginForm.code=='ineffective'}"><p class="error" style="display: block;" >账号未生效</p></c:when>
		                	<c:when test="${loginForm.code=='already_bind'}"><p class="error" style="display: block;">账号已被绑定</p></c:when>
		                	</c:choose>
	         </c:if>
	   		 <a href="#"  class="log" onclick="submitf()">登录</a>
	   		   		<c:if test="${not empty tenantConfig && tenantConfig.openregister==true}">
	   		   			<a  id="login_register" style="display: inline-block;background:none;font-size:14px;height:20px;line-height:20px;width:70px;text-align:left;margin-top:30px;"  href="${basepath}/m/register.xhtml?domain=${tenantConfig.id}&openid=${openid}">注册帐号</a>
	                </c:if>
	                
	                <c:if test="${domain eq 'syngenta'}">
                	<a  id="login_register" style="display: inline-block;background:none;font-size:14px;height:20px;line-height:20px;width:70px;text-align:left;margin-top:30px;"  href="${basepath}/m/h5/findpwd.xhtml">忘记密码</a>
               	</c:if>
	                <br />
	                <c:if test="${not empty tenantConfig && tenantConfig.login_prompt ne null}">
	                 <span style="color:#999;font-size: 14px;display:block;margin-top:32px;line-height:22px;">${tenantConfig.login_prompt }</span>
	                </c:if>
	                &nbsp;
	                <input type="hidden"  name="domain" value="${domain}"/>
	                <input type="hidden" name="callback" value="${callback}"/>
	    </section>
	    </form>
	    </article>
	</div>
     
<script type="text/javascript" src="${basepath}/static/m_h5/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="${basepath}/static/m_h5/js/common.js"></script>
<script type="text/javascript">

$(function (){
	if(getCookie("if") == "1"){//不是第一次访问
		$("#login").show();
	}else{
		$("#promise").show();
	}
});

function comfirm(){
	SetCookie("if",  "1");//写入cookie 
	$("#promise").hide();
	$("#login").show();
}
       
//正在登录
function loging(){
	$("a.log").text("正在登录").append('<i class="fa fa-spinner fa-spin"></i>').addClass("loging");
}
//显示登录
function login(){
	$("a.log").replaceWith('<a href="#" class="log" onclick="submitf()" >登录</a>');
}

function submitf(){
	 loging();
   	 $(".error").hide();
   	 $("#nullinputerror").hide();
   	 
    if($("#username").val() == "" ||$("#password").val() == ""){
        $("#nullinputerror").show();
        login();
    }else{
        /*提交操作*/
        $("#loginForm").submit();
    }
}

//获取指定名称的cookie的值 
function getCookie(objName){
	var arrStr = document.cookie.split("; "); 
	for(var i = 0;i < arrStr.length;i ++)
	{ 
		var temp = arrStr[i].split("="); 
		if(temp[0] == objName)
			return unescape(temp[1]); 
	} 
}   

//写入cookie
function SetCookie(name,value)
{
	var Days = 365 * 10; //此 cookie 将被保存 10 年
	var exp = new Date();
	exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
	document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString() + ";path=/";
}    	         
</script>
</body>
</html>
