<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="org.apache.commons.lang.math.RandomUtils"%>
<c:if test="${titlesize<=0}">
	<div class="holder-no-data">
						暂无数据
	</div>
</c:if>

		
<c:forEach var="title" items="${titlelist }" varStatus="st">
		
		<c:if test="${map[title.id]!=0}">
				<dl>
                <dt style="font-size:18px; padding-right: 10px;">${titleno[st.count-1]}、${title.name}</dt>
                <dd>
                <c:forEach var="detail" items="${detaillist }" varStatus="status">
				<c:if test="${detail.tid==title.id }">
				  <span style = "cursor: pointer;font-size:15px;" onclick="window.location.href='${basepath}/m/ext/muyang/information/detail.xhtml?did=${detail.id}'">${detail.name }</span>
				</c:if>
                </c:forEach>
                </dd>
            </dl>
          </c:if>
         <c:if test="${map[title.id]==0}">
        
         </c:if>
		   </c:forEach>
 <script type="text/javascript">
 


</script>