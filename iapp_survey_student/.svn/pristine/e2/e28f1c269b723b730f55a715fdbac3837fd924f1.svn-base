<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<% response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","No-cache"); 
response.setDateHeader("Expires", -1);
response.setHeader("Cache-Control", "No-store");
%>
<!DOCTYPE html>
<html lang="zh-CN">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="format-detection" content="telephone=no" />
     
    <link rel="stylesheet"	href="${basepath}/static/plugins/font-awesome-4.1.0/css/font-awesome.min.css" />
	<link rel="stylesheet" href="${basepath}/static/m_h5/css/common.css?v=1">
	<link rel="stylesheet" href="${basepath}/static/m_h5/css/color.css">
	<title>作业情况</title>
</head>
<body>
<header class="ctl_header">
	<div class="back"><a href="#"><i class="fa fa-angle-left"></i></a></div>
       作业情况
	</header>
  <article class="zuoye ctl_cont">
    	<nav>
        	<ul>
            	<li class="cur" name="list1" id="wpg">未批改</li>
                <li name="list2" id="ypg">已批改</li>
                <%--<li name="list3" id="wtj">未提交</li> --%>            
            </ul>
        </nav>
        <!--未批改  -->
        <section class="zuoyeBox list1" id="waittask" style="display:block;">
       
        </section>     
        <!--已批改  -->   
        <section class="zuoyeBox list2" id="yipigai" style="display:none;">
         
        </section>
        <!--未提交 -->   
       <%--  <section class="zuoyeBox list3" id="informtask" style="display:none;">
         
        </section>
        --%>   
         
     		<section class="more" style="padding-bottom:60px;" id="toload">
    		<a href="javascript:void(0);" onclick="next();">点击加载更多</a>
    	</section>
    
 		<section class="loading" id="loading" style="padding: 25px 55px 45px;">
			<i class="fa fa-spinner fa-spin"></i>
		</section>
		<section id="placeholder" class="more" style="display: none;"></section>
       	<div class="placeHolder" style="height:50px;width:100px;"></div>
    </article>

