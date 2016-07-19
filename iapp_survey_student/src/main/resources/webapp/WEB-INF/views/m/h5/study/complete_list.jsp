<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%
	String url_studytotaltime = Constant.PLAYER_ROOT + "/statistics/total.json";
%>
<script type="text/javascript">
<!--

var uid= "${uid}";
function getStudyTime(courseid, type){

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
        	 $("#study_time_"+data.rid).append(data.show);
         }
    });	
}

//-->
</script>
<input type="hidden" id="pagenum1" value="${rs.pageable.totalPages }">
		<c:if test="${rs.pageable.total == 0 }">
			<article class="scroll">
			    <section class="noData">
			        <img src="${basepath }/static/img/noData.png" />
			    </section>
		    </article>
		</c:if>
 		<c:forEach  var="item" items="${rs.data}">
 			<a id="${item.id}" href="javascript:toDetail('${item.id}');">
	             <div class="block-course">
		        	 <span class="image">
                   	     <img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${item.cover}<%=Constant.QINIU_COURSE_IMG_STYLE_320_180%>" onerror="javascript:this.src='${basepath}/static/img/study/cover_c.png'">
                    </span>
		            <ul>
		            	<li>${item.name }</li>
	                    <li>
		                    <span class="date" id='study_time_${item.id}'>已学：</span>
			             	<study:studyInfo var="entity"   rid="${item.id}"  uid="<%=MwebHelper.getCurrentUid() %>"  hasexam="${not empty item.tid }"/>
		                    <span>
		                    	${entity.finalStatus}
		                    </span>
	                    </li>
	                    <li class="date">最后学习：${ltfun:dateLongToStringFormat(item.end_date,'yy-MM-dd HH:mm') }  <span><i class="fa fa-thumbs-up"></i>${ajy:praiseTotal(item.id,1)}</span> </li>
		            </ul>
	            </div>
	        </a>
			<script type="text/javascript">
				getStudyTime('${item.id}', '${item.restype}');
	    	 </script>
         </c:forEach>