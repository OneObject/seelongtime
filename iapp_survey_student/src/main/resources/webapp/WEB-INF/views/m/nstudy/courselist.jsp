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
        <c:if test="${fn:length(courses)>10}">
        <div class="pulldown">
            <span class="pullDownBtn"><i class="fa fa-angle-down"></i>更多</span>
            <span class="pullUpBtn" style="display: none"><i class="fa fa-angle-up"></i>收起</span>
        </div>
        </c:if>
        
        
        
        
       
        <div class="series">
        
        <c:if test="${empty courses}">
      	<div  id="nothing">
           <h1 class="nothing" >没有数据</h1>
       </div>
      </c:if>
        
       
       
        <c:forEach items="${courses}" var="course">
   
        <c:if test="${course.type eq 10 }">
            <div class="seriesItem">
                <img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${course.cover}<%=Constant.QINIU_COURSE_IMG_STYLE_320_180%>" onerror="javascript:this.src='${basepath}/static/img/study/cover_c.png'" class="bigImg">
            <h1 class="course-name">${course.name}</h1>
                <ul class="ge-list">
                <c:if test="${empty course.seriesCourses}">
							<div class="well well-small text-center" style="margin:20px 10px 5px;">该系列下还没有设置课程</div>
				</c:if>
				<c:forEach items="${course.seriesCourses }" var="seriseCourse">
                  
                     <li class="linkclass" data-url="${basepath}/m/study/detail/${seriseCourse.id}.xhtml?fdomain=${current_domain}">
                        <div class="item img-font" >
                            <img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${course.cover}<%=Constant.QINIU_COURSE_IMG_STYLE_320_180%>" onerror="javascript:this.src='${basepath}/static/img/study/cover_c.png'" class="item-img">
                            <div class="item-font has-control">
                                <span class="item-title">${seriseCourse.name}</span>
                                <span class="item-intro">${ltfun:html2Text(seriseCourse.descript,30)}</span>
                                <span class="item-control">
                                    <i class="fa fa-thumbs-o-up"></i>${ajy:praiseTotal(seriseCourse.id,1)}&nbsp;
                                    <i class="fa fa-comment-o"></i>${ajy:commentTotal(seriseCourse.id,1)}
                                </span>
                            </div>
                        </div>
                    </li>
                  </c:forEach>
                </ul>
            </div>
           </c:if>
         
        <c:if test="${course.type eq 1 }">
     
            <div class="seriesItem  linkclass" data-url="${basepath}/m/study/detail/${course.id}.xhtml?fdomain=${current_domain}">
                <img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${course.cover}<%=Constant.QINIU_COURSE_IMG_STYLE_320_180%>" onerror="javascript:this.src='${basepath}/static/img/study/cover_c.png'" class="bigImg">
                <h1 class="course-name">${course.name}</h1>

                <p>${ltfun:html2Text(course.descript,30)}</p>
                 <span class="item-control flleft">
                    <i class="fa fa-thumbs-o-up"></i>${ajy:praiseTotal(course.id,1)}&nbsp;
                    <i class="fa fa-comment-o"></i>${ajy:praiseTotal(course.id,1)}
                 </span>
            </div>
            
           </c:if>
           
       </c:forEach>
        </div>
    </article>
    <footer>
        <a href="${basepath}/m/nstudy/category.xhtml" class="single-i active"><i class="fa fa-angle-left"></i></a>
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
			window.location.href="${basepath}/m/nstudy/courselist.xhtml?pid="+pid;
        }else{
			window.location.href="${basepath}/m/nstudy/courselist.xhtml?categoryid="+cid+"&pid="+pid;
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