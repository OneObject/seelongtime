<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<table class="table table-striped table-bordered table-hover table-full-width" id="sample">
   <thead>
      <tr>
          <td>
              <label>
                <input type="checkbox" value="1" data-name="all" onclick="checked_all(this)"/>
               </label>
          </td>
         <td width="10%">序号</td>
          <td width="10%">过滤实体</td>
          <td width="15%">属性名</td>
          <td width="10%">过滤方式</td>
          <td width="45%">属性值</td>
          <td width="10%">操作</td>
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
               <td>
                  <label>
                    <input name="ids" id="${item.id }" data-name="${item.property}"  type="checkbox" value="${item.id }" />
                   </label>
              </td>
             <td>${st.count }</td>
             <td>
             <c:if test="${item.type eq 0}">
                                                        用户
             </c:if>
             <c:if test="${item.type eq 1 }">
                                                         组织
             </c:if>
             <c:if test="${item.type eq 2 }">
                                                          职级
             </c:if>
             </td>
             <td title="${item.property}">${item.property}</td>
             <td>
             <c:if test="${item.operation eq 0 }">
             =
             </c:if>
              <c:if test="${item.operation eq 1 }">
              >
             </c:if>
              <c:if test="${item.operation eq 2 }">
              <
             </c:if>
              <c:if test="${item.operation eq 3 }">
              between
             </c:if>
              <c:if test="${item.operation eq 4 }">
              like
             </c:if>
              <c:if test="${item.operation eq 5 }">
              in
             </c:if>
             </td>
             <td title="${item.value }">
             	${ltfun:html2Text(item.value,20)}
             </td>
             <td>
             	<a href="#" onclick="delrule('${item.id}');">删除</a>
             </td>
          </tr>
       </c:forEach>
        </c:otherwise>
    </c:choose>
   </tbody>
</table>

<c:set var="pager" value="${page}" scope="request"></c:set>
<c:set var="pageFn" value="${pageFn}" ></c:set>
<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />
