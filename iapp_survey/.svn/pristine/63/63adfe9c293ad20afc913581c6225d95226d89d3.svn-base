<%@page contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="com.longtime.common.utils.Page" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
	<thead>
		<tr>
               <%-- <th><label><input type="checkbox" value="" onclick="checked_all(this)" name='' /></label></th> --%>
			   <th>中奖人</th>
               <th>所中奖项</th>
               <th>奖品</th>
               <th>中奖时间</th>
               <th>联系方式</th>
               <th>兑奖SN码</th>
		</tr>
	</thead>
	<tbody>
	<c:if test="${empty winners }">
	<tr>
		<td colspan="6">暂时没有人中奖</td>
	</tr>
	</c:if>
	<c:forEach items="${winners }" var="item">
	<tr>
			   <td>${item.name}</td>
			   <td>${item.title }</td>
			   <td>${item.content }</td>
               <td>
               <d:formatDate currentTime="${item.applyDate }" format="yyyy-MM-dd HH:mm"/>
               </td>
               <td>${item.phone }</td>
               <td>${item.sncode }</td>
		</tr>
	</c:forEach>
		
	</tbody>
</table>
<jsp:include page="/WEB-INF/jsp/mgr/ixin/include/pager.jsp" />
