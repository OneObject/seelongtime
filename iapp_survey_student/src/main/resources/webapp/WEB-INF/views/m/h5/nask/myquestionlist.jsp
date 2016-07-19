<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="org.apache.commons.lang.math.RandomUtils"%>



<c:if test="${rs.pageable.totalPages eq 0 }">
	<div class="holder-no-data">
		<img src="${basepath}/static/m_h5/nask/img/no_data.png" />
	</div>
</c:if>

<c:forEach var="item" items="${rs.data }">
	<a href="${basepath}/m/h5/nask/detail.xhtml?id=${item.id }">
		<dl class="block-my-ask">
			<dt>
				${item.title }
				<c:if test="${item.credit ne 0 }">
					<label class="coin">${item.credit }分</label>
				</c:if>
			</dt>
			<dd>
				<div class="info-show">
					<span><i class="fa fa-comment"></i>${item.answer_num }</span>
				</div>
				<label>${item.userCreated }</label>
			</dd>
		</dl>
	</a>
</c:forEach>
<script type="text/javascript">
var total = parseInt('${rs.pageable.totalPages}');
var current = parseInt('${rs.pageable.pageNumber}');
</script>
