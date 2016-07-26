<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%@page import="com.longtime.ajy.support.SubDomainHelper"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title><fmt:message key="login.title" bundle="${bundle}"/></title>
    <meta charset="utf-8" http-equiv="Accept-Charset">
    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="${basepath}/static/css/login/style.css" />
     <link rel="shortcut icon" type="image/ico" href="${basepath }/static/img/favicon.ico">
    <script type="text/javascript" charset="utf-8" src="${basepath}/static/js/mootools-core-1.4.5-full-nocompat.js"></script>
    <script type="text/javascript" charset="utf-8">
        // Browser.Platform.mac - (boolean) 操作系统是Mac.
        // Browser.Platform.win - (boolean) 操作系统是Windows.
        // Browser.Platform.linux - (boolean) 操作系统是Linux.-->
        // Browser.Platform.ios - (boolean) 操作系统是iOS.-->
        // Browser.Platform.android - (boolean) 操作系统是Android-->
        // Browser.Platform.webos - (boolean) 操作系统是WebOS-->
        // Browser.Platform.other - (boolean) 其它操作系统.-->
        // Browser.Platform.name - (string) 操作系统的名称.-->
        /*
        var ispad = false;
        if (Browser.Platform.ios) {
            if (navigator.userAgent.indexOf("iPhone") != -1) {
                window.location.href = "login_m.html";
            } else {
                ispad = true;
            }
        } else if (Browser.Platform.android) {
            window.location.href = "login_m.html";
        }
        */
    </script>
    
    <style>
    		.login .inp .search .user-item {
		  background:#fff url(${basepath }/static/img/login/icon/login_item1.png) no-repeat center center;
		}
		.login .inp .search .psw-item {
		  background:#fff url(${basepath }/static/img/login/icon/login_item2.png) no-repeat center center;
		}
    </style>
</head>
<body>
<c:set var="logoutstatus" value="<%=MwebHelper.getLogoutStatus(request)%>" />
	<div class="header">
		<div class="header-wrapper clear">
			<span class="logo fl" href="javascript:;">
				<img src="${basepath }/static/img/login/logo.jpg" alt="" />
			</span>
			<p class="logo-text fl"><fmt:message key="login.title" bundle="${bundle}"/></p>
			<span class="change fr">
				<a href="${basepath}/login.xhtml?lang=ja"><img src="${basepath }/static/img/login/japan.jpg" alt="" /></a>
			</span>
			<span class="change fr">
				<a href="${basepath}/login.xhtml?lang=en_US"><img src="${basepath }/static/img/login/USA.jpg" alt="" /></a>
			</span>
			<span class="change fr">
				<a href="${basepath}/login.xhtml?lang=zh_CN"><img src="${basepath }/static/img/login/china.jpg" alt="" /></a>
			</span>
		</div>
	</div>

	<div class="wrapper">
		<div class="wrapper-content">
			<div class="banner">
				<%-- <c:if test="${not empty tenant && not empty tenant.logincover }">
					<img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${tenant.logincover}" alt="" />
				</c:if>
				<c:if test="${empty tenant || empty tenant.logincover }"> --%>
					<img src="${basepath }/static/img/login/banner.jpg" alt="" />
				<%-- </c:if> --%>
			</div>
			<div class="login">
				<h2><fmt:message key="login.welcome" bundle="${bundle}"/></h2>
				 <form role="form" id="denglu" method="post" action="${basepath}/login.xhtml" onsubmit="return dl_yanzheng();">
		            	<input type="hidden" name="domain"  value="<%=SubDomainHelper.getSubDomain() %>"/>
		            	<input type="hidden" id="timestamp" name="timestamp" value="<%=System.currentTimeMillis() %>"/>
					<div class="inp">
					<!--start 错误提示 --> 
						<c:if test="${not empty loginForm and loginForm.code !='success'}">
			               <p class="tip">
			                    <c:choose>
					                	<c:when test="${loginForm.code=='empty'}"><fmt:message key="login.error_empty" bundle="${bundle}"/></c:when>
					                	<c:when test="${loginForm.code=='pwdfial'}"><fmt:message key="login.error_pwdfial" bundle="${bundle}"/></c:when>
					                	<c:when test="${loginForm.code=='disable'}"><fmt:message key="login.error_disable" bundle="${bundle}"/></c:when>
					                	<c:when test="${loginForm.code=='expire'}"><fmt:message key="login.error_expire" bundle="${bundle}"/></c:when>
					                	<c:when test="${loginForm.code=='ineffective'}"><fmt:message key="login.error_ineffective" bundle="${bundle}"/></c:when>
					                	<c:when test="${loginForm.code=='already_bind'}"><fmt:message key="login.error_already_bind" bundle="${bundle}"/></c:when>
					                	<c:when test="${loginForm.code=='unequal_domain'}"><fmt:message key="login.error_unequal_domain" bundle="${bundle}"/></c:when>
					                	<c:when test="${loginForm.code=='timeexpire'}"><fmt:message key="login.error_timeexpire" bundle="${bundle}"/></c:when>
				                	</c:choose>
				           </p>
			             </c:if>   
			             <%-- <c:if test="${ empty loginForm and logoutstatus == 'invalid'}">
			             	<p class="tip">
			             		<fmt:message key="login.error_info" bundle="${bundle}"/>
			                </p>
			             </c:if> --%>
			<%--end 错误提示 --%>  
						<p class="search clear">
							<label class="fl user-item"></label>
							<input class="search-text fl" type="text" id="username" placeholder="<fmt:message key="login.input_account" bundle="${bundle}"/>" name="username" />
						</p>
						<p class="search clear">
							<label class="fl psw-item"></label>
							<input class="search-text fl" type="password"  id="password" autocomplete="off" placeholder="<fmt:message key="login.input_pwd" bundle="${bundle}"/>"/>
							 <input type="hidden"  name="password" id="submitPwd"/>
						</p>
						<p class="remenb clear">
							<input type="hidden" name="remberme" id="remberme" value="false" />
							<input class="fl" style="position:relative;top:2px;" type="checkbox" id="isrember" title="<fmt:message key="login.secure_tip" bundle="${bundle}"/>" />&nbsp; <label for="isrember" style="font-weight: normal;"><fmt:message key="login.remember" bundle="${bundle}"/></label>
						</p>
						<p class="btn">
							<input class="btn-sub" type="submit"  onclick="" value="<fmt:message key="login.btn.login" bundle="${bundle}"/>">
						</p>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${basepath}/static/js/jquery-2.1.0.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="${basepath}/static/plugins/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${basepath}/static/js/jquery.md5.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
		$('.search-text').focus(function (){
			$(this).parent('.search').css('border','1px solid #f2453a')
		})
		$('.search-text').blur(function (){
			$(this).parent('.search').css('border','1px solid #e1e1e1')
		})
    });
    
    function dl_yanzheng(){
        if( $("#isrember").is(':checked')){
			$("#remberme").val("true");
        }else{
			$("#remberme").val("false");
        }
	        
        if($("#username").val() == "" || $("#password").val() == ""){
            $("#denglu").find(".form-group").addClass("has-error");
            $("#denglu-error").show();
            return false;
        }else{
	        	var timestamp = $("#timestamp").val();
            var password = $("#password").val();
            if(typeof(timestamp) != "undefined" && timestamp != null && timestamp!="" ){
            		password = $.md5(password+timestamp);
            }
            $("#submitPwd").val(password);
            
            //进一步验证或者登录进入
            return true;
           // $("#denglu").submit();
            
        }
    }
   
</script>
</body>
</html>
<%@ include file="/WEB-INF/include/analysis.jsp"%>