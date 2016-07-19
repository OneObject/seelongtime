<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>

<!--  -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE >
<html>
<head>
    <title>提示信息</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
     <link rel="shortcut icon" type="image/ico" href="${basepath }/static/img/favicon.ico">
    <style type="text/css">
	    * {margin: 0;padding: 0;}
	    body {text-rendering: optimizelegibility;color: #444444;font: 12px/1.5 'Helvetica Neue','Segoe UI',Tahoma,'Hiragino Sans GB','Hiragino Kaku Gothic Pro','Microsoft YaHei',sans-serif;}
	    .cl:after {clear: both;content: ".";display: block;height: 0;visibility: hidden;}
		.content, .headerco {margin: 0 auto;padding:0;}
		.changeblue2 {background-color: #F7FBFC;}
		.ngreyborder {border: 1px solid #BEC9D0;position: relative;}
		.mt20 {margin-top: 20px !important; margin: 10px}
		.m10 {margin: 10px;}
    </style>
</head>
  
<body class="bg">
  	<div class="container" style="padding:0px;width:100%;">
	    <div class="content cl" style="width:100%;padding:0px;" >
			<div class="ngreyborder changeblue2 mt20" >
	        	<div style="text-align:center;font-size:16px;padding:20px 0;">
		        	${empty msg ? "系统异常" :msg }
		        </div>
		        
		        <a href="javascript:goBack('${gotorl}');"  style="display:block;width:80px;margin:0 auto;height:32px;line-height:32px;text-align:center;font-size:16px;color:#666;margin-bottom:10px;text-decoration:none;border:1px solid #ccc;border-radius:5px;">返回</a>
	        </div>
	    </div>
	</div>
	<script type="text/javascript">
		function goBack(url){
			if(url != null && url != ""){
				window.location.href = url;
			} else {
				history.go(-1);
				window.close();
			}
		}
	</script>
</body></html>