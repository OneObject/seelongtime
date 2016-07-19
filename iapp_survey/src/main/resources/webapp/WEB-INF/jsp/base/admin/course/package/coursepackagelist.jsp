<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
	<thead>
		<tr>
               <%-- <th><label><input type="checkbox" value="" onclick="checked_all(this)" name='' /></label></th> --%>
               <th>序号</th>
			   <th>课程名称</th>
               <th>课程简介</th>
               <th>操作</th>
		</tr>
	</thead>
	<tbody>
	          <c:if test="${empty coursepackagelist}">
                   <tr><td colspan="9"> 没有相关记录！</td></tr>
	          </c:if>
	          <c:if test="${not empty coursepackagelist}">
	          <c:forEach items="${coursepackagelist }" var="item" varStatus="num">
			<tr>
				<%-- <td><input name="ids" value="${item.id }" type="checkbox"></td> --%>
				<td>${num.count }</td>
				<td   title="${item.name }"><span>${item.name}</span></td>
				<td title="${item.descript}">${ltfun:html2Text(item.descript,64)}</td>
				<td>
                 <a class="" onclick='deleteSingle("${item.id}")' href="javascript:void(0)"><span>&nbsp;删除</span></a>
				</td>
			</tr>
			<input type="hidden" name="chooseids" value="${item.courseid}"/>
		   </c:forEach>
	          </c:if>
	</tbody>
</table>
<c:set var="pager" value="${page}" scope="request"></c:set>
<c:set var="pageFn" value="${pageFn}" scope="request"></c:set>
<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />
