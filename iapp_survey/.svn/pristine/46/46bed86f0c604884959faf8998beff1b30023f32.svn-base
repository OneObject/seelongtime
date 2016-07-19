<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<%@ taglib uri="http://www.longtimeit.com/taglib-elfunctions-ajy" prefix="ajy" %>

<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
	<thead>
		<tr>
               <th>序号</th>
			   <th>内容</th>
               <th>创建时间</th>
		</tr>
	</thead>
	<tbody id="praiselist">
	<c:if test="${empty list }">
		<tr>
			<td colspan="6"style="text-align:center">
			暂无数据记录
			</td>
		</tr>
	</c:if>
	<c:forEach var="v" items="${list}" varStatus="vs">
		<tr>
			<td>${vs.index+1 }</td>
			<td class="contanttext">
             <a href="#">${v.uname}</a>&nbsp;&nbsp;赞了 &nbsp;&nbsp;${ltfun:html2Text(v.content,40)}
			</td>
			<td>
				<d:formatDate currentTime="${v.createtime}" format="yyyy-MM-dd HH:mm"/>
			</td>
		</tr>
</c:forEach>
	</tbody>
</table>
<div>
<jsp:include page="/WEB-INF/jsp/mgr/ixin/include/pager.jsp"></jsp:include>

</div>
