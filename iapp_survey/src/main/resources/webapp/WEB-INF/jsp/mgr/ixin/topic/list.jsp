<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
	<thead>
		<tr>
               <th>序号</th>
			   <th>标题</th>
               <th>简介</th>
               <th>关键字</th>
               <th>最后修改时间</th>
               <th>创建人</th>
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
			<td>${vs.index+1 }</td>
			<td>${v.title }</td>
			<td title="${v.summary }">
				<c:if test="${fn:length(v.summary)>20 }">
					${fn:substring(v.summary,0,20) }...
				</c:if>
				<c:if test="${fn:length(v.summary)<=20 }">
					${v.summary }
				</c:if>
			</td>
			<td>
				${v.keywords }
			</td>
			<td>
				<c:if test="${v.updatetime==null }">
				<d:formatDate currentTime="${v.createTime }" format="yyyy-MM-dd HH:mm"/>
				</c:if>
					<c:if test="${v.updatetime!=null }">
					<d:formatDate currentTime="${v.updatetime }" format="yyyy-MM-dd HH:mm"/>
					</c:if>
			</td>
			<td>
				${v.creatorName }
			</td>
			<td>
			<ltacl:datactl creatoruid="${v.creator }">
				<a href="${basepath }/mgr/topiccomment/index.xhtml?topicId=${v.id}" target="_topicdetail">评论管理</a> &nbsp;&nbsp;
				<a href="javascript:void(0);" onclick="del('${v.id}');">删除</a> &nbsp;&nbsp;
				<a href="${basepath }/mgr/topic/update.xhtml?id=${v.id }">修改</a> &nbsp;&nbsp;
			</ltacl:datactl>
				<a href="${basepath }/protal/topic/wall/${v.id}.xhtml?v=2"  target="_wall">墙</a>
				
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<div>
<jsp:include page="/WEB-INF/jsp/mgr/ixin/include/pager.jsp"></jsp:include>
</div>
