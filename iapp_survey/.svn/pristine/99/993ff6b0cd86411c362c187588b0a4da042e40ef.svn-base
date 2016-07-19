<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>

<input type="hidden" id="orderField" name="orderField" value="${orderField }" >
<input type="hidden" id="orderDirection" name="orderDirection" value="${orderDirection }" >
<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
   <thead>
      <tr>
          <td style="width:80px;">
              <label>
                <input type="checkbox" value="1" onclick="itemSelectAll()" id="itemSelectAll"/>
               </label>
          </td>
         <td>序号</td>
         <td>用户名</td>
         <td>姓名</td>
         <td>手机</td>
         <td>邮箱</td>
         <td>部门</td>
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
                        <c:if test="${fn:containsIgnoreCase(userids, item.id)}">
		                    <input name="uids" id="${item.id }" type="checkbox" value="${item.id }" onclick="onSave();" checked="checked" />
                        </c:if>
                        <c:if test="${!fn:containsIgnoreCase(userids, item.id)}">
		                    <input name="uids" id="${item.id }" type="checkbox" value="${item.id }" onclick="onSave();" />
                        </c:if>
                   </label>
              </td>
             <td>${st.count }</td>
             <td title="${item.username }">${ltfun:html2Text(item.username, 15)}</td>
             <td title="${item.name }">${ltfun:html2Text(item.name, 15)}</td>
             <td title="${item.mobile }">${ltfun:html2Text(item.mobile, 25)}</td>
             <td title="${item.email }">${ltfun:html2Text(item.email, 25)}</td>
             <td title="${item.organization.name }">${ltfun:html2Text(item.organization.name, 15)}</td>
          </tr>
       </c:forEach>
        </c:otherwise>
    </c:choose>
   </tbody>
</table>

<c:set var="pager" value="${page }" scope="request"></c:set>
<c:set var="pageFn" value="pageUser" scope="request"></c:set>
<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />
