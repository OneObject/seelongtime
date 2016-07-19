<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
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
    <link type="text/css" rel="stylesheet" href="${basepath }/static/css/c_tlzb/menu.css" />
	<title>通灵珠宝</title>
</head>
<body>
	<div class="hover">为了更好的体验，请竖屏浏览！</div>
	<div class="nav">
		<div class="logo"><img src="${basepath }/static/img/c_tlzb/logo2.png" ></div>
		<div class="menu m1"><img src="${basepath }/static/img/c_tlzb/m1.png" data-href="${basepath }/m/ixin/ntopic/index.xhtml?fdomain=tlzb"  ></div>
		<div class="menu m2"><img src="${basepath }/static/img/c_tlzb/m2.png" data-href="${basepath }/m/h5/ask/page.xhtml?fdomain=tlzb"></div>
		<div class="menu m3"><img src="${basepath }/static/img/c_tlzb/m3.png" data-href="${basepath }/m/h5/channelresource/index.xhtml?fdomain=tlzb&channelid=c86701a9b0134eb1a61f651a98819eb5" ></div>
		<div class="menu m4"><img src="${basepath }/static/img/c_tlzb/m4.png" data-href="<%=Constant.ADMIN_ROOT %>/protal/rank/credit.xhtml?fdomain=tlzb"></div>
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
			waitForLoadImg(function(){
				$(".nav > .menu img").tap(function(){
					window.location.href = $(this).attr("data-href");
				});
				showMenu();
			});
			
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
			
			function showMenu(){
				$(".logo").show(400);
				show($(".m1"), 0, 1200, 0);
				show($(".m2"), 0, 1200, 400);
				show($(".m3"), 0, 1200, 800);
				show($(".m4"), 0, 1200, 1200);
			}

			function show(img, rotate, time, delay){
				setTimeout(function(){
					img.animate(
						{opacity: 1, left: "50%"}, 
						{duration: time, easing:'easing'}
					)
				}, delay);	
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