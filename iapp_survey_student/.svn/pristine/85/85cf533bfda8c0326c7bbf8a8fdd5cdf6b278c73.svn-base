<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>

    <section class="wrapper-static margin-top-50 margin-bottom-55">
    <c:choose>
    	<c:when test="${empty coach or empty list}">
    				<ul class="no-answer-img-ul" style="padding-top:50px;">
                        <li>
            			<c:if test="${isTeacher }">      
                        	没有要辅导的学员
                        </c:if>
            			<c:if test="${not isTeacher }">      
                        	敬请期待
                        </c:if>
                        </li>
                        <li></li>
                    </ul>
    	</c:when>
    	<c:otherwise>
    	
    	
    	
	        <div class="new-student-list-box">
	            <div class="new-student-list" id="new-student-list">
            			<c:forEach items="${list }" var="item">
	            			 <div class="student">
			                    <span class="image" onclick="toUserDetail('${item.id}');">
			                    <img src="${basepath}/user/avatar/${item.id}.xhtml?style=80x80&color=gray" />
			                    </span>
			                    <ul>
			                        <li>${item.name }</li>
			                        <li>等级：<span>${not empty item.level ?item.level:'LV0' }</span><label>(${item.percent }%)</label></li>
			                        <li><span class="progress-bar"><label class="percent" data-percent="${item.percent }"></label></span></li>
			                    </ul>
			                </div>
			                <input type="hidden" value="${item.id }">
		                </c:forEach>
		            </div>
		            <c:if test="${not empty list }">
		            <div class="new-help-btn" >
					
		                <span class="help-btn" id="help-btn" onclick="toguidance('${coach.id}')" ><label>我要辅导<i id='btn_coach' style="display:none"></i></label></span>
		            </div>
		            </c:if>
		        </div>
		        <c:choose>
			        <c:when test="${isTeacher }">
				        <div class="new-info-list">
				            <a href="${basepath}/m/ext/enn/coach/newtoaddtask.xhtml?coachid=${coach.id}">
				                <span class="image"><img src="${basepath}/static/m/ext/enn/img/c3.png" /></span>
				                <div>辅导计划</div>
				                <label><%-- ${taskCount } --%></label>
				            </a>
				            <a href="javascript:void(0);" onclick="toCoachList('${coach.id}',true);">
				                <span class="image"><img src="${basepath}/static/m/ext/enn/img/c2.png" /></span>
				                <div>辅导记录</div>
				                <label>${recordCount }</label>
				            </a>
				            <a href="${basepath}/m/ext/enn/coach/surveyresult.xhtml?coachid=${coach.id}">
				                <span class="image"><img src="${basepath}/static/m/ext/enn/img/c4.png" /></span>
				                <div>观察评估表</div>
				                <label>${surveyCount }</label>
				            </a>
				        </div>
			        </c:when>
			        <c:otherwise>
			        	<div class="new-info-list">
				            <a href="${basepath}/m/ext/enn/coach/plandetail.xhtml?uid=${user.id }&coachid=${coach.id}">
				                <span class="image"><img src="${basepath}/static/m/ext/enn/img/c3.png" /></span>
				                <div>辅导计划</div>
				                <label><%-- ${taskCount } --%></label>
				            </a>
				            <a href="javascript:void(0);" onclick="toCoachList('${coach.id}',false);">
				                <span class="image"><img src="${basepath}/static/m/ext/enn/img/c2.png" /></span>
				                <div>实习记录</div>
				                <label>${recordCount }</label>
				            </a>
				            <a href="${basepath}/m/ext/enn/coach/surveyresult.xhtml?coachid=${coach.id}">
				                <span class="image"><img src="${basepath}/static/m/ext/enn/img/c4.png" /></span>
				                <div>观察评估表</div>
				                <label>${surveyCount }</label>
				            </a>
				            <a href="${basepath}/m/ext/enn/coach/surveyresult.xhtml?coachid=${coach.id}&isStudent=true">
				                <span class="image"><img src="${basepath}/static/m/ext/enn/img/c4.png" /></span>
				                <div>指导人评估（匿名）</div>
				                <label></label>
				            </a>
				        </div>
			        </c:otherwise>
		        </c:choose>
    	
    	
    	</c:otherwise>
    
    </c:choose>
    
    
    
    
    </section>

    <script type="text/javascript"
		src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript"
		src="${basepath}/static/m/ext/enn/js/plupload/plupload.full.min.js"></script>
	<script type="text/javascript"
		src="${basepath}/static/m/ext/enn/js/guidance.2.0.js"></script>
	<script type="text/javascript" src="${basepath}/static/plugins/socket.io/socket.io.js"></script>
	<script type="text/javascript" >


	var isNotice = $("#notice_coach").is(':visible');
	if(isNotice){
			$("#btn_coach").show();
	}else{
			$("#btn_coach").hide();
	}
	
	function toCoachList(id,isTeacher){
		
		window.location.href = "${basepath}/m/ext/enn/coach/coach.xhtml?coachid="+id;
		
	}
	
	</script>