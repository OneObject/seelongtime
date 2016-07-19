<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<% response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","No-cache"); 
response.setDateHeader("Expires", -1);
response.setHeader("Cache-Control", "No-store");
%><!DOCTYPE html>
<html>
<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="format-detection" content="telephone=no" />
	<title>消息列表</title>
</head>

<body>
	<header>
    	<div class="back"><a href="javascript:history.go(-1);"><i class="fa fa-angle-left"></i></a></div>
  			消息列表
	</header>
    
    <article class="msgList ctl_cont">
    	<nav>
        	<ul>
            	<li class="cur" name="list1" id="wd">未读</li>
            	<li name="list2" id="yd">已读</li>        
            </ul>
        </nav>
          <!--未读  -->
        <section class="msgBox list1" style="display:block;" id="weidu"> 
        </section>   
         <!-- 已读  -->     
        <section class="msgBox list2" style="display:none;" id="yidu">
        </section>
         <section class="more" style="padding-bottom:60px;" id="toload">
    		<a href="javascript:void(0);" onclick="next();">点击加载更多</a>
    	</section>
    
 		<section class="loading" id="loading" style="padding: 25px 55px 45px;">
			<i class="fa fa-spinner fa-spin"></i>
		</section>
		<section id="placeholder" class="more" style="display: none;"></section>
       	<div class="placeHolder" style="height:50px;width:100px;"></div>
    </article>
<script type="text/javascript" src="${basepath}/static/m_h5/js/common.js"></script>
<script type="text/javascript">
 var pagenumber = 1;//当前页
 var pagesize = 10;//总页数 
 var msgTotal = 0;//总数
 var currentNum = 0;//已显示数
 var type = "<%= session.getAttribute("type")%>";//默认值
 
$(function(){	
	if(type == null || type == "" || type == "null"){
		type = 0;
	}
	$("nav li").click(function(){
		var name=$(this).attr("name");				
		$(this).addClass("cur").siblings("li").removeClass("cur");
		$("article").find("."+name).show().siblings(".msgBox").hide();						
		if("list1" == name){//未读
			type = 0;
			$("#weidu").html("")//加载
		}			
		else if("list2" == name){//已读
			type = 1;
			$("#yidu").html("")//加载
		} 
		
		 pagenumber = 1;//当前页
	     msgTotal = 0;//总数
	     currentNum = 0;//已显示数
	     loadList(type);
	});
	 if(type == 0){
		  $("#wd").click();
	  }
	  else if(type == 1){
		  $("#yd").click();
	  }
});

//下一页
function next(){
	pagenumber ++;
	loadList(type);	
}


//问题列表
function loadList(type){
	$("#loading").show();  //正在加载
	$("#toload").hide();  //加载更多
	$.ajax({
		type : "GET",
		url : "${basepath}/m/h5/message/list.json",
		cache:false,
		data : { 
			page : pagenumber,
			size : pagesize,
			viewstatus : type
		},
		success : function(data) { 
			msgTotal = data.pageable.total;   
			if(msgTotal > 0 ){
				var msgs = data.data;
				currentNum += msgs.length;
				var html = []; 
				for ( var i = 0; i < msgs.length; i++) {
					var msg = msgs[i];
					html.push('<ul>');
					html.push('<li>' + msg.title + '</li>');
					html.push('<li class="txt">' + msg.content + '</li>');
					html.push('<li>' + new Date(msg.createtime).Format("yyyy-MM-dd hh:mm"));
					if(msg.url != ""){
						html.push('<a   target="_blank"  href="' + msg.url + '">访问：' + msg.url + ' </a>');
					}
					html.push('</li>'); 
					html.push('</ul>'); 
				}
				if(type == 0){//未读
					$("#weidu").html($("#weidu").html() + html.join(""))//加载
				}else{//已读
					$("#yidu").html($("#yidu").html() + html.join(""))//加载
				}
				if (msgTotal == currentNum) {
					$("#toload").hide();
					$("#placeholder").show();
				} else {
					$("#toload").show();
				}
			}else{				
				var html = [];
					html.push('<article class="scroll">');
					html.push('<section class="noData">');
					html.push('<img src="${basepath }/static/img/noData.png" />');
					html.push('</section>');
					html.push('</article>');
				if(type == 0){//未读
 					$("#weidu").html( html.join(""))//加载
				} 
				else{//已读
 					$("#yidu").html( html.join(""))//加载
 				}
				$("#toload").hide();
			}
			$("#loading").hide();
		},
		error : function() {
		}
	});
}

</script>  
<style type="text/css">
 	body{background:#f8f8f8;}
</style> 
</body>
</html>
