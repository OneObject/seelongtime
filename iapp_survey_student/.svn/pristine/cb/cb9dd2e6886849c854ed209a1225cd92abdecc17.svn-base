<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
<meta name="format-detection" content="telephone=no" />    
<link rel="stylesheet" href="${basepath }/static/c_tlzb/css/swiper.css" type="text/css">
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
	article.default section.banner{width:100%;height:auto;position:relative;}
	article.default section.banner img{width:100%;display:block;}
	article.default section.banner .loading-info{position:absolute;width:100px;left:50%;margin-left:-50px;bottom:-100px;height:24px;line-height:24px;font-size:14px;text-align:center;}
	article.default nav{overflow: hidden;box-sizing: border-box;width:100%;opacity:0;}
	article.default nav a{display:block;width:33%;height:33%;box-sizing:border-box;float:left;border-bottom:1px solid #eee;}
	article.default nav a:nth-child(3n+2){width:34%;border-left:1px solid #eee;border-right:1px solid #eee;}
	article.default nav a:nth-child(1){height:34%;border-top:none;}
	article.default nav a:nth-child(2){height:34%;border-top:none;}
	article.default nav a:nth-child(3){height:34%;border-top:none;}
	article.default nav div a:active{background-color:#fff;}
	article.default nav a span.img{width:100%;height:80%;display: block;}
	article.default nav a span.txt{width:100%;height:20%;display: block;text-align:center;color:#666;font-size:14px;line-height: 150%;}
</style>	
<title>${vo.name }</title>
</head>
<body>
	<article class="default">
	<c:choose>
		<c:when test="${vo.id =='ff808081511a2b3301517f483fa67c66' }">
			
			 <section class="banner">
            	<div class="swiper-container">
    			<div class="swiper-wrapper">
                    <div class="swiper-slide"><a href="#"><img style="display: block;" src="${basepath }/static/m/site/img/banner1_20160115.jpg" /></a></div>
                    <div class="swiper-slide"><a href="http://www.aijiayou.com/student/m/ixin/fodder/detail.xhtml?id=2c242fae7715467bb99d72b50b5daf05&fdomain=fosunproperty"><img style="display: none;" src="${basepath }/static/m/site/img/banner2_20160128.png" /></a></div>
                </div>
            	</div>
            	<div class="pagination"></div>
        	</section>
		</c:when>
		<c:when test="${vo.id == 'ff808081529f97640152a514d0c117ea' }">
			 <section class="banner">
            	<div class="swiper-container">
    			<div class="swiper-wrapper">
                    <div class="swiper-slide"><a href="#"><img style="display: block;" src="${basepath }/static/m/site/img/amblem_banner1_20160218.jpg" /></a></div>
                    <div class="swiper-slide"><a href="#"><img style="display: none;" src="${basepath }/static/m/site/img/amblem_banner2_20160218.jpg" /></a></div>
                </div>
            	</div>
            	<div class="pagination"></div>
        	</section>
		</c:when>
		<c:otherwise>
			<section class="banner">
            <img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${vo.cover}-640x360"  />
            <span class="loading-info" id="loading-info">加载中...</span>
        	</section>
		</c:otherwise>
	</c:choose>
	
	
        <nav id="nav">
        	<c:forEach var="item" items="${vo.models }">
				<a href="${item.url }">
				<span class="img"  style="background: url(<%=Constant.IMG_SERVER_DOWNLOAD%>${item.cover}) center center no-repeat;background-size:auto 90%;"></span>
				<span class="txt">${item.title }</span>
				</a>
        	</c:forEach>
        	<c:set var="length" value="${fn:length(vo.models)}"></c:set>
        	 ${length % 3 ==1?'<a href></a><a href></a>':length % 3 ==2?'<a href></a>':''}
        		
        	
        	
        </nav>
    </article>
 	<script type="text/javascript" src="${basepath}/static/m_h5/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="${basepath }/static/c_tlzb/js/swiper.min.js"></script>
    <script type="text/javascript">
    	$(function (){
    		banner = new Swiper('.swiper-container',{
                pagination: '.pagination',
                loop: true,
                autoplay: 3000,
                autoplayDisableOnInteraction: false,
                autoResize: true,
                calculateHeight: true,
                paginationClickable: true,
            });
            setTimeout(function () {
                $(".swiper-slide img").css({"display": "block"});
            }, 300);  
            window.addEventListener("orientationchange", function() {
                $(".swiper-wrapper,.swiper-slide").css({"height": "auto"});
            }, false);   
    	})
    
    
		window.onload = function () {
			var orientationEvent;
			var supportsOrientationChange = "onorientationchange" in window;
			var or=window.orientation;
			var w=$(window).width();
			var h=$(window).height();
			var h1;
			var arrA = $("nav > a");
			var nav = $('#nav');
			var loading = $('#loading-info');
			if (arrA.length < 10) {
				setTimeout(function(){
					if((h / w) >= (12 / 10)){
						h1 = $("section.banner").height();
						nav.css({"height":(h-h1)+"px"});
	
					}else{
						nav.css({"height":"100%"});
					}		
					nav.css({'opacity': 1});
					loading.remove();
				},100);
				
				orientationEvent = supportsOrientationChange ? "orientationchange" : "resize";   
				window.addEventListener(orientationEvent, function() {
					var w=$(window).width();
					var h=$(window).height();
					var h1;
					setTimeout(function(){
						if((h / w) >= (12 / 10)){
							h1 = $("section.banner").height();
							nav.css({"height":(h-h1)+"px"});
						}else{
							nav.css({"height":"100%"});
						}				
					},100);			
				}); 
			} else {
				setTimeout(function(){
					nav.css({"height":"auto"});
					for (var i = 0, len = arrA.length; i < len; i++) {
						$(arrA[i]).height(w / 3);
					}
					nav.css({'opacity': 1});
					loading.remove();
				},100);
				
				orientationEvent = supportsOrientationChange ? "orientationchange" : "resize";   
				window.addEventListener(orientationEvent, function() {
					var w=$(window).width();
					var h=$(window).height();
					var h1;
					setTimeout(function(){
						nav.css({"height":"auto"});
						for (var i = 0, len = arrA.length; i < len; i++) {
							$(arrA[i]).height(w / 3);
						}
					},100);		
				}); 				
			}			
		};
    </script>
</body>
</html>
