<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%
	String id = request.getParameter("id");
	request.setAttribute("id", id);

%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>课程分类</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <link type="text/css" rel="stylesheet" href="${basepath }/static/plugins/font-awesome-4.1.0/css/font-awesome.min.css">
    <link type="text/css" rel="stylesheet" href="${basepath }/static/m/nui/css/frame.css">
    <link type="text/css" rel="stylesheet" href="${basepath }/static/m/nui/css/list.css">
    <link type="text/css" rel="stylesheet" href="${basepath }/static/m/nui/css/classify.css">
    
    <script type="text/javascript">
	    document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
	    	WeixinJSBridge.call('hideOptionMenu');
	    });
    </script>
</head>
<body style="background-color: white;">
<div id="aside_container">
    <aside id="menu" data-position="right" data-transition = "push">
        <div>
            <!--右边划出来的东西-->
        </div>
    </aside>
</div>
<section id="section_container" style="background-color: white;">
    <article class="container" data-scroll = "true">
    <c:if test="${id eq '-1' }">
    	<h1 style="text-align: center; margin-top: 25px; font-size:20px; font-weight:bold ;">没有课程</h1>
    </c:if>
    <!-- 根 -->
    <c:if test="${id eq 'root' }">
        <h1 class="big-title">课程分类</h1>
        <div class="classitem color1" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id}_1">
            <span class="classTitle">代理人</span><span class="classCount"></span>
        </div>
        <div class="classitem color2" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id}_2">
            <span class="classTitle">多元</span><span class="classCount"></span>
        </div>
        <div class="classitem color3" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id}_3">
            <span class="classTitle">银保</span><span class="classCount"></span>
        </div>
        <div class="classitem color4" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id}_4">
            <span class="classTitle">员福</span><span class="classCount"></span>
        </div>
        <div class="classitem color5" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id}_5">
            <span class="classTitle">专职讲师</span><span class="classCount"></span>
        </div>
    </c:if>
    
    <!-- 一级目录 -->
    <c:if test="${id eq 'root_1' }">
        <h1 class="big-title">代理人</h1>
        <div class="classitem color1" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }_1">
            <span class="classTitle">主管</span><span class="classCount"></span>
        </div>
        <div class="classitem color2" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }_2">
            <span class="classTitle">销售</span><span class="classCount"></span>
        </div>
        <div class="classitem color3" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=13fe2389-8dbc-4f16-94b6-79ebff0e28f9">
            <span class="classTitle">TTT课程</span><span class="classCount"></span>
        </div>
        <%--
        <div class="classitem color4" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }">
            <span class="classTitle">渠道培训</span><span class="classCount"></span>
        </div>
         --%>
    </c:if>
    <c:if test="${id eq 'root_2' }">
        <h1 class="big-title">多元</h1>
        <div class="classitem color1" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }_1">
            <span class="classTitle">主管</span><span class="classCount"></span>
        </div>
        <div class="classitem color2" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }_2">
            <span class="classTitle">销售</span><span class="classCount"></span>
        </div>
        <div class="classitem color3" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=4713c440-0ce8-4b83-a959-6e0fd51af0cd">
            <span class="classTitle">TTT课程</span><span class="classCount"></span>
        </div>
        <%--
        <div class="classitem color4" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }">
            <span class="classTitle">渠道培训</span><span class="classCount"></span>
        </div>
        --%>
    </c:if>
    <c:if test="${id eq 'root_3' }">
        <h1 class="big-title">银保</h1>
        <div class="classitem color1" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }_1">
            <span class="classTitle">主管</span><span class="classCount"></span>
        </div>
        <div class="classitem color2" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }_2">
            <span class="classTitle">销售</span><span class="classCount"></span>
        </div>
       <div class="classitem color3" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=0708e673-a6a1-451e-9f71-53bcaaf91fd1">
            <span class="classTitle">TTT课程</span><span class="classCount"></span>
        </div>
        <%-- 
        <div class="classitem color4" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }">
            <span class="classTitle">渠道培训</span><span class="classCount"></span>
        </div>
        --%>
    </c:if>
    <c:if test="${id eq 'root_4' }">
        <h1 class="big-title">员福</h1>
        <div class="classitem color1" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }_1">
            <span class="classTitle">主管</span><span class="classCount"></span>
        </div>
        <div class="classitem color2" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }_2">
            <span class="classTitle">销售</span><span class="classCount"></span>
        </div>
        <div class="classitem color3" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=ee605ca3-f625-4a43-8434-646c44ede7b5">
            <span class="classTitle">TTT课程</span><span class="classCount"></span>
        </div>
        <%-- 
        <div class="classitem color4" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }">
            <span class="classTitle">渠道培训</span><span class="classCount"></span>
        </div>
        --%>
    </c:if>
    <c:if test="${id eq 'root_5' }">
        <h1 class="big-title">专职讲师</h1>
        <div class="classitem color1" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }_1">
            <span class="classTitle">讲师课程</span><span class="classCount"></span>
        </div>
    </c:if>
    
    <!-- 二级目录 -->
    <%-- root_1_1 --%>
    <c:if test="${id eq 'root_1_1' }">
    	<h1 class="big-title">主管</h1>
        <div class="classitem color1" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }_1">
            <span class="classTitle">必修课程</span><span class="classCount"></span>
        </div>
        <div class="classitem color2" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }_2">
            <span class="classTitle">一级选修课程</span><span class="classCount"></span>
        </div>
        <div class="classitem color3" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }_3">
            <span class="classTitle">二级选修课程</span><span class="classCount"></span>
        </div>
        <div class="classitem color4" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }_4">
            <span class="classTitle">持续课程</span><span class="classCount"></span>
        </div>
    </c:if>
    <%-- root_1_2 --%>
    <c:if test="${id eq 'root_1_2' }">
    	<h1 class="big-title">销售</h1>
        <div class="classitem color1" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }_1">
            <span class="classTitle">必修课程</span><span class="classCount"></span>
        </div>
        <div class="classitem color2" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }_2">
            <span class="classTitle">一级选修课程</span><span class="classCount"></span>
        </div>
        <div class="classitem color3" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }_3">
            <span class="classTitle">二级选修课程</span><span class="classCount"></span>
        </div>
        <div class="classitem color4" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }_4">
            <span class="classTitle">持续课程</span><span class="classCount"></span>
        </div>
    </c:if>
    
    <%-- root_2_1 --%>
    <c:if test="${id eq 'root_2_1' }">
    	<h1 class="big-title">主管</h1>
        <div class="classitem color1" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }_1">
            <span class="classTitle">必修课程</span><span class="classCount"></span>
        </div>
        <div class="classitem color2" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }_2">
            <span class="classTitle">一级选修课程</span><span class="classCount"></span>
        </div>
        <div class="classitem color3" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }_3">
            <span class="classTitle">二级选修课程</span><span class="classCount"></span>
        </div>
        <div class="classitem color4" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }_4">
            <span class="classTitle">持续课程</span><span class="classCount"></span>
        </div>
    </c:if>
    <%-- root_2_2 --%>
    <c:if test="${id eq 'root_2_2' }">
    	<h1 class="big-title">销售</h1>
        <div class="classitem color1" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }_1">
            <span class="classTitle">必修课程</span><span class="classCount"></span>
        </div>
        <div class="classitem color2" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }_2">
            <span class="classTitle">一级选修课程</span><span class="classCount"></span>
        </div>
        <div class="classitem color3" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }_3">
            <span class="classTitle">二级选修课程</span><span class="classCount"></span>
        </div>
        <div class="classitem color4" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }_4">
            <span class="classTitle">持续课程</span><span class="classCount"></span>
        </div>
    </c:if>
        
    <%-- root_3_1 --%>
    <c:if test="${id eq 'root_3_1' }">
    	<h1 class="big-title">主管</h1>
        <div class="classitem color1" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }_1">
            <span class="classTitle">必修课程</span><span class="classCount"></span>
        </div>
        <div class="classitem color2" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }_2">
            <span class="classTitle">一级选修课程</span><span class="classCount"></span>
        </div>
        <div class="classitem color3" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }_3">
            <span class="classTitle">二级选修课程</span><span class="classCount"></span>
        </div>
        <div class="classitem color4" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }_4">
            <span class="classTitle">持续课程</span><span class="classCount"></span>
        </div>
    </c:if>
    <%-- root_3_2 --%>
    <c:if test="${id eq 'root_3_2' }">
    	<h1 class="big-title">销售</h1>
        <div class="classitem color1" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }_1">
            <span class="classTitle">必修课程</span><span class="classCount"></span>
        </div>
        <div class="classitem color2" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }_2">
            <span class="classTitle">一级选修课程</span><span class="classCount"></span>
        </div>
        <div class="classitem color3" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }_3">
            <span class="classTitle">二级选修课程</span><span class="classCount"></span>
        </div>
        <div class="classitem color4" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }_4">
            <span class="classTitle">持续课程</span><span class="classCount"></span>
        </div>
    </c:if>
   
    <%-- root_4_1 --%>
    <c:if test="${id eq 'root_4_1' }">
    	<h1 class="big-title">主管</h1>
        <div class="classitem color1" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }_1">
            <span class="classTitle">必修课程</span><span class="classCount"></span>
        </div>
        <div class="classitem color2" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }_2">
            <span class="classTitle">一级选修课程</span><span class="classCount"></span>
        </div>
        <div class="classitem color3" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }_3">
            <span class="classTitle">二级选修课程</span><span class="classCount"></span>
        </div>
        <div class="classitem color4" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }_4">
            <span class="classTitle">持续课程</span><span class="classCount"></span>
        </div>
    </c:if>
    <%-- root_4_2 --%>
    <c:if test="${id eq 'root_4_2' }">
    	<h1 class="big-title">销售</h1>
        <div class="classitem color1" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }_1">
            <span class="classTitle">必修课程</span><span class="classCount"></span>
        </div>
        <div class="classitem color2" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }_2">
            <span class="classTitle">一级选修课程</span><span class="classCount"></span>
        </div>
        <div class="classitem color3" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }_3">
            <span class="classTitle">二级选修课程</span><span class="classCount"></span>
        </div>
        <div class="classitem color4" data-url = "${basepath }/m/nstudy/category_fuxing.xhtml?id=${id }_4">
            <span class="classTitle">持续课程</span><span class="classCount"></span>
        </div>
    </c:if>
 
    <%-- root_5_1 --%>
 	<c:if test="${id eq 'root_5_1' }">
 		<h1 class="big-title">讲师课程</h1>
        <div class="classitem color1" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=474d82fb-d4b2-46aa-8c91-80d1805160fb">
            <span class="classTitle">TTT课程</span><span class="classCount"></span>
        </div>
      
    </c:if>
      
      
    <!-- 3级目录 -->
    <%-- root_1_1_1 --%>
    <c:if test="${id eq 'root_1_1_1' }">
 		<h1 class="big-title">必修课程</h1>
        <div class="classitem color1" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=951684e9-f4cf-4c0e-8289-701475b87a80">
            <span class="classTitle">保险从业人员资格考试</span><span class="classCount"></span>
        </div>
        <div class="classitem color2" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=62267f6a-39f1-4cf2-8d88-9301b9867f55">
            <span class="classTitle">主管</span><span class="classCount"></span>
        </div>
        <div class="classitem color3" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=c11a3198-1503-4c67-af79-cd64650a50f6">
            <span class="classTitle">销售</span><span class="classCount"></span>
        </div>
        <div class="classitem color4" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=192089c9-98e1-480b-b6d7-49456b9b885c">
            <span class="classTitle">产品</span><span class="classCount"></span>
        </div>
        <div class="classitem color5" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=5048713e-7851-4639-add8-0e11234fd955">
            <span class="classTitle">保监课程</span><span class="classCount"></span>
        </div>
      
    </c:if>
    <%-- root_1_1_2 --%>
    <c:if test="${id eq 'root_1_1_2' }">
 		<h1 class="big-title">一级选修课程</h1>
        <div class="classitem color1" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=70e344a7-177e-406f-8590-a8bba0fd8ab0">
            <span class="classTitle">销售</span><span class="classCount"></span>
        </div>
        <div class="classitem color2" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=f3d98d50-2db1-491d-9f51-9125dffebf74">
            <span class="classTitle">主管</span><span class="classCount"></span>
        </div>
    </c:if>
    <%-- root_1_1_3 --%>
     <c:if test="${id eq 'root_1_1_3' }">
 		<h1 class="big-title">二级选修课程</h1>
         <div class="classitem color1" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=2d5ec042-96b7-4aa9-a6b5-25c4ce30dd23">
            <span class="classTitle">销售</span><span class="classCount"></span>
        </div>
        <div class="classitem color2" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=c6b1e1b5-269a-44e7-a957-db30e0d70190">
            <span class="classTitle">主管</span><span class="classCount"></span>
        </div>
    </c:if>
    <%-- root_1_1_4 --%>
     <c:if test="${id eq 'root_1_1_4' }">
 		<h1 class="big-title">持续课程</h1>
        <div class="classitem color1" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=2f7dc080-9beb-443a-b90f-29581b7570e2">
            <span class="classTitle">网络学习</span><span class="classCount"></span>
        </div>
        <div class="classitem color2" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=fb8fe0f1-281e-40ed-9027-15b4195466c1">
            <span class="classTitle">创新举措</span><span class="classCount"></span>
        </div>
        <div class="classitem color3" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=16a1ff03-dd20-4b12-96bf-985c011c77dd">
            <span class="classTitle">健康管家</span><span class="classCount"></span>
        </div>
        <div class="classitem color4" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=0a864805-a8d7-4d6a-b78b-21c280d505d2">
            <span class="classTitle">移动展业</span><span class="classCount"></span>
        </div>
        <div class="classitem color5" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=fd60ce9c-26e9-4d2c-8663-13909504f41f">
            <span class="classTitle">养老社区</span><span class="classCount"></span>
        </div>
        <div class="classitem color6" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=04cb7d41-9343-4322-8940-a525cf445325">
            <span class="classTitle">法务合规</span><span class="classCount"></span>
        </div>
    </c:if>
    <%-- root_1_2_1 --%>
    <c:if test="${id eq 'root_1_2_1' }">
 		<h1 class="big-title">必修课程</h1>
            <div class="classitem color1" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=951684e9-f4cf-4c0e-8289-701475b87a80">
            <span class="classTitle">保险从业人员资格考试</span><span class="classCount"></span>
        </div>
        <div class="classitem color2" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=c11a3198-1503-4c67-af79-cd64650a50f6">
            <span class="classTitle">销售</span><span class="classCount"></span>
        </div>
        <div class="classitem color3" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=c8b8dd7c-e18d-4f3a-b859-0a334754826d">
            <span class="classTitle">产品</span><span class="classCount"></span>
        </div>
        <div class="classitem color4" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=5048713e-7851-4639-add8-0e11234fd955">
            <span class="classTitle">保监课程</span><span class="classCount"></span>
        </div>
      
    </c:if>
    <%-- root_1_2_2 --%>
     <c:if test="${id eq 'root_1_2_2' }">
 		<h1 class="big-title">一级选修课程</h1>
          <div class="classitem color1" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=c2bfb036-e738-4aba-a15e-34cb13411729">
            <span class="classTitle">销售</span><span class="classCount"></span>
        </div>
    </c:if>
    <%-- root_1_2_3 --%>
      <c:if test="${id eq 'root_1_2_3' }">
 		<h1 class="big-title">二级选修课程</h1>
          <div class="classitem color1" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=2d5ec042-96b7-4aa9-a6b5-25c4ce30dd23">
            <span class="classTitle">销售</span><span class="classCount"></span>
        </div>
    </c:if>
    <%-- root_1_2_4 --%>
     <c:if test="${id eq 'root_1_2_4' }">
 		<h1 class="big-title">持续课程</h1>
        <div class="classitem color1" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=2f7dc080-9beb-443a-b90f-29581b7570e2">
            <span class="classTitle">网络学习</span><span class="classCount"></span>
        </div>
        <div class="classitem color2" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=fb8fe0f1-281e-40ed-9027-15b4195466c1">
            <span class="classTitle">创新举措</span><span class="classCount"></span>
        </div>
        <div class="classitem color3" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=16a1ff03-dd20-4b12-96bf-985c011c77dd">
            <span class="classTitle">健康管家</span><span class="classCount"></span>
        </div>
        <div class="classitem color4" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=0a864805-a8d7-4d6a-b78b-21c280d505d2">
            <span class="classTitle">移动展业</span><span class="classCount"></span>
        </div>
        <div class="classitem color5" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=fd60ce9c-26e9-4d2c-8663-13909504f41f">
            <span class="classTitle">养老社区</span><span class="classCount"></span>
        </div>
        <div class="classitem color6" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=04cb7d41-9343-4322-8940-a525cf445325">
            <span class="classTitle">法务合规</span><span class="classCount"></span>
        </div>
    </c:if>
    <%-- root_2_1_1 --%>
    <c:if test="${id eq 'root_2_1_1' }">
 		<h1 class="big-title">必修课程</h1>
            <div class="classitem color1" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=951684e9-f4cf-4c0e-8289-701475b87a80">
            <span class="classTitle">保险从业人员资格考试</span><span class="classCount"></span>
        </div>
        <div class="classitem color2" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=437ca909-4f54-4c8a-8cb0-8a26273c9492">
            <span class="classTitle">主管</span><span class="classCount"></span>
        </div>
        <div class="classitem color3" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=b4a26976-3a53-4eca-9cb3-cd1bf2664b8c">
            <span class="classTitle">销售</span><span class="classCount"></span>
        </div>
        <div class="classitem color4" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=c8e18ce2-b70f-4484-aad7-c863b85b2698">
            <span class="classTitle">产品</span><span class="classCount"></span>
        </div>
        <div class="classitem color5" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=5048713e-7851-4639-add8-0e11234fd955">
            <span class="classTitle">保监课程</span><span class="classCount"></span>
        </div>
      
    </c:if>
    <%-- root_2_1_2 --%>
     <c:if test="${id eq 'root_2_1_2' }">
 		<h1 class="big-title">一级选修课程</h1>
          <div class="classitem color1" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=ded45496-b23a-496d-a917-e57c5d1a18ba">
            <span class="classTitle">销售</span><span class="classCount"></span>
        </div>
        <div class="classitem color2" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=e8f66a0a-41d9-40e4-899b-ebc8eed4a25c">
            <span class="classTitle">主管</span><span class="classCount"></span>
        </div>
    </c:if>
    <%-- root_2_1_3 --%>
      <c:if test="${id eq 'root_2_1_3' }">
 		<h1 class="big-title">二级选修课程</h1>
          <div class="classitem color1" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=60138a7e-1ee7-4ccd-8735-a0fa3e23548b">
            <span class="classTitle">销售</span><span class="classCount"></span>
        </div>
        <div class="classitem color2" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=18cd99d8-cec3-4bc1-bb0d-be72ca7bf0e4">
            <span class="classTitle">主管</span><span class="classCount"></span>
        </div>
    </c:if>
    <%-- root_2_1_4 --%>
     <c:if test="${id eq 'root_2_1_4' }">
 		<h1 class="big-title">持续课程</h1>
        <div class="classitem color1" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=2f7dc080-9beb-443a-b90f-29581b7570e2">
            <span class="classTitle">网络学习</span><span class="classCount"></span>
        </div>
        <div class="classitem color2" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=fb8fe0f1-281e-40ed-9027-15b4195466c1">
            <span class="classTitle">创新举措</span><span class="classCount"></span>
        </div>
        <div class="classitem color3" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=16a1ff03-dd20-4b12-96bf-985c011c77dd">
            <span class="classTitle">健康管家</span><span class="classCount"></span>
        </div>
        <div class="classitem color4" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=0a864805-a8d7-4d6a-b78b-21c280d505d2">
            <span class="classTitle">移动展业</span><span class="classCount"></span>
        </div>
        <div class="classitem color5" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=fd60ce9c-26e9-4d2c-8663-13909504f41f">
            <span class="classTitle">养老社区</span><span class="classCount"></span>
        </div>
        <div class="classitem color6" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=04cb7d41-9343-4322-8940-a525cf445325">
            <span class="classTitle">法务合规</span><span class="classCount"></span>
        </div>
    </c:if>
    <%-- root_2_2_1 --%>
    <c:if test="${id eq 'root_2_2_1' }">
 		<h1 class="big-title">必修课程</h1>
         <div class="classitem color1" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=951684e9-f4cf-4c0e-8289-701475b87a80">
            <span class="classTitle">保险从业人员资格考试</span><span class="classCount"></span>
        </div>
        <div class="classitem color3" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=ccfb6f97-bc3c-4a48-88c3-6972c117462f">
            <span class="classTitle">销售</span><span class="classCount"></span>
        </div>
        <div class="classitem color4" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=66a840c2-8496-41cb-acf8-1ddc9b087b7d">
            <span class="classTitle">产品</span><span class="classCount"></span>
        </div>
        <div class="classitem color5" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=5048713e-7851-4639-add8-0e11234fd955">
            <span class="classTitle">保监课程</span><span class="classCount"></span>
        </div>
      
    </c:if>
    <%-- root_2_2_2 --%>
     <c:if test="${id eq 'root_2_2_2' }">
 		<h1 class="big-title">一级选修课程</h1>
          <div class="classitem color1" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=81a18e76-6f8e-43be-bdda-056a3313b231">
            <span class="classTitle">销售</span><span class="classCount"></span>
        </div>
    </c:if>
    <%-- root_2_2_3 --%>
      <c:if test="${id eq 'root_2_2_3' }">
 		<h1 class="big-title">二级选修课程</h1>
          <div class="classitem color1" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=60138a7e-1ee7-4ccd-8735-a0fa3e23548b">
            <span class="classTitle">销售</span><span class="classCount"></span>
        </div>
    </c:if>
    <%-- root_2_2_4 --%>
     <c:if test="${id eq 'root_2_2_4' }">
 		<h1 class="big-title">持续课程</h1>
        <div class="classitem color1" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=2f7dc080-9beb-443a-b90f-29581b7570e2">
            <span class="classTitle">网络学习</span><span class="classCount"></span>
        </div>
        <div class="classitem color2" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=fb8fe0f1-281e-40ed-9027-15b4195466c1">
            <span class="classTitle">创新举措</span><span class="classCount"></span>
        </div>
        <div class="classitem color3" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=16a1ff03-dd20-4b12-96bf-985c011c77dd">
            <span class="classTitle">健康管家</span><span class="classCount"></span>
        </div>
        <div class="classitem color4" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=0a864805-a8d7-4d6a-b78b-21c280d505d2">
            <span class="classTitle">移动展业</span><span class="classCount"></span>
        </div>
        <div class="classitem color5" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=fd60ce9c-26e9-4d2c-8663-13909504f41f">
            <span class="classTitle">养老社区</span><span class="classCount"></span>
        </div>
        <div class="classitem color6" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=04cb7d41-9343-4322-8940-a525cf445325">
            <span class="classTitle">法务合规</span><span class="classCount"></span>
        </div>
    </c:if>
    <%-- root_3_1_1 --%>
    <c:if test="${id eq 'root_3_1_1' }">
 		<h1 class="big-title">必修课程</h1>
        <div class="classitem color1" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=951684e9-f4cf-4c0e-8289-701475b87a80">
            <span class="classTitle">保险从业人员资格考试</span><span class="classCount"></span>
        </div>
        <div class="classitem color2" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=6826e4a3-f5ed-4b4e-8fff-d76ff4424301">
            <span class="classTitle">主管</span><span class="classCount"></span>
        </div>
        <div class="classitem color3" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=e59300f0-48ca-4501-b176-df9a9c851c71">
            <span class="classTitle">销售</span><span class="classCount"></span>
        </div>
        <div class="classitem color4" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=9b56486b-0d75-404e-a22d-f1296b68baf4">
            <span class="classTitle">产品</span><span class="classCount"></span>
        </div>
        <div class="classitem color5" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=5048713e-7851-4639-add8-0e11234fd955">
            <span class="classTitle">保监课程</span><span class="classCount"></span>
        </div>
      
    </c:if>
    <%-- root_3_1_2 --%>
     <c:if test="${id eq 'root_3_1_2' }">
 		<h1 class="big-title">一级选修课程</h1>
          <div class="classitem color1" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=080d0eb2-f5d3-43b1-96c3-e152fc9d481c">
            <span class="classTitle">销售</span><span class="classCount"></span>
        </div>
        <div class="classitem color2" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=17b3767b-6bad-43c5-888b-32de06afe586">
            <span class="classTitle">主管</span><span class="classCount"></span>
        </div>
    </c:if>
    <%-- root_3_1_3 --%>
      <c:if test="${id eq 'root_3_1_3' }">
 		<h1 class="big-title">二级选修课程</h1>
          <div class="classitem color1" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=a6ce0dbf-2b2d-4a72-9e32-6a1d91d31164">
            <span class="classTitle">销售</span><span class="classCount"></span>
        </div>
        <div class="classitem color2" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=4f1a821a-27a6-4bc6-8ec2-8127016bdd23">
            <span class="classTitle">主管</span><span class="classCount"></span>
        </div>
    </c:if>
    <%-- root_3_1_4 --%>
     <c:if test="${id eq 'root_3_1_4' }">
 		<h1 class="big-title">持续课程</h1>
        <div class="classitem color1" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=2f7dc080-9beb-443a-b90f-29581b7570e2">
            <span class="classTitle">网络学习</span><span class="classCount"></span>
        </div>
        <div class="classitem color2" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=fb8fe0f1-281e-40ed-9027-15b4195466c1">
            <span class="classTitle">创新举措</span><span class="classCount"></span>
        </div>
        <div class="classitem color3" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=16a1ff03-dd20-4b12-96bf-985c011c77dd">
            <span class="classTitle">健康管家</span><span class="classCount"></span>
        </div>
        <div class="classitem color4" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=0a864805-a8d7-4d6a-b78b-21c280d505d2">
            <span class="classTitle">移动展业</span><span class="classCount"></span>
        </div>
        <div class="classitem color5" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=fd60ce9c-26e9-4d2c-8663-13909504f41f">
            <span class="classTitle">养老社区</span><span class="classCount"></span>
        </div>
        <div class="classitem color6" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=04cb7d41-9343-4322-8940-a525cf445325">
            <span class="classTitle">法务合规</span><span class="classCount"></span>
        </div>
    </c:if>
    <%-- root_3_2_1 --%>
    <c:if test="${id eq 'root_3_2_1' }">
 		<h1 class="big-title">必修课程</h1>
        <div class="classitem color1" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=951684e9-f4cf-4c0e-8289-701475b87a80">
            <span class="classTitle">保险从业人员资格考试</span><span class="classCount"></span>
        </div>
        <div class="classitem color3" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=45530d97-86d4-4102-8062-e8840bbcde43">
            <span class="classTitle">销售</span><span class="classCount"></span>
        </div>
        <div class="classitem color4" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=128a34da-8dea-4226-9d20-04a04fd39351">
            <span class="classTitle">产品</span><span class="classCount"></span>
        </div>
        <div class="classitem color5" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=5048713e-7851-4639-add8-0e11234fd955">
            <span class="classTitle">保监课程</span><span class="classCount"></span>
        </div>
    </c:if>
    <%-- root_3_2_2 --%>
     <c:if test="${id eq 'root_3_2_2' }">
 		<h1 class="big-title">一级选修课程</h1>
         <div class="classitem color1" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=89f7a6cb-b715-4db0-942c-477d0d60e837">
            <span class="classTitle">销售</span><span class="classCount"></span>
        </div>
    </c:if>
    <%-- root_3_2_3 --%>
      <c:if test="${id eq 'root_3_2_3' }">
 		<h1 class="big-title">二级选修课程</h1>
        <div class="classitem color1" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=a6ce0dbf-2b2d-4a72-9e32-6a1d91d31164">
            <span class="classTitle">销售</span><span class="classCount"></span>
        </div>
    </c:if>
    <%-- root_3_2_4 --%>
     <c:if test="${id eq 'root_3_2_4' }">
 		<h1 class="big-title">持续课程</h1>
        <div class="classitem color1" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=2f7dc080-9beb-443a-b90f-29581b7570e2">
            <span class="classTitle">网络学习</span><span class="classCount"></span>
        </div>
        <div class="classitem color2" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=fb8fe0f1-281e-40ed-9027-15b4195466c1">
            <span class="classTitle">创新举措</span><span class="classCount"></span>
        </div>
        <div class="classitem color3" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=16a1ff03-dd20-4b12-96bf-985c011c77dd">
            <span class="classTitle">健康管家</span><span class="classCount"></span>
        </div>
        <div class="classitem color4" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=0a864805-a8d7-4d6a-b78b-21c280d505d2">
            <span class="classTitle">移动展业</span><span class="classCount"></span>
        </div>
        <div class="classitem color5" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=fd60ce9c-26e9-4d2c-8663-13909504f41f">
            <span class="classTitle">养老社区</span><span class="classCount"></span>
        </div>
        <div class="classitem color6" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=04cb7d41-9343-4322-8940-a525cf445325">
            <span class="classTitle">法务合规</span><span class="classCount"></span>
        </div>
    </c:if>
    <%-- root_4_1_1 --%>
    <c:if test="${id eq 'root_4_1_1' }">
 		<h1 class="big-title">必修课程</h1>
        <div class="classitem color1" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=951684e9-f4cf-4c0e-8289-701475b87a80">
            <span class="classTitle">保险从业人员资格考试</span><span class="classCount"></span>
        </div>
        <div class="classitem color2" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=f8b82f6d-ba16-4c7f-b4d8-54807c879783">
            <span class="classTitle">主管</span><span class="classCount"></span>
        </div>
        <div class="classitem color3" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=c3cca14e-74f6-4403-8872-d39f26c14b74">
            <span class="classTitle">销售</span><span class="classCount"></span>
        </div>
        <div class="classitem color4" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=3d111a8f-2af6-4148-aa28-a03e66a5c795">
            <span class="classTitle">产品</span><span class="classCount"></span>
        </div>
        <div class="classitem color5" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=5048713e-7851-4639-add8-0e11234fd955">
            <span class="classTitle">保监课程</span><span class="classCount"></span>
        </div>
      
    </c:if>
    <%-- root_4_1_2 --%>
     <c:if test="${id eq 'root_4_1_2' }">
 		<h1 class="big-title">一级选修课程</h1>
          <div class="classitem color1" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=b7cdfbea-5f5d-46ea-815b-ff0adfb77d98">
            <span class="classTitle">销售</span><span class="classCount"></span>
        </div>
        <div class="classitem color2" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=96e27a8a-9764-4006-bd72-e854c4ba0c0a">
            <span class="classTitle">主管</span><span class="classCount"></span>
        </div>
    </c:if>
    <%-- root_4_1_3 --%>
      <c:if test="${id eq 'root_4_1_3' }">
 		<h1 class="big-title">二级选修课程</h1>
          <div class="classitem color1" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=052cc526-421d-46a3-b328-84441cfd6348">
            <span class="classTitle">销售</span><span class="classCount"></span>
        </div>
        <div class="classitem color2" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=79dc0f49-066f-4a92-9e98-a10c83096691">
            <span class="classTitle">主管</span><span class="classCount"></span>
        </div>
    </c:if>
    <%-- root_4_1_4 --%>
     <c:if test="${id eq 'root_4_1_4' }">
 		<h1 class="big-title">持续课程</h1>
        <div class="classitem color1" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=2f7dc080-9beb-443a-b90f-29581b7570e2">
            <span class="classTitle">网络学习</span><span class="classCount"></span>
        </div>
        <div class="classitem color2" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=fb8fe0f1-281e-40ed-9027-15b4195466c1">
            <span class="classTitle">创新举措</span><span class="classCount"></span>
        </div>
        <div class="classitem color3" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=16a1ff03-dd20-4b12-96bf-985c011c77dd">
            <span class="classTitle">健康管家</span><span class="classCount"></span>
        </div>
        <div class="classitem color4" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=0a864805-a8d7-4d6a-b78b-21c280d505d2">
            <span class="classTitle">移动展业</span><span class="classCount"></span>
        </div>
        <div class="classitem color5" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=fd60ce9c-26e9-4d2c-8663-13909504f41f">
            <span class="classTitle">养老社区</span><span class="classCount"></span>
        </div>
        <div class="classitem color6" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=04cb7d41-9343-4322-8940-a525cf445325">
            <span class="classTitle">法务合规</span><span class="classCount"></span>
        </div>
    </c:if>
    <%-- root_4_2_1 --%>
    <c:if test="${id eq 'root_4_2_1' }">
 		<h1 class="big-title">必修课程</h1>
        <div class="classitem color1" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=951684e9-f4cf-4c0e-8289-701475b87a80">
            <span class="classTitle">保险从业人员资格考试</span><span class="classCount"></span>
        </div>
        <div class="classitem color3" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=a55b2e48-acfa-4507-ac76-f848cc1966a8">
            <span class="classTitle">销售</span><span class="classCount"></span>
        </div>
        <div class="classitem color4" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=f6876b83-8853-4ef5-8428-5d584d6dc0f8">
            <span class="classTitle">产品</span><span class="classCount"></span>
        </div>
        <div class="classitem color5" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=5048713e-7851-4639-add8-0e11234fd955">
            <span class="classTitle">保监课程</span><span class="classCount"></span>
        </div>
      
    </c:if>
    <%-- root_4_2_2 --%>
    <c:if test="${id eq 'root_4_2_2' }">
 		<h1 class="big-title">一级选修课程</h1>
          <div class="classitem color1" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=0db2c736-83c0-4087-980e-a5525f4e1f33">
            <span class="classTitle">销售</span><span class="classCount"></span>
        </div>
    </c:if>
    <%-- root_4_2_3 --%>
    <c:if test="${id eq 'root_4_2_3' }">
 		<h1 class="big-title">二级选修课程</h1>
          <div class="classitem color1" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=052cc526-421d-46a3-b328-84441cfd6348">
            <span class="classTitle">销售</span><span class="classCount"></span>
        </div>
    </c:if>
    <%-- root_4_2_4 --%>
    <c:if test="${id eq 'root_4_2_4' }">
 		<h1 class="big-title">持续课程</h1>
        <div class="classitem color1" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=2f7dc080-9beb-443a-b90f-29581b7570e2">
            <span class="classTitle">网络学习</span><span class="classCount"></span>
        </div>
        <div class="classitem color2" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=fb8fe0f1-281e-40ed-9027-15b4195466c1">
            <span class="classTitle">创新举措</span><span class="classCount"></span>
        </div>
        <div class="classitem color3" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=16a1ff03-dd20-4b12-96bf-985c011c77dd">
            <span class="classTitle">健康管家</span><span class="classCount"></span>
        </div>
        <div class="classitem color4" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=0a864805-a8d7-4d6a-b78b-21c280d505d2">
            <span class="classTitle">移动展业</span><span class="classCount"></span>
        </div>
        <div class="classitem color5" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=fd60ce9c-26e9-4d2c-8663-13909504f41f">
            <span class="classTitle">养老社区</span><span class="classCount"></span>
        </div>
        <div class="classitem color6" data-url = "${basepath }/m/nstudy/course.xhtml?categoryid=04cb7d41-9343-4322-8940-a525cf445325">
            <span class="classTitle">法务合规</span><span class="classCount"></span>
        </div>
    </c:if>
    
    </article>
</section>
<%-- 
<c:if test="${id ne 'root' && id ne '-1' }">
	<footer style="background-color: white;border-top:none;">
        <a></a>
        <a href="javascript:history.go(-1);" class="single-i active"><i class="fa fa-angle-left"></i></a>
        <a></a><a></a><a></a>
	</footer>
</c:if>	
--%>
<script type="text/javascript" src="${basepath }/static/m/nui/js/zepto.js"></script>
<script type="text/javascript" src="${basepath }/static/m/nui/js/template.min.js"></script>
<script type="text/javascript" src="${basepath }/static/m/nui/js/frame.js"></script>
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
    });
    $("#showmenu").tap(function(){
        showmenu();
    })
    $(".classitem").click(function(){
        var url = $(this).attr("data-url");
        console.log(url);
        setTimeout(function(){
        	window.location.href  = url ;
        },0);
        //window.location.href =url;
    });
</script>
</body>
</html>