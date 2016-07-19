<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
	<thead>
		<tr>
               <th>选择</th>
			   <th>标题</th>
		</tr>
	</thead>
	<tbody>
	    <c:if test="${empty rs.items }">
	    	<tr>
	    		<td colspan="4">暂无数据</td>
	    	</tr>
	    </c:if>
	   <c:forEach items="${rs.items }" var="item" varStatus="vs">
	   		<tr align="left">
	   			<td><input name="ids" value="${item.id }" type="checkbox"></td>
	   			<td>${item.name }</td>
	   			<input type="hidden" id="name_${item.id}" value="<c:out value='${item.name}'/>"/>
	   		</tr>
	   </c:forEach>
	</tbody>
</table>
<c:set var="pageFn" value="doSelectPage" scope="request"></c:set>
<c:set var="pager" value="${rs.page}" scope="request"></c:set>
<div>
<jsp:include page="/WEB-INF/jsp/mgr/ixin/include/pager.jsp"></jsp:include>
</div>
<script>

function setChoose(){
	var chooseids=[];
	$("input[name='chooseids']").each(function(){
		   chooseids.push($(this).val());
		});
	
	$("input[name='ids']").each(function(){
		
		for (var i = 0; i < chooseids.length; i++) {
	        if (chooseids[i] === $(this).val()) {
	        	$(this).attr("checked","checked");
	        	$(this).attr("disabled","disabled");
	            break;
	        }
	    }
	    
	    });
}

setChoose();
</script>