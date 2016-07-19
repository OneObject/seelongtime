<%@page import="com.longtime.app.config.Constants"%>
<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
	<thead>
		<tr>
               <th width="6%">序号</th>
			   <th width="30%">标题</th>
			   <th width="30%">简介</th>
               <th width="13%">创建者</th>
               <th>操作</th>
		</tr>
	</thead>
	<tbody>
	    <c:if test="${empty list }">
	    	<tr>
	    		<td colspan="5">暂无数据</td>
	    	</tr>
	    </c:if>
	    <c:forEach items="${list }" var="v" varStatus="vs">
	   		<tr>
	   			<td>${vs.index+1 }</td>
	   			<td title="${v.title }">${ltfun:html2Text(v.title,20)}</td>
	   			<td title="${v.summary }">${ltfun:html2Text(v.summary,25)}</td>
	   			<td>${v.creatorName }</td>
	   			<td>
	   				<a href="${basepath }/mgr/vote/update.xhtml?id=${v.id}">修改</a>
	   				&nbsp;&nbsp;&nbsp;
	   				<a href="${basepath }/mgr/vote/${v.id}.xhtml">设置问题</a>
	   				&nbsp;&nbsp;&nbsp;
	   				<a href="javascript:void(0);" onclick="delVote('${v.id}');">删除</a>
	   			</td>
	   		</tr>
	   </c:forEach>
	</tbody>
</table>

<div>
<jsp:include page="/WEB-INF/jsp/mgr/ixin/include/pager.jsp"></jsp:include>
</div>