<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/WEB-INF/include/taglibs.jsp"%><%--需重再一次导入 --%>
							
						
	<c:if test="${empty rs.data}">
		
		<tr><td  colspan='5'>没有评记录</td></tr>
	
	</c:if>
	<c:forEach items="${rs.data}" var="item" varStatus="st">
		<tr>
			<td>${st.index+1}</td>
			<td>我&nbsp;&nbsp;评论了 &nbsp;&nbsp;${ltfun:html2Text(item.content,40)}</td>
			<td>${ltfun:dateLongToStringFormat(item.createtime,'yyyy-MM-dd HH:mm')}</td>
			<td><a href="javascript:deletecomment('${item.id}');">删除</a></td></tr>
	</c:forEach>			  
     <script type="text/javascript">
     	var commentpageNumber = '${rs.pageable.pageNumber}';
 		var commenttotalPage = '${rs.pageable.totalPages}';
 		var commentpageSize = '${rs.pageable.pageSize}';
 		var commenttotal = '${rs.pageable.total}';
 		showPage(commentpageNumber,commenttotalPage,commentpageSize,commenttotal,"gotoPage3","pageinfo3"); 
	</script>          