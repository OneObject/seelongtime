<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>

<table class="table table-striped table-bordered table-hover table-full-width datatable" id="sample_2">
    <thead>
        <tr>
            <th>序号</th>
            <th>标题</th>
            <th>创建日期</th>
            <th>操作</th>
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
            <td>${num.index+1 }</td>
            <td>
                <span>${ltfun:html2Text(item.name, 15)}</span>
            </td>
            <td>
                <span>${ltfun:dateLongToStringFormat(item.createtime, 'yyyy-MM-dd')  }</span>
            </td>
           
            <td>
                <a href="javascript:void(0);" onclick='update("${item.id}")'><span class="mytable_btn"><i class="glyphicon glyphicon-edit"></i>&nbsp;修改</span></a>
                &nbsp;&nbsp;
                <a href="javascript:void(0);" onclick='deleteEntity("${item.id}")'><span class="mytable_btn"><i class="glyphicon glyphicon-remove"></i>&nbsp;删除</span></a>
                &nbsp;&nbsp;
                 <a href="javascript:void(0);" onclick="qrcode('<%=Constants.STUDENT_WEB_ROOT %>m/site/index/${item.id}.xhtml?fdomain=${item.domain}')">访问地址</a>
                
            </td>
        </tr>
        </c:forEach>
        </c:otherwise>
    </c:choose>
    </tbody>
</table>

<c:set var="pager" value="${page }" scope="request"></c:set>
<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />
