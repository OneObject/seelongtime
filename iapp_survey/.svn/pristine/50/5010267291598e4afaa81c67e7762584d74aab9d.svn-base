<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>

<input type="hidden" name="type" id="type" value="" />
<input type="hidden" name="idsStr" id="idsStr" value="${idsStr }" />
<input type="hidden" name="namesStr" id="namesStr" value="${namesStr }" />

<input type="hidden" id="orderField" name="orderField" value="${orderField }" >
<input type="hidden" id="orderDirection" name="orderDirection" value="${orderDirection }" >
<table class="table table-striped table-bordered table-hover table-full-width datatable" id="sample_2">
    <thead>
        <tr>
            <th style="width: 20px;"><label><input type="checkbox" value="1" onclick="itemSelectAll()" style="width: 20px;" name='' id="itemSelectAll" /></label></th>
            <th>序号</th>
            <th>题库名称</th>
            <th onclick="page(1, 'entityMetaInfo.dateCreated')" class="sorting<c:out value='${orderField eq "entityMetaInfo.dateCreated" ? orderDirection:"" }' />" id="entityMetaInfo.dateCreated">创建时间</th>
            <th>创建人</th>
            <th onclick="page(1, 'entityMetaInfo.dateLastModified')" class="sorting<c:out value='${orderField eq "entityMetaInfo.dateLastModified" ? orderDirection:"" }' />" id="entityMetaInfo.dateLastModified">修改时间</th>
            <th>修改人</th>
        </tr>
    </thead>
    <tbody id="tbody">
    <c:choose>
        <c:when test="${fn:length(list) eq 0 }">
            <tr><td colspan="7"> 没有相关记录！</td></tr>
        </c:when>
        <c:otherwise>
        <c:forEach var="item" items="${list }" varStatus="num">
        <tr>
            <td>
	            <label>
	                <c:if test="${fn:contains(idsStr, item.id)}">
	                    <input name="ids" type="checkbox" value="${item.id}" checked="checked" style="width: 20px;" onclick="onSave();">
	                </c:if> 
	                <c:if test="${!fn:contains(idsStr, item.id)}">
	                    <input name="ids" type="checkbox" value="${item.id}" style="width: 20px;" onclick="onSave();">
	                </c:if> 
	            </label>
            </td>
            <td>${num.index+1 }</td>
            <td>
                <span id="name_${item.id }" title="${item.name }">${ltfun:html2Text(item.name, 15)}</span>
            </td>
            <td>
                <span>${ltfun:dateLongToStringFormat(item.entityMetaInfo.dateCreated, 'yyyy-MM-dd HH:mm') }</span>
            </td>
            <td>
                <span>${item.entityMetaInfo.userCreated }</span>
            </td>
            <td>
                <span>${ltfun:dateLongToStringFormat(item.entityMetaInfo.dateLastModified, 'yyyy-MM-dd HH:mm') }</span>
            </td>
            <td>
                <span>${item.entityMetaInfo.userLastModified}</span>
            </td>
        </tr>
        </c:forEach>
        </c:otherwise>
    </c:choose>
    </tbody>
</table>

<c:set var="pageFn" value="pageItemblank" scope="request"></c:set>
<c:set var="pager" value="${page }" scope="request"></c:set>
<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />
