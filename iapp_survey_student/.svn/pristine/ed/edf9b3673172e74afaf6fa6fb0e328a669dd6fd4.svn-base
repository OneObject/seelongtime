<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="format-detection" content="telephone=no" />
    
<title>已学课程</title>
	<style type="text/css">
		.module-course-list {
	padding: 8px;
}
section,div,a,ul,dl,span,p,dd,dt,li {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}
.module-course-list a:first-child .block-course {
	margin-top: 0;
}

.module-course-list .block-course {
	margin-top: 8px;
	padding: 8px;
	background: #fff;
	position: relative;
	overflow: hidden;
}

.module-course-list .block-course .image {
	display: inline-block;
	width: 80px;
	height: 50px;
	position: absolute;
	left: 8px;
	top: 8px;
}

.module-course-list .block-course .image img {
	display: block;
	width: 80px;
	height: 50px;
}

.module-course-list .block-course ul {
	width: 100%;
	padding: 0 0 0 90px;
}
.module-course-list .block-course ul li{
	
	width:100%;
	float:left;
}
.module-course-list .block-course ul li:nth-child(1) {
	line-height: 22px;
	color: rgba(0, 0, 0, 0.87);
	font-size: 16px;
}

.module-course-list .block-course ul li:nth-child(2) {
	margin-top: 4px;
	color: #999;
	font-size: 14px;
	line-height: 20px;
}

.module-course-list .block-course ul li:nth-child(2) i {
	margin-right: 4px;
}
.module-course-list .block-course ul li:nth-child(2) span:first-child {
	float: left;
}
.module-course-list .block-course ul li:nth-child(2) span {
	float: right;
}

.module-course-list .block-course ul li:nth-child(3) {
	color: #999;
	font-size: 14px;
	line-height: 20px;
	margin-top: 4px;
}

.module-course-list .block-course ul li:nth-child(3) i {
	margin-right: 4px;
}

.module-course-list .block-course ul li:nth-child(3) span {
	float: right;
}	
	</style>
</head>

<body>
    

	<header class="ctl_header">
      <div class="back"><a href="${basepath}/m/h5/usercenter/index.xhtml"><i class="fa fa-angle-left"></i></a></div>
       已学课程
 

    </header>
	<input type="hidden" id="page" value="1">
    <article class="scroll ctl_cont">
    <section>
    	 <div class="module-course-list" id="contents">
    	 </div>
    </section>
	<div class="placeHolder">
   <section class="more" id="toload"  style="display: none;" onclick="page(false);">
    	<a href="javascript:void(0);">点击加载更多</a>
    </section>
 	</div>
 	<section class="loading" id="loading"><i class="fa fa-spinner fa-spin"></i></section> 
    
    </article>
    
    <footer class="footer">
    
    </footer>
<script type="text/javascript">	
 	$(document).ready(function(){
		page(true);
	});
	function page(init){
		$("#toload").hide();
	 	$("#loading").show();
	 	var params="";
	 	var size = 10;
	 	params += "size="+size;
	 	if(init){
	 		var pagenum = 1;
		}else{

	 		var pagenum = $("#page").val();
		}
	 	params +="&page="+pagenum;

	 	$.ajax({
			type : "GET",
			url : "${basepath}/m/h5/study/completelist.list?"+params,
			success : function(data) {
				$("#contents").append(data);
		 		if(pagenum == $("#pagenum1").val() || $("#pagenum1").val()==0){
		 			$("#toload").hide();
		 		 	$("#loading").hide();
		 			return;
		 		}
		 		pagenum = parseInt(pagenum)+1;
		 		$("#page").val(pagenum);
		 		$("#toload").show();
			 	$("#loading").hide();
			}

	 	});	 	
	 
	}

	function toDetail(id){
	 	window.open("${basepath}/m/study/detail/"+id+".xhtml");
	}
</script>
</body>
</html>
