<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta name="menu_path" content="course.courseAccredit"/>
<title>课程授权管理</title>
	<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
   <link rel="stylesheet" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.css" />
   <!-- END PAGE LEVEL STYLES -->
	<link rel="stylesheet" media="screen" href="${basepath }/static/public/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css">
	<link rel="stylesheet" href="${basepath}/static/public/JQuery zTree v3.5.15/css/zTreeStyle/zTreeStyle.css" type="text/css">
   <style type="text/css">
.ztree li span.button.add {margin-left:2px; margin-right: -1px; background-position:-144px 0; vertical-align:top; *vertical-align:middle}
    </style>
	<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/course.css">
</head>
<body>
	<!-- 面包屑开始-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i> <a href="javascript:void(0);">首页</a>
					<i class="icon-angle-right"></i></li>
				<li><a href="javascript:tourl('courseAccredit')">课程授权管理</a><i class="icon-angle-right"></i></li>
				<li><a href="javascript:void(0)">部门授权</a></li>
			</ul>
			<!-- END PAGE TITLE & BREADCRUMB-->
		</div>
	</div>
	<!-- 面包屑结束-->
	<div class="row">
		<div class="col-md-12">
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-reorder"></i>部门结构图
					</div>
				</div>
				<div class="portlet-body box_box">
					<div class="col-md-4">
						<div class="zTreeDemoBackground left ">
							<ul id="organization_tree" class="ztree">
							</ul>
						</div>
					</div>
					<div class="col-md-8">
						<!-- 授权操作 -->
						<span class="btn btn-success">确认授权</span>
						<span class="btn default">取消</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<content tag="pageCore">
 <script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
   <script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.core-3.5.js" type="text/javascript"></script>
     <script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.excheck-3.5.js" type="text/javascript"></script>
     <script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.exedit-3.5.js" type="text/javascript"></script>
   <script type="text/javascript" src="${basepath }/static/public/javascripts/accredit.js"></script>
</content>
<content tag="pageInit">
<script type="text/javascript">
$(document).ready(function(){
	 $.fn.zTree.init($("#organization_tree"), setting, zNodes);
});
</script>
</content>  
