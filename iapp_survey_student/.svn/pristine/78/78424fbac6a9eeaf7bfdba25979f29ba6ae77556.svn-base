<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%
long currentTime = System.currentTimeMillis();
pageContext.setAttribute("currentTime", currentTime);
%>
<!DOCTYPE html>
<html>
<head>
    <title>投票列表</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="${basepath}/static/plugins/fonticon/css/font-awesome.min.css">
    <link rel="stylesheet" href="${basepath}/static/css/320.css">
    <link rel="stylesheet" href="${basepath}/static/css/easydialog.css">
    <style type="text/css">
    header {width:100%;height:50px;line-height:50px;text-align:center;color:#fff;font-size:20px;position:relative;}
    header span.h_back{display:inline-block;height:50px;width:40px;line-height:50px;position:absolute;left:0px;top:0px;text-align:center;}
    header span.h_back i{font-size:22px;color:#fff;}
    </style>
</head>
<body>
<!--  
<header >
	<a href="javascript:goBack();"><span class="h_back"><i class="fa fa-angle-left"></i></span></a>
	投票列表
</header>
-->
<section class="GM-list-box" >
    <!--通用列表页 微信端的所有列表页，都可使用-->
    <ul>
    <c:if test="${empty votelist}">
    <li>
     <span class="alert alert-warning" style="display:block;overflow: hidden; text-align: center;">没有投票信息</span>
    </li>
    </c:if>
    <c:forEach  var="item" items="${votelist}">
       <li onclick="toDetail('${item.id}');">
            <div class="GM-list-item" >
            	<c:if test="${not empty item.coverPath}"><img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${item.coverPath}-80x80" class="GM-item-poster"></c:if>
               <c:if  test="${empty item.coverPath}"><img src="${basepath}/static/m/img/poll_80x80.png" class="GM-item-poster"></c:if>
              
                <div class="GM-list-item-content img-for-left has-time">
                        <c:set var="startTime" value="${item.startTime eq 0 ? (currentTime-1):item.startTime}"/>
                    	<c:set var="endTime" value="${item.endTime eq 0 ? (currentTime+1):item.endTime}"/>
                    	
                    <span class="GM-item-title">
                    <c:choose>
                    		<c:when test="${startTime > currentTime }"><span style="color: blue;">[未开始]</span></c:when>
                    		<c:when test="${endTime < currentTime }"><span style="color: black;">[已结束]</span></c:when>
                    		<c:otherwise>
                    			<span style="color: green;">[进行中]</span>
                    		</c:otherwise>
                    	</c:choose>
                     ${ltfun:html2Text(item.title, 8)}
                    </span>
                    <span class="GM-item-jianjie">${ltfun:html2Text(item.summary, 15)}</span>
                    <div class="GM-item-time">
                        <span class="GM-item-time-o">
                        <c:if test="${item.startTime!=0}">
                        	${ltfun:dateLongToStringFormat(item.startTime,'MM月dd日HH时mm分') }~
                        </c:if>
                         <c:if test="${item.endTime!=0}">
                         	${ltfun:dateLongToStringFormat(item.endTime,'MM月dd日HH时mm分') }
                         </c:if>
                         <input type="hidden" id="${item.id}starttime" value="${item.startTime}"/>
                         <input type="hidden" id="${item.id}endtime" value="${item.endTime}"/>
                        </span>
                        <span class="GM-item-time-state">已${item.voteNum}人投票</span>
                    </div>
                </div>
            </div>
        </li>
     </c:forEach>
    </ul>
    <input type="hidden" id="activityId" value="${activityId}"/>
</section>
<script type="text/javascript" src="${basepath }/static/js/easydialog.min.js"></script>
<script type="text/javascript">
var admin_root ="<%=Constant.ADMIN_ROOT %>";
function showMsgDialog(content){
	easyDialog.open({
        container : {
            header : '提示',
            content : '<div style="background-color: #ffffff;width:260px;height:20px;text-align:center;">'+content+'</div>'
        },
        autoClose:3000
    });
}
function toDetail(id){
	var currenttime = ${currentTime};
	var starttime = $("#"+id+"starttime").val();
	var endtime = $("#"+id+"endtime").val();
	var activityId = $("#activityId").val();
	if (starttime==0 && endtime == 0){
		openURL("${basepath}/m/ixin/nsurvey/index.xhtml?voteId="+id);
		//openURL(admin_root + "/protal/uservote/index.xhtml?voteId=" + id +"&uid=${uid}");
	}else{
		if (currenttime < starttime && starttime!=0){
			showMsgDialog("对不起投票还没有开始");
			return;
		}
		if (currenttime > endtime && endtime!=0){
			showMsgDialog("对不起投票已经结束");
			return;
		}
		openURL("${basepath}/m/ixin/nsurvey/index.xhtml?voteId="+id);
		//openURL(admin_root + "/protal/uservote/index.xhtml?voteId=" + id +"&uid=${uid}");
	}
	
}
function openURL(url){
	  window.top.location.href=url;
	}
</script>
</body>
</html>