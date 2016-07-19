<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>

<input type="hidden" id="orderField" name="orderField" value="${orderField }" >
<input type="hidden" id="orderDirection" name="orderDirection" value="${orderDirection }" >
<table class="table table-striped table-bordered table-hover table-full-width datatable" id="sample_2">
   <thead>
      <tr>
         <th>序号</th>
         <th>商户标识</th>
         <th>商户名称</th>
         <th>管理员账号</th>
         <th>操作</th>
      </tr>
   </thead>
   <tbody id="tbody">
   
    <c:choose>
        <c:when test="${fn:length(list) eq 0 }">
            <tr><td colspan="14"> 没有相关记录！</td></tr>
        </c:when>
        <c:otherwise>
      <c:forEach var="item" items="${list }" varStatus="st">
          <tr>
             <td>${st.count }</td>
              <%--<td title="${item.username }">${ltfun:html2Text(item.username, 15)}</td> --%>
             <td>${ltfun:html2Text(item.id, 15)}</td>
             <td title="${item.name }">${ltfun:html2Text(item.name, 15)}</td>
             <td title="${item.adminAccount }">${ltfun:html2Text(item.adminAccount, 15)}</td>
             <td>
                  <a href="${basepath }/base/admin/tenant/toupdate.xhtml?id=${item.id }">
                     <span>
                         <i class="glyphicon glyphicon-edit"></i>编辑
                     </span>
                  </a>
             </td>
          </tr>
       </c:forEach>
        </c:otherwise>
    </c:choose>
   </tbody>
</table>

<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />
