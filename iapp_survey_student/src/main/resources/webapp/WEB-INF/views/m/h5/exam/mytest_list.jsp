<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<input type="hidden" id="pagenum1" value="${rs.pageable.totalPages }">
<input type="hidden" id="total" value="${rs.pageable.total }">
	<c:if test="${rs.pageable.total == 0 }">
			<article class="scroll">
			    <section class="noData">
			        <img src="${basepath }/static/img/noData.png" />
			    </section>
		    </article>
	</c:if>
	<c:forEach  var="item" items="${rs.data}">
		<a href="javascript:void(0);" class="examItem new-exam-item" onclick="toTest('${item.id}');">
		 	<ul>
                <li style="white-space:nowrap;text-overflow:ellipsis;overflow:hidden;">${item.examName}</li>
                <li>
                <c:if test="${item.testStatus eq 1 }">
                <span class="a">已通过</span> 
                </c:if>
                <c:if test="${item.testStatus ne 1 }">
                <span class="b">未通过</span>
                </c:if>
                最高分：<label>${item.score }</label> 次数：<label>${item.test_times }</label> </li>
            </ul>
		 </a>
      
  </c:forEach>