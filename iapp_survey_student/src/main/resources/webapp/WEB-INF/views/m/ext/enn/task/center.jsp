<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>

<%

response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","No-cache"); 
response.setDateHeader("Expires", -1); 
response.setHeader("Cache-Control", "No-store");

%>

<!DOCTYPE html>
<html>
	<head>
		<title>任务中心</title>
		<link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/css/module.css?v=0.1" />
		
		 <style type="text/css">
            body{
                background: #eee;
            }
        </style>
	</head>
	<body class="bg-color-gray">
        <header>
            <span class="btn btn-left" id="btn-back">
                <i class="fa fa-angle-left"></i>
            </span>
            <div class="title title-2">
                任务中心
            </div>
        </header>
        <div class="holder-loading" id="holder-loading-1" style="margin-top:100px;">
                <i class="fa fa-spinner fa-pulse"></i>正在加载...
            </div>
        

        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.2.0.js"></script>
        <script type="text/javascript">
        
        
        $(function () {
        	getContent();
        });
        
        function getContent(){

        	var  $load = $('#holder-loading-1');
        	
        	$.ajax({
				type:"POST",
				cache: false,
				url:"${basepath}/m/ext/enn/task/centerContent.list",
				success:function(html){
					$load.replaceWith(html);

	               
				}
			});
        }
        
        
    		function showMessage(credit,experience){
    			var html =
    						'<div class="signed-box" id="signed-box">'
    						+ '<ul>'
    						+ '<li></li>'
    						+ '<li>领取成功</li>'
    						+ '<li>经验+<label>'+ experience + '</label> 财富+'+credit+'</li>'
    						+ '</ul>'
    						+ '</div>';
    			$('body').append(html);
    			setTimeout(function () {
    							$('#signed-box').animate({'opacity': 0}, 600, function () {
    								$(this).remove();
    							});
    			}, 1000);
    		}
    		
    		function showMessage1(credit){
    			var html =
    						'<div class="signed-box" id="signed-box">'
    						+ '<ul>'
    						+ '<li></li>'
    						+ '<li>领取成功</li>'
    						+ '<li>财富+'+credit+'</li>'
    						+ '</ul>'
    						+ '</div>';
    			$('body').append(html);
    			setTimeout(function () {
    							$('#signed-box').animate({'opacity': 0}, 600, function () {
    								$(this).remove();
    							});
    			}, 1000);
    		}

 
    		function gotoUrl(url){
    			window.location.href="${basepath}"+url;
    			//window.open("${basepath}"+url);
    		}
    		
        </script>
	</body>
</html>
