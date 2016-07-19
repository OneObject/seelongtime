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
	  <div class="block-comment">
        <div class="image">
                   <img src="${basepath}/user/avatar/${item.uid}.xhtml?style=80x80&color=gray&r=<%=RandomUtils.nextInt()%>" />
        </div>
           <dl>
                <dt><label class="set-color">${item.uname}</label><span class="date">${ltfun:dateLongToStringFormat(item.createtime,'yyyy-MM-dd HH:mm')}</span></dt>
                <dd>${item.body}</dd>
           </dl>
       </div>

</c:forEach>
<script type="text/javascript">
var total = parseInt('${rs.pageable.totalPages}');
var current = parseInt('${rs.pageable.pageNumber}');
</script>
