<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="com.longtime.ajy.mweb.MwebHelper" %>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","No-cache"); 
response.setDateHeader("Expires", -1); 
response.setHeader("Cache-Control", "No-store");

String domain = MwebHelper.getCurrentDomain();
%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
<meta name="format-detection" content="telephone=no" />    
<style type="text/css">
	*{padding:0px;margin:0px;}
	ul{list-style:none;}
	.clr{clear:both;}
	a{text-decoration:none;}
	input,textarea,a{outline:none;}
	textarea{resize:none;}
	input:focus,textarea:focus,a:focus{outline:none;}
	:root{height:100%;}
	body{font-family:"Microsoft yahei","sans-serif";font-size:62.5%;background:#fff;color:#53575e;min-width:320px;height:100%;}
	body a,button,input{-webkit-tap-highlight-color:rgba(255,0,0,0);}
	
	article.default{width:100%;height:100%;overflow:auto;position:relative;}
	article.default section.lineBox{width:100%;height:48px;}
	article.default section.lineBox .line{height:8px;width:100%;background: url(${basepath }/static/img/c_guoyao/line.png) center center no-repeat;background-size:100% 8px;}
	article.default section.lineBox h2{font-weight: normal;text-align: center;height:40px;line-height: 40px;font-size:18px;}
	article.default section.box{padding:0px 8px 12px 8px;box-sizing: border-box;width: 100%;}
	article.default section.box .banner{width:100%;height:auto;margin-bottom: 12px;}
	article.default section.box .banner img{width:100%;display:block;}
	article.default nav{overflow: hidden;box-sizing: border-box;width:100%;}
	article.default nav a{display:inline-block;width:49%;height:auto;box-sizing:border-box;float:left;margin-bottom:8px;}
	article.default nav a img{display: block;width:100%;}
	article.default nav a.r{float:right;}
	article.default > .line{height:8px;width:100%;position:fixed;left:0px;bottom:0px;background: url(${basepath }/static/img/c_guoyao/line.png) center center no-repeat;background-size:100% 8px;}
	article.default nav div a:active{background-color:#fff;}
	
</style>	
<title>信息 & 动态</title>
</head>
<body>
	<article class="default">
		<section class="lineBox">
			<div class="line"></div>
			<h2>信息 & 动态</h2>
		</section>
		<section class="box">
			<div class="banner">
				<img src="${basepath }/static/img/c_guoyao//banner3.png"  />
			</div>
			<nav>
				<a href="${basepath }/m/h5/channelresource/open.xhtml?channelid=7772a97fa0464168bbf2ad5d7f921950&fdomain=guoyaodaxue"><img src="${basepath }/static/img/c_guoyao/b1.png" /></a>
				<a class="r" href="${basepath }/m/h5/channelresource/open.xhtml?channelid=127e97b6e5e9491fa34fea82ff33120f&fdomain=guoyaodaxue"><img src="${basepath }/static/img/c_guoyao/b2.png" /></a>
				<a href="${basepath }/m/h5/channelresource/open.xhtml?channelid=4583628953c042569a0eac1f7ea5d210&fdomain=guoyaodaxue"><img src="${basepath }/static/img/c_guoyao/b3.png" /></a>
			</nav>
		</section>
		<div class="line"></div>
 
    </article> 
</body>
</html>
