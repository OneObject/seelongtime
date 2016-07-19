<%@page import="com.longtime.ajy.support.SubDomainHelper"%>
<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>美世在线课堂</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<style type="text/css">
	*{margin:0; padding:0}
	
	html{overflow-y:hidden;}
	body{font-family:"微软雅黑" arial Helvetica, sans-serif;width:100%;}
	a{color:#333; text-decoration:none}
	img{border:none}
	ul,ol{list-style:none}
	p{margin-bottom:12px}
	.clear{clear:both}
	body{min-width: 980px;min-height:460px;}
	#header{width:100%;height:58px;background:#fff url(${basepath }/static/mercer/img/logo0.gif) 18px center no-repeat;background-size:auto 32px;background:#fff url(${basepath }/static/mercer/img/logo.gif) 18px center no-repeat\9;*background:#fff url(${basepath }/static/mercer/img/logo.gif) 18px center no-repeat;}
	#header .rightLink{_display:inline;text-align:right;width:320px;height:58px;line-height:58px;margin-right:25px;float: right;color:#999;font-size:16px;}
	#header .rightLink a{color:#00a6c1;text-decoration: underline;font-weight:400;}
	#header .rightLink a:hover{text-decoration: underline;}
	#content{width:100%;position:relative;}
	#content  img{width:100%;display:block;}
	#content .logBox{width:296px;height:328px;position: absolute;top:8.5%;right:8.7%;background:url(${basepath }/static/mercer/img/log_win.png) left top no-repeat;_background:url(${basepath }/static/mercer/img/log_win.gif) left top no-repeat !important;}
	.logBox div{text-align: center;font-size:18px;color:#999;height:40px;line-height: 40px;font-weight:600;}
	.logBox div label{*position:relative;*top:-9px;font-weight:normal;}
	.logBox div input{height:38px;line-height:38px;color:#999;font-size:16px;padding:0px 14px;width:160px;border:1px #aaa solid;border-radius: 2px;}
	.logBox div input:focus{box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.075) inset, 0px 0px 8px rgba(0, 183, 220, 0.6);transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s;}
	.logBox div input.error{border-color:#C26468;}
	.logBox div input.error:focus{box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.075) inset, 0px 0px 8px rgba(194, 100, 104, 0.6);transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s;}
	.logBox .user{margin-top:80px;}
	.logBox .psd{margin-top:24px;}
	.logBox .logBtn{color:#fff;font-size:14px;font-weight:normal;cursor:pointer;margin-top:44px;height:40px;width:208px;margin-left:44px;background: url(${basepath }/static/mercer/img/log_btn.png) center center no-repeat;}
	.logBox .logBtn:hover{background: url(${basepath }/static/mercer/img/log_btn1.png) center center no-repeat;}
	.logBox .err{position:absolute;width:200px;top:214px;left:80px;text-align:left;font-size:13px;color: #C26468;font-weight: normal;}
	#footer{width:100%;height:66px;background: #fff;}
	#footer .leftLogo{float:left;width:182px;margin-top:20px;height:26px;_display:inline;margin-left:18px;_background:#fff url(${basepath }/static/mercer/img/logo2.png) left center no-repeat !important;_filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true', sizingMethod='scale', src="${basepath }/static/mercer/img/logo2.png");background:#fff url(${basepath }/static/mercer/img/logo2.png) left center no-repeat;_background:none;}
	#footer .rightInfo{text-align:right;width:100px;height:66px;line-height:66px;_display:inline;margin-right:25px;float: right;color:#999;font-size:16px;}
	.sb{color:#00a6c1;font-size:12px;position:absolute;left:45px;bottom:15px;}
	#warnBox{color: red;border:1px solid;background-color: #FCF8E3;border-color: #FAEBCC;box-sizing:border-box;font-size:16px;height:44px;line-height:44px;width:640px;text-align:center;position: absolute;left:50%;margin-left:-320px;top:0px;}
	.rem{display:inline-block;width:100px;height:24px;line-height:24px;font-size:14px;color:#999;position:relative;left:80px;top:11px;}
</style>
<script type="text/javascript">
if(self!=top){top.location=self.location;} 
</script>
</head>
<body>
<div id="warnBox" style="display: none;" >您的IE浏览器版本过低，请使用IE9+、Chrome、Firefox浏览器浏览本站!</div>
<div id="header">
	<div class="rightLink">
		联络方式：<a href="#">learning.china@mercer.com</a>
	</div>
	<div class="clear"></div>
</div>

<div id="content">
<form role="form" id="denglu" method="post" action="${basepath}/login.xhtml">
		<input type="hidden" name="domain"  value="<%=SubDomainHelper.getSubDomain() %>"/>
		<input type="hidden" id="timestamp" name="timestamp" value="<%=System.currentTimeMillis() %>"/>
		<img src="${basepath }/static/mercer/img/log_bg.jpg"  />
		<div class="logBox">
			<div class="user">
				<label>账号：</label><input type="text" id="username" placeholder="账号" name="username" value="${loginForm.username }"/>
			</div>
			<div class="psd">
				<label>密码：</label><input type="password" id="password"  placeholder="密码" />
				<input type="hidden"  name="password" id="submitPwd"/>
			</div>
			  
                 
              
            <input type="hidden" name="remberme" id="remberme" value="false" />
            <span class="rem"><input style="position:relative;top:2px;" type="checkbox" id="isrember" title="为了您的账户安全，请勿在网吧或其它公共场合使用该功能" />&nbsp; 记住我</span>
                  
                   
				 
					<div class="logBtn" onclick="dl_yanzheng()">
				登录
			</div>
			<a class="sb" href="${basepath }/m/h5/findpwd.xhtml">忘记密码</a>
			
				<c:if test="${not empty loginForm and loginForm.code !='success'}">
				<div class="err">
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
		</div>
</form>
<div class="clear"></div>
</div>
<div class="clear" ></div>
<div id="footer">
	<div class="leftLogo">
		
	</div>
	<div class="rightInfo">
		@ MERCER
	</div>
</div>
<script type="text/javascript"  src="${basepath}/static/js/jquery-2.1.0.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${basepath}/static/js/jquery.md5.js"></script>
<script type="text/javascript">
	
$(function(){
	var ie = !-[1,];
	var warn = document.getElementById("warnBox");
	if(ie){
	    warn.style.display = "block";
	}
	window.onmousewheel = scrollFunc;
	changeFooter();
	window.onresize = changeFooter;
	function changeFooter(){
		setTimeout(function(){
			var h1 = $(window).height();
			var h2 = $("body").height() - 66;
			if((h1-h2) > 66){
				$("body").css({"position": "static"});
				$("#footer").css({"position": "static"});
			}else{
				$("body").css({"position": "static"});
				$("#footer").css({"position": "absolute","left":"0px","bottom":"0px"});
			}
		},200);
	}
	function scrollFunc(event){
		return false;
	}
});


	function dl_yanzheng(){
		
		if( $("#isrember").is(':checked')){
			$("#remberme").val("true");
	    }else{
			$("#remberme").val("false");
	    }
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
