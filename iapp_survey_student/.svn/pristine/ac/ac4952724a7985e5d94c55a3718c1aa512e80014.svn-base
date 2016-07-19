<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%@ page contentType="text/html;charset=UTF-8" buffer="none"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<% 
String domain=MwebHelper.getCurrentDomain();
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","No-cache"); 
response.setDateHeader("Expires", -1); 
response.setHeader("Cache-Control", "No-store");
String uid = MwebHelper.getCurrentUid();
%>
<!DOCTYPE html>
<html>
<head>
    <title>${activity.name}</title>
    <meta charset="utf-8">
    <meta http-equiv="pragma" content="no-cache"> 
	<meta http-equiv="cache-control" content="no-cache"> 
	<meta http-equiv="expires" content="0">   
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="${basepath}/static/css/320.css">
    <link rel="stylesheet" href="${basepath }/static/css/easydialog.css">
    <style type="text/css">
    .easyDialog_wrapper .easyDialog_title {
		height: 30px;
		line-height: 30px;
		overflow: hidden;
		color: #FCF7F7;
		padding: 0 10px;
		font-size: 14px;
		border-bottom: 1px solid #e5e5e5;
		background: #389CD5;
		border-radius: 4px 4px 0 0;
		}
		
		.info-detail{padding-left:55px;}
		.info-time{width:50px;}
		.info-time span:first-child {font-size: 100%;}
		.info-time span:last-child {font-size: 100%;}
		.info-detail-title{font-size:1.2em;}
		.info-detail-jieshao{font-size:100%;}
		.time-detail{10px 8px 0px}
		.time-detail-item .top-time{font-size:1.2em;}
    </style>
      <link rel="stylesheet" type="text/css" href="http://developer.amap.com/Public/css/demo.Default.css" />   
    <script type="text/javascript" src="http://webapi.amap.com/maps?v=1.2&key= 8ec74296b8f76afc3a2219284c9a9e34"></script>
    <script type="text/javascript" src="${basepath }/static/js/easydialog.js"></script>
     <script type="text/javascript" src="${basepath }/static/js/formattime.js"></script>
    <script type="text/javascript">
    	var admin_root ="<%=Constant.ADMIN_ROOT %>";
    	
    	function check(){
    		var signin = $("#signin").val();
    		var isSign = $("#isSign").val();
    		var afterSignIn = $("#afterSignIn").val();
    		if(signin == 1 && afterSignIn == 1){
    			if(isSign != 1){
    				showMsg("请签到后再来查看");
    				return false;
    			}
    		}
    		return true;
    	}
    	
		function toDetail(type,id){
			if(!check()){
				return;
			}
			
			var url = "";
			if(type == "1"){
				//url = "${basepath}/m/ixin/nsurvey/index.xhtml?voteId="+id;
				url = "${basepath}/m/ixin/nsurvey/index.xhtml?voteId="+id;
				window.top.location.href=url;
				return;
			}else if(type == "2"){
				//url = "${basepath}/m/ixin/nsurvey/index.xhtml?voteId="+id;
				url = "${basepath}/m/ixin/nsurvey/index.xhtml?voteId="
				+ id;
				window.top.location.href=url;
				return;
			}else if(type == "3"){
				//url = admin_root+"/protal/activity/cardreward.xhtml?rewardId="+id;
				url = "${basepath}/m/ixin/lottery/cardreward.xhtml?rewardId="+id;
			}else if(type == "4"){
				url = admin_root+"/protal/rank/"+id+".xhtml";
			} else if (type == "6") {
				url = "${basepath}/m/study/detail/" + id + ".xhtml?fdomain=${current_domain}";
				if (window.top.location!= window.location) {
			        window.top.location.href=url;
			        return;
			    }
					
			} else if (type == "7") {
					url = "${basepath}/m/h5/exam/detail.xhtml?tid=" + id;
					
				    window.top.location.href=url;
				   return;
				    
					
			} else if (type == "8") {
					url = "${basepath}/m/ixin/fodder/detail.xhtml?id=" + id;
			} else if(type=="9"){
				//url= "${basepath}/m/ixin/channelresource/list.xhtml?channelid="+id
				url = "${basepath}/m/h5/channelresource/index.xhtml?channelid=" + id;
				window.top.location.href=url;
				return;
		    }else if (type == "10") {
				//url = "${basepath}/m/ixin/activity/seriesdetail.xhtml?id=" + activityId;
				url = "${basepath}/m/h5/activity/seriesdetail.xhtml?id="+activityId;
				window.top.location.href=url;
				return;
			}else{
				alert("未知类型，请联系管理人员！");
				return;
			}
			openUrl(url);
		}    
		function toTopic(id){
			if(!check()){
				return;
			}
			var url = "";
			
				url = "${basepath }"+"/m/ixin/ntopic/index.xhtml?activityid="+id;
				window.top.location.href=url;
			//openUrl(url);
		}
		//跳转到问答
		function toQuestion(id){
			if(!check()){
				return;
			}
			window.location.href = "${basepath }"+"/m/h5/ask/page.xhtml?activityid="+id;
		}
		
		function showMsg(msg){
			easyDialog.open({
			      container : {
			        content : '<span style="text-algin: center;text-align: center;display: block;font-size: 16px;">'+msg+'</span>'
			      },
			      autoClose:1200
			});
		}
    </script>
    <script type="text/javascript">

	    $(function(){
	        var lasttime =getFormatDateByLong(${activity.lastApplyDate}, "yyyy/MM/dd hh:mm:ss") ;//传入倒计时最后的时间long型数据
	        countDown(lasttime,"#divdown1");
	    });
	    function countDown(time,id){
	        var day_elem = $(id).find('.day');
	        var hour_elem = $(id).find('.hour');
	        var minute_elem = $(id).find('.minute');
	        var second_elem = $(id).find('.second');
	        //if(typeof end_time == "string")
	        var end_time = new Date(time).getTime(),//月份是实际月份-1
	                sys_second = (end_time-new Date().getTime())/1000;
	        var timer = setInterval(function(){
	            if (sys_second > 1) {
	                sys_second -= 1;
	                var day = Math.floor((sys_second / 3600) / 24);
	                var hour = Math.floor((sys_second / 3600) % 24);
	                var minute = Math.floor((sys_second / 60) % 60);
	                var second = Math.floor(sys_second % 60);
	                day_elem && $(day_elem).text(day);//计算天
	                $(hour_elem).text(hour<10?"0"+hour:hour);//计算小时
	                $(minute_elem).text(minute<10?"0"+minute:minute);//计算分钟
	                $(second_elem).text(second<10?"0"+second:second);//计算秒杀
	            } else {
	                clearInterval(timer);
	            }
	        }, 1000);
	    }
	
	</script>
