<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>错误</title>
	<meta name="menu_path" content="system.permission"/>
	<!-- BEGIN PAGE LEVEL STYLES -->
   <link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
   <link rel="stylesheet" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.css" />
   <!-- END PAGE LEVEL STYLES -->
   <!-- END PAGE LEVEL STYLES -->
   <link rel="stylesheet" href="${basepath}/static/public/JQuery zTree v3.5.15/css/zTreeStyle/zTreeStyle.css" type="text/css">
   <style type="text/css">
.ztree li span.button.add {margin-left:2px; margin-right: -1px; background-position:-144px 0; vertical-align:top; *vertical-align:middle}
    </style>
	<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/organization.css">
	<script type="text/javascript">
		var zdata = ${tree};
		//alert(zdada);
	</script>
</head>

<body>
<!-- BEGIN PAGE HEADER-->
         <div class="row" >
            <div class="col-md-12">
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
                <!-- <h3 class="page-title">
              权限管理
               </h3> -->
               <ul class="page-breadcrumb breadcrumb">
                  <li>
                     <i class="icon-home">
                     </i>
                     <a href="index-2.html">首页</a> 
                     <i class="icon-angle-right">
                     </i>
                  </li>
               </ul>
               <!-- END PAGE TITLE & BREADCRUMB-->
            </div>
         </div>
         <!-- END PAGE HEADER-->
	<div class="row">
         <div class="col-md-12">
            <h2>您没有进行此操作的权限！</h2>
         </div>
	</div>

</body>
</html>
<content tag="pageCore">
<!-- 引用核心js包 -->
 <!-- END PAGE CONTENT-->
     <script src="${basepath }/static/public/easydialog-v2.0/easydialog.min.js" type="text/javascript"></script>
     <script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.core-3.5.js" type="text/javascript"></script>
     <script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.excheck-3.5.js" type="text/javascript"></script>
     <script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.exedit-3.5.js" type="text/javascript"></script>
     <script src="${basepath }/static/public/javascripts/permission.js" type="text/javascript"></script> 
     <%-- 输入验证 --%>
     <script src='${basepath }/static/public/javascripts/commonValidate.js' type='text/javascript' ></script> 
</content>
<content tag="pageInit">
<!-- 初始化窗口 -->
</content>	