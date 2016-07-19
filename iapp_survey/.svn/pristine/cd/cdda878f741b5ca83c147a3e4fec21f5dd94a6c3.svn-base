<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
   <thead>
      <tr>
          <td width="2%">
              <label>
                <input type="checkbox" value="1" data-name="all" onclick="checked_all(this)"/>
               </label>
          </td>
         <td width="5%">序号</td>
          <td width="10%">用户名</td>
          <td width="10%">姓名</td>
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
		                      <input name="ids" id="${item.id }" data-name="${item.name}"  type="checkbox" value="${item.id }" onclick="onSave();"checked="checked" />
                        </c:if>
                        <c:if test="${!fn:containsIgnoreCase(userids, item.id)}"> 
		                    <input name="ids" id="${item.id }" data-name="${item.name}"  type="checkbox" value="${item.id }" onclick="onSave();"  />
                        </c:if>
                        
                    
                   </label>
              </td>
             <td>${st.count }</td>
              <td title="${item.username}">${item.username}</td>
             <td title="${item.name }">${ltfun:html2Text(item.name, 15)}</td>
              <td title="${item.organization.name}">${ajy:orgFullName(item.organization.id) }</td>
          </tr>
       </c:forEach>
        </c:otherwise>
    </c:choose>
   </tbody>
</table>

<c:set var="pager" value="${page}" scope="request"></c:set>
<c:set var="pageFn" value="${pageFn}" ></c:set>
<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />
