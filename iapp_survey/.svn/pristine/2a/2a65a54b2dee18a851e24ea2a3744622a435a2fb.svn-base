<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<%@ taglib uri="http://www.longtimeit.com/taglib-elfunctions-ajy"
	prefix="ajy"%>

<input type="hidden" id="orderField" name="orderField"
	value="${orderField }">
<input type="hidden" id="orderDirection" name="orderDirection"
	value="${orderDirection }">
<table
	class="table table-striped table-bordered table-hover table-full-width datatable"
	id="sample_2">
	<thead>
		<tr>
			<th><label> <input type="checkbox" value="1"
					onclick="checked_all(this)" name='' />
			</label></th>
			<th>序号</th>
			<th>练习名称</th>
			<th>创建状态</th>
			<th>创建人</th>
			<th onclick="page(1, 'createTime')"
				class="sorting<c:out value='${orderField eq "createTime" ? orderDirection:"" }' />"
				id="createTime">创建时间</th>
			<th>发布状态</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody id="tbody">
		<c:choose>
			<c:when test="${fn:length(list) eq 0 }">
				<tr>
					<td colspan="9">没有相关记录！</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="item" items="${list }" varStatus="num">
					<tr>
						<td><label> <input type="checkbox"
								value="${item.id }" name='ids' />
						</label></td>

						<td>${num.index+1 }</td>
						<td><span id="name_${item.id }" title="${item.name }">${ltfun:html2Text(item.name,
								15)}</span></td>

						<td><span> ${ajy:createStatus(2,item.id,1,domain) } </span></td>

						<td><span>${ item.creater }</span></td>
						<td><span>${ltfun:dateLongToStringFormat(item.createTime,'yyyy-MM-dd
								HH:mm') }</span></td>

						<td><span> <c:forEach items="${examinationStatusMap }"
									var="status">
									<c:if test="${status.value eq item.status}">${status.key }</c:if>
								</c:forEach>
						</span></td>

						<td> 
							   <c:if test="${item.status eq '0' }">
	                    <a class="" onclick='updateReleaseStatusSingle("${item.id }", 1)' href="javascript:void(0)"><span><i class="icon-ok-circle"></i>&nbsp;发布</span></a>
                    </c:if>
                    <c:if test="${item.status eq '1' }">
	                    <a class="" onclick='updateReleaseStatusSingle("${item.id }", 0)' href="javascript:void(0)"><span><i class="icon-ban-circle"></i>&nbsp;取消发布</span></a>
                    </c:if>
                    
							<a onclick="detailEntity('${item.id}')"
							href="javascript:void(0);"><span class="mytable_btn"><i
									class="glyphicon glyphicon-eye-open"></i>&nbsp;查看详情</span></a> <a
							onclick="updateEntity( '${item.id}')" href="javascript:void(0);"><span
								class="mytable_btn"><i class="glyphicon glyphicon-edit"></i>&nbsp;修改</span></a>
							<a onclick="deleteSingle('${item.id}')"
							href="javascript:void(0);"><span class="mytable_btn"><i
									class="glyphicon glyphicon-remove"></i>&nbsp;删除</span></a></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>
<c:set var="pager" value="${page }" scope="request"></c:set>
<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />
