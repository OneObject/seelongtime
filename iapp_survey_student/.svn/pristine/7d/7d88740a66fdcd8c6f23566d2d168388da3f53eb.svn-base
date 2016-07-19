<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="org.apache.commons.lang.math.RandomUtils"%>
<c:if test="${rs.pageable.totalPages eq 0 }">
	<div class="holder-no-data">
						暂无数据
	</div>
</c:if>

<c:forEach var="info" items="${rs.data }" varStatus="status">

				<a href="${basepath}/m/ext/muyang/information/titleindex.xhtml?mid=${info.id}">
                <ul>
                    <li>${info.name }
                    <c:if test="${info.isnew==1 }">
                    <label>NEW</label>
                    </c:if>
                    </li>
                    <li>${ltfun:dateLongToStringFormat(info.showtime,'yyyy-MM-dd') }</li>
                </ul>
                <span class="arrow">
                </span>
            </a>
               
		   </c:forEach>
 <script type="text/javascript">
 var total = parseInt('${rs.pageable.totalPages}');
	var current = parseInt('${rs.pageable.pageNumber}');
	
</script>