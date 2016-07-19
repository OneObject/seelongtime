<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>商户管理</title>
	<meta name="menu_path" content="system.tenant"/>
	<!-- BEGIN PAGE LEVEL STYLES -->
   <link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
   <!-- END PAGE LEVEL STYLES -->
	<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/usermanage.css">
</head>
<body>
<!-- BEGIN PAGE HEADER-->
         <div class="row" >
            <div class="col-md-12">
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
               <ul class="page-breadcrumb breadcrumb">
                  <%-- <li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                   --%><li><span>商户管理</span></li>
               </ul>
               <!-- END PAGE TITLE & BREADCRUMB-->
            </div>
         </div>
         <!-- END PAGE HEADER-->
         <div class="row">
              <div class="col-md-12">
               <!-- BEGIN EXAMPLE TABLE PORTLET-->
               <div class="portlet box blue">
                  <div class="portlet-title">
                     <div class="caption"><i class="icon-globe"></i>商户列表</div>
                     <div class="actions">
                        <div class="btn-group">
                           <div id="sample_2_column_toggler" class="dropdown-menu hold-on-click dropdown-checkboxes pull-right">
                              <label><input type="checkbox" checked data-column="1">序号</label>
                              <label><input type="checkbox" checked data-column="2">标识</label>
                              <label><input type="checkbox" checked data-column="3">名称</label>
                              <label><input type="checkbox" data-column="4">管理员账号</label>
                              <label><input type="checkbox"  data-column="6">操作</label>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="portlet-body" style="overflow: hidden;">
                      <div class="row">
                        <ltacl:checkAcl resourceId="111">
                          <span class="btn btn-success table_add" onclick="addTenant();">
                               <i class="glyphicon glyphicon-plus"></i>新增商户
                           </span>
                        </ltacl:checkAcl>
                      </div>
                    <%-- 分页内容 --%>
                    <div id="table_list" class="mt10"></div>
                      
                  </div>
               </div>
               <!-- END EXAMPLE TABLE PORTLET-->
             </div>
         </div>
</body>
</html>
<content tag="pageCore">
 <!-- END PAGE LEVEL PLUGINS -->
 <script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/jquery.dataTables.js"></script>

<!-- BEGIN PAGE LEVEL PLUGINS -->
    <script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
    <script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.js"></script>
	<script src="${basepath}/static/public/metronic.bootstrap/assets/scripts/app.js" type="text/javascript"></script>
	<script src="${basepath }/static/public/javascripts/cutPage.1.0.js" type="text/javascript"></script>
	<script src="${basepath }/static/public/javascripts/tenant.js" type="text/javascript"></script>
	<script src="${basepath }/static/public/javascripts/dateUtil.js" type="text/javascript"></script>

</content>
<content tag="pageInit">
</content>  

  
