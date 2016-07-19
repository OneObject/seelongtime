<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="org.apache.commons.lang.math.RandomUtils"%>


<c:forEach var="course" items="${rs.data }">

            <a href="#">
                    <ul>
                        <li class="a">这是标题这是标题这是标题这是标题这是标题这是标题这是标题标</li>
                        <li class="b">答：这是标题这是标题这是标题这是标题这是标题这是标题这是标题标</li>
                        <li class="c">2012-11-11 12:22</li>
                    </ul>
                </a>
               
		   </c:forEach>
 <script type="text/javascript">
 var total = parseInt('${rs.pageable.totalPages}');
	var current = parseInt('${rs.pageable.pageNumber}');
</script>