<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>

<input type="hidden" id="orderField" name="orderField" value="${orderField }" >
<input type="hidden" id="orderDirection" name="orderDirection" value="${orderDirection }" >
<table class="table table-striped table-bordered table-hover table-full-width datatable" id="sample_2">
   <thead>
      <tr>
      	 <th width="4%">
              <label>
	                <input type="checkbox" value="1" onclick="checked_all(this)"/>
               </label>
         </th>
         <th width="5%">序号</th>
         <th width="6%">编号</th>
         <th width="8%">用户名</th>
         <th width="6%">姓名</th>
         <th width="12%">邮箱</th>
         <th width="15%">主题</th>
         <th width="6%">状态</th>
         <th width="12%">预计发送时间</th>
         <th width="12%">发送时间</th>
         <th>操作</th>
      </tr>
   </thead>
   <tbody id="tbody">
   
    <c:choose>
        <c:when test="${fn:length(list) eq 0 }">
            <tr><td colspan="11"> 没有相关记录！</td></tr>
        </c:when>
        <c:otherwise>
	      <c:forEach var="item" items="${list }" varStatus="st">
	          <tr>
	          	<td>
		          	 <label>
	                    <input name="ids" id="${item.id }" type="checkbox" value="${item.id }" />
	                 </label>
                 </td>
	             <td>${st.count }</td>
	             <td>${item.no }</td>
	             <td>${item.username }</td>
	             <td>${item.name }</td>
	             <td>${item.email }</td>
	             <td title="${item.subject }">${ltfun:html2Text(item.subject, 12)}</td>
	             <td title="${item.errmsg }">
	             	<c:if test="${item.status == -1 }">失败</c:if>
	             	<c:if test="${item.status == 0 }">待发送</c:if>
	             	<c:if test="${item.status == 1 }">成功</c:if>
	             </td>
	             <td>${ltfun:dateLongToStringFormat(item.tosendtime, 'yyyy-MM-dd HH:mm')  }</td>
	             <td>${ltfun:dateLongToStringFormat(item.sendtime, 'yyyy-MM-dd HH:mm')  }</td>
	             <td>
	                  <a href="javascript:void(0);" onclick="toDetail('${item.id}');">
	                      <span>
	                         <i class="icon-eye-open"></i>详情
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
