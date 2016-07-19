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
    <link rel="stylesheet" href="${basepath}/static/plugins/font-awesome-4.1.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="${basepath}/static/m_h5/css/common.css" >
    <link rel="stylesheet" href="${basepath}/static/m_h5/css/color.css" >
    <style type="text/css">
	    article.default section.banner{overflow:hidden;}
    	article.default section.banner img{height:auto;}    
    </style>
<title>学习中心</title>
</head>
<body>
	<article class="default">
        <section class="banner">
            <img src="${basepath}/static/m_h5/img/enn/enn_banner.jpg" alt="banner" />
        </section>
        <nav>
            <div>
            	 <a href="${basepath}/m/nmystudy/mycourse_page.xhtml?fdomain=ENN&page=1&size=10&categoryid=691ce645-f4e0-4fe1-9048-423fcc2755d1">
                    <ul>
                        <li><img src="${basepath}/static/m_h5/img/enn/1.jpg" alt="平台化战略" /><span>平台化战略</span></li>
                        
                    </ul>    
                </a>
                <a href="${basepath}/m/nmystudy/mycourse_page.xhtml?fdomain=ENN&page=1&size=10&categoryid=34ae208d-89e1-4b48-b157-e16bae9b2e10">
                    <ul>
                        <li><img src="${basepath}/static/m_h5/img/enn/2.jpg" alt="领导力" /><span>领导力</span></li>
                    </ul>                
                </a>
                <a href="${basepath}/m/nmystudy/mycourse_page.xhtml?fdomain=ENN&page=1&size=10&categoryid=e530cd24-7406-47a4-b837-d244bfc001c9">
                    <ul>
                        <li><img src="${basepath}/static/m_h5/img/enn/3.jpg" alt="项目管理" /><span>项目管理</span></li>
                    </ul>
                </a>               
            </div>
            <div>
                <a href="${basepath}/m/nmystudy/mycourse_page.xhtml?fdomain=ENN&page=1&size=10&categoryid=e17d2cb6-ecd8-43c2-9b25-c85391571ee3">
                    <ul>
                        <li><img src="${basepath}/static/m_h5/img/enn/4.jpg" alt="职场攻略" /><span>职场攻略</span></li>
                    </ul>                
                </a>
                <a href="${basepath}/m/nmystudy/mycourse_page.xhtml?fdomain=ENN&page=1&size=10&categoryid=2887ea2a-bb07-477a-ba41-575aa1de700b">
                    <ul>
                        <li><img src="${basepath}/static/m_h5/img/enn/5.jpg" alt="初识新奥" /><span>初识新奥</span></li>
                    </ul>    
                </a>
                <a href="${basepath}/m/nmystudy/mycourse_page.xhtml?fdomain=ENN&page=1&size=10&categoryid=e7917700-850e-4455-a0d2-503572668e68">
                    <ul>
                        <li><img src="${basepath}/static/m_h5/img/enn/6.jpg" alt="健康、亲子" /><span>健康、亲子</span></li>
                    </ul>
                </a>               
            </div>
            <div>
            	<a href="${basepath}/m/nmystudy/mycourse_page.xhtml?fdomain=ENN&page=1&size=10&categoryid=ab672bd8-7669-40b2-8c16-18d980a4f3d3">
                    <ul>
                        <li><img src="${basepath}/static/m_h5/img/enn/7.jpg" alt="慧海拾珠" /><span>慧海拾珠</span></li>
                    </ul>    
                </a>
            	<a href="${basepath}/m/h5/usercenter/index.xhtml">
                    <ul>
                        <li><img src="${basepath}/static/m_h5/img/enn/8.jpg" alt="个人中心" /><span>个人中心</span></li>
                    </ul>    
                </a>
                <a href="#" class="hold"></a>               
            </div>
        </nav>
    </article>
 	<script type="text/javascript" src="${basepath}/static/m_h5/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript">
    	$(function(){
			var orientationEvent;
			var supportsOrientationChange = "onorientationchange" in window;			
			var or=window.orientation;
			var count=$("nav>div").length;
			if(count<=3){//当模块数小于9
				if(or==0 || or==180){//竖屏	
				var w=$(window).width();
				var h=$(window).height();	
				if(h == 0){
					h = 500;
				}
				var liH;			
				var bannerH=h*0.32;
				var navH=h-bannerH;
				$("article.default .banner").height(bannerH);
				$("article.default nav").height(navH);
				liH=$("nav div a").height();
				$("nav div a.hold").height(liH);							
				$("nav div a li img").height(liH-44);
				$("nav div a li img").width(liH-44);
				if (/ipad/i.test(navigator.userAgent)){
						$("nav div a li img").height(liH-64);
						$("nav div a li img").width(liH-64);
					}	  
				}else{//横屏
					var w1=$(window).width();
				    var h1=$(window).height();
					var liW=$("nav div a").width();
					$(".banner,.banner img").css({"width":"100%;","height":"auto"});
					$("nav div").css({"height":"auto"});
					$("nav div a").height(liW);
					$("nav div a li img").height(liW-84);
					$("nav div a li img").width(liW-84);
					if (/ipad/i.test(navigator.userAgent)){
							$("nav div a li img").height(liW-124);
							$("nav div a li img").width(liW-124);
						}	
					}				
				}else{//当模块数大于9
					if(or==0 || or==180){//竖屏
						var aW=$("nav div a").width();
						$(".banner,.banner img").css({"width":"100%;","height":"auto"});
						$("nav div").css({"height":"auto"});
						$("nav div a").height(aW);
						$("nav div a li img").height(aW-44);
						$("nav div a li img").width(aW-44);
						if (/ipad/i.test(navigator.userAgent)){
								$("nav div a li img").height(aW-84);
								$("nav div a li img").width(aW-84);
							}	  		
					}else{
						var aW1=$("nav div a").width();
						$(".banner,.banner img").css({"width":"100%;","height":"auto"});
						$("nav div").css({"height":"auto"});
						$("nav div a").height(aW1);
						$("nav div a li img").height(aW1-84);
						$("nav div a li img").width(aW1-84);
						if (/ipad/i.test(navigator.userAgent)){
								$("nav div a li img").height(aW1-124);
								$("nav div a li img").width(aW1-124);
							}
						}		
					}			
			orientationEvent = supportsOrientationChange ? "orientationchange" : "resize";   
			window.addEventListener(orientationEvent, function() {
				var or=window.orientation;
				var count=$("nav>div").length;
				if(count<=3){//当模块数小于9
					if(or==0 || or==180){//竖屏					
					var w=$(window).width();
					var h=$(window).height();
					$(".banner,.banner img").css({"width":"100%","height":"100%"});
					var liH,liH1;			
					var bannerH=h*0.32;
					var navH=h-bannerH;
					$("article.default .banner").height(bannerH);
					$("article.default nav").height(navH);
					liH=navH*0.33;
					liH1=navH*0.34;
					$("nav div a").height(liH);
					$("nav div:last a").height(liH1);						
					$("nav div a li img").height(liH-44);
					$("nav div a li img").width(liH-44);
					if (/ipad/i.test(navigator.userAgent)){
							$("nav div a li img").height(liH-64);
							$("nav div a li img").width(liH-64);
						}	  
					}else{//横屏						
						var liW=$("nav div a").width();
						$(".banner,.banner img").css({"width":"100%","height":"auto"});
						$("article.default nav").css({"height":"auto"});
						$("nav div").css({"height":"auto"});
						$("nav div a").height(liW);
						$("nav div a li img").height(liW-84);
						$("nav div a li img").width(liW-84);
						if (/ipad/i.test(navigator.userAgent)){
								$("nav div a li img").height(liW-124);
								$("nav div a li img").width(liW-124);
							}	
						}									
					}else{//当模块数大于9
						if(or==0 || or==180){//竖屏
							var aW=$("nav div a").width();
							$(".banner,.banner img").css({"width":"100%","height":"auto"});
							$("nav div").css({"height":"auto"});
							$("nav div a").height(aW);
							$("nav div a li img").height(aW-44);
							$("nav div a li img").width(aW-44);
							if (/ipad/i.test(navigator.userAgent)){
									$("nav div a li img").height(aW-84);
									$("nav div a li img").width(aW-84);
								}	  		
						}else{
							var aW1=$("nav div a").width();
							$(".banner,.banner img").css({"width":"100%","height":"auto"});
							$("nav div").css({"height":"auto"});
							$("nav div a").height(aW1);
							$("nav div a li img").height(aW1-84);
							$("nav div a li img").width(aW1-84);
							if (/ipad/i.test(navigator.userAgent)){
									$("nav div a li img").height(aW1-124);
									$("nav div a li img").width(aW1-124);
								}
							}		
						}
				}, false); 		
			});    
    </script>
</body>
</html>
