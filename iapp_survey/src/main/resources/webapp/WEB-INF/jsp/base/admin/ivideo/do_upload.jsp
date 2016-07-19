<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>课件管理</title>
<meta name="menu_path" content="video.videoUpload"/>
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/video.css">
</head>
<body>
 <!-- BEGIN PAGE HEADER-->
         <div class="row">
            <div class="col-md-12">
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
               <ul class="page-breadcrumb breadcrumb">
                  <li>
                     <i class="icon-home"></i><a href="${basepath }">首页</a> 
                     <i class="icon-angle-right"></i>
                  </li>
                  <li><span href="#">视频管理</span></li>
               </ul>
               <!-- END PAGE TITLE & BREADCRUMB-->
            </div>
         </div>
         <!-- END PAGE HEADER-->
          <div class="row">
            <form onsubmit="return false;" action="${basepath }/base/admin/course/courseware/savefiles.xhtml" method="post" enctype="multipart/form-data" id="file_form">
         	<!-- 上传文件 -->
         	<div class="col-md-12">
               <!-- BEGIN SAMPLE TABLE PORTLET-->
               <div class="portlet box purple">
                  <div class="portlet-title">
                     <div class="caption"><i class="icon-film"></i>上传视频</div>
                  </div>
                  <div class="portlet-body">
                     <div class=" portlet-tabs">
                       	<iframe style="width: 100%;min-height:437px;border: none;margin: 0px;margin-top: 13px;margin-left: 5px;" src="${basepath }/base/admin/ivideo/uploadoption.xhtml"></iframe>  
                     </div>
                  </div>
               </div>
               <!-- END SAMPLE TABLE PORTLET-->
            </div>
            </form>
         </div>
               <!-- END SAMPLE TABLE PORTLET-->
         </div>
         <div class="row">
         	<div class="col-md-12">
         		<%-- <div class="mulu_crumbs">
         			<span class="btn default">
         				<i class="icon-hand-left"></i>&nbsp;返回
         			</span>
         			<ul class="mulu_nav">
         				<li>
         					<span>销售经验</span>
         				</li>
         				<li>
         					<i class="icon-chevron-right"></i>
         				</li>
         				<li>
         					<span>如何沟通</span>
         				</li>
         			</ul>
         		</div> --%>
         	</div>
         </div>
</body>
</html>
<content tag="pageCore">
<!-- 引用核心js包 -->
<script src="${basepath }/static/public/javascripts/course/zxxFile.js" type="text/javascript"></script>
</content>
<content tag="pageInit">
<!-- 初始化窗口 -->

</content>	