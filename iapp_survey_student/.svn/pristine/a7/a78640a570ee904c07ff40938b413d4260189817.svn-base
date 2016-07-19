<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
		<c:if test="${rs.pageable.total == 0 }">
			<article class="scroll">
			    <section class="noData">
			        <img src="${basepath }/static/img/noData.png" />
			    </section>
		    </article>
		</c:if>
 		<c:forEach  var="item" items="${rs.data}">
 		  	<a href="javascrpit:void(0);" id="item_${item.id}">
					<ul >
						<li><label>${ltfun:dateLongToStringFormat(item.createtime,'yyyy-MM-dd HH-mm') } </label> <span onclick="deleteEntity('${item.id}')">删除</span></li>
						<li>我<label>评论了</label>${item.content }
						</li>
						<li>
						${item.body }
						</li>
					</ul>
			</a>
         </c:forEach>
<c:if test="${restype eq 1}">
<script type="text/javascript">
var coursetotal = parseInt('${rs.pageable.totalPages}');
var coursecurrent = parseInt('${rs.pageable.pageNumber}');
</script>
</c:if>
<c:if test="${restype eq 2}">
<script type="text/javascript">
var topictotal = parseInt('${rs.pageable.totalPages}');
var topiccurrent = parseInt('${rs.pageable.pageNumber}');
</script>
</c:if>
<c:if test="${restype eq 3}">
<script type="text/javascript">
var asktotal = parseInt('${rs.pageable.totalPages}');
var askcurrent = parseInt('${rs.pageable.pageNumber}');
</script>
</c:if>
