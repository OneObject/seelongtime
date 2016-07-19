<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<%@ taglib uri="http://www.longtimeit.com/taglib-elfunctions-ajy" prefix="ajy" %>

<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
	<thead>
		<tr>
               <th >序号</th>
			   <th >名称</th>
			   <th >简介</th>
               <th >创建时间</th>
               <th >操作</th>
		</tr>
	</thead>
	<tbody id="channellist">
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
			<td>
            ${ltfun:html2Text(v.title,20)}
			</td>
			<td > ${ltfun:html2Text(v.remark,20)}</td>
			<td>
				<d:formatDate currentTime="${v.createtime}" format="yyyy-MM-dd HH:mm"/>
			</td>
			<td>
			
			<ltacl:datactl creatoruid="${ v.creator}">
			<a href="${basepath}/mgr/channelresource/tolink.xhtml?id=${v.id}">关联内容</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a href="${basepath}/mgr/channel/toupdate.xhtml?id=${v.id}">修改</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a href="#" onclick="del('${v.id}');" >删除</a>
			&nbsp;&nbsp;|&nbsp;&nbsp;
			</ltacl:datactl>
			<a href="javascript:void(0);" onclick="qrcode('<%=Constants.STUDENT_WEB_ROOT %>m/h5/channelresource/index.xhtml?channelid=${v.id }&fdomain=${v.domain }');" >访问地址</a>
			</td>
		</tr>
</c:forEach>
	</tbody>
</table>
<div>
<jsp:include page="/WEB-INF/jsp/mgr/ixin/include/pager.jsp"></jsp:include>

</div>
