<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>

<input type="hidden" id="orderField" name="orderField" value="${orderField }" >
<input type="hidden" id="orderDirection" name="orderDirection" value="${orderDirection }" >
<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
   <thead>
      <tr>
          <td  width="5%">
              <label>
                <input type="checkbox" value="1" id="checkall" onclick="checked_all(this)" data-name="all" />
               </label>
          </td>
         <td width="8%">序号</td>
         <td width="15%">用户名</td>
         <td width="10%">姓名</td>
         <td width="10%">手机</td>
         <td width="10%">邮箱</td>
         <td width="20%">部门</td>
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
		                    <input name="ids" id="${item.id }" data-name="${item.name}" type="checkbox" value="${item.id }" onclick="onSaveUser();"  checked="checked" />
                        </c:if>
                        <c:if test="${!fn:containsIgnoreCase(userids, item.id)}">
		                    <input name="ids" id="${item.id }" data-name="${item.name}" type="checkbox" value="${item.id }"  onclick="onSaveUser();"/>
                        </c:if>
                   </label>
              </td>
             <td>${st.count }</td>
             <td title="${item.username }">${ltfun:html2Text(item.username, 15)}</td>
             <td title="${item.name }">${ltfun:html2Text(item.name, 15)}</td>
             <td title="${item.mobile }">${ltfun:html2Text(item.mobile, 25)}</td>
             <td title="${item.email }">${ltfun:html2Text(item.email, 25)}</td>
             <td title="${item.organization.name }">${ajy:orgFullName(item.organization.id) }</td>
          </tr>
       </c:forEach>
        </c:otherwise>
    </c:choose>
   </tbody>
</table>

<c:set var="pager" value="${page }" scope="request"></c:set>
<c:set var="pageFn" value="pageUser" scope="request"></c:set>
<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />
