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
       <link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/base.css" type="text/css">
	<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/ixin.css" type="text/css">
	<style type="text/css">
	.btn button, .btn input[type="button"], .btn input[type="submit"], .btn input[type="reset"] {
		display: block;
		height: 100%;
		background-color: transparent;
		border: 0;
		outline: 0;
		overflow: visible;
		padding: 0 36px;
	}	
	</style>
    </head>
    <body>
        <div class="wrap" id="wrap" style="">
            <article class="post">
                <h1 class="post-title" id="title">${vo.title }</h1>
                <div class="post-desc" id="votedate">
                    ${surveyOrvote}时间：<d:formatDate currentTime="${vo.startTime }" format="yyyy/MM/dd"/>~<d:formatDate currentTime="${vo.endTime }" format="yyyy/MM/dd"/>
                </div>
            </article>
            <div id="inner">
            <c:forEach items="${vo.questions }" var="question">
                <div id="result" class="tpcon" style="margin-bottom:10px;">
                    <dl class="quslist">
                        <dt class="qus-problem">
                            <span class="qus-title">${question.qtitle }  (${surveyOrvote}数目：${question.voteNum })</span><span class="qus-des">(单选)</span>
                        </dt>
                        
                        <c:forEach items="${question.options }" var="option" varStatus="vs">
                        <dd class="qus-item" id="rq1">
                            <span class="qus-option">${vs.index+1 }.${option.ocontent }</span>
                            <div>
                            	<c:if test="${question.voteNum == 0 }">
	                            	<span class="progress-bar bar1" data-width="1" style="width: 1%;"></span>
	                                <span class="progress-num">
	                                	暂无${surveyOrvote}</span>
                            	</c:if>
                            	<c:if test="${question.voteNum !=0 }">
	                            	<span class="progress-bar bar1" data-width="${option.voteNum/question.voteNum * 100}" style="width: ${option.voteNum/question.voteNum * 100 +5 }%;"></span>
	                                <span class="progress-num">
	                                ${myel:numFormat(option.voteNum/question.voteNum * 100) }%</span>
                            	</c:if>
                            </div>
                        </dd>
                        </c:forEach>
                    </dl>
                </div>
                </c:forEach>
                <div style="text-align:center">
					<span id="js_submit" onclick="back()" class="btn btn_input btn_primary"><button>关闭</button></span>
				</div>	
            </div>
        </div>
    </body>
<script type="text/javascript">
function back(){
	window.close();
}
</script>
</html>
