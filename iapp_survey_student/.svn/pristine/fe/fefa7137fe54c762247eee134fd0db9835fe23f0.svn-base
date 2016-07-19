<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<script type="text/javascript">
	var total = parseInt('${rs.pageable.totalPages}');
	var current = parseInt('${rs.pageable.pageNumber}');
</script>

<c:choose>
	<c:when test="${empty rs.data }">
		<div class="no-data-img"></div>
	</c:when>
	<c:otherwise>
		<c:forEach items="${rs.data }" var="item">
				<a href="${basepath }/m/ext/enn/coach/surveydetail.xhtml?surveyid=${item.id }">
			    <ul>
			        <li>对${item.touname }的评估观察</li>
			        <li><span class="name">学员：${item.touname }</span><span class="date">发布日期：${ltfun:dateLongToStringFormat(item.createtime,'yyyy-MM-dd')}</span></li>
			        <li>查看详情</li>
			    </ul>
			    <!-- new 的判断条件显示
			    <label class="new"></label> 
			    -->
			</a>
		</c:forEach>
	</c:otherwise>
</c:choose>
