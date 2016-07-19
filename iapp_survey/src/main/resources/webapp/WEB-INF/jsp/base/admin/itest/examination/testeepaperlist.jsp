<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>

<input type="hidden" id="orderField" name="orderField" value="${orderField }" >
<input type="hidden" id="orderDirection" name="orderDirection" value="${orderDirection }" >
<table class="table table-striped table-bordered table-hover table-full-width datatable" id="sample_2">
    <thead>
         <tr>
             <th>序号</th>
             <c:if test="${empty uid }">
                 <th>用户名</th>
                 <th>姓名</th>
             </c:if>
             <th onclick="page(1, 'score')" class="sorting<c:out value='${orderField eq "score" ? orderDirection:"" }' />" id="score">得分</th>
             <th onclick="page(1, 'status')" class="sorting<c:out value='${orderField eq "status" ? orderDirection:"" }' />" id="status">考试状态</th>
             <th onclick="page(1, 'start_time')" class="sorting<c:out value='${orderField eq "start_time" ? orderDirection:"" }' />" id="start_time">参加考试时间</th>
             <th onclick="page(1, 'end_time')" class="sorting<c:out value='${orderField eq "end_time" ? orderDirection:"" }' />" id="end_time">结束考试时间</th>
             <th>操作</th>
         </tr>
    </thead>
    <tbody id="tbody">
    <c:choose>
        <c:when test="${fn:length(list) eq 0 }">
            <tr><td colspan="9"> 没有相关记录！</td></tr>
        </c:when>
        <c:otherwise>
        <c:forEach var="item" items="${list }" varStatus="num">
             <tr>
                 <td><c:out value="${num.count}"></c:out></td>
                 <c:if test="${empty uid }">
                     <td>${item.loginname }</td>
                     <td>${item.name }</td>
                 </c:if>
                 <td>${item.score }</td>
                 <td>
                     <c:if test="${item.status==0 }">未通过</c:if>
                     <c:if test="${item.status==1 }">通过</c:if>
                     <c:if test="${item.status==2 }">阅卷中</c:if>
                 </td>
                 <td>${ltfun:dateLongToStringFormat(item.start_time,'yyyy-MM-dd HH:mm') }</td>
                 <td>${ltfun:dateLongToStringFormat(item.end_time,'yyyy-MM-dd HH:mm') }</td>
                 <td>
                     <a href="${basepath }/base/admin/itest/examination/testeepaperdetail.xhtml?tid=${tid}&testee_paper_id=${item.id}">答卷详情</a>
                     
                     &nbsp;&nbsp;
                     <a href="#" onclick="deleterecord('${tid}', '${item.id}')">删除该条</a>
                     
                 </td>
             </tr>
        </c:forEach>
        </c:otherwise>
    </c:choose>
    </tbody>
</table>

<c:set var="pager" value="${page }" scope="request"></c:set>
<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />
