<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="org.apache.commons.lang.math.RandomUtils"%>



<c:if test="${rs.pageable.totalPages eq 0 }">
	<div class="holder-no-data">
		<img src="${basepath}/static/m_h5/nask/img/no_data.png" />
	</div>
</c:if>

<c:forEach var="item" items="${rs.data }">
	
   <div class="someone" data-name="${item.name }" data-id="${item.id}" data-href="abc" onclick="clickSomeoneItem(this);">
           <span class="image">
           <img src="${basepath}/user/avatar/${item.id}.xhtml?style=80x80&color=gray&r=<%=RandomUtils.nextInt()%>" />
           </span>
              <label><i class="fa fa-check set-color"></i></label>
               		<div>${item.name }</div>
   </div>
                            
</c:forEach>
<script type="text/javascript">
var usertotal = parseInt('${rs.pageable.totalPages}');
var usercurrent = parseInt('${rs.pageable.pageNumber}');
</script>
