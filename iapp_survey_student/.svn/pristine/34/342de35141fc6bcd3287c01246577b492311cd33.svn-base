<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>${name}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
	<link type="text/css" rel="stylesheet"
	href="${basepath }/static/m/new/plugins/fonticon/css/font-awesome.min.css">
    <link type="text/css" rel="stylesheet" href="${basepath }/static/m/nui/css/frame.css">
    <link type="text/css" rel="stylesheet" href="${basepath }/static/m/nui/css/list.css">
    <link type="text/css" rel="stylesheet" href="${basepath }/static/m/nui/css/classify.css">
	 <style type="text/css">
        html,body{
            margin: 0px;
            padding: 0px;
            color: #53575E;
        }

        .courselists{
            margin: 0px;
            padding: 0px;
            display: block;
            overflow: hidden;
        }
        .courselists>li{
            list-style: none;
        }
        .courseitems{
            width: 100%;
            padding: 8px;
            height: 48px;
            padding: 8px;
            border-bottom:1px solid #CCCCCC ;
        }
        .courseitems>img{
            height: 48px;;
            width:  85.3px;
        }
        .courseitems>span{
            height: 48px;
            padding-left: 90px;
            display: block;
            margin-top: -48px;
            line-height: 48px;
            font-size: 16px;
            padding-right: 8px;
            overflow: hidden;white-space: nowrap;text-overflow: ellipsis;
        }
   </style>
</head>
<body>

<section id="section_container">
    <article class="container" data-scroll = "true">
        <div class="categoryTags" id="categoryTags">
            <label rel="root" class="classBtn <c:out value="${categoryid ==pid ? 'active':'' }"/>">全部</label>
            <c:forEach items="${categorylist}" var="category" varStatus="vs">
            <label rel="${category.id}" class="classBtn <c:out value="${categoryid ==category.id ? 'active':'' }"/>">${category.name}</label>
            </c:forEach>
        </div>
        <c:if test="${fn:length(categorylist)>8}">
        <div class="pulldown">
            <span class="pullDownBtn"><i class="fa fa-angle-down"></i>更多</span>
            <span class="pullUpBtn" style="display: none"><i class="fa fa-angle-up"></i>收起</span>
        </div>
        </c:if>

<div class="containers" style="background-color: white;">
	<ul class="courselists">
	 		<c:if test="${empty courses }">
		        <div>
			        <h1 style="text-align:center;">没有找到相关课程</h1>
			    </div>
		   	</c:if>
	   		<c:forEach items="${courses}" var="course">
	        	<li class="courseitems linkclass" data-url="${basepath}/m/study/detail/${course.id}.xhtml?fdomain=${current_domain}" style="display: block;overflow: hidden;height:64px;">
	                <img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${course.cover}<%=Constant.QINIU_COURSE_IMG_STYLE_320_180%>"  onerror="javascript:this.src='${basepath}/static/img/study/cover_c.png'"  style="cursor: pointer;">
	                 <span>${course.name}</span>    
	            </li>
	      </c:forEach>
	</ul>
</div>


</article>
    <footer>
    	
    	<c:if test="${id  eq rootid && key eq 0}">
        <a href="${basepath}/m/nmystudy/category.xhtml" class="single-i active"><i class="fa fa-angle-left"></i></a>
    	</c:if>   
 		<c:if test="${id ne rootid && key eq 1}">
        <a href="${basepath}/m/nmystudy/courselist.xhtml?pid=${id}&rootid=${rootid}" class="single-i active"><i class="fa fa-angle-left"></i></a>
    	</c:if>
 		<c:if test="${id eq rootid && key eq 1}">
        <a href="${basepath}/m/nmystudy/courselist.xhtml?pid=${id}&rootid=${rootid}" class="single-i active"><i class="fa fa-angle-left"></i></a>
    	</c:if>
        <a></a>
        <a></a>
        <a href="javascript:window.location.reload();"><i class="fa fa-refresh"></i>刷新</a>
    </footer>
</section>
<script type="text/javascript" src="${basepath }/static/m/nui/js/zepto.js"></script>
<script type="text/javascript" src="${basepath }/static/m/nui/js/template.min.js"></script>
<script type="text/javascript" src="${basepath }/static/m/nui/js/frame.js"></script>
 <script type="text/javascript">
  $(document).ready(function(){
	  $(".linkclass").on("tap",function(){
	      var url = $(this).attr("data-url");
	      console.log(url);
	      window.location.href =url;
	  });
  });
  </script>  
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
        resetBlockBg();
    });
    $(".pullDownBtn").on("tap",function(){
        $("#categoryTags").css({
            height:"auto"
        });
        $(this).hide();
        $(".pullUpBtn").show();
    });
    $(".pullUpBtn").on("tap",function(){
        $("#categoryTags").css({
            height:"56px"
        });
        $(this).hide();
        $(".pullDownBtn").show();
    });
    $("#categoryTags>.classBtn").on("tap",function(){
        $(this).parent().find(".classBtn").each(function(){
            $(this).removeClass("active");
        });
        $(this).addClass("active");
        var cid = $(this).attr("rel");
        var pid = '${pid}';
        if(cid=="root"){
			window.location.href="${basepath}/m/nmystudy/courselist.xhtml?pid="+pid+"&rootid="+'${rootid}';
        }else{
			window.location.href="${basepath}/m/nmystudy/courselist.xhtml?categoryid="+cid+"&pid="+pid+"&rootid="+'${rootid}';
        }
    });
    $(window).resize(function(){
        resetBlockBg();
    });
    function resetBlockBg(){
        var w=$(window).width()-34;//可用宽度
        //获得可用宽度以后先要给那个黑条赋值
        $(".course-name").width(w);
    }
</script>
</body>
</html>