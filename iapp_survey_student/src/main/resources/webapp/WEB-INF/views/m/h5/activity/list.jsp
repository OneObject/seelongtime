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
<title>活动</title>
</head>
<body>
	<header class="ctl_header">
     <%-- <div class="back"><a href="${basepath}/m/h5/index.xhtml"><i class="fa fa-home"></i></a></div> --%>
    	  <div class="back"><a href="javascript:history.go(-1);"><i class="fa fa-angle-left"></i></a></div>
    	活动     
    </header>
    
    <article class="scroll ctl_cont">    
	    <section class="activity" id="activity">  
	    </section>
    
		<div class="placeHolder"></div>
		<section class="more" id="toload">
    		<a href="javascript:void(0);" onclick="next();">点击加载更多</a>
    	</section>
    
 		<section class="loading" id="loading" style="padding: 25px 55px 45px;">
			<i class="fa fa-spinner fa-spin"></i>
		</section>
		<section id="placeholder" class="more" style="display: none;"></section>
		
    </article>
		
<script type="text/javascript" src="${basepath}/static/m_h5/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="${basepath}/static/m_h5/js/common.js"></script>

<script type="text/javascript">
var pagenumber = 1;//当前页
var pagesize = 10;//总页数 
var activityTotal = 0;//总评论数
var currentNum = 0;//已显示评论数
$(function(){   
	loadList(); 
}) 

//下一页
function next(){
	pagenumber ++;
	loadList();	
}

function loadList(){
	$("#loading").show();  //正在加载
	$("#toload").hide();  //加载更多

	$.ajax({
		type : "GET",
		url : "${basepath}/m/h5/activity/list.json",
		data : { 
			page : pagenumber,
			size : pagesize
		},
		success : function(data) {
			activityTotal = data.pageable.total;
			if(activityTotal > 0){
				var activitys = data.data;
				currentNum += activitys.length;
				var html = [];
				for ( var i = 0; i < activitys.length; i++) {
					var activity = activitys[i];
					html.push('<a href="javascript:void(0);" onclick="indetail(\'' + activity.id +'\');")>');
					html.push('<ul>');
					html.push('<li ><img src="<%=Constant.IMG_SERVER_DOWNLOAD%>' + activity.picUrl + '-320x180" onerror="javascript:this.src=\''+basepath+'/static/m_h5/img/activity_default.jpg\'"></li>');
					html.push('<li style="white-space:nowrap;text-overflow:ellipsis;overflow:hidden;">' +	activity.name  + '</li>');
					html.push('<li>' + formatDate(new Date(activity.startDate)) + '&nbsp;至&nbsp;' + formatDate(new Date(activity.endDate)) + '</li>');
					html.push('</ul>');
					html.push('</a>');
				}
				$("#activity").html($("#activity").html() + html.join(""))//加载评论
				if (activityTotal == currentNum) {
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
				$("#activity").html( html.join(""))//加载评论
				$("#toload").hide();
			}
			$("#loading").hide();
		},
		error : function() {
		}
	});
}

//活动详情
function indetail(id){
	// window.location.href="${basepath}/m/ixin/activity/detaildispatch.xhtml?id="+id;

	 toViewShell("${basepath}/m/ixin/activity/detaildispatch.xhtml?id="+id);
	 //toViewShell("http://192.168.0.55:8080/student/m/ixin/activity/detaildispatch.xhtml?id="+id);
}

function formatDate(now) {
	var year = now.getFullYear();
	var month = now.getMonth() + 1;
	var date = now.getDate();
	var hour = now.getHours();
	var minute = now.getMinutes();
	return year + "-" + formatNumber(month) + "-" + formatNumber(date) + " " + formatNumber(hour) + ":" + formatNumber(minute);
}

function formatNumber(value){
	if(value < 10){
		return  '0'+value;
	}
	return value;
}

 </script>
</body>
</html>
