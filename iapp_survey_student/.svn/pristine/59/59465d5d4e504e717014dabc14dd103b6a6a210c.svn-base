<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/WEB-INF/include/taglibs.jsp"%><%--需重再一次导入 --%>
							
						
	<c:if test="${empty rs.data}">
		
		<tr><td  colspan='5'>没有考试记录</td></tr>
	
	</c:if>
	<c:forEach items="${rs.data}" var="item" varStatus="st">
		<tr>
			<td>${st.index+1}</td>
			<td>${ltfun:html2Text(item.examName,40)}</td>
		
			<td align="center">${ltfun:dateLongToStringFormat(item.attendTime,'yyyy-MM-dd HH:mm')}</td>
				<c:choose>
				<c:when test="${item.testStatus== 0 }">
					<td align="center"><fmt:formatNumber value="${item.score }" pattern="#.#" type="number"/></td>
					<td align="center">未通过</td>
				</c:when>
				<c:when test="${item.testStatus== 1 }">
					<td align="center"><fmt:formatNumber value="${item.score }" pattern="#.#" type="number"/></td>
					<td align="center">通过</td>
				</c:when>
				<c:otherwise>
					<td align="center">--</td>
					<td align="center">阅卷中</td>
				</c:otherwise>
			</c:choose>
			<%--
			<td><a href="javascript:showResult('${item.id}');">考试结果</a></td>
			 --%>
			</tr>
	</c:forEach>			  
     <script type="text/javascript">
     	var exampageNumber = '${rs.pageable.pageNumber}';
 		var examtotalPage = '${rs.pageable.totalPages}';
 		var exampageSize = '${rs.pageable.pageSize}';
 		var examtotal = '${rs.pageable.total}';
 		showPage(exampageNumber,examtotalPage,exampageSize,examtotal,"gotoPage2","pageinfo2"); 
	</script>          