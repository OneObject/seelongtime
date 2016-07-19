<%@page import="java.util.Arrays"%>
<%@page import="org.apache.commons.lang3.exception.ExceptionUtils"%>
<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>500页面</title>
    <script type="text/javascript" src="${basepath}/static/js/jquery-1.10.2.min.js"></script>
    <style type="text/css">
        .error-container{
            width: 100%;
            margin: 0px auto;
            height: 600px;
            text-align: center;
        }
        .error-msg{
            display: block;
            overflow: hidden;
            font-size: 24px;
            width: auto;
            color: #999999;
        }
    </style>

</head>
<body>
<body>
<div class="error-container">
    <!--主要内容-->
    <img src="${basepath }/static/img/error.png" style="width: 400px;" id = "cuowu">
    <span class="error-msg">很抱歉，本系统暂时无法为您服务。 <a href="javascript:openiframe()" id="openbtn" style="color:#999;text-decoration: none;font-size: 12px;">查看罪证</a></span>
	<a href="javascript:window.history.go(-1);" style="display: none;" id="goback" style="font-size:28px;text-decoration: none;">点击返回上一页</a>
    <div class="other-do" id = "otherdo">
        <div  id="erroriframe" style="width: 80%;border: none;display: block;margin: 0px auto;height: 300px;display: none;">
            <div screen_capture_injected="true" style="text-align:left;" >
            	<%=Arrays.toString(ExceptionUtils.getRootCauseStackTrace(exception))%> 
            	<br>   
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
$(function(){
	var w = window.screen.availWidth ;
	if(w < 700){
		$("#cuowu").attr("style","width:80%;")
		$("#goback").show();
		$("#goback").css({
			"font-size":"28px",
			"text-decoration": "none",
			"color":"#529bea"
			});
		$("#otherdo,#openbtn").hide();
		$(".error-container").height("100%");
	}
})
    function openiframe(){
        $("#erroriframe").slideToggle("slow");
    }
</script>
</body>
</html>