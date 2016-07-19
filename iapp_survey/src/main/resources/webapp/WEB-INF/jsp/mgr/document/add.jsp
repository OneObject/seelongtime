<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>文档管理</title>
<meta name="menu_path" content="course.documentmanage" />
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/course.css">
</head>
<body>
 <!-- BEGIN PAGE HEADER-->
      <div class="row">
		<div class="col-md-12">
			<ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i> <a href="${basepath}">首页</a><i class="icon-angle-right"></i></li>
				<li><a href="${basepath }/base/admin/mgr/document/index.xhtml">文档管理</a><i class="icon-angle-right"></i></li>
				<li><span href="#">上传文档</span></li>
			</ul>
		</div>
	</div>
         <!-- END PAGE HEADER-->
          <div class="row">
            <form onsubmit="return false;" action="${basepath }/base/admin/mgr/document/add.xhtml" method="post" enctype="multipart/form-data" id="file_form">
         	<!-- 上传文件 -->
         	<div class="col-md-12">
               <!-- BEGIN SAMPLE TABLE PORTLET-->
               <div class="portlet box purple">
                  <div class="portlet-title">
                     <div class="caption"><i class="icon-film"></i>上传文档</div>
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
	                            <input type="file"  id="fileImage" name="file" class="hidden"  multiple="multiple">
                                <input type="hidden" name="domain" id="domain" value="longtime"> 
	                            <input type="button" class="btn-success btn" style="display:none"  id="fileSubmit" value="上传文档">
                           </div>
                           <div class="tab-pane" id="portlet_tab2">
                           </div>
                        </div>
                     </div><!-- /\.doc$|\.docx$|\.xls$|\.xlsx$|\.ppt$|\.pptx&|\.pdf$ -->
                     	<span style="margin: 10px; margin-top: 30px;">支持上传的文件格式有：.doc、.docx、.ppt、.pptx、.xls、.xlsx、.pdf</span>
                  </div>
               </div>
               <!-- END SAMPLE TABLE PORTLET-->
            </div>
            </form>
         </div>
         
         <div class="row">
         	<div class="col-md-12">
         	</div>
         </div>
</body>
</html>
<content tag="pageCore">
<!-- 引用核心js包 -->
<script src="${basepath }/static/public/javascripts/course/zxxFile.js" type="text/javascript"></script>
<script src="${basepath }/static/public/javascripts/document/documentware.js" type="text/javascript"></script>
<script src="${basepath}/static/public/easydialog-v2.0/easydialog.js"></script>
</content>
<content tag="pageInit">
<!-- 初始化窗口 -->

</content>	