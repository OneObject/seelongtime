<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<c:forEach var="taskVo" items="${tasks}">
	<div class="list clear" onclick="goto('${basepath}/m/ext/enn/xw/taskupdate.xhtml?tuid=${taskVo.tuid }')">
		<div class="text fl">${taskVo.name }</div>
		<div class="fr">
			<i class="fa icon-angle-right"></i>
		</div>
		<div class="over fr">
			<c:if test="${taskVo.process==3 }">已完成</c:if>
			<c:if test="${taskVo.process<3 }">${taskVo.process }/3</c:if>
		</div>
	</div>
</c:forEach>
<script type="text/javascript" src="${basepath}/static/m/ext/enn/js/common.js"></script>