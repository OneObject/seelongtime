<%@page import="com.longtime.common.spring.SpringContextUtil"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true" %>
<%@include file="/WEB-INF/include/taglibs.jsp"%><%--需重再一次导入 --%>
<%
String key = exception.getMessage();
String msg = key!=null? SpringContextUtil.getMessage(key):"";
pageContext.setAttribute("msg", msg);
%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="format-detection" content="telephone=no" />
    <title>提示信息</title>
    <style>
        html,body,div,span,a,p,section,article,dl,ul,dd,dt,li,img{
            margin:0;padding:0;border:0;
        }
        dl,ul{
            list-style: none;
        }
        a,button,input,textarea,span,img,li,div{
            -webkit-tap-highlight-color:rgba(255,0,0,0);
        }
        section,div,a,ul,dl,span,p,dd,dt,li{
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }
        body{
            min-width: 320px;
            color:rgba(0,0,0,0.87);
            -ms-touch-action:none;
            background: #fff;
        }
        input,textarea,div{
            outline:medium;
        }
        input[type="search"] {
            -webkit-appearance: none;
        }
        a{
            color:rgba(0,0,0,0.87);
            text-decoration: none;
        }
        .error-info{
            width: 100%;
            overflow: hidden;
            position: absolute;
            left:0;
            top:40%;
            -webkit-transform: translate(0,-50%);
            transform: translate(0,-50%);
        }
        .error-info li{
            width: 100%;
            text-align: center;
            font-size:18px;
            height:24px;
            line-height: 24px;
            color:rgba(0,0,0,0.48);
        }
        .error-info li:nth-child(1){
            height:70px;
            line-height: 70px;
            background: url(${ basepath}/static/img/face.png) center center no-repeat;
            background-size: auto 70px;
        }
        .error-info li:nth-child(2){
            margin-top:48px;
        }
        .error-info li:nth-child(3){
            margin-top:12px;
        }
    </style>
</head>
<body>
        <ul class="error-info">
            <li></li>
            <li>${not empty msg ? msg:'操作错误' }</li>
            <li></li>
        </ul>
</body>
</html>