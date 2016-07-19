<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<%@page import="com.longtime.app.base.util.Constant"%>
<input type="hidden" id="orderField" name="orderField" value="${orderField }" >
<input type="hidden" id="orderDirection" name="orderDirection" value="${orderDirection }" >

<%
	String url_studytotaltime = Constant.PLAYER_ROOT + "/statistics/total.json";
%>
<script type="text/javascript">
<!--

function getStudyTime(courseid, type,uid){
	var scorm = (1 == type);
	 $.ajax({
         url:'<%=url_studytotaltime%>',
         dataType:"jsonp",
         data:{
			uid : uid,
			rid : courseid,
			scorm : scorm
          },
         jsonp:"callback",
         success:function(data){
        	 $("#study_time_"+courseid+"_"+uid).html(data.show);
        	 if(scorm){
        		 if(data.lesson_status == "completed"){
        			 $("#study_status_"+courseid+"_"+uid).html("已完成");
        		 } else {
        			 $("#study_status_"+courseid+"_"+uid).html("未完成");
        		 }
        	 }
        	 <%-- 
        	 if(scorm){
        		 $("#score_"+courseid+"_"+uid).html(data.last_score + "/" + data.max_score );
        	 } else {
        		 $("#score_"+courseid+"_"+uid).html("--");
        	 }
        	 --%>
        	 
         }
    });	
}

//-->
</script>
<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
	<span class="btn btn-success table_add common_add"  onclick="exportStudyDetail(0);" style="margin-right: 0px" >
           <i class="glyphicon glyphicon-plus"></i>导出所有课程学习进度
    </span>
    
    <ltacl:res resourceId="242" ctl="false" >
    <ltacl:checkAcl resourceId="242">
	<span class="btn btn-success table_add"  onclick="exportStudyDetail(1);" style="margin-right: 8px" >
           <i class="glyphicon glyphicon-plus"></i>导出课程加考试记录
    </span>
    </ltacl:checkAcl>
    </ltacl:res>
    
    <ltacl:res resourceId="241" ctl="true" >
    <ltacl:checkAcl resourceId="241">
	<span class="btn btn-success table_add"  onclick="exportStudyDetail(2);" style="margin-right: 8px" >
           <i class="glyphicon glyphicon-plus"></i>导出课程加考试记录（课程维度）
    </span>
    </ltacl:checkAcl>
    </ltacl:res>
	<thead>
		<tr>
               <th>用户名</th>
               <th>姓名</th>
               <th>课程名称</th>
               <th>学习总时间</th>
               <th>最近学习时间</th>
               <th>课程状态</th>
               
               <ltacl:res resourceId="243" ctl="true" >
               <th>考试状态</th>
               <th>考试得分</th>
               </ltacl:res>
		</tr>
	</thead>
	<tbody>
	   <c:if test="${empty rs.items }">
			<tr>
				<td colspan="8">暂无学习记录信息！</td>
			</tr>
		</c:if>
		<c:forEach items="${rs.items }" var="entity">
			<tr>
				<td>${entity.username }</td>
				<td>${entity.uname }</td>
				<td class="hidden-xs">${entity.cname }</td>
				<td class="hidden-xs" id='study_time_${entity.courseId}_${entity.userId}'>${entity.study_total_time }</td>
				<c:if test="${entity.end_date==0 }">
					<td class="hidden-xs">${ltfun:dateLongToStringFormat(entity.start_date,'yyyy-MM-dd HH:mm') }</td>
				</c:if>
				<c:if test="${entity.end_date!=0 }">
					<td class="hidden-xs">${ltfun:dateLongToStringFormat(entity.end_date,'yyyy-MM-dd HH:mm') }</td>
				</c:if>
				<%--
				<td  align="center" class="hidden-xs" id='score_${entity.courseId}_${entity.userId}'></td>
				 --%>
				
				
				<td class="hidden-xs" id="study_status_${entity.courseId}_${entity.userId}">
					<c:choose>
						<c:when test="${entity.lesson_status eq 'completed' or entity.lesson_status eq 'passed' }">完成</c:when>
						<c:otherwise>未完成</c:otherwise>
					</c:choose>
				</td>
				<ltacl:res resourceId="243" ctl="true" >
				<td>${entity.testStatus }</td>
				<td><fmt:formatNumber value="${entity.score}"  type="number"/></td>
				</ltacl:res>
			</tr>
			<%-- 
			<script type="text/javascript">
				getStudyTime('${entity.courseId}',${entity.resType},'${entity.userId}');
	    	 </script>
			 --%>
		</c:forEach>	
	</tbody>
</table>

<c:set var="pager" value="${rs.page }" scope="request"></c:set>
<jsp:include page="/WEB-INF/jsp/include/admin/pager.jsp" />