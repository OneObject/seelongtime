<%@page contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="com.longtime.common.utils.Page" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
	<thead>
		<tr>
               <%-- <th><label><input type="checkbox" value="" onclick="checked_all(this)" name='' /></label></th> --%>
               <th>序号</th>
               <th>学员名称</th>
               <th>分数</th>
               <th>通过分数</th>
               <th>状态</th>
               <th>操作</th>
		</tr>
	</thead>
	<tbody>
	<c:if test="${empty list }">
		<tr>
		<td colspan="6">没有找到更多作业信息</td>
		</tr>
	</c:if>
	<c:forEach items="${list}" var="item" varStatus="num">
	<tr>       
	           <td>${num.count}</td>
			   <td>${item.uname}</td>
               <td>
                ${item.score}
               </td>
               <td>
               ${item.passscore}
               </td>
               <td>
                 <c:if test="${item.status eq 0}">
                 <label class="label label-warning">未提交</label>
                 </c:if>
                 <c:if test="${item.status eq 1 }">
                  <label class="label  label-default">未批改</label>
                 </c:if>
                  <c:if test="${item.status eq 2 }">
                   <label class="label label-danger">未通过</label>
                 </c:if>
                  <c:if test="${item.status eq 3 }">
                   <label class="label label-success">通过</label>
                 </c:if>
               </td>
               <td>
               <a href="${basepath}/mgr/task/viewpigai.xhtml?id=${item.taskuserid}&score=${item.passscore}">批改</a>
               </td>
		</tr>
	</c:forEach>
		
	</tbody>
</table>
<script type="text/javascript">
</script>
<jsp:include page="/WEB-INF/jsp/mgr/ixin/include/pager.jsp" />
