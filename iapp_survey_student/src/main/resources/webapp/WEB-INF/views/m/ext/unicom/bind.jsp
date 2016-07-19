<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="format-detection" content="telephone=no" />
    <title>用户绑定</title>
    <link rel="stylesheet" type="text/css" href="${basepath }/static/m/ext/unicom/css/liantong.css" />

</head>
<body>
    <header>
        <div class="title">
            	用户绑定
        </div>
        <span class="btn-left"></span>
    </header>
    <form method="post" action="${basepath}/m/h5/login.xhtml" id="loginForm" method="post">
    <section class="wrapper-static margin-top-45">
        <div class="login-info">
            <%--微创新活动--%>
        </div>
        <div class="login-box">
            <input type="text" placeholder="账号" name="username" id="username" value="${loginForm.username }"/>
            <input type="password" placeholder="密码" name="password" id="password"/>
            <div class="login-error"  id="nullinputerror">
           	 <c:if test="${not empty loginForm and loginForm.code !='success'}">
	                    <c:choose>
	                	<c:when test="${loginForm.code=='empty'}">请输入账号和密码</c:when>
	                	<c:when test="${loginForm.code=='pwdfial'}">账号或密码错误</c:when>
	                	<c:when test="${loginForm.code=='disable'}">账号被禁用</c:when>
	                	<c:when test="${loginForm.code=='expire'}">账号已过期</c:when>
	                	<c:when test="${loginForm.code=='ineffective'}">账号未生效</c:when>
	                	<c:when test="${loginForm.code=='already_bind'}">账号已被绑定</c:when>
	                	</c:choose>
         </c:if>
          </div>
             <div class="btn-login sps" onclick="submitf()">
             			用户绑定
            </div>  
        </div>
        <div class="logo-bg">

        </div>
        <div class="organization">
            <%--活动组织方：网络公司综合部--%>
        </div>
        <c:if test="${not empty tenantConfig && tenantConfig.login_prompt ne null}">
                 <span style="color:#999;font-size: 14px;display:block;margin-top:32px;line-height:22px;">${tenantConfig.login_prompt }</span>
                </c:if>
                &nbsp;nbsp
                <input type="hidden"  name="domain" value="${domain}"/>
                <input type="hidden" name="callback" value="${callback}"/>
                 <input type="hidden" name="openid" value="${openid}"/>
                 <input type="hidden" name="d_openid" value="${d_openid}"/>
                 <input type="hidden" name="action" value="bind"/>
                
    </section>
    </form>
    <script type="text/javascript" src="${basepath}/static/m_h5/js/jquery-2.1.1.min.js"></script>
     <script type="text/javascript" src="${basepath}/static/m_h5/js/common.js"></script>
     <script type="text/javascript">
   //正在登录
 	function loging(){
 		$(".sps").text("正在登录").append('<i class="fa fa-spinner fa-spin"></i>').addClass("loging");
 		}
 	//显示登录
 	function login(){
 		$(".sps").replaceWith('<div class="btn-login sps" onclick="submitf()">用户绑定</div>');
 	}

 	    function submitf(){
 	    	loging();
         	 $(".error").hide();


             if($("#username").val() == "" ||$("#password").val() == ""){
                 $("#nullinputerror").html('请填写账号密码 ');
                 login();
             }else{
                 /*提交操作*/
                 $("#loginForm").submit();
             }
         }
     </script>
</body>
</html>