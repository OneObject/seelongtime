<%@ page contentType="text/html;charset=UTF-8"%>
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
<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
<meta name="format-detection" content="telephone=no" />
<link rel="stylesheet"	href="${basepath}/static/plugins/font-awesome-4.1.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="${basepath}/static/m_h5/css/common.css">
<link rel="stylesheet" href="${basepath}/static/m_h5/css/color.css">  
<title>${activity.name}</title>

</head>

<body> 
    <header class="ctl_header">
	<div class="back"><a href="javascript:histroy.go(-1);"><i class="fa fa-angle-left"></i></a></div>
        ${activity.name}
	</header>
	
    <article class="huodong ctl_cont">
    	<section class="huodongBox">
        	<div class="box1">
            	<a class="h" href="javascript:void(0);"  onclick="toDetail('10','','','${activity.id}')">
                 	<img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${activity.picUrl}" onerror="javascript:this.src='${basepath}/static/img/study/cover_c.png'">
                    <span class="blackBlock"></span>
                    <label>点击查看详情</label>
                </a>
                
        	<c:forEach items="${list }" var="item">
        	   <a class="item" href="javascript:void(0);"  onclick="toDetail('${item.type }','${item.itemNum }','${item.rid}','${activity.id }')">
                  <div>
                 	 <c:choose>
                  		<c:when test="${ item.type == 1 }"> <%-- 投票 --%>
                  		    <img src="${basepath}/static/m_h5/img/h1.png" />
                  		</c:when>
                  		<c:when test="${ item.type == 2}"><%-- 调研 --%>
                  		   <img src="${basepath}/static/m_h5/img/h2.png" />
                  		</c:when>
                  		<c:when test="${ item.type == 3 }"><%-- 抽奖 --%>
                  	    	<img src="${basepath}/static/m_h5/img/h3.png" />
                  		</c:when>
                  		<c:when test="${ item.type == 4 }"><%-- 排行榜 --%>
                  			<img src="${basepath}/static/m_h5/img/h4.png" />
                  		</c:when>
               			<c:when test="${ item.type == 6 }"><%-- 课程 --%>
                  			<img src="${basepath}/static/m_h5/img/h5.png" />
                  		</c:when>
                  		<c:when test="${ item.type == 7 }"><%-- 考试 --%>
                  			<img src="${basepath}/static/m_h5/img/h6.png" />
                  		</c:when>
                  		<c:when test="${ item.type == 8 }"><%-- 资讯 --%>
                  			<img src="${basepath}/static/m_h5/img/h7.png" />
                  		</c:when>
                  		<c:when test="${ item.type == 9 }"><%-- 栏目 --%>
                  		    <img src="${basepath}/static/m_h5/img/h8.png" />
                  		</c:when>
                  		<c:otherwise>
                  			<img src="${basepath }/static/img/study/cover_c.png">
                  		</c:otherwise>
                  	</c:choose>
                   </div>
                   <ul>
                      <li>${item.title }</li>                         
                   </ul>
            	</a>
        	 </c:forEach>
        	 <c:if test="${activity.showTopic eq 1}">
        	  <a class="item" href="javascript:void(0);"  onclick="toTopic('${activity.id}')">
                    <div><img src="${basepath }/static/m/img/huati.png"></div>
                    <ul>
                        <li>话题</li>                         
                    </ul>
            	</a>
             </c:if>
                <c:if test="${activity.showQuestion eq 1}">
                 <a class="item" href="javascript:void(0);"   onclick="toQuestion('${activity.id}')">
                    <div><img src="${basepath }/static/m/img/wenda.png"></div>
                    <ul>
                        <li>问答</li>                         
                    </ul>
            	</a>
              </c:if>
            </div>      
            
             <!--活动关联内容列表 end-->
            <input type="hidden" id="signin" value="${activity.signin }">
			<input type="hidden" id="isSign" value="${isSign}">
			<input type="hidden" id="afterSignIn" value="${activity.afterSignIn}">
          
        </section>
    </article>
    
    <%-- 提示框 --%>
     <div class="dialogBg" id="qiandaofdialogBg" style="display:none;" >​</div>
    <div class="dialogBox1" style="display: none;" id="qiandaofdialog">
    	<div class="dialogHeader">提示</div>
        <div class="dialogContent"> 
             <span class="err" id="tishiMsg"></span>
        </div>
        <div class="dialogFooter"><span class="a" onclick="cancel('qiandaofdialog');">取消</span> </div>
    </div>
     
 <script type="text/javascript">
$(function(){
	var orientationEvent;
	var supportsOrientationChange = "onorientationchange" in window;
	var w=$("header",parent.document).width();
	$("a.h span").width(w-34);
	$("a.h label").width(w-34);
	$("a>ul").width(w-94);	
	orientationEvent = supportsOrientationChange ? "orientationchange" : "resize";   
	window.addEventListener(orientationEvent, function() {
		var w=$(window).width();
		$("a.h span").width(w-34);
		$("a.h label").width(w-34);
		$("a>ul").width(w-94);	
	}, false);
	 
});

var admin_root ="<%=Constant.ADMIN_ROOT %>";

/**无法签到提示框*/
function showtishi(message){
	$("#tishiMsg").html(message);	
	$("#qiandaofdialog").show();	
	$("#qiandaofdialogBg").show();	
}

/**关闭提示框*/
function cancel(dialogid){
	$("#"+dialogid).hide();	
	$("#"+dialogid + "Bg").hide();	
}

function check(){
	var signin = $("#signin").val();
	var isSign = $("#isSign").val();
	var afterSignIn = $("#afterSignIn").val();
	if(signin == 1 && afterSignIn == 1){
		if(isSign != 1){ 
			showtishi("请签到后再来查看");
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
			//url = "${basepath}/m/ixin/vote/serieslist.xhtml?type=1&activityId=" + activityId;
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
			//url = "${basepath}/m/ixin/vote/serieslist.xhtml?type=2&activityId=" + activityId;
			url = "${basepath}/m/h5/vote/index?type=2&activityid=" + activityId;
			window.top.location.href=url;
			return;
		}
	} else if(type == "3"){//抽奖
		if(size == 1){
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
       	url = "${basepath}/m/h5/channelresource/index.xhtml?channelid=" + id;
       	window.top.location.href=url;
		return;
	}else if(type == "10"){
//		url = "${basepath}/m/ixin/activity/seriesdetail.xhtml?id="+activityId;
		url = "${basepath}/m/h5/activity/seriesdetail.xhtml?id="+activityId;
	   	window.top.location.href=url;
		return;
	} else{
		//alert("未知类型，请联系管理人员！");
		showtishi("未知类型，请联系管理人员！");
		return;
	}
	openUrl(url);
} 

function toTopic(id){
	if(!check()){
		return;
	}
	var url = "${basepath }/m/ixin/ntopic/index.xhtml?activityid="+id;
		 window.top.location.href=url;
}  

//跳转到问答
function toQuestion(id){
	if(!check()){
		return;
	}
	window.location.href = "${basepath }/m/h5/ask/page.xhtml?activityid="+id;
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

<style type="text/css">
a,a:hover,a:focus{text-decoration:none;}
</style>

</body>
</html>
