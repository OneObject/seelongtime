<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>

<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
   <thead>
      <tr>
          <td style="width:80px;">
              <label>
                <input type="checkbox"  value="1" onclick="checked_all2(this)"/>
               </label>
          </td>
         <td>序号</td>
         <td>名称</td>
         <td>创建时间</td>
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
		                    <input name="groups" id="${item.id }" type="checkbox" value="${item.id }" />
                   </label>
              </td>
             <td>${st.count }</td>
             <td title="${item.name }">${ltfun:html2Text(item.name, 15)}</td>
             <td title="${item.createtime }"><d:formatDate currentTime="${item.createtime}" format="yyyy-MM-dd HH:mm"/></td>
          </tr>
       </c:forEach>
        </c:otherwise>
    </c:choose>
   </tbody>
</table>

<c:set var="pager" value="${page }" scope="request"></c:set>
<c:set var="pageFn" value="grouplist" scope="request"></c:set>
<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />
