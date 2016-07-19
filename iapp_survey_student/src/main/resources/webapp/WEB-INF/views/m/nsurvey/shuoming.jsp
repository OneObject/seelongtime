<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>${surveyEntity.title }</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no"/>
    <link rel="stylesheet" href="${basepath}/static/plugins/fonticon/css/font-awesome.min.css">
    <style type="text/css">
        html,body{margin: 0px;padding: 0px;background-color: #eeeeee}
        .container{
            max-width: 760px;
            padding: 8px;
        }
        .item{
            display: block;
            overflow: hidden;
            text-align: center;
            color: #53575e;
            margin-top: 30%;
        }
   
    header {width:100%;height:50px;line-height:50px;text-align:center;color:#fff;font-size:20px;position:relative;}
    header span.h_back{display:inline-block;height:50px;width:40px;line-height:50px;position:absolute;left:0px;top:0px;text-align:center;}
    header span.h_back i{font-size:22px;color:#fff;}

    </style>
</head>
<body>
    <div class="container">
      
        	<div class="item">
        		<img src="${basepath }/static/img/none.png">
   
            	<h2>${surveyEntity.surveyOrvote eq 0?"投票还未开始或已过期":"调研还未开始或已过期" }</h2>
         	</div>
        
</div>
</body>
</html>