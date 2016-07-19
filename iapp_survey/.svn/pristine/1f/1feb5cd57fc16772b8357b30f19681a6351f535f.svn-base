<%@page contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="com.longtime.common.utils.Page" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
	<thead>
	<tr>
		<th>
			名称
		</th>
		<th>
			简介
		</th>
		<th>
			签到码
		</th>
		<th>
			状态
		</th>
		<th>
			创建时间
		</th>
		<th>
			创建者
		</th>
		<th>
			操作
		</th>
	</tr>
	</thead>
	<tbody>
	<c:if test="${empty list }">
		<tr>
			<td colspan="6">还没有创建签到事件</td>
		</tr>
	</c:if>
	<c:forEach items="${list }" var="item">
	<tr>
		<td>
			${item.name }
		</td>
		<td>
		  	${item.remark }
		</td>
		<td>
		  	${item.signinCode }
		</td>
		<td>
		<c:if test="${item.type == 0}">
			<span class="label label-sm label-warning">
				未完成
			</span>
		</c:if>
		<c:if test="${item.type == 1}">
			<span class="label label-sm label-success">
				完成
			</span>
		</c:if>
		</td>
		<td>
		<d:formatDate currentTime="${item.createTime }" format="yyyy-MM-dd HH:mm"/>
		</td>
		<td>
		  	${item.creatorName }
		</td>
		<td>
			<%-- 
			<c:if test="${item.type == 1}">
               <a href="javascript:void(0);" onclick="createCode('${item.id}',true)"><i class=""></i>&nbsp;生成二维码（需要绑定）</a>&nbsp;
			</c:if>
			<c:if test="${item.type == 1}">
               <a href="javascript:void(0);" onclick="createCode('${item.id}')"><i class=""></i>&nbsp;生成二维码（无需绑定）</a>&nbsp;
			</c:if>
			--%>
			<ltacl:datactl creatoruid="${item.creator }">
			<a href="${basepath}/mgr/signin/tostep1.xhtml?id=${item.id }"><i class=""></i>&nbsp;修改</a>&nbsp;
			<a href="javascript:void(0);" onclick="del('${item.id}')"><i class=""></i>&nbsp;删除</a>&nbsp;
			</ltacl:datactl>
			<a href="${basepath}/mgr/signin/count.xhtml?id=${item.id }"><i class=""></i>&nbsp;签到名单</a>&nbsp;
			<a href="javascript:void(0);" onclick="qrcode('<%=Constants.STUDENT_WEB_ROOT %>m/h5/signin/newindex.xhtml?id=${item.id}&fdomain=${item.domain}')">访问地址</a>
		</td>
	</tr>
	</c:forEach>
	</tbody>
	</table>
<jsp:include page="/WEB-INF/jsp/mgr/ixin/include/pager.jsp" />