</head>
<body>
<div id="iCenter" style="display:none;"></div> 
  <script type="text/javascript">
    var mapObj,toolBar,locationInfo; 
	var locationX;
	var locationY;
	mapInit();
	//初始化地图对象，加载地图  
	function mapInit(){  
	  mapObj = new AMap.Map("iCenter");  
	  mapObj.plugin(["AMap.ToolBar"],function(){ 
		  var toolbarOptions={
				  autoPosition:true
				  }       
	      toolBar = new AMap.ToolBar(toolbarOptions); //设置地位标记为自定义标记  
	      mapObj.addControl(toolBar); 
	      AMap.event.addListener(toolBar,'location',function callback(e){   
	          locationInfo = e.lnglat;
	          locationX=locationInfo.lng+0.0065;
	          locationY=locationInfo.lat+0.0060;
	        });  
	  });  
	}     
    </script>
<section class="time-detail">
	<input type="hidden" id="signin" value="${activity.signin }">
	<input type="hidden" id="isSign" value="${isSign}">
	<input type="hidden" id="afterSignIn" value="${activity.afterSignIn}">
	
     <ul>
    	<c:if test="${empty beforeList && empty durationList && empty afterList && activity.apply == 0 && activity.signin == 0 }">
    		<li>
    			<span class="btn btn-default btn-block" disabled="true">活动尚未关联内容</span>
    		</li>
    	</c:if>
    	<c:if test="${activity.apply == 1 }">
	        <li class="baomingbtn" id="applyButton">
	        	<c:if test="${current<=activity.lastApplyDate ||  activity.lastApplyDate == 0}">
	        		<c:if test="${isApply eq 1 }">
	        			<span class="btn btn-default btn-block" disabled="true">已报名</span>
	        		</c:if>
	        		<c:if test="${isApply ne 1 }">
	        			<span class="btn btn-success btn-block" onclick="apply();">报名（
		        			<span id="divdown1">
			        			<span class="day"></span>天
			        			<span class="hour"></span>小时
			        			<span class="minute"></span>分
			        			<span class="second"></span>秒
			        		</span>）
	        			</span>
	        		</c:if>
	        	</c:if>
	        	<c:if test="${current>activity.lastApplyDate  && activity.lastApplyDate != 0}">
	        		 <span class="btn btn-default btn-block" disabled="true">报名已结束</span>
	        	</c:if>
	        </li>
        </c:if>
        <c:if test="${not empty beforeList }">
	        <li>
	            <div class="time-detail-item">
	                <div class="top-time red_line">
	                    <i class="fa fa-coffee"></i>&nbsp;&nbsp;<span>活动开始前预热</span>
	                </div>
	                <!--多个的话重复 start-->
	                <c:forEach items="${beforeList }" var="before">
	                	<c:forEach items="${before.list }" var="item">
	                		<div class="container-info" onclick="toDetail('${item.type}','${item.rid }')">
			                    <div class="info-time">
			                    	<c:if test="${item.allDay eq 1 }">全天</c:if>
			                    	<c:if test="${item.allDay  eq 0}">
				                        <span>${item.startTimeInDay }</span>
				                        <span>${item.endTimeInDay }</span>
			                        </c:if>
			                    </div>
			                    <div class="info-detail">
			                        <span class="info-detail-title">
		                            	<c:choose>
		                            		<c:when test="${item.type eq 1 }"><img src="${basepath }/static/m/img/tou.png" style="width:24px;"></c:when>
		                            		<c:when test="${item.type eq 2 }"><img src="${basepath }/static/m/img/tiao.png" style="width:24px;"></c:when>
		                            		<c:when test="${item.type eq 3 }"><img src="${basepath }/static/m/img/jiang.png" style="width:24px;"></c:when>
		                            		<c:when test="${item.type eq 4 }"><img src="${basepath }/static/m/img/bang.png" style="width:24px;"></c:when>
		                            		<c:when test="${item.type eq 5 }"></c:when>
		                            		<c:when test="${item.type eq 6 }"><img src="${basepath }/static/m/img/ke.png" style="width:24px;"></c:when>
		                            		<c:when test="${item.type eq 7 }"><img src="${basepath }/static/m/img/kao.png" style="width:24px;"></c:when>
		                            		<c:when test="${item.type eq 8 }"><img src="${basepath }/static/m/img/xun.png" style="width:24px;"></c:when>
		                            		<c:when test="${item.type eq 9 }"><img src="${basepath}/static/m/img/lanmu.png" style="width:24px;"></c:when>
		                            		<c:otherwise><i class="label label-default">它</i></c:otherwise>
		                            	</c:choose>
			                            ${item.title}
			                        </span>
			                        <span class="info-detail-jieshao">
			                            ${ltfun:html2Text(item.descript,200)}
			                        </span>
			                    </div>
			                </div>
	                	</c:forEach>
	                	   <c:if test="${activity.showTopic eq 1}">
	                	<div class="container-info" style="height: ">
			                    <div class="info-time">
			                    	开始
			                    </div>
			                    <div class="info-detail" onclick="toTopic('${activity.id}')">
			                        <span class="info-detail-title" >
										<img src="${basepath }/static/m/img/hua.png" style="width:24px;">
		                            	 话题
			                        </span>
			                        <span class="info-detail-jieshao">赶紧参与话题讨论吧！</span>
			                        
			                    </div>
			            </div>
			            </c:if>
	                	   <c:if test="${activity.showQuestion eq 1}">
	                	<div class="container-info" style="height: ">
			                    <div class="info-time">
			                    	开始
			                    </div>
			                    <div class="info-detail" onclick="toQuestion('${activity.id}')">
			                        <span class="info-detail-title" >
										<img src="${basepath }/static/m/img/wen.png" style="width:24px;">
		                            	 问答
			                        </span>
			                        <span class="info-detail-jieshao">赶紧参与问答吧！</span>
			                        
			                    </div>
			            </div>
			            </c:if>
	                </c:forEach>
	              
	            </div>
	            
	        </li>
        </c:if>
        <c:if test="${activity.signin == 1 }">
	        <li>
	            <div class="time-detail-item">
	                <div class="top-time green_line">
	                    <span>${signDayTime }&nbsp;&nbsp;${signDayOfWeek }</span>
	                </div>
	                <!--多个的话重复 start-->
	                <div class="container-info">
	                    <div class="info-time">
	                        <span>${signTimeInDay}</span>
	                        <span>开始</span>
	                    </div>
	                    <div class="info-detail" id="signButton">
	                        <c:if test="${isSign eq 0 && isInProcess eq 1}">
	                    		<span class="btn btn-success btn-block" onclick="signindialog()">签到</span>
	                    	</c:if>
	                        <c:if test="${isSign eq 1 || isInProcess eq 0}">
	                    		<span class="btn btn-default btn-block" disabled="true">
	                    			<c:if test="${isSign eq 1 }">已签到</c:if>
	                    			<c:if test="${isSign ne 1 }">签到</c:if>
	                    		</span>
	                    	</c:if>
	                    </div>
	                </div>
	                <!--多个的话重复 end-->
	            </div>
	        </li>
        </c:if>
        <c:forEach items="${durationList }" var="duration">
        	<c:if test="${not empty duration.list }">
		        <li>
		            <div class="time-detail-item">
		                <div class="top-time">
		                    <span>${duration.dayTime }&nbsp;&nbsp;${duration.weekTime}</span>
		                </div>
		                <!--多个的话重复 start-->
		                <c:forEach items="${duration.list }" var="item">
			                <div class="container-info" onclick="toDetail('${item.type}','${item.rid }')">
			                    <div class="info-time">
			                        <c:if test="${item.allDay eq 1 }">全天</c:if>
			                    	<c:if test="${item.allDay  eq 0}">
				                        <span>${item.startTimeInDay }</span>
				                        <span>${item.endTimeInDay }</span>
			                        </c:if>
			                    </div>
			                    <div class="info-detail">
			                        <span class="info-detail-title">
			                            <c:choose>
		                            		<c:when test="${item.type eq 1 }"><img src="${basepath }/static/m/img/tou.png" style="width:24px;"></c:when>
		                            		<c:when test="${item.type eq 2 }"><img src="${basepath }/static/m/img/tiao.png" style="width:24px;"></c:when>
		                            		<c:when test="${item.type eq 3 }"><img src="${basepath }/static/m/img/jiang.png" style="width:24px;"></c:when>
		                            		<c:when test="${item.type eq 4 }"><img src="${basepath }/static/m/img/bang.png" style="width:24px;"></c:when>
		                            		<c:when test="${item.type eq 6 }"><img src="${basepath }/static/m/img/ke.png" style="width:24px;"></c:when>
		                            		<c:when test="${item.type eq 7 }"><img src="${basepath }/static/m/img/kao.png" style="width:24px;"></c:when>
		                            		<c:when test="${item.type eq 8 }"><img src="${basepath }/static/m/img/xun.png" style="width:24px;"></c:when>
		                            		<c:when test="${item.type eq 9 }"><img src="${basepath}/static/m/img/lanmu.png" style="width:24px;"></c:when>
		                            		<c:otherwise><label class="label label-default">它</label></c:otherwise>
		                            	</c:choose>
			                            ${item.title }
			                        </span>
			                        <span class="info-detail-jieshao">
			                            ${ltfun:html2Text(item.descript,200)}
			                        </span>
			                    </div>
			                </div>
		                </c:forEach>
		                <!--多个的话重复 end-->
		                 <c:if test="${activity.showTopic eq 1}">
		                	<div class="container-info" style="height: ">
			                    <div class="info-time">
			                    	开始
			                    </div>
			                    <div class="info-detail" onclick="toTopic('${activity.id}')">
			                        <span class="info-detail-title" >
										<img src="${basepath }/static/m/img/hua.png" style="width:24px;">
		                            	 话题
			                        </span>
			                        <span class="info-detail-jieshao">赶紧参与话题讨论吧！</span>
			                    </div>
			            </div>
			            </c:if>
		                 <c:if test="${activity.showQuestion eq 1}">
		                	<div class="container-info" style="height: ">
			                    <div class="info-time">
			                    	开始
			                    </div>
			                    <div class="info-detail" onclick="toQuestion('${activity.id}')">
			                        <span class="info-detail-title" >
										<img src="${basepath }/static/m/img/wen.png" style="width:24px;">
		                            	 问答
			                        </span>
			                        <span class="info-detail-jieshao">赶紧参与问答吧！</span>
			                    </div>
			            </div>
			            </c:if>
		            </div>
		        </li>
	        </c:if>
        </c:forEach>
        
        <c:if test="${not empty afterList }">
	        <li class="houxu">
	            <div class="time-detail-item">
	                <div class="top-time orange_line">
	                    <i class="fa fa-coffee"></i><span>&nbsp;&nbsp;后续跟踪活动</span>
	                </div>
	            </div>
	            <div class="time-detail-item">
	                <!--<div class="top-time">-->
	                <!--<span>3月31日&nbsp;&nbsp;周一</span>-->
	                <!--</div>-->
	                <!--多个的话重复 start-->
	                <c:forEach items="${afterList }" var="after">
	                	<c:forEach items="${after.list }" var="item">
			                <div class="container-info" onclick="toDetail('${item.type}','${item.rid }')">
			                    <div class="info-time">
			                        <c:if test="${item.allDay eq 1 }">全天</c:if>
			                    	<c:if test="${item.allDay  eq 0}">
				                        <span>${item.startTimeInDay }</span>
				                        <span>${item.endTimeInDay }</span>
			                        </c:if>
			                    </div>
			                    <div class="info-detail">
			                       <span class="info-detail-title">
			                            <c:choose>
		                            		<c:when test="${item.type eq 1 }"><img src="${basepath }/static/m/img/tou.png" style="width:24px;"></c:when>
		                            		<c:when test="${item.type eq 2 }"><img src="${basepath }/static/m/img/tiao.png" style="width:24px;"></c:when>
		                            		<c:when test="${item.type eq 3 }"><img src="${basepath }/static/m/img/jiang.png" style="width:24px;"></c:when>
		                            		<c:when test="${item.type eq 4 }"><img src="${basepath }/static/m/img/bang.png" style="width:24px;"></c:when>
		                            		<c:when test="${item.type eq 6 }"><img src="${basepath }/static/m/img/ke.png" style="width:24px;"></c:when>
		                            		<c:when test="${item.type eq 7 }"><img src="${basepath }/static/m/img/kao.png" style="width:24px;"></c:when>
		                            		<c:when test="${item.type eq 8 }"><img src="${basepath }/static/m/img/xun.png" style="width:24px;"></c:when>
		                            		<c:when test="${item.type eq 9 }"><img src="${basepath}/static/m/img/lanmu.png" style="width:24px;"></c:when>
		                            		<c:otherwise><label class="label label-default">它</label></c:otherwise>
		                            	</c:choose>
			                            ${item.title}
			                        </span>
			                        <span class="info-detail-jieshao">
			                            ${ltfun:html2Text(item.descript,200)}
			                        </span>
			                    </div>
			                </div>
	                	</c:forEach>
	                	  <c:if test="${activity.showTopic eq 1}">
	                		<div class="container-info" style="height: ">
			                    <div class="info-time">
			                    	开始
			                    </div>
			                    <div class="info-detail" onclick="toTopic('${activity.id}')">
			                        <span class="info-detail-title" >
										<img src="${basepath }/static/m/img/hua.png" style="width:24px;">
		                            	 话题
			                        </span>
			                        <span class="info-detail-jieshao">赶紧参与话题讨论吧！</span>
			                    </div>
			            </div>
			            </c:if>
	                	  <c:if test="${activity.showQuestion eq 1}">
	                		<div class="container-info" style="height: ">
			                    <div class="info-time">
			                    	开始
			                    </div>
			                    <div class="info-detail" onclick="toQuestion('${activity.id}')">
			                        <span class="info-detail-title" >
										<img src="${basepath }/static/m/img/wen.png" style="width:24px;">
		                            	问答
			                        </span>
			                        <span class="info-detail-jieshao">赶紧参与问答吧！</span>
			                    </div>
			            </div>
			            </c:if>
	                </c:forEach>
	                <!--多个的话重复 end-->
	                
	            </div>
	        </li>
        </c:if>
    </ul>
