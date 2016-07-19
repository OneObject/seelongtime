<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>

<c:if test="${rs.pageable.totalPages eq 0 }">
	<div class="holder-no-data">
		<img src="${basepath}/static/m_h5/nask/img/no_data.png" />
	</div>
</c:if>

<c:forEach var="item" items="${rs.data }">
	
   <div class="tag" data-name="${item.name }" data-id="${item.id }" data-href="abc" onclick="clickTagItem(this);">
       <label><i class="fa fa-check set-color"></i></label>
           <div>${item.name }</div>
   </div>
                            
</c:forEach>
<script type="text/javascript">
var tagtotal = parseInt('${rs.pageable.totalPages}');
var tagcurrent = parseInt('${rs.pageable.pageNumber}');
</script>
