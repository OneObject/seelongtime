<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="org.apache.commons.lang.math.RandomUtils"%>
<%
String random = String.valueOf(System.currentTimeMillis());
%>
<script type="text/javascript">
	var total = parseInt('${rs.pageable.totalPages}');
	var current = parseInt('${rs.pageable.pageNumber}');
</script>
<c:forEach var="item" items="${rs.data }">
 	<sns:imTimeLine timestamp="${item.createtime  }">
							<div class="system-info">${ltfun:dateLongToStringFormat(item.createtime,'yyyy-MM-dd')}</div>
	</sns:imTimeLine>
	<c:choose>
		<c:when test="${uid eq item.sender }">
		<div class="me">
			<div class="chat-box">
				<span class="image" onclick="toUserDetail('${item.sender}');"> <img
					src="${basepath}/user/avatar/${item.sender}.xhtml?style=80x80&color=gray" />
				</span>
				<div class="content-line-1">
				<c:choose>
					<c:when test="${item.type eq 0}">
						<c:out value="${item.content }"/>
					</c:when>
					<c:otherwise>
						<img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${item.content }-imageView0h520q85"/>
					</c:otherwise>
				</c:choose>
				</div>
				<label class="arrow set-bg-color"></label>
			</div>
		</div>
		</c:when>
		
		<c:otherwise>
		<div class="other">
			<div class="chat-box">
				<span class="image" onclick="toUserDetail('${item.sender}');"> <img
					src="${basepath}/user/avatar/${item.sender}.xhtml?style=80x80&color=gray" />
				</span>
				<div class="name">
					${item.name }
				</div>
				<div class="content-line-1">
					<c:choose>
					<c:when test="${item.type eq 0}">
						<c:out value="${item.content }"/>
					</c:when>
					<c:otherwise>
						<img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${item.content }-imageView0h520q85"/>
					</c:otherwise>
				</c:choose>
				</div>
				<label class="arrow"></label>
			</div>
		</div>
		</c:otherwise>
	</c:choose>
</c:forEach>