<script type="text/javascript" src="${basepath}/static/m_h5/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="${basepath}/static/m_h5/js/common.js"></script>
<script type="text/javascript">
var pagenumber = 1;//当前页
var pagesize = 10;//总页数 
var taskTotal = 0;//总数
var currentNum = 0;//已显示数
var type = "<%= session.getAttribute("type")%>";//默认值
$(function(){
	if(type == null || type == "" || type == "null"){
		type = 1;
	}
	var orientationEvent;
	var supportsOrientationChange = "onorientationchange" in window;
	var w=$(".zuoyeBox a").width();
	$("a>ul").width(w-58);
	orientationEvent = supportsOrientationChange ? "orientationchange" : "resize";   
	window.addEventListener(orientationEvent, function() {
		var w=$(".zuoyeBox a").width();
		$("a>ul").width(w-58); 
	}, false);
	
	$("nav li").click(function(){
		var name=$(this).attr("name");				
		$(this).addClass("cur").siblings("li").removeClass("cur");
		$("article").find("."+name).show().siblings(".zuoyeBox").html("");
 
		if("list1" == name){//未批改1
			type = 1 ;
			$("#waittask").html("")//加载
		}			
		else if("list2" == name){//已经批改2,3
			type = 2;
			$("#yipigai").html("")//加载
		}
		//else if("list3" == name){// 0未提交
		//	type = 0;
		//}
		
		 pagenumber = 1;//当前页
	     taskTotal = 0;//总数
	     currentNum = 0;//已显示数
	     loadList(type);
	});
	//loadList(type);
	  if(type == 1){
		  $("#wpg").click();
	  }
	  else if(type == 2){
		  $("#ypg").click();
	  }
	//  else if(type == 0){
	//	  $("#wtj").click();
	//  }
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
	if(type == 1 || type == 2){//已批改或未批改用户作业列表
		$.ajax({
			type : "GET",
			url : "${basepath}/m/h5/task/list.json",
			cache:false,
			data : { 
				page : pagenumber,
				size : pagesize,
				type : type
			},
			success : function(data) { 
				taskTotal = data.pageable.total;   
				if(taskTotal > 0 ){
					var tasks = data.data;
					currentNum += tasks.length;
					var html = [];
					setDataHtml(html, type, tasks);
			
					if (taskTotal == currentNum) {
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
						html.push(' </article>');
					if(type == 1){//未批改
	 				$("#waittask").html( html.join(""))//加载
					}
					else if(type == 0){
	 				$("#informtask").html( html.join(""))//加载
	 			}
					else{
	 				$("#yipigai").html( html.join(""))//加载
	 			}
					$("#toload").hide();
				}
				$("#loading").hide();
			},
			error : function() {
			}
		});
	}
	/**else{//未提交用户列表
		$.ajax({
			type : "GET",
			url : "${basepath}/m/h5/task/user.json",
			cache:false,
			data : { 
				page : pagenumber,
				size : pagesize
			},
			success : function(data) { 
				taskTotal = data.pageable.total;   
				if(taskTotal > 0 ){
					var users = data.data;
					currentNum += users.length;
					var html = []; 
					for ( var i = 0; i < users.length; i++) {
						var user = users[i];
							html.push('<a href="javascript:void(0);" >');
							html.push('<div><img src="${basepath}/user/avatar/'+user.uid+'.xhtml?style=80x80&color=blue&r=" /></div>');
							html.push('<ul>');
							html.push('<li>'+ user.name+'</li>');
							html.push('</ul>'); 
							html.push('</a>');
					}
					$("#informtask").html($("#informtask").html() + html.join(""))//加载
					
					if (taskTotal == currentNum) {
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
						html.push(' </article>');
					if(type == 1){//未批改
	 				$("#waittask").html( html.join(""))//加载
					}
					else if(type == 0){
	 				$("#informtask").html( html.join(""))//加载
	 			}
					else{
	 				$("#yipigai").html( html.join(""))//加载
	 			}
					$("#toload").hide();
				}
				$("#loading").hide();
			},
			error : function() {
			}
		});
	}*/
}

	 //加载数据
function setDataHtml(html, type, tasks){
	if(type == 1){//未批改
		for ( var i = 0; i < tasks.length; i++) {
			var task = tasks[i];
				html.push('<a href="javascript:void(0);" onclick="indetail(\'' + task.id +'\');")>');
				html.push('<div><img src="${basepath}/user/avatar/'+task.uid+'.xhtml?style=80x80&color=blue&r=" /></div>');
				html.push('<ul>');
				html.push('<li>' + task.creator+ ' : ' + task.taskname + ' </li>');
				html.push('<li>提交时间：'+ new Date(task.createtime).Format("yyyy-MM-dd hh:mm") + '</li>');
				html.push('</ul>'); 
				html.push('</a>');
		}
		$("#waittask").html($("#waittask").html() + html.join(""))//加载
	} 
	else{//已批改
		for ( var i = 0; i < tasks.length; i++) {
			var task = tasks[i];
			html.push('<a href="javascript:void(0);" onclick="indetail(\'' + task.id +'\');")>');
			html.push('<div><img src="${basepath}/user/avatar/'+task.uid+'.xhtml?style=80x80&color=blue&r=" /></div>');
			html.push('<ul >');
			html.push('<li>' + task.creator + ' : ' + task.taskname + '</li>');
			html.push('<li>提交时间：'+ new Date(task.createtime).Format("yyyy-MM-dd hh:mm") + '<span>得分：'+task.score+'</span></li>');
			html.push('<li>批改时间：' +  new Date(task.updatetime).Format("yyyy-MM-dd hh:mm"));
			if(task.status == 3){//通过
				html.push('<span class="b">通过</span>');
			}
			else{//未通过
				html.push('<span class="a">未通过</span>');
			}
			html.push('</li>'); 
			html.push('</ul>'); 
			html.push('</a>');
		}
		$("#yipigai").html($("#yipigai").html() + html.join(""))//加载
	}

	var w=$(".zuoyeBox a").width();
	$("a>ul").width(w-58); 
}	

	 //用户作业的详情
function indetail(id){
	window.location.href="${basepath}/m/h5/task/detail.xhtml?id="+id;
}	

</script>
   
<style type="text/css">
 	body{background:#f8f8f8;}
</style> 
</body>
</html>
