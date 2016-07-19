<%@ page contentType="text/html;charset=UTF-8" buffer="none"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<% 
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
	<meta http-equiv="pragma" content="no-cache"> 
	<meta http-equiv="cache-control" content="no-cache"> 
	<meta http-equiv="expires" content="0">   
    <link rel="stylesheet" href="${basepath }/static/css/320.css">
    <link rel="stylesheet" href="${basepath }/static/css/easydialog.css">
    <script type="text/javascript" src="${basepath }/static/js/easydialog.js"></script>
</head>
<body>
<section class="series">
    <section class="a-series">
        <!--一个系列 start-->
        <div class="series-top"  onclick="toDetail('10','','','${activity.id}')">
            <img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${activity.picUrl}<%=Constant.QINIU_COURSE_IMG_STYLE_320_180%>" onerror="javascript:this.src='${basepath}/static/img/study/cover_c.png'" class="bigimg">
            <span class="series-top-title-bg"></span>
            <span class="series-top-title">${activity.name }</span>
        </div>
        
        <section class="list-box">
            <!--活动关联内容列表 start-->
            <ul class="course-list">
            	<c:if test="${not empty list }">
	            	<c:forEach items="${list }" var="item">
		                <li  onclick="toDetail('${item.type }','${item.itemNum }','${item.rid}','${activity.id }')">
		                    <div class="course-list-item">
		                        <div class="course-list-item-img">
		                        	<c:choose>
		                        		<c:when test="${ item.type == 1 }">
		                        			<img src="${basepath }/static/m/img/tou.png">
		                        		</c:when>
		                        		<c:when test="${ item.type == 2}">
		                        			<img src="${basepath }/static/m/img/diao.png">
		                        		</c:when>
		                        		<c:when test="${ item.type == 3 }">
		                        			<img src="${basepath }/static/m/img/jiang.png">
		                        		</c:when>
		                        		<c:when test="${ item.type == 4 }">
		                        			<img src="${basepath }/static/m/img/bang.png">
		                        		</c:when>
		                     			<c:when test="${ item.type == 6 }">
		                        			<img src="${basepath }/static/m/img/ke.png">
		                        		</c:when>
		                        		<c:when test="${ item.type == 7 }">
		                        			<img src="${basepath }/static/m/img/kao.png">
		                        		</c:when>
		                        		<c:when test="${ item.type == 8 }">
		                        			<img src="${basepath }/static/m/img/xun.png">
		                        		</c:when>
		                        		<c:when test="${ item.type == 9 }">
		                        		    <img src="${basepath}/static/m/img/lanmu.png">
		                        		</c:when>
		                        		<c:otherwise>
		                        			<img src="${basepath }/static/img/study/cover_c.png">
		                        		</c:otherwise>
		                        	</c:choose>
		                            <i class="fa fa-caret-square-o-right"></i>
		                        </div>
		                        <div class="course-list-item-detail what">
		                        	<c:choose>
		                        		<c:when test="${item.type == 6 }"><h3>课程</h3></c:when>
		                        		<c:when test="${item.type == 7 }"><h3>考试</h3></c:when>
		                        		<c:when test="${item.type == 8 }"><h3>资讯</h3></c:when>
		                        		<c:otherwise>
		                        			<h3 style="text-overflow:ellipsis; white-space:nowrap; overflow:hidden;">${item.title }</h3>
		                        			<span style="height:auto;text-overflow:ellipsis; white-space:nowrap; overflow:hidden;">${ltfun:html2Text(item.descript,200)}</span>
		                        		</c:otherwise>
		                        	</c:choose>
		                        </div>
		                    </div>
		                </li>
	                </c:forEach>
                </c:if>
                <c:if test="${activity.showTopic eq 1}">
                <li  onclick="toTopic('${activity.id}')">
	                    <div class="course-list-item">
	                        <div class="course-list-item-img">
	                        	<img src="${basepath }/static/m/img/huati.png">
	                            <i class="fa fa-caret-square-o-right"></i>
	                        </div>
	                        <div class="course-list-item-detail">
	                            <h3>话题</h3>
	                            <span style="height:auto;">赶紧参与话题讨论吧！</span>
	                        </div>
	                    </div>
	                </li>
	                </c:if>
                <c:if test="${activity.showQuestion eq 1}">
                <li  onclick="toQuestion('${activity.id}')">
	                    <div class="course-list-item">
	                        <div class="course-list-item-img">
	                        	<img src="${basepath }/static/m/img/wenda.png">
	                            <i class="fa fa-caret-square-o-right"></i>
	                        </div>
	                        <div class="course-list-item-detail">
	                            <h3>问答</h3>
	                            <span style="height:auto;">赶紧参与问答吧！</span>
	                        </div>
	                    </div>
	                </li>
	                </c:if>
            </ul>
            <!--活动关联内容列表 end-->
            <input type="hidden" id="signin" value="${activity.signin }">
			<input type="hidden" id="isSign" value="${isSign}">
			<input type="hidden" id="afterSignIn" value="${activity.afterSignIn}">
        </section>
        <!--一个系列 end-->
    </section>
