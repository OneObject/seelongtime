<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta name="menu_path" content="system.user"/>
<!-- Important Owl stylesheet -->
   <!-- BEGIN PAGE LEVEL STYLES -->
   <link rel="stylesheet" type="text/css" href="${basepath}/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
   <!-- END PAGE LEVEL STYLES -->
   <!-- BEGIN THEME STYLES --> 
   <link href="${basepath}/static/public/metronic.bootstrap/assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
   <link href="${basepath}/static/public/metronic.bootstrap/assets/css/style.css" rel="stylesheet" type="text/css"/>
   <link href="${basepath}/static/public/metronic.bootstrap/assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
   <link href="${basepath}/static/public/metronic.bootstrap/assets/css/plugins.css" rel="stylesheet" type="text/css"/>
   <link href="${basepath}/static/public/metronic.bootstrap/assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
   <link href="${basepath}/static/public/metronic.bootstrap/assets/css/custom.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="${basepath}/static/public/carousel/owl-carousel/owl.carousel.css">
	<!-- Default Theme -->
	<link rel="stylesheet" href="${basepath}/static/public/carousel/owl-carousel/owl.theme.css">
	<link rel="stylesheet" href="${basepath}/static/public/JQuery zTree v3.5.15/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<link rel="stylesheet" media="screen" href="${basepath}/static/public/stylesheets/usermanage.css">
</head>
<body>
<!-- BEGIN PAGE HEADER-->
         <div class="row" >
            <div class="col-md-12">
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
               <ul class="page-breadcrumb breadcrumb">
                  <li>
                     <i class="icon-home">
                     </i>
                     <a href="${basepath }">用户登录</a> 
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
               <!-- BEGIN VALIDATION STATES-->
               <div class="portlet box green">
                  <div class="portlet-title">
                     <div class="caption"><i class="icon-reorder"></i><span>用户信息</span></div>
                     <!--<div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                        <a href="#portlet-config" data-toggle="modal" class="config"></a>
                        <a href="javascript:;" class="reload"></a>
                        <a href="javascript:;" class="remove"></a>
                     </div>-->
                  </div>
                  <div class="portlet-body form">
                     <div class="form-body">
                        <!-- BEGIN FORM-->
    <!-- 弹出层显示树状结构的部门 -->
    <form action="${basepath }/base/admin/user/dologin.xhtml" id="form_sample_2" class="form-horizontal" method="post" onsubmit="return loginValidate();">
       <div class="form-group" id="username_con">
          <label class="control-label col-md-3">用户名<span class="required">*</span></label>
          <div class="col-md-4">
             <!--<input type="text" name="name" data-required="1" class="form-control"/>-->
             <div class="input-group">
                <span class="input-group-addon"><i class="icon-user"></i></span>
                <input name="username" id="username" onchange="usernameValidate('', false)" type="name" class="form-control" placeholder="用户名">
             </div>
          </div>
          <div class="col-md-4">
            <span id="username_tip" for="username" class="help-block " style="">请输入用户名</span>
          </div>
       </div>
       
       <div class="form-group" id="password_con">
          <label class="control-label col-md-3">密码<span class="required">*</span></label>
          <div class="col-md-4">
             <div class="input-group">
                <span class="input-group-addon"><i class="icon-envelope"></i></span>
                <input name="password" id="password" type="password" onchange="passwordValidate('', false)" class="form-control" placeholder="密码">
             </div>
          </div>
          <div class="col-md-4">
            <span id="password_tip" for="password" class="help-block " style="">随意输入</span>
          </div>
       </div>
       
       <div class="form-actions fluid">
          <div class="col-md-offset-3 col-md-9">
             <button type="button" class="btn green" onclick="login()">登录</button>
          </div>
       </div>
    </form>         
                        <!-- END FORM-->
                     </div>
                  </div>
                  <!-- END VALIDATION STATES-->
               </div>
            </div>
    </div>
    <!-- 弹出层显示树状结构的部门 -->
</body>
</html>
<content tag="pageCore">
<!-- BEGIN PAGE LEVEL PLUGINS -->
   <!-- END PAGE LEVEL PLUGINS -->
     <%-- dwr --%>
	<script type='text/javascript' src='${basepath }/dwr/engine.js'></script>
	<script type='text/javascript' src='${basepath }/dwr/util.js'></script>
	<script type='text/javascript' src='${basepath }/dwr/interface/DWRService.js'></script>
     <%-- 输入验证 --%>
     <script src='${basepath }/static/public/javascripts/commonValidate.js' type='text/javascript' ></script>
     <!-- 添加用户 -->
     <script src="${basepath }/static/public/javascripts/usermanage.js" type="text/javascript"></script>
     <script src="${basepath }/static/public/javascripts/login.js" type="text/javascript"></script> 
     

</content>
<content tag="pageInit">
<!-- 初始化窗口 -->
<script>
      
      
   </script>
</content>	
