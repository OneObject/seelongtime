<%@page import="com.longtime.app.config.Constants"%>
<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
	<thead>
		<tr>
               <th>序号</th>
			   <th>标题</th>
			   <th>参与人数</th>
               <th>开始时间</th>
               <th>结束时间</th>
               <th>标签</th>
               <th>创建者</th>
               <th>发布状态</th>
               <th>操作</th>
		</tr>
	</thead>
	<tbody>
	    <c:if test="${empty list }">
	    	<tr>
	    		<td colspan="9">暂无数据</td>
	    	</tr>
	    </c:if>
	    <c:forEach items="${list }" var="v" varStatus="vs">
	   		<tr>
	   			<td>${vs.index+1 }</td>
	   			<td title="${v.title }">${ltfun:html2Text(v.title,15)}</td>
	   			<td>${v.voteNum }</td>
	   			<td>
	   			   <c:if test="${v.startTime!=0}" >
	   			       <d:formatDate currentTime="${v.startTime }" format="yyyy/MM/dd HH:mm"/>
	   			   </c:if>	
	   			</td>
	   			
	   			<td>
	   			    <c:if test="${v.endTime!=0}">
	   			      <d:formatDate currentTime="${v.endTime }" format="yyyy/MM/dd HH:mm"/>
	   			    </c:if>
	   			</td>
	   			<td>${v.labels }</td>
	   			<td>${v.creatorName }</td>
	   			<td>
	   				<c:if test="${v.isrelease==2}" >已发布</c:if>
	   				<c:if test="${v.isrelease ==1}" >发布中</c:if>
	   				<c:if test="${v.isrelease ==0}" >未发布</c:if>
	   				<c:if test="${v.isrelease ==-1}" >发布失败</c:if>
	   			</td>
	   			<td>
	   				<c:if test="${v.isrelease==0 || v.isrelease==-1 }" >
	   					<a href="javascript:void(0);" onclick="updaterelease('${v.id}',1)">发布</a>
	   				</c:if>
	   				<c:if test="${v.isrelease==1 || v.isrelease==2}" >
	   					<a href="javascript:void(0);" onclick="updaterelease('${v.id}',0)">取消发布</a>
	   				</c:if>
	   				&nbsp;&nbsp;
	   				<a href="${basepath }/mgr/voteactivity/update.xhtml?id=${v.id}">修改</a>
	   				&nbsp;&nbsp;
	   				<a href="javascript:void(0);" onclick="delVoteActivity('${v.id}');">删除</a>
	   				&nbsp;&nbsp;
	   				<a href="${basepath }/mgr/voteactivity/toauth.xhtml?id=${v.id}">授权</a>
	   				&nbsp;&nbsp;
	   				<a href="${basepath}/mgr/voteactivity/statistics.xhtml?id=${v.id}" >统计</a>
	   				&nbsp; &nbsp; 
	   				<a href="javascript:void(0);" onclick="qrcode('<%=Constants.STUDENT_WEB_ROOT %>m/ixin/nsurvey/index.xhtml?id=${v.id}&fdomain=${v.domain}')">访问地址</a>
	   				
	   				&nbsp; &nbsp; 
					<a href="javascript:void(0);" <c:if test="${!vs.first}">onclick="up('${v.id}',${v.weight},${pager.current_page })"</c:if> ><i class="fa fa-long-arrow-up"></i></a>
					&nbsp; 
					<a href="javascript:void(0);" <c:if test="${!vs.last}">onclick="down('${v.id}',${v.weight},${pager.current_page })"</c:if> ><i class="fa fa-long-arrow-down"></i></a>
	   			</td>
	   		</tr>
	   </c:forEach>
	</tbody>
</table>

<div>
<jsp:include page="/WEB-INF/jsp/mgr/ixin/include/pager.jsp"></jsp:include>
</div>