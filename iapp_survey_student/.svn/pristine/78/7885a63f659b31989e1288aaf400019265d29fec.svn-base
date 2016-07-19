<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>课程</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no"/>
    <style type="text/css">
        html,body{
            margin: 0px;
            padding: 0px;
            color: #53575E;
        }
        .container{
            width: 100%;
            display: block;
            overflow: hidden;
        }
        .courselist{
            margin: 0px;
            padding: 0px;
            display: block;
            overflow: hidden;
        }
        .courselist>li{
            list-style: none;
        }
        .courseitem{
            width: 100%;
            padding: 8px;
            min-height: 48px;
            padding: 8px;
            border-bottom:1px solid #CCCCCC ;
        }
        .courseitem>img{
            height: 48px;;
            width:  85.3px;
        }
        .courseitem>span{
            min-height: 48px;
            padding-left: 90px;
            display: block;
            margin-top: -48px;
            font-size: 16px;
            padding-right: 8px;
        }
        .cutpage{
            min-height: 48px;
            clear: both;
            display: block;
        }
        .cutpage>div>a{
            display: block;
            overflow: hidden;
            height: 32px;
            line-height: 32px;
            width: 82px;
            font-size: 16px;
            float: left;
            text-align: center;
            text-decoration: none;
            color: #53575E;
        }
        .cutpage>div{
            width: 252px;
            margin: 8px auto;
        }
        .cutpage>div>.button{
            border: 1px solid #CCCCCC;
            border-radius: 5px;
            -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
        }
    </style>
</head>
<body>
    <div class = "container">
        <ul class="courselist">
	        <c:if test="${empty rs }">
		        <div>
			        <h1 style="text-align:center;">没有找到相关课程</h1>
			    </div>
		   	</c:if>
         	<c:forEach items="${rs }" var="item">
	        	<li class="courseitem" onclick="javascript:openDetail('${item.id}')">
	                <img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${item.cover}<%=Constant.QINIU_COURSE_IMG_STYLE_320_180%>"  onerror="javascript:this.src='${basepath}/static/img/study/cover_c.png'"  style="cursor: pointer;">
	                 <span>${ltfun:html2Text(item.name, 14)}</span>    
	            </li>
	      </c:forEach>
         
        </ul>
    </div>
    <script>
    
		 function openDetail(courseId){
				window.location.href="${basepath}/m/study/detail/"+courseId+".xhtml?fdomain=${current_domain}";
		 }
		 
	</script>
</body>
</html>