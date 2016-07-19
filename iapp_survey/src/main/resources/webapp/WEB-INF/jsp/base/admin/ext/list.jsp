<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>

<table class="table table-striped table-bordered table-hover table-full-width datatable" id="sample_2">
    <thead>
        <tr>
            <th><label> <input type="checkbox" value="1" onclick="checked_all(this)" name='' />
            </label></th>
            <th>序号</th>
            <th>标题</th>
            <th>状态</th>
            <th>发布日期</th>
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
            <td><label> <input type="checkbox" value="${item.id }" name='ids'/>
            </label></td>
            <td>${num.index+1 }</td>
            <td>
                <span>${ltfun:html2Text(item.title, 15)}</span>
            </td>
            <td>
                <span>${item.releasestatus eq 0 ? '未发布':'已发布'}</span>
            </td>
            <td>
                <span>${ltfun:dateLongToStringFormat(item.releasetime, 'yyyy-MM-dd')  }</span>
            </td>
           
            <td>
                <a href="javascript:void(0);" onclick='update("${item.id}")'><span class="mytable_btn"><i class="glyphicon glyphicon-edit"></i>&nbsp;修改</span></a>
                &nbsp;&nbsp;
                <a href="javascript:void(0);" onclick='deleteEntity("${item.id}")'><span class="mytable_btn"><i class="glyphicon glyphicon-remove"></i>&nbsp;删除</span></a>
                &nbsp;&nbsp;
                <c:if test="${item.releasestatus eq 0 }">
                <a href="javascript:void(0);" onclick="release('${item.id}',1)" id="import_${item.id }"><span class="mytable_btn"><i class="glyphicon glyphicon-log-in"></i>&nbsp;发布</span></a>
            	</c:if>
            	<c:if test="${item.releasestatus eq 1 }">
                <a href="javascript:void(0);" onclick="release('${item.id}',0)" id="import_${item.id }"><span class="mytable_btn"><i class="glyphicon glyphicon-log-in"></i>&nbsp;取消发布</span></a>
            	</c:if>
            </td>
        </tr>
        </c:forEach>
        </c:otherwise>
    </c:choose>
    </tbody>
</table>

<c:set var="pager" value="${page }" scope="request"></c:set>
<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />
