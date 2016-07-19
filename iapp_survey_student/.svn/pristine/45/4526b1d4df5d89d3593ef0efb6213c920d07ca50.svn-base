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
 
<title>完成考试</title>
</head>

<body>
	

	<header class="ctl_header">
    	<div class="back"><a href="${basepath}/m/h5/usercenter/index.xhtml"><i class="fa fa-angle-left"></i></a></div>
        完成考试

    </header>
    
    <article class="scroll ctl_cont">
    <input type="hidden" id="page" value="1">
    <section class="test" id="contents">
       
            
        
        
       
        
    
    </section>
    <div id="data" style="display: none"></div>
    
 <div class="placeHolder">
   <section class="more" id="load"  style="display: none;" onclick="page();">
    	<a href="javascript:void(0);">点击加载更多</a>
    </section>
 </div>
 	<section class="loading" id="loading"><i class="fa fa-spinner fa-spin"></i></section>   
    

   
    </article>
    
    
    
    
    
	


<script type="text/javascript">	
 	$(document).ready(function(){
		page(true);
	});
	function page(init){
		$("#load").hide();
	 	$("#loading").show();
	 	var params="";
	 	var size = 10;
	 	params += "size="+size;
	 	var pagenum;
	 	if(init){
	 		pagenum = 1;
		}else{

	 		pagenum = $("#page").val();
		}
	 	params +="&page="+pagenum;
	 	$("#data").load("${basepath}/m/h5/exam/mytestlist.list?"+params,function(){
	 		var add_html = $("#data").html();
	 		$("#data").html("");
	 		$("#contents").append(add_html);
	 		var pagenum1 = $("#pagenum1").val();
	 		if(pagenum == pagenum1 || pagenum1 == 0 || pagenum1 == null){
	 			$("#load").hide();
	 		 	$("#loading").hide();
	 			return;
	 		}
	 		pagenum = parseInt(pagenum)+1;
	 		$("#page").val(pagenum);
	 		$("#load").show();
		 	$("#loading").hide();
	 	});
	}
	
	
	function toTest(eid){
		window.location.href=basepath+"/m/h5/exam/detail.xhtml?tid="+eid;
	} 

	
</script>
</body>
</html>
