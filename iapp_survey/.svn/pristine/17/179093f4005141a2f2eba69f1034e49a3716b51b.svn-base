<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>

<input type="hidden" id="orderField" name="orderField" value="${orderField }" >
<input type="hidden" id="orderDirection" name="orderDirection" value="${orderDirection }" >
<table class="table table-striped table-bordered table-/advance table-hover datatable" id="sample_2">
       <thead>
           <tr>
               <th>选择</th>
               <th>序号</th>
               <th>试卷名称</th>
               <th>试卷描述</th>
               <th>组卷方式</th>
               <th onclick="page(1, 'entityMetaInfo.dateCreated')" class="sorting<c:out value='${orderField eq "entityMetaInfo.dateCreated" ? orderDirection:"" }' />" id="entityMetaInfo.dateCreated">创建时间</th>
               <th onclick="page(1, 'entityMetaInfo.dateLastModified')" class="sorting<c:out value='${orderField eq "entityMetaInfo.dateLastModified" ? orderDirection:"" }' />" id="entityMetaInfo.dateLastModified">修改时间</th>
           </tr>
       </thead>
	<tbody>
		<c:forEach items="${list }" var="item" varStatus="state">
		<tr>
            <td><input type="radio" name="ids" value="${item.id }" <c:out value="${item.id eq paper_id? 'checked=checked':'' }" /> >
                <input type="hidden" name="generate_type${item.id }" id="generate_type${item.id }" value="${item.generate_type }" >
            </td>
			<td><span>${state.count }</span></td>
			<td title="${item.name }"><span name="name_${item.id }" id="name_${item.id }">${ltfun:html2Text(item.name, 15)}</span></td>
			<td title="${item.descript }"><span>${ltfun:html2Text(item.descript, 15)}</span></td>
			<td title="${item.descript }">
			     <span>
			     <c:if test="${item.generate_type eq 1 }">自动组卷</c:if>
			     <c:if test="${item.generate_type eq 2 }">手动组卷</c:if>
			     </span>
			</td>
            <td><span>${ltfun:dateLongToStringFormat(item.entityMetaInfo.dateCreated, 'yyyy-MM-dd HH:mm') }</span></td>
            <td><span>${ltfun:dateLongToStringFormat(item.entityMetaInfo.dateLastModified, 'yyyy-MM-dd HH:mm') }</span></td>
		</tr>
		</c:forEach>
	</tbody>
</table>

<c:set var="pager" value="${page }" scope="request"></c:set>
<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />