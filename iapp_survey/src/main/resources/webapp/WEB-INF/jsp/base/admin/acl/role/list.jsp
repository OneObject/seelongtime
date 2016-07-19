<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>

<table class="table table-striped table-bordered table-hover table-full-width datatable" id="sample_2">
   <thead>
      <tr>
         <th>序号</th>
         <th>角色名称</th>
         <th>操作</th>
      </tr>
   </thead>
   <tbody id="tbody">
   <c:choose>
   		<c:when test="${fn:length(list) eq 0 }">
   			<tr><td colspan="14"> 没有相关记录！</td></tr>
   		</c:when>
   		<c:otherwise>
   			<c:forEach var="item" items="${list }" varStatus="i">
   			
   				<tr>
		             <td>${i.count }</td>
		             <td>${item.name }</td>
		             <td>
		                  <a href="javascript:void(0);" onclick="deleteRole('${item.id}')">
		                     <span>删除</span>
		                  </a>
		                  <a href="javascript:void(0);" onclick="tosave('${item.id}')">
		                     <span>编辑</span>
		                  </a>
		                  <a href="${basepath }/base/admin/acl/role/tolinkuser.xhtml?id=${item.id}">
		                     <span>关联用户</span>
		                  </a>
		             </td>
		          </tr>
   			
   			</c:forEach>
   		
   		</c:otherwise>
   
   </c:choose>
          
   </tbody>
</table>

<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />
