<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<script type="text/javascript">
	var total = parseInt('${pageable.totalPages}');
	var current = parseInt('${pageable.pageNumber}');
</script>

<c:choose>
	<c:when test="${empty list }">
		<div class="no-data-img"></div>
	</c:when>
	<c:otherwise>
		<c:forEach items="${list }" var="item">
			<c:if test="${isTeacher }">
				<a href="${basepath }/m/ext/enn/coach/guidancedetail.xhtml?id=${item.id }">
			</c:if>
			<c:if test="${not isTeacher }">
				<a href="${basepath }/m/ext/enn/coach/practicedetail.xhtml?id=${item.id }">
			</c:if>
			    <ul>
			        <li>${item.subject }</li>
			        <li><span class="name">学员：${item.uname }</span><span class="date">发布日期：${ltfun:dateLongToStringFormat(item.createtime,'yyyy-MM-dd')}</span></li>
			        <li>查看详情</li>
			    </ul>
			    <!-- new 的判断条件显示
			    <label class="new"></label> 
			    -->
			</a>
		</c:forEach>
	</c:otherwise>
</c:choose>
