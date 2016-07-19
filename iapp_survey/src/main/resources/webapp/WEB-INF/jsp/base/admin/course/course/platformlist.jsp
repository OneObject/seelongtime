<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>

<input type="hidden" id="orderField" name="orderField" value="${orderField }" >
<input type="hidden" id="orderDirection" name="orderDirection" value="${orderDirection }" >
<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
	<thead>
		<tr>
               <%-- <th><label><input type="checkbox" value="" onclick="checked_all(this)" name='' /></label></th> --%>
               <th>序号</th>
			   <th>课程名称</th>
              <!--  <th>课程分类</th> -->
               <th>课程时间(分钟)</th>
               <th id="score">合格分数</th>
               <th id="createTime">创建时间</th>
               <th id="releaseStatus">发布状态</th>
               <th>操作</th>
		</tr>
	</thead>
	<tbody>
	    <c:choose>
	          <c:when test="${empty list }">
                   <tr><td colspan="9"> 没有相关记录！</td></tr>
	          </c:when>
	          <c:otherwise>
	          </c:otherwise>
	    </c:choose>
		<c:forEach items="${list }" var="item" varStatus="num">
			<tr>
				<%-- <td><input name="ids" value="${item.id }" type="checkbox"></td> --%>
				<td>${num.count }</td>
				<td  id="name_${item.id }" title="${item.name }"><span>${ltfun:html2Text(item.name, 15)}</span></td>
				<%-- <td title="${item.courseCategory.name }">${ltfun:html2Text(item.courseCategory.name, 15)}</td> --%>
				<td><fmt:formatNumber value="${item.length}" pattern="#"/></td>
				<td>${item.score }</td>
				<td>${ltfun:dateLongToStringFormat(item.createTime,'yyyy-MM-dd HH:mm') }</td>
				<td><span>
					<c:forEach items="${statusMap }" var="type"><%-- ${type.key }|${type.value }|${item.releaseStatus } --%>
						<c:if test="${type.key eq item.releaseStatus}">
							${type.value}
						</c:if>
					</c:forEach>
					</span>
				</td>
				<td>
                    <a class="" onclick='detailEntity("${item.id }")' href="javascript:void(0)"><span><i class="glyphicon glyphicon-eye-open"></i>&nbsp;详情</span></a>
				</td>
			</tr>
		</c:forEach>	
	</tbody>
</table>

<c:set var="pager" value="${page }" scope="request"></c:set>
<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />
