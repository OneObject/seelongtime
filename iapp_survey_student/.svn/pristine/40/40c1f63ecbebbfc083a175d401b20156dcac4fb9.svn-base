<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="org.apache.commons.lang.math.RandomUtils"%>

<c:if test="${rs.pageable.totalPages eq 0 }">
	<div class="no-data-img"></div>
</c:if>

<c:forEach var="item" items="${rs.data }">
	  <div class="tag" data-name="${item.name }" data-id="${item.id}" data-href="abc" onclick="clickTagItem(this);">
           <label><i class="fa fa-check"></i></label>
           <div>${item.name }</div>
       </div>
                    

</c:forEach>


<script type="text/javascript">
	var tagtotal = parseInt('${rs.pageable.totalPages}');
	var tagcurrent = parseInt('${rs.pageable.pageNumber}');
</script>
