<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%
String img_stype="-80x80";
%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>推荐课程</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <link type="text/css" rel="stylesheet"
	href="${basepath }/static/m/new/plugins/fonticon/css/font-awesome.min.css">
<link type="text/css" rel="stylesheet"
	href="${basepath }/static/m/nui/css/frame.css">
<link type="text/css" rel="stylesheet"
	href="${basepath }/static/m/nui/css/list.css">
</head>
<body>
<div id="aside_container">
    <aside id="menu" data-position="right" data-transition = "push">
        <div>
            <!--右边划出来的东西-->
        </div>
    </aside>
</div>
<section id="section_container">
    <article class="container">
        <div class="tabBtn">
            <span class="baseName active" data-url="${basepath}/m/nstudy/sortbyname.xhtml?condition=name">按名称</span>
            <span class="baseTime" data-url="${basepath}/m/nstudy/sortbytime.xhtml?condition=time">按时间</span>
        </div>
        <ul class="ge-list">
         <c:if test="${empty tops }">
	        <div id="nothing">
		    <h1 class="nothing">没有课程</h1>
	          </div>
            </c:if>
         <c:forEach items="${tops}" var ="course" varStatus="status">
            <li class="topcourse" data-url="${basepath}/m/study/detail/${course.id}.xhtml?fdomain=${current_domain}">
                <div class="item img-font">
                 <c:if test="${empty course.cover}"><img src="${basepath }/static/img/course/default_course_cover_100x100.png" class="item-img" /></c:if>
                 <c:if test="${not empty course.cover}"><img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${course.cover}<%=img_stype%>" onerror="javascript:this.src='${basepath }/static/img/course/default_course_cover_100x100.png'" class="item-img"  /></c:if>
                    <div class="item-font has-control">
                        <span class="item-title">${course.name}</span>
                        <span class="item-intro">${course.remark}</span>
                <span class="item-control">
                    <i class="fa fa-thumbs-o-up"></i>&nbsp;${ajy:praiseTotal(course.id,1)}&nbsp;
                    <i class="fa fa-comment-o"></i>&nbsp;${ajy:commentTotal(course.id,1)}
                </span>
                    </div>
                </div>
            </li>
            </c:forEach>
        </ul>
    </article>
    <footer>
        <a href="${basepath}/m/nstudy/portal.xhtml" ><i class="fa fa-home"></i>首页</a>
        <a href="javascript:void(0);" class="active"><i class="fa fa-star"></i>推荐</a>
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
    <script type="text/javascript">
    var condition="${condition}";
    if(condition=="name"){
    	 $(".baseTime").removeClass("active");
         $(".baseName").addClass("active");
        }else if(condition=="time"){
        	 $(".baseName").removeClass("active");
             $(".baseTime").addClass("active");
            }
    $(document).ready(function(){
    //按名称
     $(".baseName").on("tap",function(){
         var url = $(this).attr("data-url");
	      console.log(url);
	      window.location.href =url;
         });
    //按时间
    $(".baseTime").on("tap",function(){
        var url = $(this).attr("data-url");
	      console.log(url);
	      window.location.href =url;
        });
    //课程详情
    $(".topcourse").on("tap",function(){
    	 var url = $(this).attr("data-url");
	      console.log(url);
	      window.location.href =url;
        });
    });
    </script>
</body>
</html>