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
	<title>通灵珠宝</title>
	<style type="text/css">
	*{padding:0px;margin:0px;}
	a{text-decoration:none;font-size:16px;color:black;}
	ul,ol,dl{list-style: none;}
	body{font-family:"宋体";overflow: hidden;width:100%;height:100%;position: relative;}
	.indexContainer{overflow: hidden;}
		.bg{height: 100%;width: 100%;position: absolute;left: 0;}
		.mainBox{position: absolute;left: 0;top: 0;width: 100%;height: 50%;z-index: 300;background-color: #000;overflow: hidden;}
		.imgTitle{position:absolute;top: 60%;width:152px;height:72px;left:50%;margin-left:-76px;z-index:100;}
		.imgMain{position: absolute;width:100%;top: 0;left: 0;z-index:10;}
		.imgArr{position: absolute;height: 3.9%;bottom: 5%;z-index:105;}
		.menu{position: absolute;width: 100%;height: 50%;left: 0;top: 50%;z-index: 200;background-color: #000;overflow: hidden;}
		@media (max-width:767px ) {
			.products{position: absolute;width:145px;height: 175px;}
			.p1{z-index: 0;right: 8px;transform:translateY(-1500px);-webkit-transform:translateY(-1500px);bottom: 12px;}
			.p2{z-index: 0;left:  8px;transform:translateY(-1700px);-webkit-transform:translateY(-1700px);bottom: 12px;}
			.p3{z-index: 0;right:  8px;transform:translateY(-1900px);-webkit-transform:translateY(-1900px);bottom: 42%;}
			.p4{z-index: 0;left:  8px;transform:translateY(-2100px);-webkit-transform:translateY(-2100px);bottom: 42%;} 
		}
		
		@media (min-width:768px) {
			.products{position: absolute;width:280px;height: 330px;}
			.p1{z-index: 0;right: 32px;transform:translateY(-1500px);-webkit-transform:translateY(-1500px);bottom: 48px;}
			.p2{z-index: 0;left:  32px;transform:translateY(-1700px);-webkit-transform:translateY(-1700px);bottom: 48px;}
			.p3{z-index: 0;right: 32px;transform:translateY(-1900px);-webkit-transform:translateY(-1900px);bottom: 42%;}
			.p4{z-index: 0;left:  32px;transform:translateY(-2100px);-webkit-transform:translateY(-2100px);bottom: 42%;} 
		}
		.indexLogo{opacity: 0;position: absolute;top: 11%;height: 7%;}
		.indexTitle{transform:translateY(-200px);-webkit-transform:translateY(-200px); width: 100%;height: 8.5%;position: absolute;background: #434c6c;text-align: center;}
		.whiteLogo{height: 55%;}
		.hover{display:none;z-index:1000;position:absolute;width:100%;height:100%;left:0px;top:0px;background-color:#000;text-align:center;color:#fff;font-size:18px;}
	</style>
</head>
<body class="indexContainer">
	<div class="hover">为了更好的体验，请竖屏浏览！</div>
	<div class="bg">
		<section class="mainBox">
			<img src="${basepath }/static/img/c_tlzb/tl-logo.png" class="imgTitle">
			<img src="${basepath }/static/img/c_tlzb/pro.png" class="imgMain">
			<img src="${basepath }/static/img/c_tlzb/point.png" class="imgArr">
		</section>

		<section class="menu">
			<img src="${basepath }/static/img/c_tlzb/p1.jpg" class="p1 products">
			<img src="${basepath }/static/img/c_tlzb/p2.jpg" class="p2 products">
			<img src="${basepath }/static/img/c_tlzb/p3.jpg" class="p3 products">
			<img src="${basepath }/static/img/c_tlzb/p4.jpg" class="p4 products">
			<div class="indexTitle">
				<img src="${basepath }/static/img/c_tlzb/tl-white-logo.png" class="whiteLogo">
			</div>
			<img src="${basepath }/static/img/c_tlzb/title.jpg" class="indexLogo">
		</section>
	</div>
	<script type="text/javascript" src="${basepath }/static/m_h5/js/zepto.min.1.0.js"></script>
	<script type="text/javascript">
		var or = window.orientation;
		var orientationEvent;
		var supportOrientationChange = "onorientationchange" in window;
	
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
		
		document.addEventListener('touchmove', function(e) {
		    e.stopPropagation();
		    e.preventDefault();
		    return false;
		});
		
		$(function(){
			var width = $(window).width();
			var height = $(window).height();
			var imgMainH;
			
			$("body").width(width);
			$("body").height(height * 2);
			$(".mainBox").css("opacity", 0);
			
			waitForLoadImg(function(){
				imgMainH = $(".imgMain").height();
				
				$(".imgTitle").css({"top" : (imgMainH + 18) + "px"} );	
				
				horizontalCenter($(".imgMain"), width);
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
					//window.location.href = $(this).attr("data-href");
				});
			});
			
			function waitForLoadImg(callback){
				var total = $("img").length;
				var loaded = 0;
				$("img").each(function(){
					var src = $(this).attr("src");
					var img = new Image();
					img.src = src;
					img.onload = function () {   
						img.onload = null;   
						loaded ++;
						if(loaded == total){
							callback();
						}
					}   
				});
			}
		
			function horizontalCenter(obj, width){
				obj.css("left", (width - obj.width()) / 2 + "px");
			}	
			
			function showMenu(){
				drop($(".indexTitle"), 0, 1000, 0);
				drop($(".p1"), 0, 3000, 0);
				drop($(".p2"), 0, 3000, 400);
				drop($(".p3"), 0, 3000, 800);
				drop($(".p4"), 0, 3000, 1600);
				show($(".indexLogo"), 0, 1500, 4600);
			}
		
			function drop(img, rotate, time, delay){
				setTimeout(function(){
					img.animate(
						{translateY: "0",rotate: ""+rotate + "deg"}, 
						{duration: time, easing: 'ease-out'}
					)
				}, delay);	
			}
		
			function show(img, rotate, time, delay){
				setTimeout(function(){
					img.animate(
						{opacity: 1,rotate: ""+rotate + "deg"}, 
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
		});
		
		function showWarn(){
			$(".hover").show();
		}
		
		function hideWarn(){
			$(".hover").hide();
		}
	</script>
</body>
</html>