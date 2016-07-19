<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>

<%-- <c:if test="${gtype eq 1 }">
<!-- <span>自动组卷中，仅可以删除某个试题，使此试题在系统自动组卷时不会包括此试题，但不能指定分数与排序，因自动组卷的题目是随机从题库中抽取的</span> -->
</c:if> --%>
<input type="hidden" id="orderField" name="orderField" value="${orderField }" >
<input type="hidden" id="orderDirection" name="orderDirection" value="${orderDirection }" >
<table class="table table-striped table-bordered table-hover table-full-width datatable" id="sample_2">
    <thead>
        <tr>
            <!-- <th><label><input type="checkbox" value="1" onclick="checked_all(this)" name='' />
            </label></th> -->
            <th>序号</th>
            <th>题库名称</th>
            <th>试题名称</th>
            <th>试题类型</th>
            <th>试题难度</th>
            <th>分数</th>
            <!-- <th>排序（越小越靠前，最小0，可重复）</th> -->
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
        <tr id="tr_${item.id }">
            <%-- <td><label> <input type="checkbox" value="${item.id }" name='ids'/></label></td> --%>
            <td>${num.index+1 }</td>
            <td>
                <c:forEach items="${itemblanks }" var="itemblank">
                    <c:if test="${itemblank.id eq item.itemId }">
                        ${itemblank.name }
                    </c:if>
                </c:forEach>
                <%-- <input type="hidden" name="questionIds" value="${item.id }" /> --%>
            </td>
            <td>
                <span title="${item.title }">${ltfun:html2Text(item.title, 15)}</span>
            </td>
            <td>
                <c:forEach items="${questionTypeMap }" var="type">
                     <c:if test="${type.value eq item.type}">
                         ${type.key}
                     </c:if>
                </c:forEach>
            </td>
            <td>
                <c:if test="${item.difficulty eq '1' }">简单</c:if>
                <c:if test="${item.difficulty eq '2' }"> 一般</c:if>
                <c:if test="${item.difficulty eq '3' }">困难</c:if>
            </td>
            <td>
                <input class="score itemscore" name="score_${item.id }" value="${item.score }" type="text" style="width: 60px;" onblur="updateAmount1();" >
                     <c:set var="amount" value="${amount+item.score }"/>
            </td>
            <%-- <td>
                <input class="count" name="sort_order_${item.id }" id="sort_order_${item.id }" value="${state.count }" type="hidden" >
                <input name="sort_order_${item.id }" value="${num.count }" >
            </td> --%>
	            <td>
	                <a href="javascript:void(0);" onclick="deleteLocal('${item.id }');">删除</a>
	            </td>
        </tr>
        </c:forEach>
        <tr id="tr_total">
            <td colspan="4" ></td>
            <td >合计：</td>
            <td>
                <input type="text" name="scoreNum" value='<fmt:formatNumber value="${totalScore }" pattern=".0"/>' style="width: 60px;" id="scoreNum"/>
            </td>
                 <td colspan="2">&nbsp;</td>
        </tr>
        </c:otherwise>
    </c:choose>
    </tbody>
</table>

