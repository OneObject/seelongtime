<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>课程分类</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<link type="text/css" rel="stylesheet"
	href="${basepath }/static/m/new/plugins/fonticon/css/font-awesome.min.css">
<link type="text/css" rel="stylesheet"
	href="${basepath }/static/m/nui/css/frame.css">
<link type="text/css" rel="stylesheet"
	href="${basepath }/static/m/nui/css/list.css">
<link type="text/css" rel="stylesheet"
	href="${basepath }/static/m/nui/css/classify.css">
</head>
<body>
	<div id="aside_container">
		<aside id="menu" data-position="right" data-transition="push">
			<div>
				<!--右边划出来的东西-->
			</div>
		</aside>
	</div>
	<section id="section_container">
		<article class="container" data-scroll="true">
			<h1 class="big-title">课程分类</h1>
			
			<c:if test="${empty categorylist}">
		      	<div class="series">
		      	<div  id="nothing">
		           <h1 class="nothing" >没有数据</h1>
		       </div>
		       </div>
		      
		    </c:if>
			
			<c:forEach items="${categorylist}" var="category" varStatus="st">
				<div class="classitem" data-url="${basepath}/m/nmystudy/courselist.xhtml?pid=${category.id}&rootid=${category.id}">
					<span class="classTitle">${ category.name}</span>
				</div>
			</c:forEach>
			
			
			
		</article>
		
	</section>
	<script type="text/javascript"
		src="${basepath }/static/m/nui/js/zepto.js"></script>
	<script type="text/javascript"
		src="${basepath }/static/m/nui/js/template.min.js"></script>
	<script type="text/javascript"
		src="${basepath }/static/m/nui/js/frame.js"></script>
	<script type="text/javascript"
		src="${basepath }/static/m/nui/js/zepto.touch2mouse.js"></script>
	<script type="text/javascript">
    $(function(){
        var _clintWidth = document.body.clientWidth;
        var kuandu = (_clintWidth-24)/2;
        $(".container").find(".classitem").each(function(){
            $(this).css({
                width:kuandu,
                "margin-left":"8px"
            });
        });
    })
     $(".classitem").on("tap",function(){
            var url = $(this).attr("data-url");
            console.log(url);
            window.location.href =url;
        });
 
    
</script>
</body>
</html>