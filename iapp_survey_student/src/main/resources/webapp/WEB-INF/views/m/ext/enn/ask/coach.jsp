<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>

    <section class="wrapper-static margin-top-50 margin-bottom-55">
        <div class="new-student-list-box">
            <div class="new-student-list" id="new-student-list">
            	<c:choose>
            	
            		<c:when test="${empty list }">
            			当前没有人员
            		</c:when>
            		
            		<c:otherwise>
            			<c:forEach items="${list }" var="item">
	            			 <div class="student">
			                    <span class="image"><img src="${basepath}/static/m/ext/enn/img/tx/tx2.jpg" /></span>
			                    <ul>
			                        <li>${item.name }</li>
			                        <li>等级：<span>LV3</span><label>(68%)</label></li>
			                        <li><span class="progress-bar"><label class="percent" data-percent="68"></label></span></li>
			                    </ul>
			                </div>
			                <input type="hidden" value="${item.id }">
		                </c:forEach>
            		</c:otherwise>
            		
            	</c:choose>

                
            </div>
            <c:if test="${empty list }">
            <div class="new-help-btn">
                <span class="help-btn" id="help-btn">我要辅导</span>
            </div>
            </c:if>
        </div>
        <div class="new-info-list">
            <a href="#">
                <span class="image"><img src="${basepath}/static/m/ext/enn/img/c3.png" /></span>
                <div>辅导计划</div>
                <label>1</label>
            </a>
            <a href="#">
                <span class="image"><img src="${basepath}/static/m/ext/enn/img/c2.png" /></span>
                <div>辅导记录</div>
                <label>12</label>
            </a>
            <a href="#">
                <span class="image"><img src="${basepath}/static/m/ext/enn/img/c4.png" /></span>
                <div>观察评估表</div>
                <label>3</label>
            </a>
        </div>
    </section>
