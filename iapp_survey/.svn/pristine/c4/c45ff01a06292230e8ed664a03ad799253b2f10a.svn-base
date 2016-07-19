<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>



<form id="pagerForm" action="${basepath }/itemblank/chooseList.xhtml">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${model.numPerPage}" />
	<input type="hidden" name="orderField" value="${param.orderField}" />
	<input type="hidden" name="orderDirection" value="${param.orderDirection}" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" method="post" action="${basepath }/itemblank/chooseList.xhtml" onsubmit="return dwzSearch(this, 'dialog');">
	<div class="searchBar">
		<ul class="searchContent">
			<li>
				题库名称:
				<input class="textInput" name="name" value="${param.name }" type="text">
			</li>	  
			
			
		</ul>
		
		<div class="subBar">
			<ul>
				
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
			</ul>
		</div>
	</div>
	</form>
</div>
<div class="pageContent">

	<table class="table" layoutH="118" targetType="dialog" width="100%">
		<thead>
			<tr>
				<th></th>
				<th orderfield="name">题库名称</th>
				<th orderField="dateCreated" class='<c:out value="${empty dateCreated_s?'desc':'asc' }"/>'>创建时间</th>
				<th>创建人</th>
				<th orderField="dateLastModified" class='<c:out value="${empty dateLastModified_s?'desc':'asc' }"/>'>修改时间</th>
				<th>修改人</th>
				<th width="80">查找带回</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${itemblanks }" var="item" varStatus="st">
				<tr>
					<td>${st.index+1 }</td>
					<td style="text-align: left;" title="${item.name }">${item.name }</td>
                    <td>${ltfun:dateLongToStringFormat(item.entityMetaInfo.dateCreated, 'yyyy-MM-dd HH:mm') }</td>
					<td>${item.entityMetaInfo.userCreated }</td>
                    <td>${ltfun:dateLongToStringFormat(item.entityMetaInfo.dateLastModified, 'yyyy-MM-dd HH:mm') }</td>
					<td>${item.entityMetaInfo.userLastModified}</td>
					<td>
						<a class="btnSelect" href="javascript:$.bringBack({id:'${item.id }', name:'${item.name }'})" title="查找带回" >选择</a>
					</td>
				</tr>
			</c:forEach>	
		</tbody>
	</table>

	<div class="panelBar">
		<div class="pages">
			<span>每页</span>

			<select name="numPerPage" onchange="dwzPageBreak({targetType:dialog, numPerPage:'10'})">
				<option value="10" selected="selected">10</option>
				<option value="20">20</option>
				<option value="50">50</option>
				<option value="100">100</option>
			</select>
			<span>条，共${totalCount}条</span>
		</div>
		<div class="pagination" targetType="dialog" totalCount="2" numPerPage="10" pageNumShown="1" currentPage="1"></div>
	</div>
</div>