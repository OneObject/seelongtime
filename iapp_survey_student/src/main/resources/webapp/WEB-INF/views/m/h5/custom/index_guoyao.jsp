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
%><!DOCTYPE html>
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
	
	article.default{width:100%;height:100%;overflow:auto;}
	article.default section.logo{width:100%;height:44px;background:#fff url(${basepath }/static/img/c_guoyao/logo3.png) 10px center no-repeat;background-size: auto 70%;}
	article.default section.banner{width:100%;height:auto;}
	article.default section.banner img{width:100%;display:block;}
	article.default nav{overflow: hidden;box-sizing: border-box;padding:10px;width:100%;height:100%;}
	article.default nav div{width:100%;height:33%;display:block;}
	article.default nav div a{display:inline-block;width:33%;height:100%;box-sizing:border-box;float:left;}

	article.default nav div a:active{background-color:#fff;}
	article.default nav .a1{background: url(${basepath }/static/img/c_guoyao/301.png) center center no-repeat; background-size:auto 70%;}
	article.default nav .a2{background: url(${basepath }/static/img/c_guoyao/302.png) center center no-repeat; background-size:auto 70%;}
	article.default nav .a3{background: url(${basepath }/static/img/c_guoyao/303.png) center center no-repeat; background-size:auto 70%;}
	article.default nav .a4{background: url(${basepath }/static/img/c_guoyao/304.png) center center no-repeat; background-size:auto 70%;}
	article.default nav .a5{background: none;}
	article.default nav .a6{background: none;}
	article.default nav .a7{background: none;}
	article.default nav .a8{background: none;}
	article.default nav .a9{background: none;}
</style>	
<title>牧羊</title>
</head>
<body>
	<article class="default">
		<section class="logo"></section>
        <section class="banner">
            <img src="${basepath }/static/img/c_guoyao/banner3.jpg"  />
        </section>
        <nav>
			<div>
				<a href="http://www.aijiayou.com/student/m/ixin/ntopic/index.xhtml?fdomain=FIELDS" class="a1"></a>
				<a href="http://www.aijiayou.com/student/m/ixin/ntopic/index.xhtml?fdomain=FIELDS" class="a2"></a>
				<a href="http://www.aijiayou.com/student/m/ixin/ntopic/index.xhtml?fdomain=FIELDS" class="a3"></a>
			</div>
			<div>
				<a href="http://www.aijiayou.com/student/m/ixin/ntopic/index.xhtml?fdomain=FIELDS" class="a4"></a>
				<a href="#" class="a5"></a>
				<a href="#" class="a6"></a>
			</div>
			<div>
				<a href="#" class="a7"></a>
				<a href="#" class="a8"></a>
				<a href="#" class="a9"></a>
			</div>
        </nav>
    </article>
 		<script type="text/javascript" src="${basepath }/static/js/jquery-2.1.0.min.js"></script>
  <script type="text/javascript">
    	$(function(){
			var orientationEvent;
			var supportsOrientationChange = "onorientationchange" in window;
			var or=window.orientation;
			var w=$(window).width();
			var h=$(window).height();
			var h1;
			setTimeout(function(){
				if((h / w) >= 1){
					h1 = 44 + $("section.banner").height();
					$("nav").css({"height":(h-h1)+"px"});
				}else{
					$("nav").css({"height":"100%"});
				}				
			}, 100);
			
			orientationEvent = supportsOrientationChange ? "orientationchange" : "resize";   
			window.addEventListener(orientationEvent, function() {
				var w=$(window).width();
				var h=$(window).height();
				var h1;
				setTimeout(function(){
					if((h / w) >= 1){
						h1 = 44 + $("section.banner").height();
						$("nav").css({"height":(h-h1)+"px"});
					}else{
					 
						$("nav").css({"height":"100%"});
					}				
				}, 100);			
			}); 
			}); 
    </script>

</body>
</html>
