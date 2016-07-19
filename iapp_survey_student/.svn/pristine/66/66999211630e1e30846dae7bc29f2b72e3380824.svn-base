<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%
String img_stype="-320x180";
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","No-cache"); 
response.setDateHeader("Expires", -1); 
response.setHeader("Cache-Control", "No-store");
%>
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
    <script src="${basepath }/static/js/swipe.js"></script>
</head>
<body>
<section class="classify">
    <div class="slider">
        <!--图片轮播-->
        <div id='slider' class='swipe'>
            <div class='swipe-wrap'>
            	<c:forEach items="${tops}" var ="course" varStatus="status">
	            	<div onclick="javascript:openwindow(this,'${basepath}/m/study/detail/${course.id}.xhtml?domain=${current_domain}')">
	            		<c:if test="${empty course.cover}"><img src="${basepath }/static/img/course/default_course_cover_320x180.png" /></c:if>
	            		<c:if test="${not empty course.cover}"><img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${course.cover}<%=img_stype%>" onerror="javascript:this.src='${basepath }/static/img/course/default_course_cover_320x180.png'" /></c:if>
	                </div>
            	</c:forEach>
            </div>
            <nav>
          
                <ul id='position'>
                	<c:forEach var="i" begin="1" end="${fn:length(tops)}">
                    	<li <c:if test="${i==1}">class='on'</c:if>></li>
                    </c:forEach>
                </ul>
            </nav>
        </div>
        <!--图片轮播 end-->
    </div>
    <section class="list-box">
        <!--课程分类列表 start-->
        <ul class="course-list">
        	<c:if test="${empty courses}">
				<div class="well well-small text-center" style="margin:20px 10px 5px;">没有数据</div>
			</c:if>
			
			<c:forEach items="${courses}" var ="course" varStatus="status"> 
	           <li onclick="javascript:openwindow(this,'${basepath}/m/study/detail/${course.id}.xhtml?domain=${current_domain}')">
	                <div class="course-list-item">
	                    <div class="course-list-item-img">
	                        <img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${course.cover}<%=Constant.QINIU_COURSE_IMG_STYLE_180_180%>" class="sm-img" onerror="javascript:this.src='${basepath}/static/img/study/cover_c_100x100.png'" />
	                       <!--  <i class="fa fa-caret-square-o-right"></i> -->
	                       <%-- <img src="${basepath}/static/img/study/player_btn.png" class="i"> --%>
	                    </div>
	                    <c:set var="categoryname" value="${ajy:categoryName(course.categoryid)}"></c:set>
	                    <c:if test="${empty categoryname}">
	                       <c:set var="cname" value=""></c:set>
	                    </c:if>
	                    <c:if test="${not empty categoryname}">
	                       <c:set var="cname" value="[${categoryname}]"/>
	                    </c:if>
	                    <div class="course-list-item-detail">
	                        <h3>${course.name}</h3>
	                        <span>${course.descript}</span>
	                        <p><a style="float:left;color:#999;" href="#">${cname}</a><i class="fa fa-comment">(${ajy:commentTotal(course.id,1)})</i><i class="fa fa-thumbs-up">(${ajy:praiseTotal(course.id,1)})</i><!-- <i class="fa fa-eye">(${scannum })</i> --></p>
	                    </div>
	                </div>
	            </li>
             </c:forEach> 
            
        </ul>
        <!--课程分类列表 end-->
    </section>
</section>
<script type="text/javascript">
    $(function() {
        $("#slider").find("img").each(function(){
            var wt = $(window).width();//浏览器当前的宽度
            var ht = wt*9/16;
            $(this).height(ht+"px")
            $(this).width(wt+"px");
        });
        var slider =
                Swipe(document.getElementById('slider'), {
                    auto: 3000,
                    continuous: true,
                    callback: function(pos) {
                        var i = bullets.length;
                        while (i--) {
                            bullets[i].className = ' ';
                        }
                        bullets[pos].className = 'on';
                    }
                });
        var bullets = document.getElementById('position').getElementsByTagName('li');
        /*点击展开时改变箭头的方向*/
    });
</script>
</body>
</html>