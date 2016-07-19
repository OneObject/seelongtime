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
String title = MwebHelper.getTenantInfo().getName();
if(StringUtils.isBlank(title)){
	title ="首页";
}

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
<style type="text/css">
	*{padding:0px;margin:0px;}
	ul{list-style:none;}
	.clr{clear:both;}
	a{text-decoration:none;}
	input,textarea,a{outline:none;}
	textarea{resize:none;}
	input:focus,textarea:focus,a:focus{outline:none;}
	
	body{font-family:"Microsoft yahei","sans-serif";font-size:62.5%;background:#eeeeee;color:#53575e;min-width:320px;height:auto;min-height:1px;}
	body a,button,input{-webkit-tap-highlight-color:rgba(255,0,0,0);}
	a:active{background:none;}
	
	header.xinao{width:100%;height:auto;padding:8px;background:#fff;box-sizing:border-box;position:static;}
	header.xinao img{width:97%;height:auto;display:block;}
	nav.xinao{width:100%;overflow:hidden;background:url(${basepath}/static/img/xinao/bg.jpg) center center no-repeat;background-size:100% 100%;}
	nav.xinao ul{width:100%;height:33%;}
	nav.xinao ul li{width:50%;height:100%;border-right:1px solid #fff;border-bottom:1px solid #fff;box-sizing:border-box;float:left;display:table;}
	nav.xinao ul li a{display:inline-block;width:100%;height:100%;text-align:center;display:table-cell;vertical-align:middle;}
	nav.xinao ul li img{width:64px;height:64px;display:block;margin:0 auto;}
	nav.xinao ul li a span{color:#fff;font-size:16px;margin-top:12px;display:inline-block;}
	nav.xinao ul li:last-child{border-right:0px;}
	nav.xinao ul:last-child{height:34%;}
	nav.xinao ul:last-child li{border-bottom:none;}
</style>	
<title>新奥首页</title>
</head>
<body>
	<header class="xinao"><img src="${basepath}/static/img/xinao/logo.png" /></header>
    <nav class="xinao" style="padding: 0px;">
    	<ul>
        	<li><a href="${basepath}/m/h5/notice/index.xhtml"><img src="${basepath }/static/m_h5/img/i1.png" alt="通知公告" /><span>通知公告</span></a></li>
            <li><a href="javascript:toDetail('<%=Constant.ADMIN_ROOT %>/protal/uservote/index.xhtml?voteId=6f8d244a0db44eee9f7d6f98f9eb88fa&openId=oRuXDjvt9v3ITa8FUUrHbsM_4G6w&domain=ENNApp&fdomain=ENNApp');"><img src="${basepath }/static/m_h5/img/i3.png" alt="培训计划" /><span>培训计划</span></a></li>            
        </ul>
        <ul>
        	<li><a href="javascript:toDetail('<%=Constant.ADMIN_ROOT %>/protal/uservote/index.xhtml?voteId=ec1d78be76194408bfbfe98db4086f5d&openId=oRuXDjvt9v3ITa8FUUrHbsM_4G6w&domain=ENNApp&fdomain=ENNApp');"><img src="${basepath }/static/m_h5/img/i2.png" alt="辅导记录" /><span>辅导记录</span></a></li>
            <li><a href="${basepath }/m/task/index.xhtml?fdomain=ENNApp"><img src="${basepath }/static/m_h5/img/i7.png" alt="辅导日志" /><span>辅导日志</span></a></li>            
        </ul>
        <ul>
        	<li><a href="${basepath}/m/h5/channelresource/channel?channelid=dddd9c0295a946468f11e45a1c0c0f4b"><img src="${basepath }/static/m_h5/img/i5.png" alt="微社区" /><span>微社区</span></a></li>
            <li><a href="${basepath}/m/h5/usercenter/index.xhtml"><img src="${basepath }/static/m_h5/img/i4.png" alt="个人中心" /><span>个人中心</span></a></li>            
        </ul>    
    </nav>
    <script type="text/javascript" src="${basepath}/static/m_h5/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="${basepath}/static/m/common.js"></script>
	<script type="text/javascript">

		var basepath ="${basepath}";
    	$(function(){			
			var orientationEvent;
			var supportsOrientationChange = "onorientationchange" in window;
			
			var or=window.orientation;
			var w=$(window).width();
			var h=$(window).height();			
			var h1=$("header").height();
			var w1=$("ul li").width();
			if(or==0 || or==180){//竖屏
				$("nav").height(h-h1-16);
			}else{
				$("ul li").css({"height":"auto"});
				$("ul li img").css({"width":"124px","height":"124px"});
				$("ul li").height(w1);				
				}
			orientationEvent = supportsOrientationChange ? "orientationchange" : "resize";   
			window.addEventListener(orientationEvent, function() {
				var or=window.orientation;
				var w=$(window).width();
				var h=$(window).height();			
				var h1=$("header").height();
				var h2;
				var w1=$("ul li").width();
				if(or==0 || or==180){//竖屏
					$("nav").height(h-h1-16);
					h2=$("nav").height();
					$("nav ul li").height(h2*0.33);
					$("nav ul:last li").height(h2*0.34);
					$("ul li img").css({"width":"64px","height":"64px"});		
				}else{
					$("nav").css({"height":"auto"});
					$("ul li img").css({"width":"124px","height":"124px"});
					$("ul li").height(w1);				
					}
				},false);	
			});
		function toDetail(url){

			toViewShell(url);
		}

	
		
				
    </script>
    
</body>
</html>