</section>
<script type="text/javascript">
var coordinate="${activity.coordinate}";
var startSignLocation="${activity.startSignLocation}";
</script>
<script type="text/javascript">
function apply(){
	  var v1 = "${user.name}";
	  var v2 = "${empty user.temporary_mobile ? user.mobile:user.temporary_mobile}";
	  var v3 = "${user.unitinfo}";
	  var domain="<%=domain%>";
	  if(null==v1){
		  v1="";
	  }
	  if(null==v2){
		  v2="";
	  }
	  if(null==v3){
		  v3="";
	  }
	  var html = [];
	  html.push('<div style="width:300px;height:130px;">');
		html.push('	<div class="form-group" id="">');
		html.push('		<input type="hidden" id="userId" value="">');
		html.push('		<lable style="font-size:18px; width:25%">姓名：</lable>');
		html.push('		<input type="text" name="userName" id="text-basic" style="width:75%;height:30px;" value="'+v1+'">');
		html.push('	</div>');
		html.push('	<div class="form-group"');
		if(domain=="ENN"){
		html.push(' style="display:none;"');
		}
		html.push(' id="" >');
		html.push('		<lable style="font-size:18px; width:25%">手机：</lable>');
		html.push('		<input type="tel" name="userMobile" id="tel" style="width:75%;height:30px;" value="'+v2+'">');
		html.push('	</div>');
		html.push('	<div class="form-group" id="">');
		html.push('		<lable style="font-size:18px; width:25%">单位：</lable>');
		html.push('		<input type="text" name="userCompany" style="width:75%;height:30px;" id="text-basic" value="'+v3+'">');
		html.push('	</div>');
		html.push("</div>");
		
		easyDialog.open({
			  container : {
			    header : '请输入个人信息',
			    content : html.join(''),
			    yesFn : btnFn,
			    noFn : true
			  }
			});
		  function btnFn(){
			  var userName = $("input[name='userName']").val();
			  var userMobile = $("input[name='userMobile']").val();
			  var userCompany = $("input[name='userCompany']").val();
			  var qcorder="${qcorder}";
			  $("input[name='userName']").css({"background-color":"#fff"});
			  $("input[name='userMobile']").css({"background-color":"#fff"});
			  if($.trim(userName) == ""){
				  $("input[name='userName']").css({"background-color":"red"});
				  return false;
			  }
			  /*if($.trim(userMobile) == ""){
				  $("input[name='userMobile']").css({"background-color":"red"});
				  return false;
			  }*/
			  $.ajax({
				  	type:"POST",
		       		url:"${basepath}/m/ixin/activity/saveixinuserinfo.json",
		       		data:{"openid":"${openId}","uid":"${uid}","mobile":userMobile,"name":userName,"company":userCompany},
		       		success:function(data){
		       			if(data == 1){
		       				$.ajax({
		    				  	type:"POST",
		    		       		url:"${basepath}/m/ixin/activity/apply.json",
		    		       		data:{"activityId": "${activity.id}", "openId": "${openId}", "baseuid":"${uid}"},
		    		       		success:function(data){
		    		       			if(data == 0) {
				  				    	 opendialog('报名成功');
				  			              $("#applyButton").html('<span class="btn btn-default btn-block" disabled="true">已报名</span>');

				  			              var signin = "${activity.signin}";
				  			            if(signin == 1){//需要签到
			  				    	        if(!qcorder){//不是二维码过来的
			  				    	        }else{
			  				    	        	autosignin();
				  				    	        }
				  			            }


				  			              
				  				     } else if(data == 1) {
				  				    	 opendialog('报名失败，已截止报名');
				  				     } else {
				  				    	opendialog('报名失败，服务器访问失败');
				  				     }
		    		       		},
		    		       		error:function(date){
		    		       			opendialog('报名失败，服务器访问失败');
		    		       		}
		    		       	});
		       			} else {
		       				opendialog('报名失败，服务器访问失败');
		       			}
		       		},
		       		error:function(data){
		       			alert("error");
		       		}
		       	});
			
		  }
	}

