<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>

<input type="hidden" id="orderField" name="orderField" value="${orderField }" >
<input type="hidden" id="orderDirection" name="orderDirection" value="${orderDirection }" >
<table class="table table-striped table-bordered table-hover table-full-width datatable" id="list_content">
    <thead>
        <tr>
            <!-- <th><label> <input type="checkbox" value="1" onclick="checked_all(this)" name='' />
            </label></th> -->
            <th>选择</th>
            <th>序号</th>
            <th>文件名</th>
            <th onclick="pageCourseware(1, 'createTime')" class="sorting<c:out value='${orderField eq "createTime" ? orderDirection:"" }' />" id="createTime">上传时间</th>
            <th onclick="pageCourseware(1, 'size')" class="sorting<c:out value='${orderField eq "size" ? orderDirection:"" }' />" id="size">文件大小</th>
            <!-- <th>操作</th> -->
        </tr>
    </thead>
    <tbody id="tbody">
    <c:choose>
        <c:when test="${fn:length(list) eq 0 }">
            <tr><td colspan="8"> 没有相关记录！</td></tr>
        </c:when>
        <c:otherwise>
        <c:forEach var="item" items="${list }" varStatus="num">
        <tr>
            <td>
                <input type="radio" name="ids" value="${item.id }" <c:out value="${item.id eq coursewareId? 'checked=checked':'' }" /> >
                <input id="name_${item.id }" value="${item.name }" type="hidden" />
                <input id="path_${item.id }" value="${item.path }" type="hidden" />
            </td>
            <td class="highlight">
                ${num.index+1 }
            </td>
            <td>
                <span title="${item.name }">${ltfun:html2Text(item.name, 15)}</span>
            </td>
            <td>
                <span>${ltfun:dateLongToStringFormat(item.createTime, 'yyyy-MM-dd HH:mm') }</span>
            </td>
            <td>
                <span>${item.sizeMb }&nbsp;Mb</span>
            </td>
            <%-- <td>
                <a href="javascript:void(0);" onclick='deleteSingle("${item.id}")'><span class="mytable_btn"><i class="glyphicon glyphicon-remove"></i>&nbsp;删除</span></a>
            </td> --%>
        </tr>
        </c:forEach>
        </c:otherwise>
    </c:choose>
    </tbody>
</table>

<c:set var="pageFn" value="pageCourseware" scope="request"></c:set>
<c:set var="pager" value="${page }" scope="request"></c:set>
<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />

<!-- <style type="text/css">
.remove_item{display:none;}
.remove_item:hover{display:none;}
</style> -->
