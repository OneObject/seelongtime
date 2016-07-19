<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>邮件发送管理</title>
	<meta name="menu_path" content="system.emailManage"/>
	<!-- BEGIN PAGE LEVEL STYLES -->
   <link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
   <!-- END PAGE LEVEL STYLES -->
	<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/usermanage.css">
	<style type="text/css">
	.condition_item > .check_item{margin-bottom:10px;}
	</style>
</head>  
<body>
<!-- BEGIN PAGE HEADER-->
         <div class="row" >
            <div class="col-md-12">
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
               <ul class="page-breadcrumb breadcrumb">
                  <li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                  <li><span>邮件发送管理</span></li>
               </ul>
               <!-- END PAGE TITLE & BREADCRUMB-->
            </div>
         </div>
         <!-- END PAGE HEADER-->
         <!-- 页头-->
         <div class="row">
            <div class="col-md-12">
               <!--search box-->
              <div class="col-md-12 search_box">
                  <div class="col-md-12">
                   <!--全局搜索框-->
                   <div class="col-md-6 search_container">
                       <div class="input-group">
                          <input type="text" class="form-control" id="searchContent" placeholder="输入用户名/姓名/邮箱地址/编号">
                          <span class="input-group-btn">
                           <button onclick="page(1)" class="btn btn-danger" type="button">
                              <i class="icon-search"></i>
                           </button>
                          </span>
                        </div>
                              <!-- /input-group -->
                        </div>                  
                  </div>
              </div>
            </div>
         </div>
         <!-- 页面头部结束-->
         <div class="row">
              <div class="col-md-12">
               <!-- BEGIN EXAMPLE TABLE PORTLET-->
               <div class="portlet box blue">
                  <div class="portlet-title">
                     <div class="caption"><i class="icon-globe"></i>邮件发送列表</div>
                  </div>
                  <div class="portlet-body" style="overflow: hidden;">
                      <div class="row">
                      		<!-- <span class="btn btn-success table_add" onclick = "addEmail('ff8080814c4a4fd3014c4a50db990002','0','','备注：测试');">
                               <i class="glyphicon glyphicon-plus"></i>
                                                                                   新增
                           </span> -->
                            <span class="btn btn-danger table_add" onclick = "deleteGroup();">
                               <i class="glyphicon glyphicon-trash"></i>
                                                                                    删除
                           </span>
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
	<script src="${basepath }/static/public/javascripts/dateUtil.js" type="text/javascript"></script>
	<script language="javascript" type="text/javascript" src="${basepath }/static/public/My97DatePicker/WdatePicker.js"></script>
	<script src="${basepath }/static/public/javascripts/emailsendindex.js" type="text/javascript"></script>
	<script src="${basepath }/static/public/javascripts/emailsend.js" type="text/javascript"></script>
</content>
<content tag="pageInit">
</content>  

  
