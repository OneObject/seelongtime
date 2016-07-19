<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>

<input type="hidden" id="orderField" name="orderField" value="${orderField }" >
<input type="hidden" id="orderDirection" name="orderDirection" value="${orderDirection }" >
<table class="table table-striped table-bordered table-hover table-full-width datatable" id="sample_2">
    <thead>
        <tr>
            <th>
                <input type="checkbox" onclick="checked_all_users(this)">
            </th>
            <th>序号</th>
            <th onclick="pageForChooseUser(1, 'username')" class="sorting<c:out value='${orderField eq "username" ? orderDirection:"" }' />" id="username">用户名</th>
            <th>昵称</th>
            <th>部门</th>
        </tr>
    </thead>
    <tbody id="tbodys">
    <c:choose>
        <c:when test="${empty list }">
            <tr><td colspan="5">没有查询到记录！</td></tr>
        </c:when>
        <c:otherwise>
		    <c:forEach items="${list }" var="user" varStatus="state">
		        <tr>
		            <td>
		                <c:if test="${fn:containsIgnoreCase(userIds, user.id)}">
		                    <input type="checkbox" name="uids" value="${user.id }" checked="checked" onclick="javascript:onSave()">
		                </c:if>
		                <c:if test="${!fn:containsIgnoreCase(userIds, user.id)}">
		                    <input type="checkbox" name="uids" value="${user.id }" onclick="javascript:onSave()">
		                </c:if>
		            </td>
		            <td>
		                <span>${state.count }</span>
		            </td>
		            <td>
		                <span>${user.username }</span>
		            </td>
		            <td>
		                <span>${user.nickName }</span>
		            </td>
		            <td>
		                <span>${user.organization.name }</span>
		            </td>
		        </tr>
		    </c:forEach>
        </c:otherwise>
    </c:choose>
    </tbody>
</table>

<c:set var="pageFn" value="pageForChooseUser" scope="request"></c:set>
<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />
