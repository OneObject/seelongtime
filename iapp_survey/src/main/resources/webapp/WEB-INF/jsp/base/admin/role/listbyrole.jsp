<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>

<input type="hidden" id="orderField" name="orderField" value="${orderField }" >
<input type="hidden" id="orderDirection" name="orderDirection" value="${orderDirection }" >
<table class="table table-striped table-bordered table-hover table-full-width datatable" id="sample_2">
    <thead>
        <tr>
            <th>
                <input type="checkbox" onclick="checked_all_ur(this)">
            </th>
            <th>序号</th>
            <th onclick="page(1, 'userId.username')" class="sorting<c:out value='${orderField eq "userId.username" ? orderDirection:"" }' />" id="userId.username">用户名</th>
            <th>用户昵称</th>
            <th>操作</th>
        </tr>
    </thead>
    <tbody id="tbody"> 
        <c:choose>
            <c:when test="${empty list }">
                <tr><td colspan="5">没有查询到记录！</td></tr>
            </c:when>
	        <c:otherwise>
		     <c:forEach items="${list }" var="entity" varStatus="state">
		        <tr>
		            <td>
		                <input type="checkbox" name="ids" value="${entity.id }">
		            </td>
		            <td>${state.count }</td>
                    <td title="${entity.userId.username }">${ltfun:html2Text(entity.userId.username, 15)}</td>
                    <td title="${entity.userId.nickName }">${ltfun:html2Text(entity.userId.nickName, 15)}</td>
		            <td>
		                <span class="anniu" onclick="user_role_delete('${entity.id }')">
		                    <i class="icon-remove"></i>移除
		                </span>
		            </td>
		        </tr>
		     </c:forEach>
	        </c:otherwise>
        </c:choose>
    </tbody>
</table>

<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />
