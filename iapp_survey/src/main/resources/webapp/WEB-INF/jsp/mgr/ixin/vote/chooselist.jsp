<%@page import="com.longtime.app.config.Constants"%>
<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
	<thead>
		<tr>
		 	<th>选择</th>
            <th>序号</th>
		   	<th>标题</th>
		   	<th>简介</th>
		</tr>
	</thead>
	<tbody>
	    <c:if test="${empty list }">
	    	<tr>
	    		<td colspan="4">暂无数据</td>
	    	</tr>
	    </c:if>
	    <c:forEach items="${list }" var="v" varStatus="vs">
	   		<tr>
	   			<td>
	   				<label>
                    		<input name="selectVoteId" type="radio"  data-id="${v.id }" data-title="${v.title }"/>
                   	</label>
	   			</td>
	   			<td>${vs.index+1 }</td>
	   			<td title="${v.title }">${ltfun:html2Text(v.title,25)}</td>
	   			<td title="${v.summary }">${ltfun:html2Text(v.summary,25)}</td>
	   		</tr>
	   </c:forEach>
	</tbody>
</table>

<div>
<jsp:include page="/WEB-INF/jsp/mgr/ixin/include/pager.jsp"></jsp:include>
</div>