<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>

<%-- <input type="hidden" id="orderField" name="orderField" value="${orderField }" >
<input type="hidden" id="orderDirection" name="orderDirection" value="${orderDirection }" > --%>
<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
	<thead>
		<tr>
              	<th>序号</th>
				<th>视频名称</th>
				<th>时长</th>
				<th>name</th>
				<th>desp</th>
				<th>size</th>
				<th>token</th>
				<th>videoid</th>
				<th>status</th>
				<th>posterURL</th>
				<th>type</th>
				<th>recommendrank</th>
				<th>domain</th>
				<th>source</th>
				<th>sourceURL</th>
				<th>mp4downloadurl</th>
				<th>mp4time</th>
				<th>isrelease</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${empty rs.items }">
			<tr><td colspan="9"> 没有相关记录！</td></tr>
		</c:if>
		<c:forEach items="${rs.items }" var="item" varStatus="num">
			<tr>
					<td>${num.count }</td>
					<td style="text-align: left;">${item.displayName }</td>
					<td style="text-align: left;">${item.duration }</td>
					<td>${item.name }</td>
					<td>${item.desp }</td>
					<td>${item.size }</td>
					<td>${item.token }</td>
					<td>${item.videoid }</td>
					<td>${item.status }</td>
					<td>${item.posterURL }</td>
					<td>${item.type }</td>
					<td>${item.recommendrank }</td>
					<td>${item.domain }</td>
					<td>${item.source }</td>
					<td>${item.sourceURL }</td>
					<td>${item.mp4downloadurl }</td>
					<td>${item.mp4time }</td>
					<td>${item.isrelease }</td>
			</tr>
		</c:forEach>	
	</tbody>
</table>

<c:set var="pager" value="${rs.page }" scope="request"></c:set>
<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />
