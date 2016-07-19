<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="com.longtime.common.utils.LoginSessionHelper"%>
<%@page import="com.longtime.app.config.Constants"%>
<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>首页</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${basepath}/static/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${basepath}/static/plugins/fonticon/css/font-awesome.min.css">
    <link rel="stylesheet" href="${basepath}/static/plugins/fonticon/css/font-awesome.min.css">
    <link rel="stylesheet" href="${basepath}/static/css/bind.css">
    <script type="text/javascript" src="${basepath}/static/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="${basepath}/static/plugins/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="welcome-box">
        <div class="welcome-header">
        
        <%
         	if(StringUtils.isNotBlank(LoginSessionHelper.getCurrentDomainLogo(request)))
         	{
         		%>
         		 <img src="<%=Constants.IMG_SERVER_DOWNLOAD %>/<%=LoginSessionHelper.getCurrentDomainLogo(request)%>-80x80" />
         		<%
         	}
         %>
            <span class="name"><%=LoginSessionHelper.getCurrentDomainName(request)%></span>
        </div>
        <div class="welcome-body">
            <div class="main-box">
            
            
                <!--step 1-->
                <div class="stemp1">
                    <div class="container">
                        <span class="tiaoguo">跳过&nbsp;<i class="fa fa-caret-right"></i></span>
                        <p class="huanying">
                            欢迎使用爱加油微信产品<br>请跟随指引进行简单的配置
                        </p>
                        <span class="btn btn-lg btn-success nextbtn"onclick="$(this).parent().parent().slideUp();$('.stemp2').slideDown()">&nbsp;&nbsp;&nbsp;&nbsp;下一步&nbsp;<i class="fa fa-chevron-right"></i>&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    </div>
                </div>
                
                <!--step 2-->
                <div class="stemp2" style="display: none;">
                    <div class="container">
                        <span class="tiaoguo">跳过&nbsp;<i class="fa fa-caret-right"></i></span>
                        <span class="warn-msg">微信公众平台账号和密码</span>
                        <form role="form" class="input-form">
                            <div class="form-group">
                                <input type="email" class="form-control"  placeholder="微信公众平台账号" name="username" id="username" value="${tokenInfo.name}">
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control"  placeholder="微信公众平台密码" name="password" id="password">
                            </div>
                            <div class="alert alert-danger" id="lb_error" style="display: none"></div>
                        </form>
                        <span class="btn btn-lg btn-success nextbtn"onclick="checkAccount(this)">&nbsp;&nbsp;&nbsp;&nbsp;下一步&nbsp;<i class="fa fa-chevron-right"></i>&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    </div>
                </div>
                
                 <!--step 3-->
                <div class="stemp3" style="display: none;">
                    <div class="container">
                        <span class="tiaoguo">跳过&nbsp;<i class="fa fa-caret-right"></i></span>
                        <span class="warn-msg">正在验证账号...</span>
                        <div class="waiting-box">
                            <i class="fa fa-spinner fa-10x fa-spin"></i>
                        </div>
                    </div>
                </div>
                
                 <!--step 4-->
                <div class="stemp4" style="display: none;">
                    <div class="container">
                        <span class="tiaoguo">跳过&nbsp;<i class="fa fa-caret-right"></i></span>
                        <p class="zhidao-big" style="text-align: center">
                            已经为您完成了基本的账号配置<br>
                            请点击下一步进入系统。
                            <!--为了更直观的看到效果，您可以发送一条消息给您账号的粉丝<br>-->
                            <!--<span class="zhidao-small">点击下一步，发送消息试试<br>如果没有粉丝，自己关注自己试试，<span class="openerwei" onclick="openerwei()">点击查看二维码</span></span>-->
                        </p>
                        <span class="btn btn-lg btn-success nextbtn" onclick="gotoUrl('${basepath}/mgr/voteactivity/index.xhtml')">&nbsp;&nbsp;&nbsp;&nbsp;进入系统&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    </div>
                    <!--<div  id="erwei" style="background-color: #ffffff;border: 2px solid #0d88c1;padding: 10px;display: none">-->
                        <!--<span style="height: 20px;width: 100%;display: block;overflow: hidden;">-->
                            <!--<i class="fa fa-times"></i>-->
                        <!--</span>-->
                        <!--<img src="img/erwei.png" style="width: 300px;">-->
                    <!--</div>-->

                </div>
                

            </div>
        </div>
        <div class="welcome-footer">
            <span>2014 © aijiayou.com</span>
        </div>
    </div>
<script type="text/javascript">
function gotoUrl(url){
	window.location.href=url;	
}
$(".tiaoguo").click(function() {
	window.location.href="${basepath}/mgr/guide/autobind_skip.xhtml";
});

function checkAccount(obj){
	var username = $("#username").val();
	var password = $("#password").val();
	if ($.trim(username).length < 0 ||$.trim(password).length<1 ) {
		$("#lb_error").html("<span style='font-size:15px'>请输入微信公众账号和密码</span>");
		$("#lb_error").show();
		return ;
	}
	$("#lb_error").hide();
	$(this).ajaxStart(function(){
		$(obj).parent().parent().slideUp();
		$('.stemp3').slideDown();
	});
	$.ajax({
		type: "POST",
		url:  basepath+"/mgr/guide/wx_account_check.json",
		data: {"username":username,"password":password},
		success:function(data){
			if(200==data.code){
				$.ajax({
					type: "POST",
					url: basepath+"/mgr/guide/autobind.json",
					data: {"username":username,"password":password},
					success:function(data){
						if (data == "success"){
							flag = true;
							$(obj).parent().parent().slideUp();
							$('.stemp4').slideDown();
						}else{
							$('.stemp3').slideUp();
							$('.stemp2').slideDown();
							$("#lb_error").html("<span style='font-size:15px'>绑定失败</span>");
							$("#lb_error").show();
						}
					}
				});
			}else{
				$('.stemp3').slideUp();
				$('.stemp2').slideDown();
				 if(data.code == -8){
						$("#lb_error").html("<span style='font-size:15px'>由于你的密码多次没有输入正确<br/>1.请90分钟后再次绑定。<br/>2.去微信官方绑定。</span>");
						$("#lb_error").show();
					}else{
						$("#lb_error").html("<span style='font-size:15px'>微信公众账号和密码错误</span>");
						$("#lb_error").show();
					}
			}
		},
		error: function(data){
			$('.stemp3').slideUp();
			$('.stemp2').slideDown();
			$("#lb_error").html("<span style='font-size:15px'>验证失败</span>");
			$("#lb_error").show();
		}
	});

}
</script>    
</body>
</html>