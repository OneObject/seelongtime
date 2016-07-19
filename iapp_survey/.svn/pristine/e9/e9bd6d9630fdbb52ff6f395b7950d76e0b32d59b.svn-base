<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>

<input type="hidden" id="orderField" name="orderField" value="${orderField }" >
<input type="hidden" id="orderDirection" name="orderDirection" value="${orderDirection }" >
<table class="table table-striped table-bordered table-hover table-full-width datatable" id="sample_2">
	<thead>
		<tr>
	              <th style="width: 60px">序号</th>	             
			   	  <th style="width: 150px;text-align: center;">视频名称</th>
	         <!-- <th style="text-align: center;">token</th> -->
	         <!-- <th style="width: 50px;text-align: center;">videoid</th>-->
	              <th style="width: 80px;text-align: center;">视频大小</th>
	         <!-- <th style="width: 80px;text-align: center;">上传人</th>-->
	              <th style="width: 100px;text-align: center;">上传时间</th>
	              <th style="width: 80px;text-align: center;">上传状态</th>              
	              <th style="width: 70px;text-align: center;">操作</th>
		</tr>
	</thead>
	<tbody>
	    <c:choose>
	          <c:when test="${empty rs.items }">
                   <tr><td colspan="9"> 没有相关记录！</td></tr>
	          </c:when>
	          <c:otherwise>
					<c:forEach items="${rs.items }" var="item" varStatus="num">
						<tr>			
							<td>${num.index+1}</td>
							<td>${item.name}</td>
							<!--<td>${item.token}</td
							<td>${item.videoid}</td>>-->
							<td>${item.size}</td>
							<!--<td>${item.entityMetaInfo.userCreated }</td>-->
							<td>${item.formatCreateDate }</td>
							<td><c:if test="${item.status == 10}">
										转码成功
									</c:if>
									<c:if test="${item.status == 0}">
										转码中
									</c:if>
									<c:if test="${item.status == -1}">
										转码失败
									</c:if></td>
								<td>
									<c:if test="${item.isrelease==0 }">
									<a href="javascript:doRelease('${item.id }','1');" title="确定删除吗？">删除</a>&nbsp;
									</c:if>
									<c:if test="${item.status == 10 }" >
										<a href="<%=Constants.STUDENT_WEB_ROOT %>/widget/ivideoplayer.xhtml?vid=${item.videoid}" target="_blank">预览</a>&nbsp;
										<%--
										<a href="${basepath }/ivideo/preview/${item.id }.xhtml?uid=test" target="_blank">预览</a>&nbsp;
										 --%>
										<c:if test="${item.isrelease==0 }">
											<a href="javascript:doRelease('${item.id }','2');" title="确定发布吗？">发布</a>&nbsp;
										</c:if>
										<c:if test="${item.isrelease==1 }">
											<a href="javascript:doRelease('${item.id }','0');" title="确定取消发布吗？">取消发布</a>
										</c:if>
									</c:if>
									<!-- <a href="/ivideo/delvideo.xhtml?id=${item.id}" target="ajaxTodo" title="确定要删除吗?">删除</a> -->
									
									<input name="token" value="${item.token }" type="hidden" />
									<input name="videoid" value="${item.videoid }" type="hidden" />
									
									
								</td>
						</tr>
					</c:forEach>	
	          </c:otherwise>
	    </c:choose>
	</tbody>
</table>
      
<c:set var="pager" value="${rs.page }" scope="request"></c:set>
<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />
