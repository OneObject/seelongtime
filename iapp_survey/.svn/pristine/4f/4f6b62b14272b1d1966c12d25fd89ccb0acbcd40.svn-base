<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>

<script src="${basepath }/static/public/javascripts/choicelist.js" type="text/javascript"></script>  
<table class="table table-striped table-bordered table-hover table-full-width datatable" id="sample_2">
    <thead>
        <tr>
            <th style="width: 20px;"><label><input type="checkbox" value="1" onclick="itemSelectAll()" style="width: 20px;" name='' id="itemSelectAll" /></label></th>
            <th>序号</th>
            <th>题库名称</th>
            <th>试题名称</th>
            <th onclick="pageQuestion(1, 'type')" class="sorting<c:out value='${orderField eq "type" ? orderDirection:"" }' />" id="type">试题类型</th>
            <th onclick="pageQuestion(1, 'difficulty')" class="sorting<c:out value='${orderField eq "difficulty" ? orderDirection:"" }' />" id="difficulty">试题难度</th>
            <th onclick="pageQuestion(1, 'score')" class="sorting<c:out value='${orderField eq "score" ? orderDirection:"" }' />" id="score">分数</th>
        </tr>
    </thead>
    <!-- 
    <tbody id="tbody" style="height: 300px;overflow: auto;">
     -->
    <tbody id="tbody" >
    <c:choose>
        <c:when test="${fn:length(list) eq 0 }">
            <tr><td colspan="7"> 没有相关记录！</td></tr>
        </c:when>
        <c:otherwise>
        <c:forEach var="item" items="${list }" varStatus="num">
        <tr>
            <td>
            <label>
                <c:if test="${fn:contains(questionIds, item.id)}">
                    <input name="ids" type="checkbox" value="${item.id}" checked="checked" style="width: 20px;" onclick="onSave();">
                </c:if> 
                <c:if test="${!fn:contains(questionIds, item.id)}">
                    <input name="ids" type="checkbox" value="${item.id}" style="width: 20px;" onclick="onSave();">
                </c:if> 
            </label>
            </td>
            <td>${num.index+1 }</td>
            <td>
                <span>
                     <c:forEach items="${itemblanks }" var="blank">
                         <c:if test="${blank.id eq item.itemId }">
                           ${blank.name}
                         </c:if>
                     </c:forEach>
                </span>
            </td>
            <td>
                <span title="${item.title }">${ltfun:html2Text(item.title, 15)}</span>
            </td>
            <td>
                <span>
                     <c:if test="${item.type==1}">判断题</c:if>
                     <c:if test="${item.type==2}">单选题</c:if>
                     <c:if test="${item.type==3}">多选题</c:if>
                     <c:if test="${item.type==4}">问答题</c:if>
                </span>
            </td>
            <td>
                <span>
                     <c:if test="${item.difficulty==1}">简单</c:if>
                     <c:if test="${item.difficulty==2}">一般</c:if>
                     <c:if test="${item.difficulty==3}">困难</c:if>
                </span>
            </td>
            <td>
                <span id='${item.id }'>${item.score }</span>
            </td>
        </tr>
        </c:forEach>
        </c:otherwise>
    </c:choose>
    </tbody>
</table>

<c:set var="pageFn" value="pageQuestion" scope="request"></c:set>
<c:set var="pager" value="${page }" scope="request"></c:set>
<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />
