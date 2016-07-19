<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>

<input type="hidden" id="orderField" name="orderField" value="${orderField }" >
<input type="hidden" id="orderDirection" name="orderDirection" value="${orderDirection }" >
<table class="table table-striped table-bordered table-hover table-full-width datatable" id="sample_1">
    <thead>
        <tr>
            <th>序号</th>
            <th>角色名称</th>
            <th>角色说明</th>
            <th onclick="page(1, 'createDate')" class="sorting<c:out value='${orderField eq "createDate" ? orderDirection:"" }' />" id="createDate">创建时间</th>
            <th onclick="page(1, 'updateDate')" class="sorting<c:out value='${orderField eq "updateDate" ? orderDirection:"" }' />" id="updateDate">最后更新</th>
            <th>操作</th>
        </tr>
    </thead>
    <tbody id="tbody">
        <c:choose>
            <c:when test="${empty list }">
                <tr><td colspan="6">没有查询到记录！</td></tr>
            </c:when>
            <c:otherwise>
			    <c:forEach items="${list }" var="entity" varStatus="state">
			    <tr>
		            <td>${state.count }</td>
		            <td title="${entity.name }">${ltfun:html2Text(entity.name, 15)}</td>
		            <td title="${entity.remark }">${ltfun:html2Text(entity.remark, 15)}</td>
		            <td>${ltfun:dateLongToStringFormat(entity.createDate, 'yyyy-MM-dd HH:mm') }</td>
		            <td>${ltfun:dateLongToStringFormat(entity.updateDate, 'yyyy-MM-dd HH:mm') }</td>
		            <td>
		                <span class="anniu" onclick="update_role('${entity.id}')">
		                    <i class="icon-edit"></i>编辑
		                </span>
		                <span class="anniu" onclick="user_role('${entity.id}')">
		                    <i class="icon-user"></i>成员
		                </span>
		                <span class="anniu" onclick="update_permission('${entity.id}')">
		                    <i class="icon-foursquare"></i>权限
		                </span>
		                <span class="anniu" onclick="delete_role('${entity.id}')">
		                    <i class="icon-remove"></i>删除
		                </span>
		            </td>
		        </tr>
			    </c:forEach>
            </c:otherwise>
        </c:choose>
    </tbody>
</table>

<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />
