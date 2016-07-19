<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<%@page language="java" import="com.longtime.app.config.Constants"%>
<input type="hidden" id="orderField" name="orderField"
	value="${orderField }">
<input type="hidden" id="orderDirection" name="orderDirection"
	value="${orderDirection }">
<table
	class="table table-striped table-bordered table-hover table-full-width datatable"
	id="sample_2">
	<thead>
		<tr>
			<th><label>
			<input type="checkbox" value="1" onclick="checked_all(this)"
				style="width: 20px" name='' /></label>
				</th>
			<th>序号</th>
			<th>题库名称</th>
			<th onclick="page(1, 'entityMetaInfo.dateCreated')"
				class="sorting<c:out value='${orderField eq "entityMetaInfo.dateCreated" ? orderDirection:"" }' />"
				id="entityMetaInfo.dateCreated">创建时间</th>
			<th>创建人</th>
			<th onclick="page(1, 'entityMetaInfo.dateLastModified')"
				class="sorting<c:out value='${orderField eq "entityMetaInfo.dateLastModified" ? orderDirection:"" }' />"
				id="entityMetaInfo.dateLastModified">修改时间</th>
			<th>修改人</th>
		</tr>
	</thead>
	<tbody id="tbody">
		<c:choose>
			<c:when test="${fn:length(list) eq 0 }">
				<tr>
					<td colspan="8">没有相关记录！</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="item" items="${list }" varStatus="num">
					<tr>
						<td>
						<label>
						<input type="checkbox" value="${item.id }" name='ids' data-name="${item.name }"
							style="width: 20px" />
							</label>
							</td>
						<td>${num.index+1 }</td>
						<td><span id="name_${item.id }" title="${item.name }">${ltfun:html2Text(item.name,
								15)}</span></td>
						<td><span>${ltfun:dateLongToStringFormat(item.entityMetaInfo.dateCreated,
								'yyyy-MM-dd HH:mm') }</span></td>
						<td><span>${item.entityMetaInfo.userCreated }</span></td>
						<td><span>${ltfun:dateLongToStringFormat(item.entityMetaInfo.dateLastModified,
								'yyyy-MM-dd HH:mm') }</span></td>
						<td><span>${item.entityMetaInfo.userLastModified}</span></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>
<script type="text/javascript">
	/**
	 * 全部选中
	 */
	function checked_all(obj) {
		if ($(obj).attr("checked") == "checked") {
			$("input[name='ids']").each(function() {
				$(this).attr("checked", "checked");
				$(this).parent().addClass("checked");
			});
		} else {
			$("input[name='ids']").each(function() {
				$(this).removeAttr("checked");
				$(this).parent().removeClass("checked");
			});
		}
	}
</script>

<c:set var="pager" value="${page }" scope="request"></c:set>
<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />
