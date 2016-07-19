<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","No-cache"); 
response.setDateHeader("Expires", -1); 
response.setHeader("Cache-Control", "No-store");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
        <meta name="format-detection" content="telephone=no" />
		<title>恒天商学院</title>
        <%-- <link rel="stylesheet" type="text/css" href="${basepath}/static/m_h5/css/hengtian_m.css" /> --%>
        <link type="text/css" rel="stylesheet" href="${basepath }/static/m_h5/fosun/css/swiper.css" />
        <style type="text/css">
        	html, body, div, span, a, p, section, article, dl, ul, dd, dt, li, img {
			  margin: 0;
			  padding: 0;
			  border: 0; }
			
			dl, ul {
			  list-style: none; }
			
			a, button, input, textarea, span, img, li, div {
			  -webkit-tap-highlight-color: rgba(255, 0, 0, 0); }
			
			section, div, a, ul, dl, span, p, dd, dt, li {
			  -webkit-box-sizing: border-box;
			  -moz-box-sizing: border-box;
			  box-sizing: border-box; }
			
			body {
			  min-width: 320px;
			  color: rgba(0, 0, 0, 0.87);
			  -ms-touch-action: none;
			  background: #fff; }
			
			input, textarea, div {
			  outline: medium; }
			
			input[type="search"] {
			  -webkit-appearance: none; }
			
			a {
			  color: rgba(0, 0, 0, 0.87);
			  text-decoration: none; }
			
			.body-gray-color {
			  background-color: #eee; }
			
			header {
			  height: 50px;
			  line-height: 50px;
			  position: fixed;
			  left: 0;
			  top: 0;
			  z-index: 50;
			  background: #515151;
			  color: #fff;
			  font-size: 18px;
			  text-align: center;
			  width: 100%; }
			  header .btn {
			    height: 50px;
			    line-height: 50px;
			    display: inline-block;
			    width: 50px;
			    text-align: center;
			    color: #fff; }
			  header .btn-add {
			    float: right;
			    font-size: 24px; }
			  header .btn-back {
			    float: left; }
			    header .btn-back i {
			      font-size: 34px;
			      position: relative;
			      top: 3px; }
			  header .btn-done {
			    float: right;
			    font-size: 18px;
			    width: 70px; }
			  header .title {
			    height: 50px;
			    line-height: 50px;
			    overflow: hidden;
			    white-space: nowrap;
			    text-overflow: ellipsis;
			    position: absolute;
			    width: 100%;
			    text-align: center;
			    padding: 0 50px;
			    left: 0;
			    top: 0;
			    z-index: -1;
			    color: #fff; }
			
			.margin-top-50 {
			  margin-top: 50px; }
			
			.block-banner {
			  padding: 0; 
			  position:relative;}
			
			nav {
			  padding: 8px;
			  overflow: hidden; }
			  nav a {
			    display: block;
			    width: 50%;
			    height: 76px;
			    float: left;
			    margin-bottom: 8px; }
			    nav a:nth-child(odd) {
			      padding-right: 4px; }
			    nav a:nth-child(even) {
			      padding-left: 4px; }
			    nav a div {
			      display: inline-block;
			      width: 100%;
			      height: 76px;
			      border-radius: 8px; }
			      nav a div span {
			        display: inline-block;
			        width: 100%;
			        height: 76px; }
			    nav a:nth-child(1) div {
			      background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #FD6F70), color-stop(100%, #DF243F));
			      background-image: -webkit-linear-gradient(top, #FD6F70 0%, #DF243F 100%);
			      background-image: -moz-linear-gradient(top, #FD6F70 0%, #DF243F 100%);
			      background-image: -ms-linear-gradient(top, #FD6F70 0%, #DF243F 100%);
			      background-image: -o-linear-gradient(top, #FD6F70 0%, #DF243F 100%);
			      background-image: linear-gradient(to bottom, #FD6F70 0%, #DF243F 100%); }
			    nav a:nth-child(1) span {
			      background: url(${basepath}/static/m_h5/img/jpkc.png) center center no-repeat;
			      background-size: auto 76px; }
			    nav a:nth-child(2) div {
			      background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #FFEB43), color-stop(100%, #FFB02A));
			      background-image: -webkit-linear-gradient(top, #FFEB43 0%, #FFB02A 100%);
			      background-image: -moz-linear-gradient(top, #FFEB43 0%, #FFB02A 100%);
			      background-image: -ms-linear-gradient(top, #FFEB43 0%, #FFB02A 100%);
			      background-image: -o-linear-gradient(top, #FFEB43 0%, #FFB02A 100%);
			      background-image: linear-gradient(to bottom, #FFEB43 0%, #FFB02A 100%); }
			    nav a:nth-child(2) span {
			      background: url(${basepath}/static/m_h5/img/cppx.png) center center no-repeat;
			      background-size: auto 76px; }
			    nav a:nth-child(3) div {
			      background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #86F883), color-stop(100%, #2BBE30));
			      background-image: -webkit-linear-gradient(top, #86F883 0%, #2BBE30 100%);
			      background-image: -moz-linear-gradient(top, #86F883 0%, #2BBE30 100%);
			      background-image: -ms-linear-gradient(top, #86F883 0%, #2BBE30 100%);
			      background-image: -o-linear-gradient(top, #86F883 0%, #2BBE30 100%);
			      background-image: linear-gradient(to bottom, #86F883 0%, #2BBE30 100%); }
			    nav a:nth-child(3) span {
			      background: url(${basepath}/static/m_h5/img/qbkc.png) center center no-repeat;
			      background-size: auto 76px; }
			    nav a:nth-child(4) div {
			      background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #F79FF9), color-stop(100%, #B23BD4));
			      background-image: -webkit-linear-gradient(top, #F79FF9 0%, #B23BD4 100%);
			      background-image: -moz-linear-gradient(top, #F79FF9 0%, #B23BD4 100%);
			      background-image: -ms-linear-gradient(top, #F79FF9 0%, #B23BD4 100%);
			      background-image: -o-linear-gradient(top, #F79FF9 0%, #B23BD4 100%);
			      background-image: linear-gradient(to bottom, #F79FF9 0%, #B23BD4 100%); }
			    nav a:nth-child(4) span {
			      background: url(${basepath}/static/m_h5/img/zxhd.png) center center no-repeat;
			      background-size: auto 76px; }
			    nav a:nth-child(5) div {
			      background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #A2A4FE), color-stop(100%, #575DEC));
			      background-image: -webkit-linear-gradient(top, #A2A4FE 0%, #575DEC 100%);
			      background-image: -moz-linear-gradient(top, #A2A4FE 0%, #575DEC 100%);
			      background-image: -ms-linear-gradient(top, #A2A4FE 0%, #575DEC 100%);
			      background-image: -o-linear-gradient(top, #A2A4FE 0%, #575DEC 100%);
			      background-image: linear-gradient(to bottom, #A2A4FE 0%, #575DEC 100%); }
			    nav a:nth-child(5) span {
			      background: url(${basepath}/static/m_h5/img/zxks.png) center center no-repeat;
			      background-size: auto 76px; }
			    nav a:nth-child(6) div {
			      background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #F590EC), color-stop(100%, #D0313E));
			      background-image: -webkit-linear-gradient(top, #F590EC 0%, #D0313E 100%);
			      background-image: -moz-linear-gradient(top, #F590EC 0%, #D0313E 100%);
			      background-image: -ms-linear-gradient(top, #F590EC 0%, #D0313E 100%);
			      background-image: -o-linear-gradient(top, #F590EC 0%, #D0313E 100%);
			      background-image: linear-gradient(to bottom, #F590EC 0%, #D0313E 100%); }
			    nav a:nth-child(6) span {
			      background: url(${basepath}/static/m_h5/img/wytc.png) center center no-repeat;
			      background-size: auto 76px; }

			      nav a:nth-child(7) div {
			        background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #cf7127), color-stop(100%, #ffb27f));
			        background-image: -webkit-linear-gradient(top, #cf7127 0%, #ffb27f 100%);
			        background-image: -moz-linear-gradient(top, #cf7127 0%, #ffb27f 100%);
			        background-image: -ms-linear-gradient(top, #cf7127 0%, #ffb27f 100%);
			        background-image: -o-linear-gradient(top, #cf7127 0%, #ffb27f 100%);
			        background-image: linear-gradient(to bottom, #cf7127 0%, #ffb27f 100%); }
			      nav a:nth-child(7) span {
			        background: url(${basepath}/static/m_h5/img/wxwx.png) center center no-repeat;
			        background-size: auto 76px; }

			      nav a:nth-child(8) div {
			        background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #8bbb13), color-stop(100%, #c8eb61));
			        background-image: -webkit-linear-gradient(top, #8bbb13 0%, #c8eb61 100%);
			        background-image: -moz-linear-gradient(top, #8bbb13 0%, #c8eb61 100%);
			        background-image: -ms-linear-gradient(top, #8bbb13 0%, #c8eb61 100%);
			        background-image: -o-linear-gradient(top, #8bbb13 0%, #c8eb61 100%);
			        background-image: linear-gradient(to bottom, #8bbb13 0%, #c8eb61 100%); }
			      nav a:nth-child(8) span {
			        background: url(${basepath}/static/m_h5/img/zcpzj.png) center center no-repeat;
			        background-size: auto 76px; }	
			        
			        			    nav a:nth-child(9) {
			      margin-bottom: 0; }
			      nav a:nth-child(9) div {
			        background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #7DECF3), color-stop(100%, #13ABC2));
			        background-image: -webkit-linear-gradient(top, #7DECF3 0%, #13ABC2 100%);
			        background-image: -moz-linear-gradient(top, #7DECF3 0%, #13ABC2 100%);
			        background-image: -ms-linear-gradient(top, #7DECF3 0%, #13ABC2 100%);
			        background-image: -o-linear-gradient(top, #7DECF3 0%, #13ABC2 100%);
			        background-image: linear-gradient(to bottom, #7DECF3 0%, #13ABC2 100%); }
			      nav a:nth-child(9) span {
			        background: url(${basepath}/static/m_h5/img/grzx.png) center center no-repeat;
			        background-size: auto 76px; }
			        
			    nav a:nth-child(10) {
			      margin-bottom: 0; }
			      nav a:nth-child(10) div {
			        background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #FFCA72), color-stop(100%, #FF5B04));
			        background-image: -webkit-linear-gradient(top, #FFCA72 0%, #FF5B04 100%);
			        background-image: -moz-linear-gradient(top, #FFCA72 0%, #FF5B04 100%);
			        background-image: -ms-linear-gradient(top, #FFCA72 0%, #FF5B04 100%);
			        background-image: -o-linear-gradient(top, #FFCA72 0%, #FF5B04 100%);
			        background-image: linear-gradient(to bottom, #FFCA72 0%, #FF5B04 100%); }
			      nav a:nth-child(10) span {
			        background: url(${basepath}/static/m_h5/img/htzd.png) center center no-repeat;
			        background-size: auto 76px; }				        
			
			.module-course-list {
			  padding: 8px; }
			  .module-course-list a:first-child .block-course {
			    margin-top: 0; }
			  .module-course-list .block-course {
			    margin-top: 8px;
			    padding: 8px;
			    background: #fff;
			    position: relative;
			    overflow: hidden; }
			    .module-course-list .block-course .image {
			      display: inline-block;
			      width: 80px;
			      height: 50px;
			      position: absolute;
			      left: 8px;
			      top: 8px; }
			      .module-course-list .block-course .image img {
			        display: block;
			        width: 80px;
			        height: 50px; }
			    .module-course-list .block-course ul {
			      width: 100%;
			      padding: 0 0 0 90px; }
			      .module-course-list .block-course ul li:nth-child(1) {
			        line-height: 22px;
			        color: rgba(0, 0, 0, 0.87);
			        font-size: 16px; }
			      .module-course-list .block-course ul li:nth-child(2) {
			        margin-top: 4px;
			        color: #999;
			        font-size: 14px;
			        line-height: 20px; }
			        .module-course-list .block-course ul li:nth-child(2) i {
			          margin-right: 4px; }
			        .module-course-list .block-course ul li:nth-child(2) span {
			          float: right; }
			      .module-course-list .block-course ul li:nth-child(3) {
			        color: #999;
			        font-size: 14px;
			        line-height: 20px;
			        margin-top: 4px; }
			        .module-course-list .block-course ul li:nth-child(3) i {
			          margin-right: 4px; }
			        .module-course-list .block-course ul li:nth-child(3) span {
			          float: right; }
			
			.module-tab {
			  width: 100%;
			  padding: 8px 10px;
			  background: #f8f8f8;
			  height: 51px;
			  border-bottom: 1px solid #dedede; }
			  .module-tab .tab-list {
			    width: 100%;
			    height: 30px; }
			    .module-tab .tab-list span {
			      display: inline-block;
			      float: left;
			      text-align: center;
			      height: 34px;
			      line-height: 32px;
			      font-size: 18px;
			      border: 1px solid #515151;
			      color: #515151; }
			    .module-tab .tab-list span.active {
			      background-color: #515151;
			      color: #fff; }
			
			.tab-col-3 span {
			  width: 33%; }
			  .tab-col-3 span:first-child {
			    border-top-left-radius: 5px;
			    border-bottom-left-radius: 5px; }
			  .tab-col-3 span:nth-child(2) {
			    width: 34%;
			    border-left: 0; }
			  .tab-col-3 span:last-child {
			    border-top-right-radius: 5px;
			    border-bottom-right-radius: 5px;
			    border-left: 0; }
			
			.module-tab-wapper {
			  width: 100%;
			  padding: 0 8px 8px 8px; }
			  .module-tab-wapper ul {
			    margin-top: 8px;
			    padding: 8px;
			    background: #fff; }
			    .module-tab-wapper ul li:nth-child(1) {
			      height: 20px;
			      line-height: 20px;
			      color: #999; }
			      .module-tab-wapper ul li:nth-child(1) label {
			        font-size: 12px; }
			      .module-tab-wapper ul li:nth-child(1) span {
			        font-size: 14px;
			        float: right;
			        color: #d94c46; }
			    .module-tab-wapper ul li:nth-child(2) {
			      margin-top: 4px;
			      font-size: 14px;
			      line-height: 20px;
			      color: rgba(0, 0, 0, 0.87); }
			      .module-tab-wapper ul li:nth-child(2) label {
			        margin: 0 3px; }
			    .module-tab-wapper ul li:nth-child(3) {
			      margin-top: 4px;
			      color: #999;
			      font-size: 14px;
			      line-height: 20px; }
			
			.swiper-wrapper img{
    display: block;
    width:100%;
}
.pagination {
	position: absolute;
	left: 0;
	text-align: center;
	bottom: 5px;
	width: 100%;
	z-index: 100;
}
.swiper-pagination-switch {
	display: inline-block;
	width: 8px;
	height: 8px;
	border-radius: 8px;
	background: rgba(255, 255, 255, 0.48);
	margin: 0 3px;
	cursor: pointer;
}
.swiper-active-switch {
	background: rgba(255, 255, 255, 1);
}
			        	
        </style>
	</head>
	<body class="body-gray-color">
        <section class="block-banner">
            <video id='video' controls width= '100%' poster="${basepath}/static/m_h5/img/poster.png">
                <source id='mp4' src="http://video.aijiayou.com/2dbe/4d7e/2e93/2dbe4d7e2e93c890732c80c0bea9eae0_x264_600_mp4.mp4" type='video/mp4; codecs="avc1, mp4a"'>
                <p>您的浏览器不支持html5视频播放功能</p>
            </video>
        </section>
        <!-- 视频上线一段时间后替换为图片轮播 -->
       <%--  <section class="block-banner">
			<div  class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide"><a href="#"><img style="display: block;" src="${basepath}/static/m_h5/img/poster.png" /></a></div>
                    <div class="swiper-slide"><a href="#"><img style="display: none;" src="${basepath}/static/m_h5/img/poster.png" /></a></div>
                </div>
            </div>
            <div class="pagination"></div>
		</section> --%>
        <nav>
            <a href="http://www.aijiayou.com/student/m/h5/channelresource/index.xhtml?channelid=9071c79c03f440eea9af634f52224fbc&fdomain=chtwm" title="精品课程">
            	<div><span></span></div>
            </a>
            <a href="http://www.aijiayou.com/student/m/nmystudy/mycourse_page.xhtml?fdomain=chtwm&page=1&size=10&categoryid=3e20f458-72c3-4c9b-a1c6-204e0be1be2e" title="产品培训">
            	<div><span></span></div>
            </a>
            <a href="${basepath}/m/h5/study/courses.xhtml" title="全部课程">
            	<div><span></span></div>
            </a>
            <a href="${basepath}/m/h5/activity/page.xhtml" title="在线活动">
            	<div><span></span></div>
            </a>
            <a href="${basepath}/m/h5/exam/index.xhtml" title="在线考试">
            	<div><span></span></div>
            </a>
            <a href="${basepath}/m/ixin/ntopic/index.xhtml?fdomain=chtwm#topic_list_section" title="我要吐槽">
            	<div><span></span></div>
            </a>
            <a href="http://www.aijiayou.com/student/m/site/index/ff8080814fcea83c014fd54a0d8c4c41.xhtml?fdomain=chtwm"  title="我型我秀">
            	<div><span></span></div>
            </a>
            <a href="http://www.aijiayou.com/student/m/h5/channelresource/index.xhtml?channelid=799ad67e82494b0c9abc6f005c42b9e6&fdomain=chtwm" title="资产配置季">
            	<div><span></span></div>
            </a>
                        <a href="${basepath}/m/h5/usercenter/index.xhtml"  title="个人中心">
            	<div><span></span></div>
            </a>
            <a href="${basepath}/m/h5/nask/index.xhtml?fdomain=chtwm" title="恒天知道">
            	<div><span></span></div>
            </a>
            <!-- <a href="http://www.aijiayou.com/student/m/h5/channelresource/index.xhtml?channelid=24891daede654641bdfbea973932561e&fdomain=chtwm" title="优秀讲师">
            	<div><span></span></div>
            </a> -->
        </nav>
       <!-- 图片轮播功能 -->
       <%--  <script type="text/javascript" src="${basepath }/static/m_h5/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="${basepath }/static/m_h5/fosun/js/swiper.min.js"></script>
		<script type="text/javascript">
            var banner;
			$(function () {
                banner = new Swiper('.swiper-container',{
                	pagination: '.pagination',
                    loop: true,
                    autoplay: 3000,
                    autoplayDisableOnInteraction: false,
                    autoResize: true,
                    calculateHeight: true,
                    paginationClickable: true
                });
                setTimeout(function () {
                	$(".swiper-slide img").css({"display": "block"});
                }, 300);
	   			window.addEventListener("orientationchange", function() {
					$(".swiper-wrapper,.swiper-slide").css({"height": "auto"});
				}, false);                  
			});
		</script> --%>
	</body>
</html>
