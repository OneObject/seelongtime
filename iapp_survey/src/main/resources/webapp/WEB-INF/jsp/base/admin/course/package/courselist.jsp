<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
	<thead>
		<tr>
               <th><label><input type="checkbox" value="" onclick="checked_all(this)"  name='' /></label></th>
               <th>序号</th>
			   <th>课程名称</th>
               <th>课程分类</th>
		</tr>
	</thead>
	<tbody>
	          <c:if test="${empty courselist }">
                   <tr><td colspan="9"> 没有相关记录！</td></tr>
	          </c:if>
	          <c:if test="${not empty courselist}">
	          	<c:forEach items="${courselist }" var="item" varStatus="num">
			 <tr>
				<td><input name="ids" id="name_${item.id}"  value="${item.id }" type="checkbox"></td>
				<td>${num.count }</td>
				<td title="${item.name }"><span>${ltfun:html2Text(item.name, 15)}</span></td>
				<td title="${item.courseCategory.name }">${ltfun:html2Text(item.courseCategory.name, 15)}</td>
			 </tr>
		     </c:forEach>	
	          </c:if>
	</tbody>
</table>
<c:set var="pageFn" value="${pageFn}" scope="request"></c:set>
<c:set var="pager" value="${page }" scope="request"></c:set>
<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />
