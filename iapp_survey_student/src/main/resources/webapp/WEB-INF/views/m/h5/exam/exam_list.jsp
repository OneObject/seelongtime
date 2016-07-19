<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%> 
<input type="hidden" value="${pageable.total }" id="total" />
	<c:if test="${pageable.total == 0 }">
			<article class="scroll">
			    <section class="noData">
			        <img src="${basepath }/static/img/noData.png" />
			    </section>
		    </article>
		</c:if>
<c:forEach var="examvo" items="${list}" varStatus="vs">
	<a href="javascript:void(0);" class="examItem new-exam-item" onclick="toTest('${examvo.id}');">
            <ul>
                <li style="white-space:nowrap;text-overflow:ellipsis;overflow:hidden;">${examvo.examName }</li>
                <li>${ltfun:dateLongToStringFormat(examvo.startTime,'yyyy-MM-dd
				HH:mm') }至${ltfun:dateLongToStringFormat(examvo.endTime,'MM-dd
				HH:mm') }</li>
            </ul>
          	<c:choose>
           		<c:when test="${examvo.startTime>nowtime }">
           		 <div class="blue">未开始</div>
           		</c:when>
           		<c:when test="${examvo.endTime<nowtime }">
           		<div>已结束</div>
           		</c:when>
           		<c:when test="${examvo.endTime>nowtime &&examvo.startTime<nowtime  }">
           		<div class="red">进行中</div>
           		</c:when>
           		</c:choose> 
          <%-- <c:if test="${examvo.startTime>nowtime }">
				 <div class="blue">未开始</div>
				</c:if>
				<c:if test="${examvo.endTime<nowtime }">
				<div>已结束</div>
				</c:if>
				<c:if test="${examvo.endTime>nowtime &&examvo.startTime<nowtime }">
				<div class="red">进行中</div>
				</c:if>  --%>
			
        </a>
</c:forEach>