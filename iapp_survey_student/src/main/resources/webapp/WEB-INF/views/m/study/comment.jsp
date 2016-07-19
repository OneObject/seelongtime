<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<c:forEach items="${rs.data }" var="comment">
	<li>
	    <div class="discuss-list-item">
	<%--        <img src="${basepath}/user/avatar/${comment.uid}.xhtml?style=80x80"> --%>
	        <div class="discuss-list-item-content">
	            <span>${comment.uname }</span>
	            <span class="detail-pinlun-time">
	            	<i class="fa fa-clock-o"></i>
	            	&nbsp;${ltfun:dataLongToSNS(comment.createtime,"yyyy-MM-dd HH:mm")}
	            </span>
	            <!-- <i class="fa fa-thumbs-up">0</i> -->
	            <p class="contenttext">
	            	<c:if test="${comment.action eq 2 }">
	            		回复：${comment.touname }&nbsp;&nbsp;
	            		<c:if test="${not empty comment.header }">${comment.header }</c:if>
	            	</c:if>
	            	${comment.body }
	            </p>
	        </div>
	    </div>
	</li>
</c:forEach>