function autosignin(){
	$.get("${basepath}/m/ixin/activity/autosignin.json", { "activityId": "${activity.id}", "openId": "${openId}","baseuid":"${uid}"},
			   function(data){
			     if(data) {
			    	 $("#signButton").html('<span class="btn btn-default btn-block" disabled="true">已签到</span>');
		             $("#isSign").val("1");
			     } 
			   });
    }



	function signindialog(){
		if(startSignLocation==1){
			  var currentPosition=locationX+","+locationY;//当前位置
		       $.ajax({
		             type:"GET",
		             url:"${basepath}/m/ixin/activity/getdistance.json",
		             data:{"point":coordinate,"currentPoint":currentPosition},
		             success:function(data){
		                 if(data>2000){
	                         alert("不在活动现场，无法签到");
			                 }else{
			                	 easyDialog.open({
			               	      container : {
			               	        content : '<label>请输入4位数的签到码</label><br><input type="text" id="code" style="width:100%;height:30px"/>',
			               	        yesFn : signin,
			               	        noFn : btnFn
			               	      }
			               	    });
				                 }
		             }
		           });
		}else{
			 easyDialog.open({
	      	      container : {
	      	        content : '<label>请输入4位数的签到码</label><br><input type="text" id="code" style="width:100%;height:30px"/>',
	      	        yesFn : signin,
	      	        noFn : btnFn
	      	      }
	      	    });
			}
	}
	var signin = function() {
		var code = $("#code").val();
		easyDialog.close();
		if(code == "${activity.signinCode}") {
			$.get("${basepath}/m/ixin/activity/signin.json", { "activityId": "${activity.id}", "openId": "${openId}", "code":code,"baseuid":"${uid}"},
					   function(data){
					     if(data) {
					    	 opendialog('签到成功');
				             $("#signButton").html('<span class="btn btn-default btn-block" disabled="true">已签到</span>');
				             $("#isSign").val("1");
					     } else {
					    	 opendialog('签到失败');
					     }
					   });
		} else {
			alert("请输入正确的签到码");
		}
		
	};
	
	var btnFn = function(){
	    easyDialog.close();
	};
	function opendialog(text){
	    easyDialog.open({
	      container : {
	        content : '<span style="text-algin: center;text-align: center;display: block;font-size: 24px;">'+text+'</span>',
	        yesFn : btnFn,
	        noFn : false
	      }
	    });
	}

	function openUrl(url){
		window.location.href=url;
	}
</script>
</body>
</html>