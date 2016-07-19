<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="org.apache.commons.lang.math.RandomUtils"%>
<c:if test="${rs.pageable.totalPages eq 0 }">
	<div class="no-data-img"></div>
</c:if>

<c:forEach var="course" items="${rs.data }">

                <a href="${basepath}/m/study/detail/${course.id}.xhtml?from=ennapp">
                    <div class="block-course">
                     <span class="image"> 
						<c:if test="${empty course.cover }">
                         <img src="${basepath}/static/m/ext/enn/img/banner.png" />
                        </c:if>
                        <c:if test="${not empty course.cover }">
                            <img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${course.cover }-320x180">
						</c:if></span> 
                        <ul>
                            <li>${course.name }</li>
                            <li>
							<c:if test="${ not empty course.length }">
							<i class="fa fa-clock-o"></i>${course.length}分钟
							</c:if>
							
							<%--
							课程状态隐藏
							 <study:studyInfo var="entity"   rid="${course.id}"  uid="${uid} "  hasexam="${not empty course.tid }"/> --%>
							<span>${entity.finalStatus}</span></li>
                            <li>发布时间:${ltfun:dateLongToStringFormat(course.releasetime,'yyyy-MM-dd') } 
							<%--
							点赞数隐藏 							
							<span><i class="fa fa-thumbs-up"></i>${ajy:praiseTotal(course.id,1)}</span> --%>							</li>
                        </ul>
                    </div>
                </a>
               
		   </c:forEach>
 <script type="text/javascript">
 var coursetotal = parseInt('${rs.pageable.totalPages}');
	var coursecurrent = parseInt('${rs.pageable.pageNumber}');
</script>