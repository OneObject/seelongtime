<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%String uid = MwebHelper.getCurrentUid(); %>
<!DOCTYPE html>
<html>
<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="format-detection" content="telephone=no" />
<title>通知公告</title>
</head>

<body>
	<header class="ctl_header">
      <div class="back"><a href="${basepath }/m/h5/index.xhtml"><i class="fa fa-home"></i></a></div>
    <span class="wrap" style="width:70%;">通知公告</span>
       
    </header>
    <input type="hidden" id="page" value="1">
    <article class="scroll ctl_cont">
    <section class="learnOnline" id="contents">
    
    </section>
    <div id="data" style="display: none"></div>

   <div class="placeHolder">
   <section class="more" id="load" onclick="page(false);">
    	<a >点击加载更多</a>
    </section>
    </div>
 	<section class="loading" id="loading"><i class="fa fa-spinner fa-spin"></i></section>   
 
    </article>
    
    
    <footer class="footer">
    
    </footer>
    <input type="hidden" id="hid_adminroot" name="hid_adminroot" value="<%=Constant.ADMIN_ROOT%>">
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
	 	if(init){
	 		var pagenum = 1;
		}else{

	 		var pagenum = $("#page").val();
		}
	 	params +="&page="+pagenum;
	 	$("#data").load("${basepath}/m/h5/notice/list.list?"+params,function(){
	 		var add_html = $("#data").html();
	 		$("#data").html("");
	 		$("#contents").append(add_html);
	 		if(pagenum == $("#pagenum1").val()|| $("#pagenum1").val()==0){
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
	
	

	 
	function linkdetail(resourceid){
	var admin_root = $("#hid_adminroot").val();
	var url="";
    
      url="${basepath}/m/ixin/fodder/detail.xhtml?id="+resourceid;
    
    toViewShell(url);

}
	
</script>
	
</html>
