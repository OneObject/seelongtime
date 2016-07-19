<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","No-cache"); 
response.setDateHeader("Expires", -1); 
response.setHeader("Cache-Control", "No-store");
String domain = MwebHelper.getCurrentDomain();
if("ENN".equals(domain) ){
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
	body{font-family:"Microsoft yahei","sans-serif";font-size:62.5%;background:#eeeeee;color:#53575e;min-width:320px;height:100%;}
	body a,button,input{-webkit-tap-highlight-color:rgba(255,0,0,0);}
	
	article.default{width:100%;height:100%;overflow:auto;}
	article.default section.banner{width:100%;height:auto;}
	article.default section.banner img{width:100%;display:block;}
	article.default nav{background:#fff;overflow: hidden;}
	article.default nav div{width:100%;height:50%;display:block;}
	article.default nav div a{display:inline-block;width:33%;height:100%;box-sizing:border-box;float:left;border-right:1px solid #f1f1f1;border-bottom:1px solid #f1f1f1;text-align:center;color:#53575e}
	article.default nav div a:last-child{border-right:none;}
	article.default nav div:last-child a{border-bottom:none;}	
	/*主题颜色*/	
	article.default nav div a:active{background-color:#f4f4f4;color:#009933;}

	article.default nav .a1{background: url(${basepath }/static/img/c_enn/a1.png) center center no-repeat; background-size:auto 90%;}
	article.default nav .a2{background: url(${basepath }/static/img/c_enn/a2_1.png) center center no-repeat; background-size:auto 90%;}
	article.default nav .a3{background: url(${basepath }/static/img/c_enn/a3_1.png) center center no-repeat; background-size:auto 90%;}
	article.default nav .a4{background: url(${basepath }/static/img/c_enn/a4.png) center center no-repeat; background-size:auto 90%;}
	article.default nav .a5{background: url(${basepath }/static/img/c_enn/alxx.png) center center no-repeat; background-size:auto 90%;}
	article.default nav .a6{background: url(${basepath }/static/img/c_enn/video.png) center center no-repeat; background-size:auto 90%;}
</style>

<script type="text/javascript">
    //去掉底部的黑条
    document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
    	WeixinJSBridge.call('hideToolbar');
    });
    //去掉右上角选项
    document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
    	WeixinJSBridge.call('hideOptionMenu');
    });
</script>
	
<title>安全学习专栏</title>
</head>
<body>
	<article class="default">
        <section class="banner">
            <img src="${basepath }/static/img/c_enn/banner.jpg" alt="banner" />
        </section>
        <nav>
            <div>
            	<a href="${basepath }/m/nmystudy/mycourse_page.xhtml?fdomain=ENN&page=1&size=10&categoryid=ac060e84-a3a8-42d1-bfaf-34563f325a2d" class="a1"></a>
                <a href="${basepath }/m/nmystudy/mycourse_page.xhtml?fdomain=ENN&page=1&size=10&categoryid=a559437f-4103-45ac-90ac-85f5760291b0" class="a2"></a>
                <a href="${basepath }/m/nmystudy/mycourse_page.xhtml?fdomain=ENN&page=1&size=10&categoryid=92ee8402-f335-4f6b-8704-62a65aaa22af" class="a3"></a>               
            </div>
            <div>
            	<a href="${basepath }/m/nmystudy/mycourse_page.xhtml?fdomain=ENN&page=1&size=10&categoryid=5281faee-91fe-400a-87b1-2e6feaf7ee85" class="a5"></a>
            	<a href="${basepath }/m/nmystudy/mycourse_page.xhtml?fdomain=ENN&page=1&size=10&categoryid=508166c3-be89-463f-b833-6cabb2e0561b" class="a6"></a>
            	<a href="${basepath}/m/ixin/ntopic/index.xhtml?fdomain=ENN&activityid=9aa6af120213456ebe45606261721fce" class="a4"></a>
                               
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
			var liH;

			var bannerH=w * 9 /16;
			var navH=h-bannerH;
			var isPc = isPC();
			

			if(or==0 || or==180 || isPc){//竖屏	
				$("article.default .banner,article.default .banner img").height(bannerH);
				$("article.default nav").height(navH);
			}else{
				$("article.default .banner,article.default .banner img").height(bannerH);
				$("article.default nav div a").height(w/3);
				$("article.default nav div").height(w/3);
				$("article.default nav").height(w*2/3);
			}

			orientationEvent = supportsOrientationChange ? "orientationchange" : "resize";   
			window.addEventListener(orientationEvent, function() {
				var or=window.orientation;
				var w=$(window).width();
				var h=$(window).height();	
				var liH;
				var bannerH=w * 9 /16;
				var navH=h-bannerH;
				var isPc = isPC();
	
				if(or==0 || or==180 || isPc){//竖屏	
					$("article.default .banner,article.default .banner img").height(bannerH);
					$("article.default nav div a").height(navH/2);
					$("article.default nav div").height(navH/2);
					$("article.default nav").height(navH);
				}else{
					$("article.default .banner,article.default .banner img").height(bannerH);
					$("article.default nav div a").height(w/3);
					$("article.default nav div").height(w/3);
					$("article.default nav").height(w*2/3);
				}
			
			}); 
			}); 
			function isPC() 
		       { 
		           var userAgentInfo = navigator.userAgent; 
		           var Agents = new Array("Android", "iPhone", "SymbianOS", "Windows Phone", "iPad", "iPod"); 
		           var flag = true; 
		           for (var v = 0; v < Agents.length; v++) { 
		               if (userAgentInfo.indexOf(Agents[v]) > 0) { flag = false; break; } 
		           } 
		           return flag; 
		       } 
    </script>
</body>
</html>
<%
}
%>
