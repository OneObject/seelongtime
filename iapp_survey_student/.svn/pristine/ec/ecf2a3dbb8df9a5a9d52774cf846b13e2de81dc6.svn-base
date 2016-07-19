<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <c:if test="${empty name}">
		<title>课程学习</title>
	</c:if>
	<c:if test="${not empty name }">
		<title>分类:${name}</title>
	</c:if>
    <link rel="stylesheet" href="${basepath }/static/css/320.css">
</head>
<body>
<section class="series">
	<c:if test="${empty courses}">
		<div class="well well-small text-center" style="margin:20px 10px 5px;">没有数据</div>
	</c:if>
	 <c:forEach items="${courses}" var="course">
	 	<c:if test="${course.type eq 10 }">
		    <section class="a-series">
		        <!--一个系列 start-->
		        <div class="series-top">
		            <img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${course.cover}<%=Constant.QINIU_COURSE_IMG_STYLE_320_180%>" onerror="javascript:this.src='${basepath}/static/img/study/cover_c.png'" class="bigimg">
		            <span class="series-top-title-bg"></span>
		            <span class="series-top-title">${course.name }</span>
		        </div>
		        
		        <section class="list-box">
		            <!--课程列表 start-->
		            <ul class="course-list">
		            	<c:if test="${empty course.seriesCourses}">
							<div class="well well-small text-center" style="margin:20px 10px 5px;">该系列下还没有设置课程</div>
						</c:if>
		            	<c:forEach items="${course.seriesCourses }" var="seriseCourse">
			                <li  onclick="javascript:openwindow(this,'${basepath}/m/study/detail/${seriseCourse.id}.xhtml?fdomain=${current_domain }')">
			                    <div class="course-list-item">
			                        <div class="course-list-item-img">
			                            <img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${seriseCourse.cover}<%=Constant.QINIU_COURSE_IMG_STYLE_320_180%>" onerror="javascript:this.src='${basepath}/static/img/study/cover_c.png'">
			                            <i class="fa fa-caret-square-o-right"></i>
			                        </div>
			                        <div class="course-list-item-detail">
			                            <h3>${seriseCourse.name }</h3>
			                            <span>${seriseCourse.descript }</span>
			                            <p><i class="fa fa-comment">(${ajy:commentTotal(seriseCourse.id,1)})</i><i class="fa fa-thumbs-up">(${ajy:praiseTotal(seriseCourse.id,1)})</i><!-- <i class="fa fa-eye">(${scannum })</i> --></p>
			                        </div>
			                    </div>
			                </li>
		                </c:forEach>
		            </ul>
		            <!--课程列表 end-->
		        </section>
		        <!--一个系列 end-->
		    </section>
	    </c:if>
	    <c:if test="${course.type eq 1 }">
		    <section class="a-series">
		        <!--只有一个课程的-->
		        <div class="series-top"  onclick="javascript:openwindow(this,'${basepath}/m/study/detail/${course.id}.xhtml?fdomain=${current_domain }')">
		            <span class="course-name">
		               ${course.name }
		            </span>
		            <img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${course.cover}<%=Constant.QINIU_COURSE_IMG_STYLE_320_180%>" onerror="javascript:this.src='${basepath}/static/img/study/cover_c.png'">
		        </div>
		        <section class="jianjie">
		            <span>${course.descript }</span>
		        </section>
		        <span class="quanwen"  onclick="javascript:openwindow(this,'${basepath}/m/study/detail/${course.id}.xhtml?fdomain=${current_domain }')">阅读全文</span><span style="color: #999999;font-size: 75%;"><i class="fa fa-comment">(${likenum })</i>&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-thumbs-up">(${commentnum })</i>&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-eye">(${scannum })</i></span>
		    </section>
	    </c:if>
    </c:forEach>
</section>
</body>
</html>