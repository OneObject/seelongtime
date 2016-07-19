<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="format-detection" content="telephone=no" />
    <title>${chose.title }</title>
    <link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/unicom/css/liantong_chose.css" />
</head>
<body>
    <header>
        <div class="title">
            ${chose.title }
        </div>
        <span class="btn-left"></span>
    </header>
    <section class="wrapper-static margin-top-45">
    	<input type="hidden" id="choseid" value="${chose.id }"/>
    	<input type="hidden" id="orderField" value="${orderField}"/>
    	<input type="hidden" id="org" value="${org}"/>
    	<input type="hidden" id="start" value="${chose.starttime }"/>
    	<input type="hidden" id="end" value="${chose.endtime}"/>
    	
        <ul class="block-drop-down">
            <li>
                <span id="btn-drop-down-1" class="btn-drop-down" data-href="drop-down-1" data-status="closed">
                    部门
                    <label></label>
                </span>
                <div class="box-drop-down" id="drop-down-1">
                	<span onclick="listByOrg('');">部门</span>
                	<c:forEach var="item" items="${orgs }">
                		 <span onclick="listByOrg('${item}');">${item }</span>
                	</c:forEach>
                </div>
            </li>
            <li>
                <span id="btn-drop-down-2" class="btn-drop-down" data-href="drop-down-2" data-status="closed">
                    <c:if test="${empty orderField || orderField eq 'default'}">默认排序</c:if>
                    <c:if test="${orderField eq 'scannum' }">人气</c:if>
                    <c:if test="${orderField eq 'praisenum' }">赞数</c:if>
                    <label></label>
                </span>
                <div class="box-drop-down" id="drop-down-2">
                    <span onclick="sortList('default')">默认排序</span>
                    <span onclick="sortList('scannum')">人气</span>
                    <span onclick="sortList('praisenum')">赞数</span>
                </div>
            </li>
        </ul>
        <div class="block-list" id="block-list">
        	<section class="loading" id="loading" class="loading">
				<i class="fa fa-spinner fa-spin"></i>
			</section>
        </div>
        <div class="time-info">
            活动时间：1月22日 16:00-1月27日 24:00
            <%-- <c:if test="${ chose.starttime == 0}">
            	不限
            </c:if>
            <c:if test="${ chose.starttime != 0}">
            	${ltfun:dateLongToStringFormat(chose.starttime,'yyyy-MM-dd') }
            </c:if>
             ~
             <c:if test="${ chose.endtime == 0}">
            	不限
            </c:if>
            <c:if test="${ chose.endtime != 0}">
            	${ltfun:dateLongToStringFormat(chose.endtime,'yyyy-MM-dd') }
            </c:if>  --%>
        </div>
        <div class="contact-info">
            联系人：王斯多
        </div>
        <div class="contact-info">
            邮箱：wangsd71@chinaunicom.cn
        </div>
        <!--
        <div class="contact-info">
            手机：18601721901
        </div>
        -->
         
        
    </section>
    <script type="text/javascript" src="${basepath}/static/m_h5/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="${basepath}/static/m/ext/unicom/js/module.js"></script>
    <script type="text/javascript" src="${basepath}/static/m/ext/unicom/js/chose/index.js?v=1"></script>
    
</body>
</html>