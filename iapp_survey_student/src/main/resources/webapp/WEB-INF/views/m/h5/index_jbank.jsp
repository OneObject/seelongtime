<%@page import="com.longtime.ajy.support.SpringContextUtil"%>
<%@page import="com.longtime.ajy.student.service.UserService"%>
<%@page import="com.longtime.ajy.model.User"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="org.apache.commons.lang.math.RandomUtils"%>
<%@page import="com.longtime.ajy.mweb.MwebHelper" %>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","No-cache"); 
response.setDateHeader("Expires", -1); 
response.setHeader("Cache-Control", "No-store");
String uid = MwebHelper.getCurrentUid();
UserService userService = (UserService)SpringContextUtil.getBean("userService");
User user = userService.findOne(uid);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    	<meta name="apple-mobile-web-app-capable" content="yes" />
    	<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    	<meta name="format-detection" content="telephone=no" />
    	<link rel="stylesheet" href="${basepath}/static/plugins/font-awesome-4.1.0/css/font-awesome.min.css" />
		<title>微培训</title>
        <style type="text/css">
			*{padding:0px;margin:0px;}
			ul,dl{list-style-type:none;}
			.clr{clear:both;}
			a{text-decoration:none;}
			input,textarea,a{outline:none;}	
			textarea{resize:none;}
			
			:root{height:100%;}
			body{font-family:"Microsoft yahei","sans-serif";font-size:62.5%;color:#53575e;min-width:320px;width:100%;min-height:480px;height:100%;}
			body a,button,input{-webkit-tap-highlight-color:rgba(255,0,0,0);}
			
			body{display:-moz-box;display:-webkit-box;display:box;-moz-box-orient:vertical;-webkit-box-orient:vertical;box-orient:vertical;}
        	header{width:100%;height:50px;line-height:50px;background:#FF4244;}
			header>span{padding:0 14px;display:inline-block;height:50pxpx;line-height:50px;cursor:pointer;}
			header>span i.fa{font-size:24px;color:#fff;display:inline-block;position:relative;top:4px;}
			header>span.left{padding:0 14px;float:left;}
			header>span.right{float:right;position:relative;}
			header>span.right .numBox{display:inline-block;width:16px;height:16px;position:absolute;top:6px;right:2px;border-radius:16px;background:#FF4244;text-align:center;}
			header>span.right .numBox label{display:inline-block;width:14px;height:14px;line-height:14px;background:#fff;border-radius:14px;color:#FF4244;position:absolute;top:1px;left:1px;font-size:12px;}
        	
			article{background:url(${basepath}/static/m_h5/img/jbank/bg.png) left top no-repeat;background-size:cover;width:100%;position:relative;-moz-box-flex:1;-webkit-box-flex:1;box-flex:1;display:-moz-box;display:-webkit-box;display:box;-moz-box-orient:vertical;-webkit-box-orient:vertical;box-orient:vertical;}
			
			article .userInfo{position:relative;}
			article .userInfo .logo{position:absolute;left:12px;top:18px;width:84px;height:42px;}
			article .userInfo .logo img{width:84px;height:42px;display:block;}
			article .userInfo .userBox ul{width:100%;text-align:center;padding:34px 0px 14px 0px;}
			article .userInfo .userBox ul li:first-child span{display:inline-block;width:114px;height:114px;border-radius:114px;background:#fff;}
			article .userInfo .userBox ul li:first-child img{display:block;width:104px;height:104px;border-radius:104px;position:relative;left:5px;top:5px;}
			article .userInfo .userBox ul li:first-child+li{color:#fff;font-size:16px;font-weight:bold;height:28px;line-height:28px;}
			article .userInfo .userBox ul li:last-child{color:#eee;font-size:13px;}
			
			article .nav{-moz-box-flex:1;-webkit-box-flex:1;box-flex:1;position:absolute;bottom:0px;left:0px;width:100%;}
			article .nav ul li{display:inline-block;box-sizing:border-box;height:78px;line-height:78px;width:50%;margin-top:1px;}
			article .nav ul li a{color:#fff;display:inline-block;width:100%;height:100%;text-align:center;font-size:16px;background:rgba(0,0,0,0.5);}
			article .nav ul li:nth-child(odd){float:left;border-right:1px solid;border-color:transparent;}
			article .nav ul li:nth-child(even){float:right;}
			article .nav ul li a:hover,article .nav ul li a:active{background:#61CCD9;}
			article .nav ul li a>span{display:block;width:100%;height:34px;text-align:center;position:relative;margin:12px 0px 5px;line-height:34px;}
			article .nav ul li a img{width:32px;height:34px;display:block;position:absolute;left:50%;margin-left:-17px;}
			article .nav ul li a label{height:18px;line-height:18px;display:block;text-align:center;}
			article .nav ul li a .img{position:relative;display:inline-block;width:32px;height:34px;line-height:34px;}
			article .nav ul li a .img span{display:inline-block;width:14px;height:14px;line-height:14px;background:#FF4244;border-radius:14px;color:#fff;position:absolute;top:0px;right:-12px;font-size:12px;}
			
			footer{padding:12px 18px 6px 18px;}
			footer .search{display:-moz-box;display:-webkit-box;display:box;-moz-box-orient:horizontal;-webkit-box-orient:horizontal;box-orient:horizontal;width:100%;}
			footer .search .input{-moz-box-flex:1;-webkit-box-flex:1;box-flex:1;display:inline-block;}
        	footer .search input{border:1px solid #eee;padding:6px 12px;border-radius:5px;color:#999;font-size:13px;box-shadow:0px 0px 3px #eee inset;box-sizing:border-box;width:100%;}
			footer .search > .btn{display:inline-block;width:30px;height:30px;line-height:30px;border-radius:5px;margin-left:5px;background:#FF4244;color:#fff;text-align:center;box-shadow:0px 0px 3px #eee;cursor:pointer;}
			footer .search > .btn i{font-size:16px;margin-top:6px;}
			footer span.arr {display:block;margin-top:8px;}
			footer span.arr img{display:block;width:42px;margin:0 auto;cursor:pointer;}
			
			.popBox{position:absolute;top:0px;left:0px;width:205px;min-height:480px;height:100%;z-index:100;box-shadow:1px 1px 6px #333;}
			.popBox a{color:#fff;display:inline-block;width:100%;cursor:pointer;}
			.popBox > dl{height:100%;background:rgba(49,52,59,0.95);border-right:1px solid #262626;}
			.popBox > dl ul{border-bottom:1px solid #222;}
			.popBox > dl dt{font-size:18px;color:#fff;background:#434956;padding-left:16px;height:50px;line-height:50px;border-bottom:3px solid #2b3238;}
			.popBox > dl li{font-size:14px;color:#fff;border-top:1px solid #222;border-bottom:1px solid #3e454b;padding-left:36px;}
			.popBox > dl li{height:28px;line-height:28px;}
			.popBox > dl li.m1{border-top:none;}
			.popBox > dl li.a{height:34px;line-height:34px;font-size:16px;}
			.popBox > dl li.a img{height:18px;width:18px;margin-top:8px;}
			.popBox > dl li a label{display:inline-block;min-width:20px;height:14px;line-height:14px;border-bottom:2px solid #aaa;border-radius:3px;background:#171c1b;font-size:12px;float:right;text-align:center;margin:7px;} 
			.popBox > dl li.a label{display:inline-block;min-width:20px;height:14px;line-height:14px;border-bottom:2px solid #aaa;border-radius:3px;background:#171c1b;font-size:12px;float:right;text-align:center;margin:10px 6px;} 
			.popBox > dl li{background:url(${basepath}/static/m_h5/img/jbank/m6.png) 24px center no-repeat;background-size:6px 6px;}
			.popBox > dl li.m1{background:url(${basepath}/static/m_h5/img/jbank/m1.png) 14px center no-repeat;background-size:18px 18px;}
			.popBox > dl li.m2{background:url(${basepath}/static/m_h5/img/jbank/m2.png) 14px center no-repeat;background-size:18px 18px;}
			.popBox > dl li.m3{background:url(${basepath}/static/m_h5/img/jbank/m3.png) 14px center no-repeat;background-size:18px 18px;}
			.popBox > dl li.m4{background:url(${basepath}/static/m_h5/img/jbank/m4.png) 14px center no-repeat;background-size:18px 18px;}	
			.popBox dd > div{padding-left:36px;height:32px;line-height:32px;font-size:16px;color:#fff;}
			.popBox .mail{width:100%;box-sizing:border-box;background:url(${basepath}/static/m_h5/img/jbank/m5.png) 14px center no-repeat;background-size:18px 18px;position:absolute;left:0px;bottom:5px;z-index:110;}
        </style>
	</head>
	<body>
		<c:set var="user" value="<%=user%>"></c:set>
    	<div class="popBox" style="display:none;">
        	<dl>
            	<dt>首页</dt>
                <dd>
                	<ul>
						<li class="a m1"><a href="#">学习中心</a></li>
                        <li><a href="${basepath}/m/h5/study/courses.xhtml?model=me">我的课程</a></li> 
                         										<%--<li><a href="#">我的课程 <label>45</label></a></li>  带有提醒数字--%>
                        <li><a href="${basepath}/m/h5/study/courses.xhtml">课程中心</a></li>
                        <li><a href="${basepath}/m/h5/study/courses.xhtml">精选课程</a></li>
                        <li class="a m2"><a href="#">分享中心</a></li>
                        <li><a href="#">达人攻略</a></li> 
                        <li><a href="#">案例学习</a></li>
                        <%--<li><a href="#">案例学习<label>45</label></a></li>  带有提醒数字--%>
                        <li><a href="#">部门宝典</a></li>
                        <li class="a m3"><a href="${basepath}/m/h5/exam/index.xhtml">考试中心</a></li>
                        <li class="a m4"><a href="${basepath}/m/h5/channelresource/channel?channelid=7e1c3c69b68b46c1abe35403aaf22f4c">问卷调研</a></li>    
                    </ul>
                	<div  class="mail">
                    	<a href="${basepath}/m/h5/feed/tofeedback.xhtml?model=1" >意见反馈</a>
                    </div>     	
                </dd>     
            </dl>
        
        </div>
    	<header>
        	<span class="left" id="menu"><i class="fa fa-bars"></i></span>
            <span class="right">
            	<i class="fa fa-envelope"></i>
            	<!-- 信封上的  提醒数字（隐藏） -->
                <span class="numBox" style="display: none">
                	<label>7</label>
                </span>
            </span>	
        </header>
		<article>
        	<div class="userInfo">
            	<div class="logo"><img src="${basepath}/static/m_h5/img/jbank/logo.png" /></div>
                <div class="userBox">
                	<ul>
                    	<%--<li><span><img src="${basepath}/static/m_h5/img/jbank/tx.png" /></span></li> --%>
                    	<li><span><img src="${basepath}/user/avatar/${user.id}.xhtml?style=80x80&color=gray&r=<%=RandomUtils.nextInt()%>" /></span></li>
                        <li>${not empty user.name?user.name:user.username }</li>
                        <%--<li>${empty oname and not empty user.name ? user.username:oname}</li>  部门暂不支持--%>
                    </ul>
                </div>
            </div>
            <div class="nav">
            	<ul>
                	<li>
                    	<a href="${basepath}/m/h5/study/courses.xhtml?model=me">
                    	<span><span class="img"><img src="${basepath}/static/m_h5/img/jbank/p1.png" /><span>3</span></span></span>
                        <label>我的课程</label>
                        </a>
                    </li>
                    <li>
                    	<a href="${basepath}/m/h5/study/courses.xhtml">
                    	<span><span class="img"><img src="${basepath}/static/m_h5/img/jbank/p2.png" /></span></span>
                        <label>热门课程</label>
                        </a>
                    </li>
                    <li>
                    	<a href="${basepath}/m/h5/exam/index.xhtml">
                    	<span><span class="img"><img src="${basepath}/static/m_h5/img/jbank/p3.png" /></span></span>
                        <label>在线考试</label>
                        </a>
                    </li>
                    <li>
                    	<a href="#">
                    	<span><span class="img"><img src="${basepath}/static/m_h5/img/jbank/p4.png" /></span></span>
                        <label>达人攻略</label>
                        </a>
                    </li>     
                </ul>            
            </div> 	
        </article>
        <footer>
        	<div class="search">
            	<span class="input"><input type="text" placeholder="Search" /></span><span class="btn"><i class="fa fa-search"></i></span>
            </div>
            <span class="arr"><img src="${basepath}/static/m_h5/img/jbank/arr.png" /></span>
        </footer>
     <script type="text/javascript" src="${basepath}/static/js/jquery-2.1.0.min.js"></script>
     <script type="text/javascript">
     	$(function(){
			var orientationEvent;
			var supportsOrientationChange = "onorientationchange" in window;
			var w=$(window).width()-71;
			$("span.input").width(w); 
			orientationEvent = supportsOrientationChange ? "orientationchange" : "resize";   
				window.addEventListener(orientationEvent, function() {
				    var w=$(window).width()-71;
					$("span.input").width(w); 
				}, false); 
			$("#menu").click(function(event){
					$(".popBox").show();
					event.stopPropagation();					
				});
			$(".popBox,article").click(function(event){
					event.stopPropagation();
				});
			
			$("body,article").click(function(){
					$(".popBox").hide();
				});
			
			});
     </script>
	</body>
</html>
