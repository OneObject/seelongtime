<%@page import="com.longtime.common.spring.SpringContextUtil"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true" %>
<%@include file="/WEB-INF/include/taglibs.jsp"%><%--需重再一次导入 --%>
<%
String key = exception.getMessage();
String msg = key!=null? SpringContextUtil.getMessage(key):"";
pageContext.setAttribute("msg", msg);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    	<meta name="apple-mobile-web-app-capable" content="yes" />
    	<meta name="apple-mobile-web-app-status-bar-style" content="black" />
    	<meta name="format-detection" content="telephone=no" />
 		<title>提示信息</title>
 		<style type="text/css">
 				ul,ol,dl{list-style:none;padding:0px;margin:0px;}
				#myBox{width:100%;min-width: 600px;}
				#myBox ul{padding:40px 20px;width:100%;}
				#myBox ul li{text-align: center;color:#666;font-size:18px;}
				#myBox ul li:nth-child(2){margin:30px 0px;}
				#myBox ul span{display:block;width:100px;margin:0 auto;border-radius:4px;cursor:pointer;text-align: center;color:#fff;font-size:18px;background: hsl(2, 64%, 58%);height:34px;line-height: 34px;}
				#myBox ul li img {display: block;width:150px;height:150px;margin:0 auto;}
 		</style>
	</head>
	<body>
		<section class="main-home">
			<ol class="breadcrumb">
			    <li><a href="${ basepath}">首页</a></li>
			    <li class="active">提示</li>
			</ol>
			<div id="myBox">
				<ul>
					<li><img src="${ basepath}/static/img/study/rectangle.png" /></li>
					<li>${not empty msg ? msg:'操作错误' }</li>
					<li><span onclick="back();">返回</span></li>
				</ul>
			</div>

		</section>
		<!-- 
        <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
		 -->
		 <script type="text/javascript">
			function back(){
				
				//window.location.href='${ basepath}';
				window.history.go(-1);
			}
		 </script>
	</body>
</html>
