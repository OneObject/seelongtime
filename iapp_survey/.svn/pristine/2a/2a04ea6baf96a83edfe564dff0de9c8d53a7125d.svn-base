<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
	<thead>
		<tr>
               <th>序号</th>
			   <th>标题</th>
               <th>创建时间</th>
               <th>操作</th>
		</tr>
	</thead>
	<tbody>
	<c:if test="${empty list }">
		<tr>
			<td colspan="4"style="text-align:center">
			暂无数据记录
			</td>
		</tr>
	</c:if>
		
	<c:forEach items="${list }" var="v" varStatus="vs">
		<tr>
			<td>${vs.index+1 }</td>
			<td>${v.title }</td>
			<td>
				<d:formatDate currentTime="${v.createTime }" format="yyyy/MM/dd"/>
			</td>
			<td>
				<a href="${basepath }/protal/fodder/detail.xhtml?id=${v.id}" target="_matterDetail">详情</a> &nbsp;&nbsp;
				<ltacl:datactl creatoruid="${ v.createUid}">
				<a href="javascript:void(0);" onclick="delStudy('${v.ext}','${v.id }')">删除</a> &nbsp;&nbsp;
				<a href="${basepath}/mgr/fodder/update.xhtml?id=${v.id}&columnId=ixinnotice&cId=${v.ext}">修改</a>
				</ltacl:datactl>
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<div>
<jsp:include page="/WEB-INF/jsp/mgr/ixin/include/pager.jsp"></jsp:include>
</div>
