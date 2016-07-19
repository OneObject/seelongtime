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
				<div class="classitem" data-url="${basepath}/m/nstudy/courselist.xhtml?pid=${category.id}">
					<span class="classTitle" style="text-overflow: ellipsis;">${category.name}</span>
					<span class="classCount">(${category.courseNum})</span>
					<span class="classcontent">
					<c:forEach begin="0" end="3" var="i">
						${category.childrens[i].name}&nbsp;
					</c:forEach>
					</span>
					
				</div>
			</c:forEach>
			
			
			
		</article>
		
		<footer>
        <a href="${basepath}/m/nstudy/portal.xhtml" ><i class="fa fa-home"></i>首页</a>
        <a href="${basepath}/m/nstudy/recommendcourse.xhtml"><i class="fa fa-tag"></i>推荐</a>
        <a href="javascript:void(0);" class="active"><i class="fa fa-star"></i>分类</a>
        <a href="javascript:window.location.reload();"><i class="fa fa-refresh"></i>刷新</a>
   		</footer>
   		
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
                margin_left:"8px"
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