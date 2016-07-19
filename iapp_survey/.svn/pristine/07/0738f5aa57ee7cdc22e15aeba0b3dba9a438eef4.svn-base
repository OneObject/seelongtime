<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>

<input type="hidden" id="orderField" name="orderField" value="${orderField }" >
<input type="hidden" id="orderDirection" name="orderDirection" value="${orderDirection }" >
<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
	<thead>
		<tr>
            <th>选择</th>
            <th>序号</th>
			<th>视频名称</th>
			<th>时长</th>
			<th>文件大小</th>
			<th>创建时间</th>
		</tr>
	</thead>
	<tbody>
	    <c:choose>
	          <c:when test="${empty rs.items }">
                   <tr><td colspan="9"> 没有相关记录！</td></tr>
	          </c:when>
	          <c:otherwise>
	          </c:otherwise>
	    </c:choose>
		<c:forEach items="${rs.items }" var="item" varStatus="num">
			<tr>
				<td>
	                <input type="radio" name="ids" value="${item.id }" <c:out value="${item.id eq coursewareId? 'checked=checked':'' }" /> >
	                <input id="name_${item.id }" value="${item.name }" type="hidden" />
           		</td>
				<td>${st.index+1 }</td>
				<td style="text-align: left;">${item.displayName }</td>
				<td style="text-align: left;">${item.duration }</td>
				<td style="text-align: left;">${item.size }</td>
				<td style="text-align: left;">${item.formatCreateDate }</td>
			</tr>
		</c:forEach>	
	</tbody>
</table>
<c:set var="pageFn" value="pageCourseware" scope="request"></c:set>
<c:set var="pager" value="${rs.page }" scope="request"></c:set>
<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />
