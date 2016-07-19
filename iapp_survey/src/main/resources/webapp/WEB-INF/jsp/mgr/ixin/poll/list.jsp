<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
	<thead>
		<tr>
               <th>序号</th>
			   <th>标题</th>
			   <th>投票总数</th>
               <th>开始时间</th>
               <th>结束时间</th>
               <th>操作</th>
		</tr>
	</thead>
	<tbody>
	    <c:if test="${empty list }">
	    	<tr>
	    		<td colspan="6">暂无数据</td>
	    	</tr>
	    </c:if>
	   <c:forEach items="${list }" var="v" varStatus="vs">
	   		<tr>
	   			<td>${vs.index+1 }</td>
	   			<td>${v.title }</td>
	   			<td>${v.voteNum }</td>
	   			<td>
	   				<d:formatDate currentTime="${v.startTime }" format="yyyy/MM/dd"/>
	   			</td>
	   			<td>
	   				<d:formatDate currentTime="${v.endTime }" format="yyyy/MM/dd"/>
	   			</td>
	   			<td>
	   				<a href="${basepath }/protal/poll/result.xhtml?voteId=${v.voteId}&openId=" target="_voteDetail">详情</a>
	   				&nbsp;&nbsp;&nbsp;&nbsp;
	   				<a href="javascript:void(0);" onclick="delVote('${v.voteId}');">删除</a>
	   			</td>
	   		</tr>
	   </c:forEach>
	</tbody>
</table>
<div>
<jsp:include page="/WEB-INF/jsp/mgr/ixin/include/pager.jsp"></jsp:include>
</div>