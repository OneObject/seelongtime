<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%
String img_stype="-320x110";
%>
<!DOCTYPE html>
<html>
<head>
   <title>课程分类</title>
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
		            	<div onclick="javascript:openwindow(this,'${basepath}/m/study/detail/${course.id}.xhtml?fdomain=${current_domain} }')">
		            		<c:if test="${empty course.cover}"><img src="<%=Constant.IMG_SERVER_DOWNLOAD%>default_course_cover<%=img_stype%>" /></c:if>
		            		<c:if test="${not empty course.cover}"><img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${course.cover}<%=img_stype%>" onerror="javascript:this.src='<%=Constant.IMG_SERVER_DOWNLOAD%>default_course_cover<%=img_stype%>'" /></c:if>
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
            <div class="panel-group" id="accordion">
            	<c:forEach items="${categorylist}" var="category" varStatus="st">
            		<div class="panel panel-default">
	                    <!--start-->
	                    <div class="panel-heading" ${empty category.childrens ?'class="toCourseList"':''} rel="${category.id }">
	                        <h4 class="panel-title">
	                            <a data-toggle="collapse" data-toggle="collapse" data-parent="#accordion" href="#collapse${st.count }">
	                                <i class="fa fa-th-large"></i><span class="class-title">${category.name }</span> <i class="fa fa-chevron-right"></i>
	                            </a>
	                        </h4>
	                    </div>
	                    <c:if test="${not empty category.childrens }">
		                    <div id="collapse${st.count }" class="panel-collapse collapse collapsing"><!--添加一个class in即可打开下拉的内容-->
		                        <div class="panel-body">
		                            <ul class="class-list">
		                            	<c:forEach items="${category.childrens }" var="children">
			                                <li class="toCourseList" rel="${children.id }">
			                                    <span>${children.name }</span><i class="fa fa-chevron-right"></i>
			                                </li>
		                                </c:forEach>
		                            </ul>
		                        </div>
		                    </div>
	                    </c:if>
	                    <!--end-->
	                </div>
            	</c:forEach>
            </div>
            <!--课程分类列表 end-->
        </section>
    </section>
    <script type="text/javascript">
        $(function() {
        	
        	$(".toCourseList").click(function(){
        		var cid = $(this).attr("rel");
        		window.location.href="${basepath}/m/study/categorycourse.xhtml?categoryid="+cid;
        	});
        	
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
            $(".panel-heading>.panel-title>a").click(function(){
                var _this=$(this).attr('href');//放内容的盒子
//                alert($(""+_this).hasClass('in'))
                if(!$(""+_this).hasClass('in')){
                //判断放置内容的盒子是否展开
                    $(this).find("i:last-child").removeClass("fa-chevron-right");
                    $(this).find("i:last-child").addClass("fa-chevron-down");
                }else{
                    $(this).find("i:last-child").removeClass("fa-chevron-down");
                    $(this).find("i:last-child").addClass("fa-chevron-right");
                }
            })
        });
		function toCourseList(){
			
		}
    </script>
</body>
</html>