</section>
<script type="text/javascript">
$(function(){
	if(window.top.location!=window.location){
		var orientationEvent;	
		var supportsOrientationChange = "onorientationchange" in window;
		var my_w=$("header",parent.document).width();
		var my_w2=my_w-140;
		$("section.series").width(my_w-20);
		$(".what h3").width(my_w2);
		$(".what span").width(my_w2);
		orientationEvent = supportsOrientationChange ? "orientationchange" : "resize";   
		window.addEventListener(orientationEvent, function() {
			var my_w=$("header",parent.document).width();
			var my_w2=my_w-140;
			$("section.series").width(my_w-20);
			$(".what h3").width(my_w2);
			$(".what span").width(my_w2); 
		}, false); 
	}
	
});



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
	
	function toDetail(type,size,id,activityId){
		
		if(type != "10" && !check()){
			return;
		}
		
		var url = "";
		if (type == "1") {
			if (size == 1) {
				url = "${basepath}/m/ixin/nsurvey/index.xhtml?voteId="
						+ id ;
				window.top.location.href=url;
				return;
			} else {
				//url = "${basepath}/m/ixin/vote/serieslist.xhtml?type=1&activityId="	+ activityId;
				url = "${basepath}/m/h5/vote/index?type=1&activityid=" + activityId;
				window.top.location.href=url;
				return;
			}
		} else if (type == "2") {
			if (size == 1) {
				url = "${basepath}/m/ixin/nsurvey/index.xhtml?voteId="
						+ id;
				window.top.location.href=url;
				return;
			} else {
				// url = "${basepath}/m/ixin/vote/serieslist.xhtml?type=2&activityId=" + activityId;
				url = "${basepath}/m/h5/vote/index?type=2&activityid=" + activityId;
				window.top.location.href=url;
				return;
			}
		} else if(type == "3"){//抽奖
			if(size == 1){
			//	url = admin_root+"/protal/activity/cardreward.xhtml?rewardId="+id;
				url = "${basepath}/m/ixin/lottery/cardreward.xhtml?rewardId="+id;
			}else {
				url = "${basepath}/m/ixin/lottery/serieslist.xhtml?activityId="+activityId;
			}
		}else if(type == "4"){
			if(size == 1){
				url = admin_root+"/protal/rank/"+id+".xhtml";
			} else {
				url = "${basepath}/m/ixin/rank/serieslist.xhtml?activityId="+activityId;
			}
		}else if(type == "6"){
			if (size == 1){
				url = "${basepath}/m/study/detail/"+id+".xhtml?fdomain=${current_domain}";
				if (window.top.location!= window.location) {
		            window.top.location.href=url;
		            return;
		         }
			}else{
				url = "${basepath}/m/ixin/study/serieslist.xhtml?activityId="+activityId;
			}
		}else if(type == "7"){
			if (size == 1){
				url = "${basepath}/m/h5/exam/detail.xhtml?tid=" + id;
			    window.top.location.href=url;
			   return;
			}else{
				url = "${basepath}/m/exam/serieslist.xhtml?activityId="+activityId;
			}
		}else if(type === "8"){
			if (size == 1){
				url = "${basepath}/m/ixin/fodder/detail.xhtml?id="+id;
			}else{
				url = "${basepath}/m/ixin/fodder/serieslist.xhtml?activityId="+activityId;
			}
		} else if(type=="9"){
            //url="${basepath}/m/ixin/channelresource/list.xhtml?channelid="+id;
        	url = "${basepath}/m/h5/channelresource/index.xhtml?channelid=" + id;
        	window.top.location.href=url;
			return;
		}else if(type == "10"){
			url = "${basepath}/m/ixin/activity/seriesdetail.xhtml?id="+activityId;
			url = "${basepath}/m/h5/activity/seriesdetail.xhtml?id="+activityId;
			window.top.location.href=url;
			return;
		} else{
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
		      autoClose:1500
		});
	}

	function openUrl(url){
		window.location.href=url;
	}
</script>
</body>
</html>