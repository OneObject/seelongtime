<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>

<div class="pageHeader"style="height: 50px;">
	<form id="pagerForm" onsubmit="return navTabSearch(this);" action="${basepath }/auth/detail.xhtml" method="post">
	<!-- 查询条件    pageNum 必须要写，设置为1 -->
	<input type="hidden" name="pageNum" value="1" />
	<!--【可选】每页显示多少条-->
	<input type="hidden" name="numPerPage" value="${param.numPerPage}" />
	<input type="hidden" name="orderField" value="${param.orderField}" />
	<input type="hidden" name="orderDirection" value="${param.orderDirection}" />
	<input type="hidden" name="sid" value="${sid}" />
	<input type="hidden" name="category" value="${category}" />
	<input type="hidden" name="type" value="${type}" />
	
	<div>
		<c:if test="${type eq '0' }">
			<span>用户授权</span>
			<a  target="navTab" href="${basepath }/auth/detail.xhtml?sid=${sid}&category=${category}&type=1">
				组织授权
			</a>
		</c:if>
		<c:if test="${type eq '1' }">
			<a target="navTab" href="${basepath }/auth/detail.xhtml?sid=${sid}&category=${category}&type=0">
				<span>用户授权</span>
			</a>
			<span>组织授权</span>
		</c:if>
	</div>
	
	<div class="searchBar">
		<table class="searchContent" style="padding-top: 8px;">
			<tr>
				<td>
					<c:if test="${type eq '0' }">用户姓名：</c:if>
					<c:if test="${type eq '1' }">组织名称：</c:if>
					<input type="text" name="rname" value="${rname}"/>
				</td>
				<td>
					<div class="buttonActive" style="line-height: "><div class="buttonContent"><button type="submit">检索</button></div></div>
				</td>
			</tr>
		</table>
	</div>
	</form>
</div>

<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="${basepath }/auth/toadd.xhtml" target="navTab"><span>添加授权对象</span></a></li>
			<li><a class="delete" href="${basepath }/examination/delete.xhtml?id={sid_user}" target="ajaxTodo" title="确定要删除吗?"><span>删除</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="60">序号</th>
				<th>
					<c:if test="${type eq '0' }">用户姓名</c:if>
					<c:if test="${type eq '1' }">组织姓名</c:if>
				</th>
			</tr>
		</thead>
		<tbody style="text-align: center;">
			<c:if test="${empty list }">
				<tr>
					<td colspan="2" align="center">暂无授权信息！</td>
				</tr>
			</c:if>
			<c:forEach items="${list }" var="entity" varStatus="st">
				<tr target="sid_user" rel="${entity.id }">
					<td>${st.index+1 }</td>
					<td style="text-align: left;">${entity.rname }</td>
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
	})
</script>