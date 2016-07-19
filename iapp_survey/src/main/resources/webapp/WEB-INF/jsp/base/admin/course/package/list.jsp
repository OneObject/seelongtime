<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<table class="table table-striped table-bordered table-hover table-full-width datatable" id="sample_2">
	<thead>
		<tr>
	              <th style="width: 40px">序号</th>	             
			   	  <th style="width: 100px;text-align: center;">名称</th>
	              <th style="width: 100px;text-align: center;">简介</th>
	              <th style="width: 50px;text-align: center;">创建时间</th>
	              <th style="width: 50px;text-align: center;">是否发布</th>              
	              <th style="width: 70px;text-align: center;">操作</th>
		</tr>
	</thead>
	<tbody>
	    <c:choose>
	          <c:when test="${empty list }">
                   <tr><td colspan="9"> 没有相关记录！</td></tr>
	          </c:when>
	          <c:otherwise>
					<c:forEach items="${list}" var="item" varStatus="num">
						<tr>			
							<td >${num.index+1}</td>
							<td >${item.name}</td>
							<td>${item.descript}</td>
							<td>${ltfun:dateLongToString(item.createtime)}</td>
							<td>${releaseMap[item.released]}</td>
								<td>
									<a href="javascript:deletePackage('${item.id }','1');" title="确定删除吗？">删除</a>/
									<a href="${basepath}/base/admin/course/package/vieweditlinkcourse.xhtml?id=${item.id}">编辑</a>/
									<a href="${basepath}/base/admin/course/package/viewlinkcourse.xhtml?packageid=${item.id}">关联课程</a>
								</td>
						</tr>
					</c:forEach>	
	          </c:otherwise>
	    </c:choose>
	</tbody>
</table>

<c:set var="pager" value="${page }" scope="request"></c:set>
<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />
