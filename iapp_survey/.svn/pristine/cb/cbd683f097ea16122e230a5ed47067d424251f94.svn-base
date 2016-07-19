<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
   <thead>
      <tr>
          <td>
              <label>
                <input type="checkbox" value="1" onclick="checked_all(this)"/>
               </label>
          </td>
         <td>用户名</td>
          <td>姓名</td>
          <td>手机</td>
         <td>操作</td>
      </tr>
   </thead>
   <tbody id="tbody">
   
    <c:choose>
        <c:when test="${fn:length(list) eq 0 }">
            <tr><td colspan="8"> 没有相关记录！</td></tr>
        </c:when>
        <c:otherwise>
      <c:forEach var="item" items="${list }" varStatus="st">
          <tr id="tr_${item.id }">
               <td>
                  <label>
                    <input name="ids" id="${item.id }" type="checkbox" value="${item.id }" />
                   </label>
              </td>
             <td title="${item.username }">${ltfun:html2Text(item.username, 15)}</td>
             <td title="${item.name }">${ltfun:html2Text(item.name, 15)}</td>
             <td title="${item.mobile }">${ltfun:html2Text(item.mobile, 25)}</td>
             <td>
                  <a href="javascript:void(0);" onclick="deleteSingle('${item.id}');">
                      <span>
                         <i class="glyphicon glyphicon-trash"></i>移除
                     </span>
                  </a>
             </td>
          </tr>
       </c:forEach>
        </c:otherwise>
    </c:choose>
   </tbody>
</table>

<c:set var="pager" value="${page }" scope="request"></c:set>
<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />