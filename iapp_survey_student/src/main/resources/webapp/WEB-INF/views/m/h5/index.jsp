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
    <link rel="stylesheet" href="${basepath}/static/m_h5/css/common.css" >
    <link rel="stylesheet" href="${basepath}/static/m_h5/css/color.css" >
<title><%=title%></title>
</head>

<body>
	

    
    <article class="index">
		<ul>
			 <%
        if("luye".equals(domain)){
        %>
        <li><a href="${basepath}/m/h5/channelresource/channel?channelid=c34d700b99a14b3bb275e8ee40cfdee7"><img src="${basepath}/static/m_h5/img/i1.png" /> <span>新闻中心</span> </a></li>
        <%	
        }else if("syngenta".equals(domain)){
        %>
        <li><a href="${basepath}/m/h5/channelresource/channel?channelid=0580e395abff4b688dc30cc8e79299b9"><img src="${basepath}/static/m_h5/img/i1.png" /> <span>新闻中心</span> </a></li>
   	    <%
   	    }else if("ajy".equals(domain)){
   	        %>
   	        <li><a href="${basepath}/m/h5/channelresource/channel?channelid=f6e67c4f9efc45908dc6858f66e15463"><img src="${basepath}/static/m_h5/img/i1.png" /> <span>新闻中心</span> </a></li>
   	   	    <%
   	   	}else{
   	    %>
   	    
        	<li><a href="${basepath}/m/h5/notice/index.xhtml"><img src="${basepath}/static/m_h5/img/i1.png" /> <span>通知公告</span> </a></li>
        <%
        } 
        %> 
            <li><a href="${basepath}/m/h5/study/courses.xhtml"><img src="${basepath}/static/m_h5/img/i2.png" /> <span>在线课程</span> </a></li>
            <li><a href="${basepath}/m/h5/exam/index.xhtml"><img src="${basepath}/static/m_h5/img/i3.png" /> <span>在线测试</span> </a></li>
            <li><a href="${basepath}/m/h5/usercenter/index.xhtml"><img src="${basepath}/static/m_h5/img/i4.png" /> <span>个人账号</span> </a></li>
            <li><a href="${basepath}/m/h5/activity/page.xhtml"><img src="${basepath}/static/m_h5/img/i5.png" /> <span>活动</span> </a></li>
            <li><a href="${basepath}/m/h5/feed/tofeedback.xhtml?model=1"><img src="${basepath}/static/m_h5/img/i6.png" /> <span>联系我们</span> </a></li>
        
        </ul>
        
        <span class="logo">
        <%
        if("luye".equals(domain)){
        %>
        <img src="${basepath}/static/m_h5/img/logo_luye.png" />
        <%	
        }else if("syngenta".equals(domain)){
        %>
        <img src="${basepath}/static/m_h5/img/logo_syngenta.png" />
   	    <%
   	    }
   	    %>
   	    </span>
    
    
    </article>
    
	


 	<script type="text/javascript" src="${basepath}/static/m_h5/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="${basepath}/static/m_h5/js/common.js"></script>
	<script type="text/javascript">
    		$(function(){
				var w=$(window).width();
				var h=$(window).height();
				var lin;
				var orientationEvent;
				var supportsOrientationChange = "onorientationchange" in window;				
				$("body").css("min-height",h);
				$("article.index").width(w);
				$("article.index").height(h);
				if(w<=700){
					lin=$('<link rel="stylesheet" href="${basepath}/static/m_h5/css/default_1.css" />');					
					
					if(h<400){
						lin=$('<link rel="stylesheet" href="${basepath}/static/m_h5/css/default_3.css" />');			
						}
						
						
					}else{
						lin=$('<link rel="stylesheet" href="${basepath}/static/m_h5/css/default_2.css" />');					
						

					} 
				$("head").append(lin);
				
				orientationEvent = supportsOrientationChange ? "orientationchange" : "resize";   
				window.addEventListener(orientationEvent, function() {
					var h=$(window).height();
				    var w=$(window).width();
				    $("body").css("min-height",h);
					$("article.index").height(h);
					$("article.index").width(w); 
					if(w<=700){
					lin=$('<link rel="stylesheet" href="${basepath}/static/m_h5/css/default_1.css" />');
					if(h<400){
						lin=$('<link rel="stylesheet" href="${basepath}/static/m_h5/css/default_3.css" />');	
						}
		
					}else{
						lin=$('<link rel="stylesheet" href="${basepath}/static/m_h5/css/default_2.css" />');					
						
					} 
					$("head").append(lin);
				}, false); 
			
				});
  
    </script>
    
</body>
</html>