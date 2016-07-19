<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>

<c:if test="${rs.pageable.totalPages eq 0 }">
<div class="holder-no-data">
	没有内容
</div>
</c:if>

<c:forEach var="item" items="${rs.data }">
	<a href="${basepath}/m/ext/muyang/product/product/detail.xhtml?id=${item.id}">
                <div class="info-box">
                	<c:choose>
                		<c:when test="${empty item.covers }">
                    		<img src="${basepath}/static/m/ext/muyang/img/product1.png" />
                		</c:when>
                		<c:otherwise>
                			<img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${item.covers}<%=Constant.QINIU_COURSE_IMG_STYLE_320_180%>" />
                		</c:otherwise>
                	</c:choose>
                    <ul>
                        <li>${item.type }</li>
                        <li>产品名称：${item.name }</li>
                        <li>商品名称：${item.goodname }</li>
                        <%--
                        <li><span>215</span><label class="ping"></label><span>354</span><label class="zan"></label></li>
                         --%>
                    </ul>
                </div>
                <%--
               	 <label class="hot"></label>
                 --%>
                 <c:if test="${item.isnew eq 1 }">
                	<label class="new"></label>
                 </c:if>
    </a>
</c:forEach>
       

<script type="text/javascript">
var total = parseInt('${rs.pageable.totalPages}');
var current = parseInt('${rs.pageable.pageNumber}');
</script>
