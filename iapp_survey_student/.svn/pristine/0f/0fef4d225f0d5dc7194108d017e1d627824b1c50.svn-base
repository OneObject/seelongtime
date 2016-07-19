<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
        <meta name="format-detection" content="telephone=no" />
		<title>确认码</title>
        <link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/css/font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/css/guidance.2.0.css" />
		<link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/css/module.css" />
		 <style type="text/css">
            body{
                background: #f8f8f8;
            }
        </style>
	</head>
	<body class="bg-color-gray">
          <section class="module-login">
            <div class="block-logo block-logo-2"></div>
            <dl class="ensure-info-list">
                <dt>通过好友找回密码</dt>
                <dd>确认码<span>${findPWD.code }</span></dd>
                <dd>
                    请将确认码告知好友，好友确认你的身份后，系统会将你的密码重置为员工编号。
                </dd>
            </dl>
            <div class="block-login-btn" id="btn-back" >
                返回
            </div>
        </section>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.2.0.js"></script>
        <script type="text/javascript">
			$(function (){
				 var $btnBack = $('#btn-back');
	                $btnBack.bind('click', function () {
	                    //window.history.go(-1);
	                    window.location.href="${basepath}/m/ext/enn/login.xhtml";
	                });
			});
			

        </script>
	</body>
</html>
		
				
     