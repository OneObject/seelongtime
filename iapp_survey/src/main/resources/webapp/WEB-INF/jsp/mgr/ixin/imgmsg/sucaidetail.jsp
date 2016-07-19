<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<!DOCTYPE html>
<c:if test="${empty info }">
<html lang="zh-CN">
	<head>
		<title>error</title>
	</head>
	<h1>服务器没有查找到该条记录，原因：该条记录已删除或者参数有误。</h1>
</html>
</c:if>
<c:if test="${not empty info }">
<html lang="zh-CN">
    <head>
        <title>${info.title }</title>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
        <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="format-detection" content="telephone=no">
        <link rel="stylesheet" type="text/css" href="${basepath }/static/ixin/css/weixin-client-page.css">
        <script type="text/javascript" async="" src="${basepath }/static/ixin/js/weixin-wxa-1.0.0.js"></script>
        <style>
            #nickname {
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
                max-width: 90%;
            }
            ol, ul {
                list-style-position: inside;
            }
        </style>
        <style>
            #activity-detail .page-content .text {
                font-size: 16px;
            }
        </style>
    </head>
    <body>
    <body id="activity-detail">
        <div class="page-bizinfo">
            <div class="header">
                <h1 id="activity-name">${info.title }</h1>
                <p class="activity-info">
                    <span id="post-date" class="activity-meta no-extra">
                    	<d:formatDate currentTime="${info.lastModifiDateline }" format="yyyy/MM/dd"/>
                    </span>
                    <span class="activity-meta">${info.author }</span>
                </p>
            </div>
        </div>
        <div class="page-content">
            <c:if test="${info.coverShowInText == 1 }">
            <div class="media" id="media">
                <img alt="" src="${info.filePath }">
            </div>
            </c:if>
            <div class="text">
                ${info.content }
            </div>
        </div>
    </body>
</html>

</c:if>