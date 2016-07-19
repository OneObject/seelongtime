<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<!DOCTYPE html>
<html>
<head>
    <title>活动详情界面</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="${basepath}/static/css/320.css">
</head>
<body>
    <section class="active-detail">
        <header>
            <h1>${activityInfo.name}</h1>
            <p class="activity-info">
                <span class="activity-meta no-extra">${ltfun:dateLongToStringFormat(activityInfo.createDate,'yyyy-MM-dd')}</span>
                <span class="activity-meta">${activityInfo.sponsor}</span>
            </p>
        </header>
        <div class="page-content">
            <div class="media" id="media">
                <img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${activityInfo.picUrl}">
            </div>
            <div class="text">
                <div class="baoming">
                    <a href="${basepath}/m/ixin/activity/detaildispatch.xhtml?id=${activityInfo.id}" style="text-decoration: none"><span class="btnGreen">进入活动</span></a>
                </div>
             
              <c:if test="${not empty activityInfo.descript}"> 
                <p><strong>培训班介绍</strong></p>
                <p>
                ${activityInfo.descript}
                </p>
              </c:if>
              
                <p><strong>培训时间</strong></p>
                <p>${ltfun:dateLongToStringFormat(activityInfo.startDate,'yyyy-MM-dd')}~${ltfun:dateLongToStringFormat(activityInfo.endDate,'yyyy-MM-dd')}</p>
                
              <c:if test="${not empty activityInfo.content}"> 
                <p><strong>日程安排</strong></p>
                <p>${activityInfo.content}</p>
              </c:if>
              
              <c:if test="${not empty activityInfo.address}">
                <p><strong>培训地点</strong></p>
                <p>${activityInfo.address}</p>
              </c:if>
              
              <c:if test="${not empty activityInfo.remark}"> 
                <p><strong>报名须知</strong></p>
                <p>${activityInfo.remark}</p>
              </c:if>  
            </div>
        </div>
    </section>

</body>
</html>