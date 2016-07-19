<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>

<div class="pageHeader"style="display: none;">
	<form id="pagerForm" onsubmit="return navTabSearch(this);" action="${basepath }/mobile/versionList.xhtml" method="post">
	<%-- <input type="hidden" name="status" value="${param.status}">
	<input type="hidden" name="keywords" value="${param.keywords}" /> --%>
	<!-- 查询条件    pageNum 必须要写，设置为1 -->
	<input type="hidden" name="pageNum" value="1" />
	<!--【可选】每页显示多少条-->
	<input type="hidden" name="numPerPage" value="${param.numPerPage}" />
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="${basepath }/mobile/toadd.xhtml" target="navTab"><span>添加</span></a></li>
			<li><a class="delete" href="${basepath }/mobile/delete.xhtml?id={mobile}" target="ajaxTodo" title="确定要删除吗?"><span>删除</span></a></li>
			<li><a class="edit" href="${basepath }/mobile/toupdate.xhtml?id={mobile}" target="navTab"><span>修改</span></a></li>
			<li class="line">line</li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="74">
		<thead style="text-align: center;">
			<tr>
				<th width="60"></th>
				<th>更新路径</th>
				<th width="160">设备</th>
				<th width="120">版本</th>
				<th width="120">域</th>
				<th width="160">能否继续使用</th>
			</tr>
		</thead>
		<tbody style="text-align: center;">
			<c:forEach items="${rs.items }" var="item" varStatus="st">
				<tr target="mobile" rel="${item.id }">
					<td>${st.index+1 }</td>
					<td style="text-align: left;">${item.downloadPath }</td>
					<td>${item.device}</td>
					<td>${item.version }</td>
					<td>${item.domain }</td>
					<td>
						<c:if test="${item.canUser==1 }">可以</c:if>
						<c:if test="${item.canUser==0 }">不可以</c:if>
					</td>
				</tr>
			</c:forEach>	
		</tbody>
	</table>
	<div class="panelBar">
		<div class="pages">
			<span>显示</span>
			<select id="pagetol" class="combox" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
				<option value="20">20</option>
				<option value="50">50</option>
				<option value="100">100</option>
				<option value="200">200</option>
			</select>
			<span>条，共${totalCount}条</span>
		</div>
		
		<div class="pagination" targetType="navTab" totalCount="${totalCount}" numPerPage="${pageSize}" pageNumShown="10" currentPage="${pageNum }"></div>

	</div>
</div>
<script type="text/javascript">
	$(function(){
		$('#pagetol').val("${pageSize}");
	});
</script>