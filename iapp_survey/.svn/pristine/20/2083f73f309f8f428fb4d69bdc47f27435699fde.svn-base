<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>

<div class="pageHeader"style="display: none;">
	<form id="pagerForm" onsubmit="return navTabSearch(this);" action="${basepath }/remind/list.xhtml" method="post">
	<%-- <input type="hidden" name="status" value="${param.status}">
	<input type="hidden" name="keywords" value="${param.keywords}" /> --%>
	<!-- 查询条件    pageNum 必须要写，设置为1 -->
	<input type="hidden" name="pageNum" value="1" />
	<!--【可选】每页显示多少条-->
	<input type="hidden" name="numPerPage" value="${param.numPerPage}" />
	<%-- <input type="hidden" name="orderField" value="${param.orderField}" />
	<input type="hidden" name="orderDirection" value="${param.orderDirection}" /> --%>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="${basepath }/remind/toadd.xhtml" target="navTab"><span>添加</span></a></li>
			<li><a class="delete" href="${basepath }/remind/delete.xhtml?id={sid_user}" target="ajaxTodo" title="确定要删除吗?"><span>删除</span></a></li>
			<%-- <li><a class="edit" href="${basepath }/itemblank/toupdate.xhtml?id={sid_user}" target="navTab"><span>修改</span></a></li>
			<li class="line">line</li>
			<li><a class="icon" href="${basepath }/importlog/list.xhtml?" target="navTab" rel="importlog_list"><span>导入记录管理</span></a></li> --%>
			<!-- <li class="line">line</li>
			<li><a class="icon" href="demo/common/dwz-team.xls" target="dwzExport" targetType="navTab" title="实要导出这些记录吗?"><span>导出EXCEL</span></a></li> -->
		</ul>
	</div>
	<table class="table" width="100%" layoutH="75">
		<thead style="text-align: center;">
			<tr>
				<th width="60"></th>
				<th>标题</th>
				<th width="160">内容</th>
				<th width="120">图片</th>
				<th width="160">创建时间</th>
				<th width="120">域[domain]</th>
				<th width="180">类型</th>
				<th width="180">操作</th>
			</tr>
		</thead>
		<tbody style="text-align: center;">
			<c:forEach items="${rs.items }" var="item" varStatus="st">
				<tr target="sid_user" rel="${item.id }">
					<td>${st.index+1 }</td>
					<td style="text-align: left;" title="${item.title }">${item.title }</td>
					<td title="${item.content }">
					<c:if test="${fn:length(item.content) > 15}">
					${fn:substring(item.content, 0, 15)}...
					</c:if>
					<c:if test="${fn:length(item.content) <= 15}">
					${item.content }
					</c:if>
					</td>
					<td>
					<a href="${item.imgUrl }" target="_blank">${item.imgUrl }</a>
					</td>
					<td>${item.datelineFormat }</td>
					<td>
					<c:if test="${item.domain eq 'all' }">
						公共
					</c:if>
					<c:if test="${item.domain eq 'ksf' }">
						康师傅
					</c:if>
					</td>
					<td>
					<c:out value='${map[fn:trim(item.type)] }'/>
					<%-- <c:if test="${item.type == 1 }">
						新闻资讯
					</c:if>
					<c:if test="${item.type != 1 }">
						其他
					</c:if> --%>
					</td>
					<td>
						<c:if test="${item.release == 1 }">
						<a href="${basepath }/remind/release.xhtml?id=${item.id}&do=cancle" target="ajaxTodo" title="确定要取消发布吗?">取消发布</a>
						</c:if>
						<c:if test="${item.release == 0 }">
						<a href="${basepath }/remind/release.xhtml?id=${item.id}&do=goto" target="ajaxTodo" title="确定要发布吗?">发布</a>
						</c:if>
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
			<span>条，共${rs.page.total_size}条</span>
		</div>
		
		<div class="pagination" targetType="navTab" totalCount="${rs.page.total_size}" numPerPage="${rs.page.page_size}" pageNumShown="10" currentPage="${rs.page.current_page  }"></div>

	</div>
</div>
<script type="text/javascript">
	$(function(){
		$('#pagetol').val("${rs.page.page_size}");
	});
</script>