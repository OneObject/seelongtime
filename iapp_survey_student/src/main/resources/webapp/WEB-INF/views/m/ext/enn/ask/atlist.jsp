<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="org.apache.commons.lang.math.RandomUtils"%>

<c:if test="${empty list }">
	<div class="no-data-img"></div>
</c:if>

<c:forEach var="item" items="${list }" varStatus="v">
	
	<div class="block-group-line ${map[item.gid]=='open' ?'opened':'closed' }">
		${item.groupname }<i class="fa ${map[item.gid]=='open' ?'fa-angle-up':'fa-angle-down' }"></i>
	</div>
	
	<div class="block-friend-list" style="display: ${map[item.gid]=='open'  ?'block':'none' };">
		<c:forEach var="entity" items="${item.list }" >
			<div class="someone" data-name="${entity.name }" data-id="${entity.id }" data-href="abc">
				<span class="image">
					<img src="${basepath}/user/avatar/${entity.id}.xhtml?style=80x80&color=gray&r=<%=RandomUtils.nextInt()%>" />
				</span> <label><i
					class="fa fa-check"></i></label>
				<div>${entity.name }</div>
			</div>
		</c:forEach>
	</div>

</c:forEach>