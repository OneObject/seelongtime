<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>

<input type="hidden" id="orderField" name="orderField" value="${orderField }" >
<input type="hidden" id="orderDirection" name="orderDirection" value="${orderDirection }" >
<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
	<thead>
		<tr>
               <%-- <th><label><input type="checkbox" value="" onclick="checked_all(this)" name='' /></label></th> --%>
              <th width="60">序号</th>
				<th>视频名称</th>
				<th>时长</th>
				<th width="100">发布状态</th>
				<th width="300">操作</th>
		</tr>
	</thead>
	<tbody>
	    <c:choose>
	          <c:when test="${empty rs.items }">
                   <tr><td colspan="9"> 没有相关记录！</td></tr>
	          </c:when>
	          <c:otherwise>
	          </c:otherwise>
	    </c:choose>
		<c:forEach items="${rs.items }" var="item" varStatus="num">
			<tr>
				<td>${num.index+1 }</td>
					<td style="text-align: left;">${item.displayName }</td>
					<td style="text-align: left;">${item.duration }</td>
					<!-- 
					<td style="text-align: right;">${item.size }</td>
					<td>${item.entityMetaInfo.userCreated }</td>
					<td>${item.formatCreateDate }</td>
					-->
					<td>
						<c:if test="${item.isrelease==1 }">已发布</c:if>
						<c:if test="${item.isrelease==0 }">未发布</c:if>
					</td>
					<td style="text-align: left;">
						<%-- <a href="${basepath }/base/admin/ivideo/toedit.xhtml?id=${item.id}" target="navTab" rel="editVideo" >编辑</a>
						&nbsp;&nbsp;&nbsp;&nbsp; --%>
						<a href="<%=Constants.STUDENT_WEB_ROOT %>/widget/ivideoplayer.xhtml?vid=${item.videoid}" target="_blank">预览</a>
						<%-- &nbsp;&nbsp;&nbsp;&nbsp;
						<a href="${basepath }/point/toaddpathpoint.xhtml?vid=${item.id}" target="navTab" rel="addpoint" external="true">路径点</a>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="${basepath }/point/toaddknowledgepoint.xhtml?vid=${item.id}" target="navTab" rel="knowwledge" external="true">知识点</a> --%>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<c:if test="${item.isrelease==0 }">
							<a href="javascript:doRelease('${item.id }','1');" title="确定发布吗？">发布</a>
						</c:if>
						<c:if test="${item.isrelease==1 }">
							<a href="javascript:doRelease('${item.id }','0');" title="确定取消发布吗？">取消发布</a>
						</c:if>
						<%-- 	&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="${basepath }/report/videoviews.xhtml?id=${item.id}" target="navTab" external="true">统计</a> --%>
					</td>
			</tr>
		</c:forEach>	
	</tbody>
</table>

<c:set var="pager" value="${rs.page }" scope="request"></c:set>
<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />
