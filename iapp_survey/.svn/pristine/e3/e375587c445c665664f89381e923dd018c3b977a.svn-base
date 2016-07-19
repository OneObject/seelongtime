<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<%@ taglib uri="http://www.longtimeit.com/taglib-elfunctions-ajy" prefix="ajy" %>

<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
	<thead>
		<tr>
               <th>序号</th>
			   <th>话题名称</th>
               <th>创建时间</th>
               <th>操作</th>
		</tr>
	</thead>
	<tbody id="topiclist">
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
			<c:if test="${v.recommend eq 1}"><span style="color: red;">(荐)</span></c:if>
			<c:if test="${v.top >0}"><span style="color: red;">(顶)</span></c:if>
             <c:out value="${v.content }"></c:out>
			</td>
			<td>
				<d:formatDate currentTime="${v.createtime }" format="yyyy-MM-dd HH:mm"/>
			</td>
			<td>
				<a href="javascript:void(0);" onclick="del('${v.id}');">删除</a> &nbsp;&nbsp;
				<a href="${basepath}/mgr/topic/commentstudentindex.xhtml?topicid=${v.id}&from=active" >评论管理</a>
				<a href="${basepath}/mgr/praise/praiseindex.xhtml?resid=${v.id}&restype=2&meta=activity" >赞管理</a>
				&nbsp;
				<c:if test="${v.top eq 0 }">
					<a href="javascript:void(0);" onclick="totop('${v.id}');" id="top_${v.id}" t="0">置顶</a>
				</c:if>
				<c:if test="${v.top>0 }">
					<a href="javascript:void(0);" onclick="totop('${v.id}');" id="top_${v.id}" t="1">取消置顶</a>
				</c:if>
			</td>
		</tr>
</c:forEach>
	</tbody>
</table>
<div>
<jsp:include page="/WEB-INF/jsp/mgr/ixin/include/pager.jsp"></jsp:include>

</div>
