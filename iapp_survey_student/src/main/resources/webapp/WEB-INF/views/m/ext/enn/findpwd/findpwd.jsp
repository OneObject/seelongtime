<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
        <meta name="format-detection" content="telephone=no" />
		<title>找回密码</title>
        <link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/css/font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/css/guidance.2.0.css" />
		<link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/css/module.css" />
	</head>
	<body class="bg-color-gray">
         <section class="module-login">
            <div class="block-logo block-logo-2"></div>
            <div class="block-help-info green-color">
                通过好友找回密码
            </div>
            <div class="block-input">
                <input type="text" id="username" placeholder="您的员工编号" />
            </div>
            <div class="block-input margin-top-12">
                <input type="text" id="friendname" placeholder="好友姓名" />
            </div>
            <div class="block-input margin-top-12" >
                <input type="text" id="friendusername" placeholder="好友员工编号" />
            </div>
            <div class="block-error-info" id="error1" style="display:none;">
                好友的姓名和员工编号不匹配
            </div>
             <div class="block-error-info" id="error2" style="display:none;">
               您输入的用户不是您的好友
            </div>
             <div class="block-error-info" id="error3" style="display:none;">
               您输入的员工编号不存在
            </div>
            <div class="block-error-info" id="error4" style="display:none;">
               请输入完整信息
            </div>
            <div class="block-login-btn margin-top-12" onclick="subfindpwd();">
                确定
            </div>
            <dl class="help-info-list">
                <dt>通过管理员找回密码</dt>
                <dd>电话：021-50936301</dd>
                <dd>Email：wanghailian@enn.cn</dd>
            </dl>
            <div class="block-login-btn" id="btn-back">
                返回
            </div>
            <ul class="block-tel">
                <li>客服电话</li>
                <li><a href="tel:021-50936301">021-50936301</a></li>
            </ul>
        </section>

        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.2.0.js"></script>
        <script type="text/javascript">
			$(function (){
				 var $btnBack = $('#btn-back');
	                $btnBack.bind('click', function () {
	                    window.history.go(-1);
	                });
			});
			
			function isEmpty(str){
				return str==null||str=="";
			}
			function subfindpwd(){
				
				$("#error1").hide();
				$("#error2").hide();
				$("#error3").hide();
				$("#error4").hide();
				
				var username = $.trim($("#username").val());
				var friendname = $.trim($("#friendname").val());
				var friendusername = $.trim($("#friendusername").val());
				showHandling();
				if(isEmpty(username)|| isEmpty(friendname) || isEmpty(friendusername)){
					$('#module-handling').remove();
					$("#error4").show();
					return;
				}
				
				$.ajax({
					type : "POST",
					url:"${basepath}/m/ext/enn/findpwd/getpwdkey.json",
					cache : false,
					data:{"username":username ,"friendname" : friendname, "friendusername" : friendusername},
					success:function(map){
						
						if(map.existuser == false){
							$('#module-handling').remove();
							$("#error3").show();
							return ;
						}
						
						if(map.istruefriend==false){
							$('#module-handling').remove();
							$("#error1").show();
							return;
						}	
						if(map.ismyfriend==false){
							$('#module-handling').remove();
							 $("#error2").show();
							 return;
						}
						window.location.href="${basepath}/m/ext/enn/findpwd/showcode.xhtml?id="+map.entity.id;
						
						
					},
	
				});
				
			}
			
			
        </script>
	</body>
</html>
		
				
     