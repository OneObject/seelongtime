<%@page contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="com.longtime.common.utils.Page" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
	<thead>
		<tr>
               <%-- <th><label><input type="checkbox" value="" onclick="checked_all(this)" name='' /></label></th> --%>
               <th>用户名</th>
			   <th>姓名</th>
			   <th>联系电话</th>
			   <th>部门</th>
               <th>报名时间</th>
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
			   <td>${item.userName }</td>
			   <td>${item.uname }</td>
			   <td>${item.mobile }</td>
			   <td>${item.company }</td>
               <td>
               <d:formatDate currentTime="${item.applyDate }" format="yyyy-MM-dd HH:mm"/>
               </td>
               <c:if test="${item.isSignin eq 1 }">
               <td>已签到</td>
               <td>
               <d:formatDate currentTime="${item.signinDate }" format="yyyy-MM-dd HH:mm"/>
               </td>
               </c:if>
               <c:if test="${item.isSignin eq 0 }">
               <td>未签到</td>
               <td>
               </td>
               </c:if>
		</tr>
	</c:forEach>
		
	</tbody>
</table>
<jsp:include page="/WEB-INF/jsp/mgr/ixin/include/pager.jsp" />
