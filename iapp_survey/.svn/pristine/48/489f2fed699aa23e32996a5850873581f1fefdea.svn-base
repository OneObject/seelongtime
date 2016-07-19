<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>

<input type="hidden" id="orderField" name="orderField" value="${orderField }" >
<input type="hidden" id="orderDirection" name="orderDirection" value="${orderDirection }" >
<table class="table table-striped table-bordered table-hover table-full-width datatable" id="sample_2">
    <thead>
        <tr>
            <th width="5%">序号</th>
            <th width="10%">用户名</th>
            <th width="8%">用户姓名</th>
            <th width="20%">部门</th>
            <th width="5%">IP数</th>
            <th width="22%">详情</th>
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
                <span >${item.username }</span>
            </td>
             <td>
                <span >${item.name }</span>
            </td>
             <td>
                <span >${item.oname }</span>
                
            </td>
             <td>
                <span >${item.num }</span>
            </td>
             <td>
             	<c:forEach  var="info" items="${item.info }" varStatus="i">
             	<span>[${ltfun:dateLongToStringFormat(info.t ,'yyyy-MM-dd HH:mm') }] &nbsp; ${info.ip }</span>
             	<span>&nbsp; <a href="https://www.baidu.com/s?wd=${info.ip}" target="_blank">搜索</a></span><br>
             	</c:forEach>
                
            </td>
       <%--      <td>
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
            </td> --%>
        
        </tr>
        </c:forEach>
        </c:otherwise>
    </c:choose>
    </tbody>
</table>

<c:set var="pager" value="${page }" scope="request"></c:set>
<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />
