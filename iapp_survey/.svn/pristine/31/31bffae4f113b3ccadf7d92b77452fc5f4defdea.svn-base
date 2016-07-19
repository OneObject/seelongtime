<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>

<input type="hidden" id="orderField" name="orderField" value="${orderField }" >
<input type="hidden" id="orderDirection" name="orderDirection" value="${orderDirection }" >
<table class="table table-striped table-bordered table-hover table-full-width datatable" id="sample_2" style="text-align: left !important;">
    <thead>
        <tr>
            <th>序号</th>
            <th>名称</th>
            <th>关键字</th>
            <th>完全匹配</th>
            <th>消息类型</th>
            <%-- <th>回复全部</th> --%>
            <th>创建时间</th>
            <th>操作</th>
        </tr>
    </thead>
    <tbody id="tbody">
    <c:choose>
        <c:when test="${empty list }">
            <tr><td colspan="7"> 没有相关记录！</td></tr>
        </c:when>
        <c:otherwise>
        <c:forEach var="item" items="${list }" varStatus="num">
        <tr>
            <td>${num.index+1 }</td>
            <td>
                <span id="name_${item.id }" title="${item.name }">${ltfun:html2Text(item.name, 15)}</span>
            </td>
            <td>
                <span title="${item.keywords }">${ltfun:html2Text(item.keywords, 15)}</span>
            </td>
            <td>
                <c:if test="${item.matchAll == 1 }">是</c:if>
                <c:if test="${item.matchAll != 1 }">否</c:if>
            </td>
            <td>
                <c:if test="${item.type eq '0' }">图文素材</c:if>
                <c:if test="${item.type eq '1' }">文字消息</c:if>
            </td>
            <%-- <td>
                <c:if test="${item.responseAll == 1 }">是</c:if>
                <c:if test="${item.responseAll != 1 }">否</c:if>
            </td> --%>
            <td>
                ${ltfun:dateLongToStringFormat(item.createTime, 'yyyy-MM-dd') }
            </td>
            <td>
                <%-- <a href="javascript:void(0);" onclick=''><span class="mytable_btn"><i class="glyphicon glyphicon-link"></i>&nbsp;图文消息</span></a>&nbsp;&nbsp; --%>
                <a href="javascript:void(0);" onclick='detailEntity("${item.id}")'><span class="mytable_btn"><i class="glyphicon glyphicon-eye-open"></i>&nbsp;详情</span></a>&nbsp;&nbsp;
              	<ltacl:datactl creatoruid="${item.creater }">  
              <a href="javascript:void(0);" onclick='updateEntity("${item.id}")'><span class="mytable_btn"><i class="glyphicon glyphicon-edit"></i>&nbsp;编辑</span></a>&nbsp;&nbsp;
              <a href="javascript:void(0);" onclick='deleteSingle("${item.id}")'><span class="mytable_btn"><i class="glyphicon glyphicon-remove"></i>&nbsp;删除</span></a>&nbsp;&nbsp;
                </ltacl:datactl>
            </td>
        </tr>
        </c:forEach>
        </c:otherwise>
    </c:choose>
    </tbody>
</table>
<jsp:include page="/WEB-INF/jsp/mgr/ixin/include/pager.jsp" />
