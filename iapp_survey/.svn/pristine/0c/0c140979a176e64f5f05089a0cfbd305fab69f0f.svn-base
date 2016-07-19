<%@page contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="com.longtime.common.utils.Page" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
	<thead>
		<tr>
               <%-- <th><label><input type="checkbox" value="" onclick="checked_all(this)" name='' /></label></th> --%>
			   <th>姓名</th>
			   <th>联系电话</th>
			   <th>单位</th>
               <th>是否签到</th>
               <th>签到时间</th>
		</tr>
	</thead>
	<tbody>
	<c:if test="${empty records }">
	<tr>
	<td colspan="7" style="text-align: center;">本活动暂时没人报名</td>
	</tr>
	</c:if>
	<c:forEach items="${records }" var="item">
	<tr>
			   <td>${item.name }</td>
			   <td>${item.mobile }</td>
			   <td>${item.work }</td>
               <c:if test="${item.issignin eq 1 }">
               <td>已签到</td>
               <td>
               <d:formatDate currentTime="${item.signindate }" format="yyyy-MM-dd HH:mm"/>
               </td>
               </c:if>
               <c:if test="${item.issignin eq 0 }">
               <td>未签到</td>
               <td>
               </td>
               </c:if>
		</tr>
	</c:forEach>
		
	</tbody>
</table>
<jsp:include page="/WEB-INF/jsp/mgr/ixin/include/pager.jsp" />
