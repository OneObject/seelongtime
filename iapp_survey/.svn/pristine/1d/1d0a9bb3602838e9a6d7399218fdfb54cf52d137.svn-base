<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>

<table class="table table-striped table-bordered table-hover table-full-width datatable" id="sample_2">
    <thead>
        <tr>
            <th><label> <input type="checkbox" value="1" onclick="checked_all(this)" name='' />
            </label></th>
            <th>序号</th>
            <th>名称</th>
            <th>大小</th>
            <th>上传日期</th>
            <th>操作</th>
        </tr>
    </thead>
    <tbody id="tbody">
    <c:choose>
        <c:when test="${fn:length(list) eq 0 }">
            <tr><td colspan="6"> 没有相关记录！</td></tr>
        </c:when>
        <c:otherwise>
        <c:forEach var="item" items="${list }" varStatus="num">
        <tr>
            <td><label> <input type="checkbox" value="${item.id }" name='ids'/>
            </label></td>
            <td>${num.index+1 }</td>
            <td>
                <span>${ltfun:html2Text(item.name, 15)}</span>
            </td>
            <td>
                <span><fmt:formatNumber value="${item.MBSize }" pattern="#.###" type="number"/>MB</span>
            </td>
            <td>
                <span>${item.formatCreateDate }</span>
            </td>
           
            <td>
                <a href="javascript:void(0);" onclick='update("${item.id}")'><span class="mytable_btn"><i class="glyphicon glyphicon-edit"></i>&nbsp;修改</span></a>
                &nbsp;&nbsp;
                <a href="javascript:void(0);" onclick='deleteEntity("${item.id}")'><span class="mytable_btn"><i class="glyphicon glyphicon-remove"></i>&nbsp;删除</span></a>
                &nbsp;&nbsp;
            </td>
        </tr>
        </c:forEach>
        </c:otherwise>
    </c:choose>
    </tbody>
</table>

<c:set var="pager" value="${page }" scope="request"></c:set>
<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />
