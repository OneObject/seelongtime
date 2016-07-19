<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%
String img_stype="-80x80";
%>
<!DOCTYPE html>
<html>
<head>
    <title>课程门户首页</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    
    <link rel="stylesheet" href="${basepath}/static/css/owl.carousel.css">
    <link rel="stylesheet" href="${basepath}/static/css/320.css">
</head>
<body>
<div style="margin-bottom: 60px;">
<div class="slider">
    <!--图片轮播-->
    <div id='slider' class='swipe'>
        <!--图片轮播 start-->
        <div class='swipe-wrap'>
            <c:forEach items="${tops}" var ="course" varStatus="status">
	            	<div onclick="javascript:openwindow(this,'${basepath}/m/study/detail/${course.id}.xhtml?fdomain=${current_domain }')">
	            		<c:if test="${empty course.cover}"><img src="${basepath }/static/img/course/default_course_cover_100x100.png" /></c:if>
	            		<c:if test="${not empty course.cover}"><img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${course.cover}<%=img_stype%>" onerror="javascript:this.src='${basepath }/static/img/course/default_course_cover_100x100.png'" /></c:if>
	                </div>
            	</c:forEach>
        </div>
        <nav>
            <ul id='position'>
            	<c:forEach items="${tops }" var="course" varStatus="st">
            		<li ${st.index==0 ? 'class="on"' : '' }></li>
            	</c:forEach>
            </ul>
        </nav>
        <!--图片轮播 end-->
    </div>
</div>
    <div class="classify-box">
        <span class="classify-title">精品课程</span>
        <div id="owl-demo" class="owl-carousel owl-theme owl">
        
            <c:forEach items="${comCourses}" var ="course" varStatus="status">
	            	<div class="item" onclick="javascript:openwindow(this,'${basepath}/m/study/detail/${course.id}.xhtml?fdomain=${current_domain }')">
                		 <div class="courseitem">
                   		 	<c:if test="${empty course.cover}"><img src="${basepath }/static/img/course/default_course_cover_100x100.png" /></c:if>
	            		 	<c:if test="${not empty course.cover}"><img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${course.cover}<%=img_stype%>" onerror="javascript:this.src='${basepath }/static/img/course/default_course_cover_100x100.png'" /></c:if>
                    		<span class="coursetitle">
                   			${ltfun:html2Text(course.name,10) }
                    		</span>
               			 </div>
            		</div>

            	</c:forEach>
        </div>
    </div>
<hr>
    <div class="classify-box">
        <span class="classify-title">最新课程</span>
        <div id="owl-new" class="owl-carousel owl-theme owl">
       
            
            <c:forEach items="${newCourses}" var ="course" varStatus="status">
	            	<div class="item" onclick="javascript:openwindow(this,'${basepath}/m/study/detail/${course.id}.xhtml?fdomain=${current_domain }')">
                		 <div class="courseitem">
                   		 	<c:if test="${empty course.cover}"><img src="${basepath }/static/img/course/default_course_cover_100x100.png" /></c:if>
	            		 	<c:if test="${not empty course.cover}"><img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${course.cover}<%=img_stype%>" onerror="javascript:this.src='${basepath }/static/img/course/default_course_cover_100x100.png'" /></c:if>
                    		<span class="coursetitle">
                   			${ltfun:html2Text(course.name,10) }
                    		</span>
               			 </div>
            		</div>

            	</c:forEach>
            
       
            
        </div>
    </div>
</div>
<footer class="coursefooter">
    <ul>
        <li>
            <span>精品</span>
        </li>
        <li>
            <span>分类</span>
        </li>
        <li>
            <span>搜索</span>
        </li>
        <li>
            <span>收藏</span>
        </li>
    </ul>
</footer>
<script src="${basepath}/static/js/jquery-2.1.0.min.js"></script>
<script src="${basepath}/static/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${basepath}/static/js/swipe.js"></script>
<script src="${basepath}/static/js/owl.carousel.js"></script>
<script type="text/javascript">
    $(function() {
        var owl = $("#owl-demo");
        var newco = $("#owl-new");

        owl.owlCarousel({
            itemsCustom : [
                [0, 3],
                [350, 4],
                [370, 4],
                [500, 6]
            ],
            navigation : false
        });
        newco.owlCarousel({
            itemsCustom : [
                [0, 3],
                [350, 4],
                [370, 4],
                [500, 6]
            ],
            navigation : false
        });
        $("#slider").find("img").each(function(){
            var wt = $(window).width();//浏览器当前的宽度
            var ht = parseInt(wt*9/16);
            $(this).attr("style","height:"+ht+"px;width:100%;")
            $(this).parents(".swipe-wrap").attr("style","height:"+ht+"px;");
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
    });
</script>
</body>

</html>