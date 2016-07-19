<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<%@ taglib prefix="myel" uri="http://www.longtimeit.com/taglib-elfunctions"%>
<!DOCTYPE HTML>
<html style="background-color:#e9eef1;">
    <head>
        <title>${vo.title }</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport">
        <meta content="yes" name="apple-mobile-web-app-capable">
        <meta content="black" name="apple-mobile-web-app-status-bar-style">
        <meta content="telephone=no" name="format-detection">
        <link href="${basepath }/static/public/easydialog-v2.0/easydialog.css" rel="stylesheet" type="text/css">
        <link href="${basepath}/static/ixin/css/Site.css" rel="stylesheet" type="text/css">
        <link href="${basepath}/static/ixin/css/style.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="wrap" id="wrap" style="">
            <div class="tip" id="tip">
                感谢您的参与!
            </div>
            <article class="post">
                <h1 class="post-title" id="title">${vo.title }</h1>
                <input type="hidden" id="voteId" value="${vo.voteId }"/>
                <div class="post-desc" id="votedate">
                    投票时间：<d:formatDate currentTime="${vo.startTime }" format="yyyy/MM/dd"/>~<d:formatDate currentTime="${vo.endTime }" format="yyyy/MM/dd"/>
                </div>
            </article>
            <div id="inner">
            <c:forEach items="${vo.questions }" var="question">
                <div id="result" class="tpcon" style="margin-bottom:10px;">
                    <dl class="quslist">
                        <dt class="qus-problem">
                            <span class="qus-title">${question.qtitle }</span><span class="qus-des">(单选)</span>
                        </dt>
                        
                        <c:forEach items="${question.options }" var="option" varStatus="vs">
                        <dd class="qus-item" id="rq1">
                            <span class="qus-option">${vs.index+1 }.${option.otitle }</span>
                            <div>
                            	<c:if test="${vo.voteNum == 0 }">
	                            	<span class="progress-bar bar1" data-width="1" style="width: 1%;"></span>
	                                <span class="progress-num">
	                                	暂无投票</span>
                            	</c:if>
                            	<c:if test="${vo.voteNum !=0 }">
	                            	<span class="progress-bar bar1" data-width="${option.userVoteNum/vo.voteNum * 100}" style="width: ${option.userVoteNum/vo.voteNum * 100 +5 }%;"></span>
	                                <span class="progress-num">
	                                ${myel:numFormat(option.userVoteNum/vo.voteNum * 100) }%</span>
                            	</c:if>
                            </div>
                        </dd>
                        </c:forEach>
                    </dl>
                </div>
                </c:forEach>
                <%--<div class="tc" id="tc">
                    <a style="" href="javascript:;" id="submit" class="btnGreen">关闭</a>
                </div> --%>
            </div>
        </div>
    </body>
</html>
<%@include file="/WEB-INF/jsp/include/student/wx.jsp"%>
<%@include file="/WEB-INF/jsp/include/analysis.jsp"%>