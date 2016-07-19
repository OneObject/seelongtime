<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="com.longtime.ajy.mweb.MwebHelper" %>

<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","No-cache"); 
response.setDateHeader("Expires", -1); 
response.setHeader("Cache-Control", "No-store");

String domain = MwebHelper.getCurrentDomain();
String uid = MwebHelper.getCurrentUid();
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
    <link rel="stylesheet" href="${basepath}/static/m_h5/css/common.css" >
    <link rel="stylesheet" href="${basepath}/static/m_h5/css/color.css" >
<title><%=title%></title>
<%--
<script type="text/javascript" name="baidu-tc-cerfication" src="http://apps.bdimg.com/cloudaapi/lightapp.js#6d03cfc607de2c5b1f58ab52c51d02de"></script>
<script type="text/javascript">window.bd && bd._qdc && bd._qdc.init({app_id: 'bdb1ea9f69dfca3b79ab3c26'});</script>
 --%>
</head>
<body>
	<article class="default">
        <section class="banner">
            <img src="${basepath}/static/m_h5/img/banner.png" alt="banner" />
        </section>
        <nav>
            <div> 
            	 <a href="${basepath}/m/h5/notice/index.xhtml">
                    <ul>
                        <li><span class="img"><img src="${basepath}/static/m_h5/img/d1.png" alt="新闻中心" /></span><span>通知公告</span></li>
                        
                    </ul>    
                </a>
                <a href="${basepath}/m/h5/study/courses.xhtml">
                    <ul>
                        <li><span class="img"><img src="${basepath}/static/m_h5/img/d2.png" alt="在线课程" /></span><span>在线课程</span></li>
                    </ul>                
                </a>
                <a href="${basepath}/m/h5/exam/index.xhtml">
                    <ul>
                        <li><span class="img"><img src="${basepath}/static/m_h5/img/d3.png" alt="在线测试" /></span><span>在线测试</span></li>
                    </ul>
                </a>               
            </div>
            <div>
                <a href="${basepath}/m/h5/activity/page.xhtml">
                    <ul>
                        <li><span class="img"><img src="${basepath}/static/m_h5/img/d5.png" alt="活动" /></span><span>活动</span></li>
                    </ul>                
                </a>
                <a href="${basepath}/m/ixin/ntopic/index.xhtml">
                    <ul>
                        <li><span class="img"><img src="${basepath}/static/m_h5/img/d4.png" alt="话题" /></span><span>话题</span></li>
                    </ul>    
                </a>
                <a href="${basepath}/m/h5/feed/tofeedback.xhtml?model=1">
                    <ul>
                        <li><span class="img"><img src="${basepath}/static/m_h5/img/d6.png" alt="联系我们" /></span><span>联系我们</span></li>
                    </ul>
                </a>               
            </div>
            <div>
            	<a href="${basepath}/m/h5/usercenter/index.xhtml">
                    <ul>
                        <li><span class="img"><img src="${basepath}/static/m_h5/img/d7.png" alt="个人中心" /></span><span>个人中心</span></li>
                    </ul>    
                </a>
			<a href="${basepath}/m/h5/message/index.xhtml">  
                	<ul>
                        <li><span class="img"><img src="${basepath}/static/m_h5/img/d8.png" alt="未读邮件" /><label id="msgNum" style="display: none;">0</label></span><span>未读邮件</span></li>
                    </ul>  
                </a>
                <a href="#" class="hold"></a>              
            </div>
        </nav>
    </article>
<script type="text/javascript" src="${basepath}/static/m_h5/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="${basepath}/static/m_h5/js/message.js"></script>
<script type="text/javascript" src="${basepath}/static/plugins/socket.io/socket.io.js"></script>
<script type="text/javascript">
var socketurl= '<%=Constant.WEBSOCKET_SERVER%>?type=msg&id=<%=uid%>&domain=<%=domain%>';

$(function(){

	var orientationEvent;
	var supportsOrientationChange = "onorientationchange" in window;			
	var or=window.orientation;
	var count=$("nav>div").length;
	if(count<=3){//当模块数小于9
		if(or==0 || or==180){//竖屏	
		var w=$(window).width();
		var h=$(window).height();	
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
	msgNumInit("<%=uid%>", "<%=domain%>");
	msgSocketioInit(socketurl);


});   

//初始化未读消息数量
function msgNumInit(uid,domain){
	if(uid == null){
		return;
	}
	
	$.ajax({
		type:"POST",
		url : "${basepath}/m/h5/message/unread.json",
		data:{"uid": uid, "domain": domain},
	    contentType:"application/json; charset=utf-8", 
		success:function(data){
			if(data > 0 ){
				$("#msgNum").show();
				$("#msgNum").html(data);
			}
			
		},
		error:function(date){
			
		}
	});
}

</script>
</body>
</html>
