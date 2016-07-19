<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>练习界面</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width,minimum-scale=1,user-scalable=no,maximum-scale=1,initial-scale=1">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <link href="http://cdn.bootcss.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <style type="text/css">
        html,body{
            margin: 0px;padding: 0px;
        }
        *{
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
        }
        .container{
            width: 100%;
            padding: 8px;
       /**  max-width: 760px;*/
            padding-top: 50px;
            padding-bottom: 50px;
            margin-left: 0px;
        }
        header{
            position: fixed;
            z-index: 9999;
            background-color: #555555;
            color: #FFFFFF;
            height: 50px;
            line-height: 50px;
            width: 100%;
          /**  max-width: 760px;*/
            font-size: 18px;
            top: 0px;
            left: 0px;
        }
        header>a{
            display: block;
            width: 60px;
            text-align: center;
            color: #FFFFFF;
            text-decoration: none;
            float: left;
            background-color: #666666;
        }
        footer{
            position: fixed;
            z-index: 9999;
            background-color: #555555;
            color: #FFFFFF;
            height: 50px;
            line-height: 50px;
            width: 100%;
       /**  max-width: 760px;*/
            font-size: 18px;
            bottom: 0px;
            left: 0px;;
        }
        footer>a{
            display: block;
            float: left;
            height: 50px;
            width: 100%;
            text-align: center;
            color: #FFFFFF;
            text-decoration: none;
        }
        .pagetitle{
            height: 60px;
            line-height: 60px;
            border-bottom: 1px solid #529bea;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
        }
        .face{
            height: 100px;
            line-height: 100px;
            text-align: center;
            font-size: 70px;
            margin-top: 50px;
        }
        .face .fa-smile-o{
            color: #009C0C;
        }
        .face .fa-meh-o{
            color: #dd5555;
        }
        .result{
            font-size: 20px;
            text-align: center;
            line-height: 40px;;
        }
        .rightresult{
            display: block;
            color: #009C0C;
        }
        .errorresult{
            color: #dd5555;
            display: block;
        }
    </style>
</head>
<body>
<header>
<c:if test="${not empty courseid }">
			<a href="javascript:void(0)" onclick="returnCourse('${courseid}')"><i
				class="fa fa-angle-left"></i>&nbsp;返回</a>
	</c:if> ${practice.name }
		</header>
<div class="container">
    <div class="pagetitle">本次练习结果</div>
    <div class="face">
    <c:choose>
    	<c:when test="${rwong gt right}" >
    		<i class="fa fa-meh-o"></i>
    	</c:when>
    	<c:otherwise>
    		<i class="fa fa-smile-o"></i>
    	</c:otherwise>
    </c:choose>  
        <!---->
        
    </div>

    <div class="result">
        <span class="rightresult">答对题目数：${right }</span>
        <span class="errorresult">答错题目数：${rwong }</span>
    </div>
</div>
<footer>
    <a href="javascript:void(0);" onclick="repractice('${practice.id}');"><i class="fa fa-retweet"></i>&nbsp;重新开始练习</a>
</footer>
<script type="text/javascript">
function repractice(id){
	window.location.href="${basepath}/m/practice/detail.xhtml?courseid=${courseid}&id=" + id;
}

//返回课程页面
function returnCourse(courseid){
	window.location.href="${basepath}/m/study/detail/"+courseid+".xhtml";
}
</script>
</body>
</html>