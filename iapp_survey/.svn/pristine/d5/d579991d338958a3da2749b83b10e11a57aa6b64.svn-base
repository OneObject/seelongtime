<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
	<thead>
		<tr>
               <th>序号</th>
			   <th>标题</th>
               <th>操作</th>
		</tr>
	</thead>
	<tbody>
	    <c:if test="${empty items }">
	    	<tr>
	    		<td colspan="3">暂无数据</td>
	    	</tr>
	    </c:if>
	   <c:forEach items="${items }" var="item" varStatus="vs">
	   		<tr align="left">
	   			<td>${vs.index+1 }</td>
	   			<td>${item.resname }</td>
	   			<td >
	   				<a href="javascript:void(0);" onclick="submitDel('${item.id}');">删除</a>
	   			</td>
	   		</tr>
	   		<input type="hidden" name="chooseids" value="${item.resid}" >
	   </c:forEach>
	</tbody>
</table>
<%--
<c:set var="pageFn" value="doItemPage" scope="request"></c:set>
<div>
<jsp:include page="/WEB-INF/jsp/mgr/ixin/include/pager.jsp"></jsp:include>
</div>
 --%>