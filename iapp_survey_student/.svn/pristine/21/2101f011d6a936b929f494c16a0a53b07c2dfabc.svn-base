<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="format-detection" content="telephone=no" />
	<title>练习结果</title>
    <style type="text/css">
    	html,body{width:100%;height:100%;overflow:scroll;}
    </style>
</head>
<body>
	<header class="ctl_header">
    	<div class="back"><a href="javascript:history.go(-2);"><i class="fa fa-angle-left"></i></a></div>
     	<span class="addWrap" id="ptitle">${practice.name }</span>
	</header>
    <article class="kaoshi ctl_cont" style="overflow:hidden;">	
      <section class="questionBox" style="padding-bottom:40px;">
			<ul class="score score2">
            	<li>本次练习结果</li>
            	<li></li>
                <li class="a">回答正确：<label>${right }</label>题</li>
                <li class="b">回答错误：<label>${wrong }</label>题</li>
            </ul>
            <div class="retry" onclick="repractice('${practice.id}')">
            	重新开始练习
            </div>
      </section>
    </article>
    <footer class="ctl_footer"></footer>
    
    <script type="text/javascript">
    function repractice(id){
    	window.location.href=basepath+"/m/h5/practice/detail.xhtml?courseid=${courseid}&id=" + id;
    }
   
    </script>
    <style type="text/css">
    	html,body{width:100%;height:auto;background:#f8f8f8;overflow:hidden;}
    </style>
</body>
</html>
