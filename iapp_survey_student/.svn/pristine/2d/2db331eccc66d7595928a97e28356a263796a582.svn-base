<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","No-cache"); 
response.setDateHeader("Expires", -1); 
response.setHeader("Cache-Control", "No-store");
String domain = MwebHelper.getCurrentDomain();
%>
<!DOCTYPE html>
<html lang="en"><head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link type="text/css" rel="stylesheet" href="${basepath }/static/css/c_tlzb/index.css" />
	<title>通灵珠宝</title>
</head>
<body class="indexContainer">
	<div class="hover">为了更好的体验，请竖屏浏览！</div>
	<div class="bg">
		<section class="mainBox">
			<img src="${basepath }/static/img/c_tlzb/point.png" class="imgArr">
		</section>
		
		<section class="menu">
			<img src="${basepath }/static/img/c_tlzb/p1.jpg" class="p1 products" data-href="${basepath }/m/h5/channelresource/index.xhtml?fdomain=tlzb&channelid=565181a6fdd749a9bcac57080659ca57" /><!-- 微信墙 -->
			<img src="${basepath }/static/img/c_tlzb/p2.jpg" class="p2 products" data-href="${basepath }/m/h5/channelresource/index.xhtml?fdomain=tlzb&channelid=ed2e934a63c24c99a47eaf5d74fa7fbe" /><!-- 培训通知 -->
			<img src="${basepath }/static/img/c_tlzb/p3.jpg" class="p3 products" data-href="${basepath }/m/h5/channelresource/index.xhtml?fdomain=tlzb&channelid=4e955aadc91b43028913b047de079cbd" /><!-- 需求调研 -->
			<img src="${basepath }/static/img/c_tlzb/p4.jpg" class="p4 products" data-href="${basepath }/m/h5/channelresource/index.xhtml?fdomain=tlzb&channelid=2b9acea7471f49acb6276307cbb35b7b" /><!-- 品牌新闻 -->
			<div class="indexTitle">
				<img src="${basepath }/static/img/c_tlzb/tl-white-logo.png" class="whiteLogo">
			</div>
			<img src="${basepath }/static/img/c_tlzb/title_w.png" class="indexLogo">
		</section>
	</div>
	<script type="text/javascript" src="${basepath }/static/m_h5/js/zepto.min.1.0.js"></script>
	<script type="text/javascript" src="${basepath }/static/js/jquery-2.1.0.min.js"></script>
	<script type="text/javascript">
		var jq = jQuery.noConflict();
		var width,height;
		document.addEventListener('touchmove', function(e) {
		    e.stopPropagation();
		    e.preventDefault();
		    return false;
		});
		jq(function(){
			width = jq(window).width();
			height = jq(window).height();
		});
		
		$(function(){
			var or = window.orientation;
			var orientationEvent;
			var supportOrientationChange = "onorientationchange" in window;
			if(( height / width )  >  480 / 320){
				$(".products").css({"width" : "45%"});
			}
			$("body").width(width);
			$("body").height(height * 2);
			$(".mainBox").css("opacity", 0);
			
			orientationEvent = supportOrientationChange ? "orientationchange" : "resize"; 
			window.addEventListener(orientationEvent, function() {
				var width;
				var height;
				or = window.orientation;
				if(or==90 || or==-90){
					setTimeout(function(){
						width = $(window).width();
						height = $(window).height();
						$(".hover").css({"width":width+"px","height" : height + "px","line-height" : height + "px",});
						showWarn();
					},500);
				}else{
					hideWarn();
				}
			}, false);
			
			waitForLoadImg(function(){
				horizontalCenter($(".imgArr"), width);	
				$(".mainBox").css("opacity", 1);
				playPointAnimate();
				$(".mainBox").swipeUp(function(event){
					$(".hover").css({"top" : height + "px"});
					$(".indexContainer").animate(
						{translateY: - height+"px"}, 
						{duration: 1000, easing: 'ease-out'}
					);
					showMenu();
				});
				horizontalCenter($(".indexLogo"), width);
				$(".whiteLogo").css("margin-top",($(".indexTitle").height() - $(".whiteLogo").height()) / 2);		
				$(".menu > img").tap(function(){
					window.location.href = $(this).attr("data-href");
				});
			});
			
			function waitForLoadImg(callback){
				var total = $("img").length;
				var loaded = 0;
				$("img").each(function(){
					var src = $(this).attr("src");
					var img = new Image();
					img.onload = function () {   
						img.onload = null;   
						loaded ++;
						if(loaded == total){
							callback();
						}
					} 
					img.src = src;
				});
			}
		
			function horizontalCenter(obj, width){
				obj.css("left", (width - obj.width()) / 2 + "px");
			}	
			
			function showMenu(){
				drop($(".indexTitle"), 0, 1000, 0);
				$(".indexLogo").show(2800);
				show($(".p4"), 0, 2800, 0);
				show($(".p3"), 0, 2800, 400);
				show($(".p2"), 0, 2800, 800);
				show($(".p1"), 0, 2800, 1200);
			}
		
			function drop(img, rotate, time, delay){
				setTimeout(function(){
					img.animate(
						{translateY: "0",rotateY: ""+rotate + "deg"}, 
						{duration: time, easing: 'ease-out'}
					)
				}, delay);	
			}
		
			function show(img, rotate, time, delay){
				setTimeout(function(){
					img.animate(
						{opacity: 1,rotateY: ""+rotate + "deg"}, 
						{duration: time, easing:'ease-out'}
					)
				}, delay);	
			}
		
			function playPointAnimate(){
				$(".imgArr").css({
					opacity:1, 
					"-webkit-transform": "translateY(0px)"
				});
				$(".imgArr").animate(
					{opacity:0, translateY: "-"+(height  / 20)+"px"}, 
					{duration: 2000, easing: 'ease-out', complete:playPointAnimate}
				);
			}
			
			function showWarn(){
				$(".hover").show();
			}
			
			function hideWarn(){
				$(".hover").hide();
			}			
		});
		

	</script>
</body>
</html>