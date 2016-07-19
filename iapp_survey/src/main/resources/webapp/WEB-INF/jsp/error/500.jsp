<%@page import="org.apache.commons.lang3.exception.ExceptionUtils"%>
<%@page import="java.util.Arrays"%>
<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<%response.setStatus(200);%>

<!DOCTYPE html>
<html>
<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="format-detection" content="telephone=no" />
    <script type="text/javascript" src="${basepath}/static/js/jquery-1.10.2.min.js"></script>
    
    <style type="text/css">
		section.busy{padding:55px 0px 0px 0px;width:100%;text-align:center;overflow:hidden;}
		section.busy img{width:135px;}
		section.busy span{margin-top:27px;font-size:16px;display:block;color:#999;}
		section.b_back{padding:60px 0px 30px 0px;overflow:hidden;text-align:center;}
		section.b_back span{display:inline-block;height:36px;line-height:36px;border-radius:5px;text-align:center;width:88px;text-align:center;font-size:14px;border:1px solid #c4c4c4;color:#999;}  
		
    </style>
	<title>系统繁忙</title>
	<script type="text/javascript">
		if(window.top.location != window.location){
			window.top.location.href = window.location.href;
		}
		function showDetail(){
		    $("#errorDetail").slideToggle("slow");
		}
	</script>
</head>

<body>
	
    <article class="scroll">
        <section class="busy">
        	<div>
                <img src="${basepath}/static/img/busy.png" onclick="javascript:showDetail();"/>
                <span>系统繁忙...</span>
            </div>  
        </section>    
        <section class="b_back">    
            <span class="c" onclick="javascript:history.go(-1);">返回</span>  
        </section>
        <section style="padding:0px 20px;">
        	<div id="errorDetail" style="display: none;width:100%; word-wrap:break-word;">
        		<%=Arrays.toString(ExceptionUtils.getRootCauseStackTrace(exception))%> 
            	<br>   
        	</div>
        </section>
    </article>
    
    
    <footer class="footer">
    
    
    </footer>
</body>
</html>
