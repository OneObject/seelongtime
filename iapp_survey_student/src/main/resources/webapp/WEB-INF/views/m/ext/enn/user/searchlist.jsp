<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="org.apache.commons.lang.math.RandomUtils"%>

<c:if test="${empty list }">
	<div class="no-data-img"></div>
</c:if>

<c:if test="${not empty list }">
<div class="block-group-line opened">
		搜索结果<i class="fa fa-angle-up"></i>
	</div>
<div class="block-friend-list" style="display: block;">
<c:forEach var="item" items="${list }" varStatus="v">
	<div class="someone" data-name="${item.name }" data-id="${item.id }" data-href="abc" onclick="toUserDetail('${item.id }');">
		<span class="image">
			<img src="${basepath}/user/avatar/${item.id}.xhtml?style=80x80&color=gray" />
		</span> <label><i class="fa fa-check"></i></label>
		<div><em class="name">${item.name }</em><em class="num">${item.username }</em></div>
	</div>
</c:forEach>
</div>
</c:if>


