<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>


<c:if test="${not empty list}">
	<table>
		<tbody>
			<tr>
				<td>版本</td>
				<td>时间</td>
				<td>详情</td>
			</tr>
			<c:forEach var="item" items="${list}">
				<tr>
					<td style="width: 33%">${item.no }</td>
					<td style="width: 33%">${ltfun:dateLongToStringFormat(item.timestamp,'yyyy/MM/dd') }</td>
					<td style="width: 34%"><span data-value="${empty item.content? '无内容':item.content }" data-title="${item.no}" class="view-detail"  onclick="viewDetail(this);">查看</span></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</c:if>

<c:if test="${empty list}">
	无版本记录
</c:if>


<script type="text/javascript">
var historytotal = parseInt('${total}');
</script>
