<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>课件管理</title>
<meta name="menu_path" content="course.courseware"/>
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/course.css">
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
                  <li><span href="#">课件管理</span></li>
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
                     <div class="caption"><i class="icon-film"></i>上传课件</div>
                  </div>
                  <div class="portlet-body">
                     <div class=" portlet-tabs">
                        <ul class="nav nav-tabs">
                           <!-- <li><a href="#portlet_tab2" data-toggle="tab" id="make_sure">上传队列</a></li> -->
                           <li class="active"><a href="#portlet_tab1" data-toggle="tab" id="search_file">选择文件</a></li>
                        </ul>
                        <div class="tab-content">
                           <div class="tab-pane active" id="portlet_tab1">
                           		<div name="image" id="fileDragArea" class="drag_upload">
                           			<div class="jiahao">
                           				<i class="glyphicon glyphicon-plus"></i>
                           			</div>
                           		</div>
                                <div class="drag_upload" id="preview_con"></div>
	                            <input type="file"  id="fileImage" name="file" class="hidden" multiple  >
                                <input type="hidden" name="domain" id="domain" value="longtime"> 
	                            <input type="button" class="btn-success btn" style="display:none"  id="fileSubmit" value="上传课件">
                           </div>
                           <div class="tab-pane" id="portlet_tab2">
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- END SAMPLE TABLE PORTLET-->
            </div>
            </form>
         </div>
         <div class="row">
         	<div class="col-md-12">
         		<div class="portlet">
                  <div class="portlet-title">
                     <div class="caption">
                     	<div style="display:block;overflow:hidden;float: left;">
                     	<i class="icon-sitemap"></i>课件列表
                     	</div>
	                     <div class="list_style" style="margin-left:20px;">
		         			<span class="active" onclick="block_nav()" id="block_nav" title="方块显示">
		         				<i class="icon-th-large"></i>
		         			</span>
		         			<span onclick="list_nav()" id="list_nav" title="列表显示">
		         				<i class="icon-list"></i>
		         			</span>
		         		</div>
                     </div>
                     <div class="tools">
                        <i class="block_red"></i><span class="color_tip">今天</span>
                        
                        <i class="block_blue"></i><span class="color_tip">3天内</span>
                        
                        <i class="block_green"></i><span class="color_tip">1个月</span>
                        
                        <i class="block_yellow"></i><span class="color_tip">更早</span>
                     </div>
                  </div>
                  <div class="portlet-body">
                    <!-- 课件分页 -->
                  	<div id="list_box"></div>
                  </div>
               </div>
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
<script src="${basepath }/static/public/javascripts/course/courseware.js" type="text/javascript"></script>
<%-- 输入验证 --%>
<script src='${basepath }/static/public/javascripts/commonValidate.js' type='text/javascript' ></script>
</content>
<content tag="pageInit">
<!-- 初始化窗口 -->

</content>	