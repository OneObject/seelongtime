<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
	<thead>
		<tr>
               <th>序号</th>
			   <th>课程名称</th>
               <th>课程分类</th>
               <th>课程时间(分钟)</th>
               <th>合格分数</th>
               <th>创建时间</th>
               <th>发布状态</th>
               <th>操作</th>
		</tr>
	</thead>
	<tbody>
	    <%-- <c:choose>
	          <c:when test="${empty list }">
                   <tr><td colspan="9"> 没有相关记录！</td></tr>
	          </c:when>
	          <c:otherwise>
	          </c:otherwise>
	    </c:choose> --%>
	</tbody>
</table>
