<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="org.apache.commons.lang.math.RandomUtils"%>


<c:if test="${rs.pageable.totalPages eq 0  or empty rs}">
<div class="holder-no-data">
<img src="${basepath}/static/m_h5/nask/img/no_data.png" />
</div>
</c:if>

<c:forEach var="item" items="${rs.data }">
<a href="${basepath}/m/h5/nask/detail.xhtml?id=${item.id }">
<ul class="block-ask">
	<li><span class="date">${item.userCreated }</span> <label
		class="image">
					<c:choose>
							<c:when test="${item.anonymous eq 0}">
							
								<img src="${basepath}/user/avatar/${item.author_id}.xhtml?style=80x80&color=gray&r=<%=RandomUtils.nextInt()%>" />
							
							</c:when>
							
							<c:otherwise>
							
								<img src="${basepath}/static/m_h5/nask/img/niming.png" />
							
							</c:otherwise>
						
						</c:choose>
		
		</label>
		<div class="from">
			来自<label class="set-color">${item.anonymous eq 0 ? item.author_name :'匿名' }</label>
		</div></li>
	<li>${item.title }
		<c:if test="${item.credit ne 0 }">
		<label class="coin">${item.credit }分</label>
		</c:if>
	</li>
	<c:if test="${item.is_set_best_answer eq 1 }">
	<li><label class="star set-bg-color">${ajy:praiseTotal(item.best_aid,3)}</label>
		<div class="intro">
			${item.answer }
		</div></li>
	</c:if>
</ul>
</a>
</c:forEach>

<script type="text/javascript">
var total = parseInt('${rs.pageable.totalPages}');
var current = parseInt('${rs.pageable.pageNumber}');
</script>

