<%@page contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="com.longtime.common.utils.Page" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
	<thead>
		<tr>
               <%-- <th><label><input type="checkbox" value="" onclick="checked_all(this)" name='' /></label></th> --%>
               <th>序号</th>
			   <th>作业名称</th>
               <th>开始时间</th>
               <th>结束时间</th>
               <th>要求</th>
               <th>通过分数</th>
               <th>是否可再次提交</th>
               <th>操作</th>
		</tr>
	</thead>
	<tbody>
	<c:if test="${empty tasklist }">
		<tr>
		<td colspan="6">没有找到更多作业信息</td>
		</tr>
	</c:if>
	<c:forEach items="${tasklist }" var="item" varStatus="num">
	<tr>       
	           <td>${num.count}</td>
			   <td>${item.title }</td>
               <td>
               <d:formatDate currentTime="${item.begintime }" format="yyyy-MM-dd HH:mm"/>
               </td>
               <td>
               <d:formatDate currentTime="${item.endtime }" format="yyyy-MM-dd HH:mm"/>
               </td>
               <td>
               ${item.taskrequire}
               </td>
               <td>${item.score }</td>
               <c:if test="${item.informtask eq 0 }">
               <td>否</td>
               </c:if>
               <c:if test="${item.informtask ne 0 }">
               <td>是</td>
               </c:if>
               <td>
               <a href="${basepath}/mgr/task/viewedit.xhtml?id=${item.id}">修改</a>
               <a href="#" id="deltask" onclick="del('${item.id}')">删除</a>
               <a href="${basepath}/base/admin/authorize/authorize.xhtml?rid=${item.id}&rcategory=4&scategory=1">授权</a>
               <a href="${basepath}/mgr/task/viewhomework.xhtml?id=${item.id}">作业批改</a>
               </td>
		</tr>
	</c:forEach>
		
	</tbody>
</table>
<script type="text/javascript">
    function del(id){
		  $.ajax({
			   type:"POST",
			   url: "${basepath}/mgr/task/deltask.json",
			   data: "id="+id,
			   success: function(msg){
				   if(msg){
					   window.location.href="${basepath}/mgr/task/taskindex.xhtml";
					   }else{
                           alert("信息删除失败!");
						   }
			   }
			});
    }
</script>
<jsp:include page="/WEB-INF/jsp/mgr/ixin/include/pager.jsp" />
