<%@page contentType="text/html; charset=utf-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%
String img_suffix="-imageView0h520q85";
pageContext.setAttribute("img_suffix", img_suffix);
%>
<c:if test="${(empty entity || empty entity.datas) && param.property != 6 }">
<div class="holder-no-data  holder-no-data2">
	没有内容
</div>
</c:if>
<c:if test="${not empty entity && not empty entity.datas}">
<c:forEach var="item" items="${entity.datas}">
	<c:choose>
		<c:when test="${item.model eq 'blue-title'}"><%--标题 --%>
			<div class="${item.css.classtype }">${item.items[0].content}</div>
		</c:when>
		<c:when test="${item.model eq 'only-text'}"><%--文本 --%>
			<table class="${item.css.classtype }">
				<tbody>
					<tr>
						<td>${item.items[0].content}</td>
					</tr>
				</tbody>
			</table>
		</c:when>
		<c:when test="${item.model eq 'only-image'}"><%--图片 --%>
			<table class="${item.css.classtype }">
                    <tbody>
                    <tr>
                        <td>
                            <img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${item.items[0].content}${img_suffix}" />
                        </td>
                    </tr>
                    </tbody>
                </table>
		</c:when>
		<c:when test="${item.model eq 'image-text' or item.model eq 'text-image'}"><%--左图右文 --%>
			<table class="${item.css.classtype }">
				<tbody>
					<tr>
					
					<c:forEach var="block" items="${item.items }">
						<td>
							<c:choose>
								<c:when test="${block.type eq 'img' }"><img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${block.content}${img_suffix}" /></c:when>
								<c:when test="${block.type eq 'text' }">${block.content}</c:when>
							</c:choose>						
						</td>
					</c:forEach>
					</tr>
				</tbody>
			</table>
		</c:when>
	
	
	</c:choose>




</c:forEach>

</c:if>

		

