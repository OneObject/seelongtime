<%@page import="com.longtime.app.config.Constants"%>
<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<table class="table table-striped table-bordered table-hover table-full-width" id="sample_3">
	<thead>
		<tr>
             <th>用户名</th>
	         <th>姓名</th>
	         <th>手机号码</th>
		</tr>
	</thead>
	<tbody>
	   <c:choose>
	        <c:when test="${fn:length(noJoinUserlist) eq 0 }">
	            <tr><td colspan="14"> 没有相关记录！</td></tr>
	        </c:when>
	        <c:otherwise>
	      <c:forEach var="item" items="${noJoinUserlist }" varStatus="st">
	          <tr>
	             <td>${item.username}</td>
	             <td >${item.name }</td>
	             <td >${not empty item.mobile ? item.mobile : item.temporaryMobile}</td>
	          </tr>
	       </c:forEach>
	        </c:otherwise>
	    </c:choose>
	</tbody>
</table>
<div>
<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />
</div>
