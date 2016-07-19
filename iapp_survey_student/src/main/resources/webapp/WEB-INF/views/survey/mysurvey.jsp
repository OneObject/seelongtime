<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="com.longtime.ajy.session.SessionHelper"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/WEB-INF/include/taglibs.jsp"%><%--需重再一次导入 --%>
<%
	String uid= SessionHelper.getCurrentUid();
%>
	<c:if test="${empty rs.data}">
		
		<tr><td  colspan='5'><fmt:message key="ucenter.nodata" bundle="${bundle}"/></td></tr>
	
	</c:if>
	<c:forEach items="${rs.data}" var="item" varStatus="st">
		<tr>
			<td align="center">${st.count}</td>
			<td>${ltfun:html2Text(item.title,50)}</td>
			<td align="center">${ltfun:dateLongToStringFormat(item.startTime,'yyyy-MM-dd HH:mm')}</td>
			<td align="center">${ltfun:dateLongToStringFormat(item.endTime,'yyyy-MM-dd HH:mm')}</td>
			<td align="center">
				<a href="${basepath }/survey/result.xhtml?id=${item.id}"><fmt:message key="menu.see_detail" bundle="${bundle}"/></a>
			</td>
		</tr>
	</c:forEach>			  
     <script type="text/javascript">
     	var coursepageNumber = '${rs.pageable.pageNumber}';
 		var coursetotalPage = '${rs.pageable.totalPages}';
 		var coursepageSize = '${rs.pageable.pageSize}';
 		var coursetotal = '${rs.pageable.total}';
     	showPage(coursepageNumber,coursetotalPage,coursepageSize,coursetotal,"gotoPage1","pageinfo1"); 
	</script>            
							
							
