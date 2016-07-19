<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>

<input type="hidden" id="orderField" name="orderField" value="${orderField }" >
<input type="hidden" id="orderDirection" name="orderDirection" value="${orderDirection }" >
<span class="btn btn-success table_add"  onclick="exportExamResult();" style="margin-right: 0px">
           <i class="glyphicon glyphicon-plus"></i>导出考试结果
</span>
<table class="table table-striped table-bordered table-hover table-full-width datatable" id="sample_2">
    <thead>
        <tr>
            <th>序号</th>
            <th>用户名</th>
            <th>姓名</th>
            <th onclick="page(1, 'score')" class="sorting<c:out value='${orderField eq "score" ? orderDirection:"" }' />" id="score">最高得分</th>
            <th onclick="page(1, 'status')" class="sorting<c:out value='${orderField eq "status" ? orderDirection:"" }' />" id="status">通过状态</th>
            <th>参加次数&nbsp;/&nbsp;总共可参加次数</th>
            <th>操作</th>
        </tr>
    </thead>
    <tbody id="tbody">
    <c:choose>
        <c:when test="${fn:length(list) eq 0 }">
            <tr><td colspan="7"> 没有相关记录！</td></tr>
        </c:when>
        <c:otherwise>
        <c:forEach var="item" items="${list }" varStatus="st">
             <tr>
                 <td>${st.index+1 }</td>
                 <td>${item.loginname }</td>
                 <td>${item.name }</td>
                 <td>${item.score }</td>
                 <td>
                     <c:if test="${item.status==0 }">未通过</c:if>
                     <c:if test="${item.status==1 }">通过</c:if>
                     <c:if test="${item.status==2 }">阅卷中</c:if>
                 </td>
                 <td>${item.test_times }&nbsp;/&nbsp;<c:out value="${item.total_times==0? '不限':item.total_times }"></c:out></td>
                 <td>
                     <a href="${basepath }/base/admin/itest/examination/testeepapercon.xhtml?tid=${item.test_id}&uid=${item.uid}">考试详情</a>
                 </td>
             </tr>
        </c:forEach>
        </c:otherwise>
    </c:choose>
    </tbody>
</table>
<script>

function pagelisttestee(index){
	page(index);
}
</script>
<c:set var="pager" value="${page }" scope="request"></c:set>
<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />
