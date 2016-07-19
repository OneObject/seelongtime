<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%
long currentTime = System.currentTimeMillis();
pageContext.setAttribute("currentTime", currentTime);
%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
<meta name="format-detection" content="telephone=no" /> 
<title>调研列表</title>
<style type="text/css">
section.learnOnline ul li.ttl{height:18px;}
section.learnOnline ul li.date{line-height:22px;}
section.learnOnline div.prompt{width:auto;}
</style>
</head>
<body>
	<header>
      <div class="back ctl_rl">
      <a href="javascript:history.go(-1);"><i class="fa fa-angle-left"></i></a></div>
       调研列表
    </header> 
    <article class="scroll">
	    <section class="learnOnline" id="surveys">
	    
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
	
<script type="text/javascript">
var pagenumber = 1;//当前页
var pagesize = 10;//总页数 
var surveyTotal = 0;//总数
var currentNum = 0;//已显示数 
var type = "${type}";
var activityId = "${activityId}"
var currentTime = "${currentTime}";
var imgBasePath = "<%=Constant.IMG_SERVER_DOWNLOAD%>";
$(function(){   
	loadList();  
}) 
//下一页
function next(){
	pagenumber ++;
	loadList();	
}	
//调研列表
function loadList(){
	$("#loading").show();  //正在加载
	$("#toload").hide();  //加载更多

	$.ajax({
		type : "GET",
		url : "${basepath}/m/h5/vote/list.json",
		cache:false,
		data : { 
			activityid : activityId,
			type : type,
			page : pagenumber,
			size : pagesize
		},
		success : function(data) { 
			surveyTotal = data.pageable.total;   
			if(surveyTotal > 0 ){
				var surveys = data.data;
				currentNum += surveys.length;
				var html = [];
				for ( var i = 0; i < surveys.length; i++) {
					var survey = surveys[i];
					html.push('<a href="javascript:void(0);" onclick="indetail(\'' + survey.id +'\',\'' + survey.startTime +'\',\'' + survey.endTime +'\' );" >');
					html.push('<div>');
					html.push('<img src="' + imgBasePath + survey.coverPath + '-80x80" onerror="javascript:this.src=\'${basepath}/static/m/img/poll_80x80.png\'">');
					html.push('</div>'); 
					html.push('<ul class="changeW">');
					html.push('<li class="ttl">'); 
					var surveyinfo = "";
					if(survey.startTime > currentTime){
						surveyinfo = "[未开始]"
					}else if(survey.endTime < currentTime){
						surveyinfo = "[已结束]"
					}
					else{
						surveyinfo = "[进行中]"
					}
					html.push(surveyinfo + survey.title + '</li>');
					html.push('<li class="date">' +  new Date(survey.startTime).Format("MM-dd hh:mm") + ' ~ ' + new Date(survey.endTime).Format("MM-dd hh:mm") + '</li>');
					html.push('</ul>');
					html.push('<div class="prompt">'); 
					html.push('<span class="GM-item-time-state">' + survey.voteNum + '人投票</span>');
					html.push('</div>');
					html.push('</a>');
				}
				$("#surveys").html($("#surveys").html() + html.join(""))//加载
				if (surveyTotal == currentNum) {
					$("#toload").hide();
					$("#placeholder").show();
				} else {
					$("#toload").show();
				}

				var w1=$("div.prompt").width();
				var w=$(window).width()-104-parseInt(w1);
				$("ul.changeW").width(w);
				
				var orientationEvent;				
				var supportsOrientationChange = "onorientationchange" in window;				  
				orientationEvent = supportsOrientationChange ? "orientationchange" : "resize";   
				window.addEventListener(orientationEvent, function() {
					var w1=$("div.prompt").width();
					var w=$(window).width()-104-parseInt(w1);
					$("ul.changeW").width(w);		 
				}, false); 
				
			}else{				
				var html = [];
					html.push('<article class="scroll">');
					html.push('<section class="noData">');
					html.push('<img src="${basepath }/static/img/noData.png" />');
					html.push('</section>');
					html.push(' </article>');
				$("#surveys").html( html.join(""))//加载
				$("#toload").hide();
			}
			$("#loading").hide();
		},
		error : function() {
		}
	});
}		

//调研详情页面
function indetail(activityId, starttime, endtime){
	if (starttime == 0 && endtime == 0){
		window.top.location.href = "${basepath}/m/ixin/nsurvey/index.xhtml?voteId=" + activityId;
	}else{
		if (currentTime < starttime && starttime != 0){
			showTishi("调研未开始");
			return;
		}
		if (currentTime > endtime && endtime!= 0){
			showTishi("调研已结束");
			return;
		}
		window.top.location.href = "${basepath}/m/ixin/nsurvey/index.xhtml?voteId=" + activityId;
	}
}	
</script>
</html>