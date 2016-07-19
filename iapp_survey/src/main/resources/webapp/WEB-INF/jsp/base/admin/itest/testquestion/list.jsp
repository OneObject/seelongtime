<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>

<input type="hidden" id="orderField" name="orderField" value="${orderField }" >
<input type="hidden" id="orderDirection" name="orderDirection" value="${orderDirection }" >
<table class="table table-striped table-bordered table-hover table-full-width datatable" id="sample_2">
	<thead>
		<tr>
               <th><label><input type="checkbox" value="" onclick="checked_all(this)" name='' /></label></th>
               <th>序号</th>
	           <th>试题名称</th>
               <th onclick="page(1, 'type')" class="sorting<c:out value='${orderField eq "type" ? orderDirection:"" }' />" id="type">试题类型</th>
               <th>创建人</th>
               <th onclick="page(1, 'entityMetaInfo.dateCreated')" class="sorting<c:out value='${orderField eq "entityMetaInfo.dateCreated" ? orderDirection:"" }' />" id="entityMetaInfo.dateCreated">创建时间</th>
               <th>修改人</th>
               <th onclick="page(1, 'entityMetaInfo.dateLastModified')" class="sorting<c:out value='${orderField eq "entityMetaInfo.dateLastModified" ? orderDirection:"" }' />" id="entityMetaInfo.dateLastModified">修改时间</th>
               <th>操作</th>
		</tr>
	</thead>
	<tbody>
	    <c:choose>
	          <c:when test="${empty testQuestions }">
                   <tr><td colspan="9"> 没有相关记录！</td></tr>
	          </c:when>
	          <c:otherwise>
	          </c:otherwise>
	    </c:choose>
		<c:forEach items="${testQuestions }" var="item" varStatus="num">
			<tr target="sid_user" rel="${item.id }">
				<td><input name="ids" value="${item.id }" type="checkbox"></td>
				<td>${num.index+1 }</td>
				<td  id="name_${item.id }" title="${item.title }"><span>${ltfun:html2Text(item.title, 15)}</span></td>
				<td><span>
					<c:forEach items="${questionTypeMap }" var="type">
						<c:if test="${type.value eq item.type}">
							${type.key}
						</c:if>
					</c:forEach>
					</span>
				</td>
				<td><span>${item.entityMetaInfo.userCreated }</span></td>
				<td><span>${ltfun:dateLongToStringFormat(item.entityMetaInfo.dateCreated, 'yyyy-MM-dd HH:mm') }</span></td>
				<td><span>${item.entityMetaInfo.userLastModified}</span></td>
				<td><span>${ltfun:dateLongToStringFormat(item.entityMetaInfo.dateLastModified, 'yyyy-MM-dd HH:mm') }</span></td>
				<td>
                        <a class="" onclick='detailEntity("${item.id }")' href="javascript:void(0)"><span><i class="glyphicon glyphicon-eye-open"></i>&nbsp;查看详情</span></a>
                        <a class="" onclick='updateEntity("${item.id }")' href="javascript:void(0)"><span><i class="glyphicon glyphicon-edit"></i>&nbsp;修改</span></a>
                        <a class="" onclick='deleteSingle("${item.id }")' href="javascript:void(0)"><span><i class="glyphicon glyphicon-remove"></i>&nbsp;删除</span></a>
				</td>
			</tr>
		</c:forEach>	
	</tbody>
</table>

<c:set var="pager" value="${page }" scope="request"></c:set>
<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />

<script type="text/javascript">
	/* $(function(){
		$('#pagetol').val("${pageSize}");
		var itemId = "${itemId }";
		var type = "${type }";
		if(itemId!=null && itemId!=""){
		  $("#"+itemId).attr("select", "selected");
		}
		if(type!=null && type!=""){
		  $("#type_"+type).attr("select", "selected");
		}
	}); */
</script>