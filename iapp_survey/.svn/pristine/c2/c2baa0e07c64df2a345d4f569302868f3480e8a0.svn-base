<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
	<thead>
		<tr>
               <th><input type="checkbox" value="1" onclick="checked_all(this)"></th>
               <th>序号</th>
			   <th style="width: 55%;">内容</th>
               <th> 审核状态 </th>
               <th>评论人</th>
               <th>评论时间</th>
               <th>操作</th>
		</tr>
	</thead>
	<tbody>
	<c:if test="${empty list }">
		<tr>
			<td colspan="6"style="text-align:center">
			暂无数据记录
			</td>
		</tr>
	</c:if>
		
	<c:forEach items="${list }" var="v" varStatus="vs">
		<tr>
			<td><input name="ids" id="${v.id }" type="checkbox" value="${v.id }"></td>
			<td>${vs.index+1 }</td>
			<td>
				<c:if test="${v.type == 0 }">${v.content }</c:if>
				<c:if test="${v.type == 1 }">
					<img alt=""  style="height: 100px;" src="${v.content }">
				</c:if>
			</td>
			<td>
				<c:if test="${v.shield == 0 }">已审核</c:if>
				<c:if test="${v.shield == 1 }"><font color="red">未审核</font></c:if>
			</td>
			<td>
				${v.uname }
			</td>
			<td>
				<d:formatDate currentTime="${v.commentTime }" format="yyyy-MM-dd HH:mm:ss"/>
			</td>
			<td>
				<c:if test="${v.shield == 0 }">
					<a href="javascript:void(0);" onclick="shieldComment('${v.id}','1')">取消审核</a> &nbsp;&nbsp;
				</c:if>
				<c:if test="${v.shield == 1 }">
					<a href="javascript:void(0);" onclick="shieldComment('${v.id}','0')">通过审核</a> &nbsp;&nbsp;
				</c:if>
				<a href="javascript:void(0);" onclick="del('${v.id}');">删除</a> &nbsp;&nbsp;
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<div>
<jsp:include page="/WEB-INF/jsp/mgr/ixin/include/pager.jsp"></jsp:include>
</div>
