<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="format-detection" content="telephone=no" /> 
        <link type="text/css" rel="stylesheet" href="${basepath }/static/css/easydialog.css">
    <script type="text/javascript" src="${basepath }/static/js/easydialog.min.js"></script>
<title>在线测试</title>
<style type="text/css">
	.new-exam-item{
		width:100%;
		position:relative;
	}
	.new-exam-item ul {
		-webkit-box-sizing:border-box;
		-moz-box-sizing:border-box;
		box-sizing:border-box;
		padding-right:70px;
		
	}
	.new-exam-item div{
		-webkit-box-sizing:border-box;
		-moz-box-sizing:border-box;
		box-sizing:border-box;
		width:70px;
		height:58px;
		position:absolute;
		right:0;
		top:0;
		line-height:58px;
		text-align:center;
		border-left:1px dotted #ccc;
		font-size:14px;
		color:#999;
	}
	.new-exam-item div.blue{
		color:#529bea;
		
	}
	.new-exam-item div.red{
		color:rgb(217,76,70);
	}
	
	

</style>
</head>
<body>
	<header class="ctl_header">
     <div class="back"><a href="${basepath}/m/h5/index.xhtml"><i class="fa fa-home"></i></a></div>
       在线测试
    </header>
    <article class="scroll ctl_cont" id="examlist">  
   	 	<section class="onlineTest" id="contents"></section> 
   	   <div id="Interchange" style="display: none"></div>
    </article>
    <input type="hidden" id="page" value="1">
    <div class="placeHolder"></div>
<section class="more" id="toload" style="display: none;" onclick="next();">
	<a href="javascript:void(0);">点击加载更多</a>
</section>

<section class="loading" id="loading" >
	<i class="fa fa-spinner fa-spin"></i>
</section>

<section id="placeholder" class="more" style="display: none;"></section>

		
<script type="text/javascript" src="${basepath}/static/m_h5/js/jquery-2.1.1.min.js"></script>
 
<script type="text/javascript">
    
$(function(){   
	loadList(); 
	$("#page").val(1);
}) 

function next(){
	var pagenum = $("#page").val()
	pagenum = parseInt(pagenum)+1;
	$("#page").val(pagenum);
	 loadList();
}
var examTotal = 0;
var currentSize = 0;
var size = 10;

function loadList(){
	$("#loading").show();  //正在加载
	$("#toload").hide();  //加载更多
 	var params="";
 	params += "size="+size;
 	
	var pagenum = $("#page").val();
 	params +="&page="+pagenum;
 	
 	$("#Interchange").load("${basepath}/m/h5/exam/list.list?"+params,function(){	 
 		var add_html = $("#Interchange").html();
 			examTotal = $("#total").val();
 			$("#Interchang").html("");
	 		$("#contents").append(add_html);
 			currentSize = $('#contents').children('a').length;
 		if(examTotal == currentSize){ 
 			$("#toload").hide();
 			$("#placeholder").show(); 
	 	 }else{
		 	$("#toload").show(); 
		} 
 		$("#loading").hide();
 	});
}

function showMsgDialog(content){
 	easyDialog.open({
         container : {
             content : '<div style="background-color: #ffffff;width:260px;height:20px;text-align:center;">'+content+'</div>'
         },
         autoClose:900
     });
 }
 
function toTest(eid){
	//toViewShell("${basepath}/m/exam/detail.xhtml?tid="+eid);
	window.location.href=basepath+"/m/h5/exam/detail.xhtml?tid="+eid;
} 
    </script>
</body>
</html>
