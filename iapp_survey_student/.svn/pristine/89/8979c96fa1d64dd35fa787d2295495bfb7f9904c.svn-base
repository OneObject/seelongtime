<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%
String img_stype="-80x80";
String img_suffix="-320x110";
String img_suffix2="-320x180";
%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>课程门户首页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
  <link type="text/css" rel="stylesheet"
	href="${basepath }/static/m/new/plugins/fonticon/css/font-awesome.min.css">
<link type="text/css" rel="stylesheet"
	href="${basepath }/static/m/nui/css/frame.css">
<link type="text/css" rel="stylesheet"
	href="${basepath }/static/m/nui/css/list.css">
  <link type="text/css" rel="stylesheet" href="${basepath}/static/m/nui/css/slide.css">
    <link type="text/css" rel="stylesheet" href="${basepath}/static/m/nui/css/owl.carousel.css">

</head>
<body onload="loaded()">
<div id="aside_container">
    <aside id="menu" data-position="right" data-transition = "push">
        <div>
            <!--右边划出来的东西-->
        </div>
    </aside>
</div>
<section id="section_container">
    <article class="container" id="wrapper">
        <div>
            <div id='slider' class='swipe'>
                <div class='swipe-wrap'>
                   <c:forEach items="${tops}" var ="course" varStatus="status">
	            	<div data-url="${basepath}/m/study/detail/${course.id}.xhtml?fdomain=${current_domain}" class="topCourse">
	            		<c:if test="${empty course.cover}"><img src="${basepath }/static/img/course/default_course_cover_320x110.png" /></c:if>
	            		<c:if test="${not empty course.cover}"><img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${course.cover}<%=img_suffix%>" onerror="javascript:this.src='${basepath }/static/img/course/default_course_cover_320x110.png'" /></c:if>
	                </div>
            	   </c:forEach>
                </div>
                <nav>
                    <ul id="position">
                        <c:forEach items="${tops }" var="course" varStatus="st">
            		      <li ${st.index==0 ? 'class="on"' : '' }></li>
            	        </c:forEach>
                    </ul>
                </nav>
            </div>
            <div class="huakuai">
                <div id="owl-demo" class="owl-carousel owl-theme owl">
                  <c:forEach items="${comCourses}" var ="course" varStatus="status">
                    <div class="item itemCourse" data-url="${basepath}/m/study/detail/${course.id}.xhtml?fdomain=${current_domain}">
                        <div class="courseitem">
                               <c:if test="${empty course.cover}"><img width="160" height="90" src="<%=Constant.IMG_SERVER_DOWNLOAD%>default_course_cover<%=img_suffix2%>"/></c:if>
                               <c:if test="${not empty course.cover}"><img width="160" height="90" src="<%=Constant.IMG_SERVER_DOWNLOAD%>${course.cover}<%=img_suffix2%>" onerror="javascript:this.src='${basepath }/static/img/course/default_course_cover_320x180.png'"  /></c:if>
                        </div>
                    </div>
                  </c:forEach>
                </div>
            </div>
            <hr>
            <ul class="ge-list">
             <c:forEach items="${newCourses}" var ="course" varStatus="status">
                <li class="newcourse" data-url="${basepath}/m/study/detail/${course.id}.xhtml?fdomain=${current_domain}">
                    <div class="item img-font">
                    <c:if test="${empty course.cover}"><img src="${basepath }/static/img/course/default_course_cover_100x100.png" class="item-img" /></c:if>
                    <c:if test="${not empty course.cover}"><img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${course.cover}<%=img_stype%>" onerror="javascript:this.src='${basepath }/static/img/course/default_course_cover_100x100.png'" class="item-img"  /></c:if>
                        <div class="item-font has-control">
                            <span class="item-title">${course.name}</span>
                            <span class="item-intro">${course.remark}</span>
                <span class="item-control">
                     <%-- <i class="fa fa-thumbs-o-up"></i>&nbsp;${ajy:praiseTotal(course.id,1)}&nbsp;
                    <i class="fa fa-comment-o"></i>&nbsp;${ajy:commentTotal(course.id,1)}--%>
                </span>
                        </div>
                    </div>
                </li>
             </c:forEach>
            </ul>
        </div>
    </article>
    <footer>
        <a href="#" class="active"><i class="fa fa-home"></i>首页</a>
        <a href="${basepath}/m/nstudy/recommendcourse.xhtml"><i class="fa fa-star"></i>推荐</a>
        <a href="${basepath}/m/nstudy/category.xhtml"><i class="fa fa-tag"></i>分类</a>
        <a href="javascript:window.location.reload();"><i class="fa fa-refresh"></i>刷新</a>
    </footer>
</section>
<script type="text/javascript"
		src="${basepath }/static/m/nui/js/zepto.js"></script>
	<script type="text/javascript"
		src="${basepath }/static/m/nui/js/template.min.js"></script>
	<script type="text/javascript"
		src="${basepath }/static/m/nui/js/frame.js"></script>
	<script type="text/javascript" src="${basepath}/static/m/nui/js/swipe.js"></script>
    <script type="text/javascript" src="${basepath}/static/m/nui/js/owl.carousel.js"></script>
    <script type="text/javascript" src="${basepath}/static/m/nui/js/iscroll.js"></script>
  <script type="text/javascript">
  $(document).ready(function(){
	  $(".topCourse").on("tap",function(){
	      var url = $(this).attr("data-url");
	      console.log(url);
	      window.location.href =url;
	  });

	  $(".itemCourse").on("tap",function(){
		  var url=$(this).attr("data-url");
		  console.log(url);
		  window.location.href=url;
		  });

      $(".newcourse").on("tap",function(){
          var url=$(this).attr("data-url");
          console.log(url);
          window.location.href=url;
          });
	  });
  </script>  

<script type="text/javascript">
    var myscroll;
    function loaded(){
        var wrapper = document.getElementById('wrapper');
        myscroll=new IScroll(wrapper,{
            mouseWheel: true
        });
    }
</script>
<script type="text/javascript">
    $(function(){
        calculateWidth();
        window.mySwipe = new Swipe(document.getElementById('slider'), {
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
    $(window).resize(function(){
        calculateWidth();
    })
    function calculateWidth(){
        var _clintWidth = document.body.clientWidth;
        var _imgHeight = parseInt(_clintWidth*110/320);
        $(".swipe-wrap").find("div").each(function(){
            $(this).css({
                width:_clintWidth,
                height:_imgHeight,
                display:"block",
                overflow:"hidden"
            });
            $(this).find("img").css({
                width:_clintWidth,
                height:_imgHeight
            })
        });
        var owl = $("#owl-demo");
        var newco = $("#owl-new");

        owl.owlCarousel({
            itemsCustom : [
                [0, 1.5],
                [320, 1.9],
                [360, 2.1],
                [400, 2.5]
            ],
            navigation : false
        });
        newco.owlCarousel({
            itemsCustom : [
                [0, 3.5],
                [350, 4],
                [370, 5],
                [400, 6]
            ],
            navigation : false
        });
    }

</script>
</body>
</html>