<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta name="menu_path" content="integral.integralRuleManage"/>
<title>积分规则管理</title>
<!-- BEGIN PAGE LEVEL STYLES -->
   <link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
   <link rel="stylesheet" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.css" />
   <!-- END PAGE LEVEL STYLES -->
   <link rel="stylesheet" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.css" />
   <link rel="stylesheet" href="${basepath }/static/public/stylesheets/integral.css" />
</head>
<body>
         <!-- BEGIN PAGE HEADER-->
         <div class="row">
            <div class="col-md-12">
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
               <h3 class="page-title">
                 积分规则管理 
               </h3>
               <ul class="page-breadcrumb breadcrumb">
                  <li>
                     <i class="icon-home"></i>
                     <a href="index-2.html">首页</a> 
                     <i class="icon-angle-right"></i>
                  </li>
                  <li>
                     <a href="#">积分规则管理</a>
                  </li>
               </ul>
               <!-- END PAGE TITLE & BREADCRUMB-->
            </div>
         </div>
         <!-- END PAGE HEADER-->
         <!-- BEGIN PAGE CONTENT-->
         <div class="row">
            <div class="col-md-12">
            <!-- BEGIN TAB PORTLET-->   
               <div class="portlet box blue tabbable">
                  <div class="portlet-title">
                     <div class="caption">&nbsp;</div>
                  </div>
                  <div class="portlet-body">
                     <div class="portlet-tabs">
                        <ul class="nav nav-tabs">
                         <li class="active"><a href="#portlet_tab1" data-toggle="tab">奖励积分规则</a></li>
                         <li><a href="#portlet_tab2" data-toggle="tab">惩罚积分规则</a></li>
                          
                        </ul>
                        <div class="tab-content">
							<div class="tab-pane active" id="portlet_tab1">
								<!-- 奖励积分规则 -->
								<div class="table-toolbar">
									<div class="btn-group">
										<button id="sample_editable_1_new" class="btn green">
											新增规则 <i class="icon-plus"></i>
										</button>
									</div>
									<!-- <div class="btn-group pull-right">
										<button class="btn dropdown-toggle" data-toggle="dropdown">
											Tools <i class="icon-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right">
											<li><a href="#">Print</a></li>
											<li><a href="#">Save as PDF</a></li>
											<li><a href="#">Export to Excel</a></li>
										</ul>
									</div> -->
								</div>
								<!-- 列表 -->
								<!-- BEGIN EXAMPLE TABLE PORTLET-->

								<table class="table table-striped table-bordered table-hover"
									id="sample_1">
									<thead>
										<tr>
											<th style="width: 8px;"><input type="checkbox"
												class="group-checkable" data-set="#sample_1 .checkboxes" /></th>
											<th>Username</th>
											<th class="hidden-480">Email</th>
											<th class="hidden-480">Points</th>
											<th class="hidden-480">Joined</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<tr class="odd gradeX">
											<td><input type="checkbox" class="checkboxes" value="1" /></td>
											<td>shuxer</td>
											<td class="hidden-480"><a href="mailto:shuxer@gmail.com">shuxer@gmail.com</a></td>
											<td class="hidden-480">120</td>
											<td class="center hidden-480">12 Jan 2012</td>
											<td><span class="label label-sm label-success">Approved</span></td>
										</tr>
										<tr class="odd gradeX">
											<td><input type="checkbox" class="checkboxes" value="1" /></td>
											<td>looper</td>
											<td class="hidden-480"><a
												href="mailto:looper90@gmail.com">looper90@gmail.com</a></td>
											<td class="hidden-480">120</td>
											<td class="center hidden-480">12.12.2011</td>
											<td><span class="label label-sm label-warning">Suspended</span></td>
										</tr>
										<tr class="odd gradeX">
											<td><input type="checkbox" class="checkboxes" value="1" /></td>
											<td>userwow</td>
											<td class="hidden-480"><a
												href="mailto:userwow@yahoo.com">userwow@yahoo.com</a></td>
											<td class="hidden-480">20</td>
											<td class="center hidden-480">12.12.2012</td>
											<td><span class="label label-sm label-success">Approved</span></td>
										</tr>
										<tr class="odd gradeX">
											<td><input type="checkbox" class="checkboxes" value="1" /></td>
											<td>user1wow</td>
											<td class="hidden-480"><a
												href="mailto:userwow@gmail.com">userwow@gmail.com</a></td>
											<td class="hidden-480">20</td>
											<td class="center hidden-480">12.12.2012</td>
											<td><span class="label label-sm label-default">Blocked</span></td>
										</tr>
										<tr class="odd gradeX">
											<td><input type="checkbox" class="checkboxes" value="1" /></td>
											<td>restest</td>
											<td class="hidden-480"><a
												href="mailto:userwow@gmail.com">test@gmail.com</a></td>
											<td class="hidden-480">20</td>
											<td class="center hidden-480">12.12.2012</td>
											<td><span class="label label-sm label-success">Approved</span></td>
										</tr>
										<tr class="odd gradeX">
											<td><input type="checkbox" class="checkboxes" value="1" /></td>
											<td>foopl</td>
											<td class="hidden-480"><a
												href="mailto:userwow@gmail.com">good@gmail.com</a></td>
											<td class="hidden-480">20</td>
											<td class="center hidden-480">19.11.2010</td>
											<td><span class="label label-sm label-success">Approved</span></td>
										</tr>
										<tr class="odd gradeX">
											<td><input type="checkbox" class="checkboxes" value="1" /></td>
											<td>weep</td>
											<td class="hidden-480"><a
												href="mailto:userwow@gmail.com">good@gmail.com</a></td>
											<td class="hidden-480">20</td>
											<td class="center hidden-480">19.11.2010</td>
											<td><span class="label label-sm label-success">Approved</span></td>
										</tr>
										<tr class="odd gradeX">
											<td><input type="checkbox" class="checkboxes" value="1" /></td>
											<td>coop</td>
											<td class="hidden-480"><a
												href="mailto:userwow@gmail.com">good@gmail.com</a></td>
											<td class="hidden-480">20</td>
											<td class="center hidden-480">19.11.2010</td>
											<td><span class="label label-sm label-success">Approved</span></td>
										</tr>
										<tr class="odd gradeX">
											<td><input type="checkbox" class="checkboxes" value="1" /></td>
											<td>pppol</td>
											<td class="hidden-480"><a
												href="mailto:userwow@gmail.com">good@gmail.com</a></td>
											<td class="hidden-480">20</td>
											<td class="center hidden-480">19.11.2010</td>
											<td><span class="label label-sm label-success">Approved</span></td>
										</tr>
										<tr class="odd gradeX">
											<td><input type="checkbox" class="checkboxes" value="1" /></td>
											<td>test</td>
											<td class="hidden-480"><a
												href="mailto:userwow@gmail.com">good@gmail.com</a></td>
											<td class="hidden-480">20</td>
											<td class="center hidden-480">19.11.2010</td>
											<td><span class="label label-sm label-success">Approved</span></td>
										</tr>
										<tr class="odd gradeX">
											<td><input type="checkbox" class="checkboxes" value="1" /></td>
											<td>userwow</td>
											<td class="hidden-480"><a
												href="mailto:userwow@gmail.com">userwow@gmail.com</a></td>
											<td class="hidden-480">20</td>
											<td class="center hidden-480">12.12.2012</td>
											<td><span class="label label-sm label-default">Blocked</span></td>
										</tr>
										<tr class="odd gradeX">
											<td><input type="checkbox" class="checkboxes" value="1" /></td>
											<td>test</td>
											<td class="hidden-480"><a
												href="mailto:userwow@gmail.com">test@gmail.com</a></td>
											<td class="hidden-480">20</td>
											<td class="center hidden-480">12.12.2012</td>
											<td><span class="label label-sm label-success">Approved</span></td>
										</tr>
										<tr class="odd gradeX">
											<td><input type="checkbox" class="checkboxes" value="1" /></td>
											<td>goop</td>
											<td class="hidden-480"><a
												href="mailto:userwow@gmail.com">good@gmail.com</a></td>
											<td class="hidden-480">20</td>
											<td class="center hidden-480">12.11.2010</td>
											<td><span class="label label-sm label-success">Approved</span></td>
										</tr>
										<tr class="odd gradeX">
											<td><input type="checkbox" class="checkboxes" value="1" /></td>
											<td>weep</td>
											<td class="hidden-480"><a
												href="mailto:userwow@gmail.com">good@gmail.com</a></td>
											<td class="hidden-480">20</td>
											<td class="center hidden-480">15.11.2011</td>
											<td><span class="label label-sm label-default">Blocked</span></td>
										</tr>
										<tr class="odd gradeX">
											<td><input type="checkbox" class="checkboxes" value="1" /></td>
											<td>toopl</td>
											<td class="hidden-480"><a
												href="mailto:userwow@gmail.com">good@gmail.com</a></td>
											<td class="hidden-480">20</td>
											<td class="center hidden-480">16.11.2010</td>
											<td><span class="label label-sm label-success">Approved</span></td>
										</tr>
										<tr class="odd gradeX">
											<td><input type="checkbox" class="checkboxes" value="1" /></td>
											<td>userwow</td>
											<td class="hidden-480"><a
												href="mailto:userwow@gmail.com">userwow@gmail.com</a></td>
											<td class="hidden-480">20</td>
											<td class="center hidden-480">9.12.2012</td>
											<td><span class="label label-sm label-default">Blocked</span></td>
										</tr>
										<tr class="odd gradeX">
											<td><input type="checkbox" class="checkboxes" value="1" /></td>
											<td>tes21t</td>
											<td class="hidden-480"><a
												href="mailto:userwow@gmail.com">test@gmail.com</a></td>
											<td class="hidden-480">20</td>
											<td class="center hidden-480">14.12.2012</td>
											<td><span class="label label-sm label-success">Approved</span></td>
										</tr>
										<tr class="odd gradeX">
											<td><input type="checkbox" class="checkboxes" value="1" /></td>
											<td>fop</td>
											<td class="hidden-480"><a
												href="mailto:userwow@gmail.com">good@gmail.com</a></td>
											<td class="hidden-480">20</td>
											<td class="center hidden-480">13.11.2010</td>
											<td><span class="label label-sm label-warning">Suspended</span></td>
										</tr>
										<tr class="odd gradeX">
											<td><input type="checkbox" class="checkboxes" value="1" /></td>
											<td>kop</td>
											<td class="hidden-480"><a
												href="mailto:userwow@gmail.com">good@gmail.com</a></td>
											<td class="hidden-480">20</td>
											<td class="center hidden-480">17.11.2010</td>
											<td><span class="label label-sm label-success">Approved</span></td>
										</tr>
										<tr class="odd gradeX">
											<td><input type="checkbox" class="checkboxes" value="1" /></td>
											<td>vopl</td>
											<td class="hidden-480"><a
												href="mailto:userwow@gmail.com">good@gmail.com</a></td>
											<td class="hidden-480">20</td>
											<td class="center hidden-480">19.11.2010</td>
											<td><span class="label label-sm label-success">Approved</span></td>
										</tr>
										<tr class="odd gradeX">
											<td><input type="checkbox" class="checkboxes" value="1" /></td>
											<td>userwow</td>
											<td class="hidden-480"><a
												href="mailto:userwow@gmail.com">userwow@gmail.com</a></td>
											<td class="hidden-480">20</td>
											<td class="center hidden-480">12.12.2012</td>
											<td><span class="label label-sm label-default">Blocked</span></td>
										</tr>
										<tr class="odd gradeX">
											<td><input type="checkbox" class="checkboxes" value="1" /></td>
											<td>wap</td>
											<td class="hidden-480"><a
												href="mailto:userwow@gmail.com">test@gmail.com</a></td>
											<td class="hidden-480">20</td>
											<td class="center hidden-480">12.12.2012</td>
											<td><span class="label label-sm label-success">Approved</span></td>
										</tr>
										<tr class="odd gradeX">
											<td><input type="checkbox" class="checkboxes" value="1" /></td>
											<td>test</td>
											<td class="hidden-480"><a
												href="mailto:userwow@gmail.com">good@gmail.com</a></td>
											<td class="hidden-480">20</td>
											<td class="center hidden-480">19.12.2010</td>
											<td><span class="label label-sm label-success">Approved</span></td>
										</tr>
										<tr class="odd gradeX">
											<td><input type="checkbox" class="checkboxes" value="1" /></td>
											<td>toop</td>
											<td class="hidden-480"><a
												href="mailto:userwow@gmail.com">good@gmail.com</a></td>
											<td class="hidden-480">20</td>
											<td class="center hidden-480">17.12.2010</td>
											<td><span class="label label-sm label-success">Approved</span></td>
										</tr>
										<tr class="odd gradeX">
											<td><input type="checkbox" class="checkboxes" value="1" /></td>
											<td>weep</td>
											<td class="hidden-480"><a
												href="mailto:userwow@gmail.com">good@gmail.com</a></td>
											<td class="hidden-480">20</td>
											<td class="center hidden-480">15.11.2011</td>
											<td><span class="label label-sm label-success">Approved</span></td>
										</tr>
									</tbody>
								</table>
								<!-- END EXAMPLE TABLE PORTLET-->
							</div>
							<div class="tab-pane" id="portlet_tab2">
                              <!--惩罚积分规则-->
								<table class="table table-striped table-hover table-bordered"
									id="punishment">
									<thead>
										<tr>
											<th>Username</th>
											<th>Full Name</th>
											<th>Points</th>
											<th>Notes</th>
											<th>Edit</th>
											<th>Delete</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>alex</td>
											<td>Alex Nilson</td>
											<td>1234</td>
											<td class="center">power user</td>
											<td><a class="edit" href="javascript:;">Edit</a></td>
											<td><a class="delete" href="javascript:;">Delete</a></td>
										</tr>
										<tr>
											<td>lisa</td>
											<td>Lisa Wong</td>
											<td>434</td>
											<td class="center">new user</td>
											<td><a class="edit" href="javascript:;">Edit</a></td>
											<td><a class="delete" href="javascript:;">Delete</a></td>
										</tr>
										<tr>
											<td>nick12</td>
											<td>Nick Roberts</td>
											<td>232</td>
											<td class="center">power user</td>
											<td><a class="edit" href="javascript:;">Edit</a></td>
											<td><a class="delete" href="javascript:;">Delete</a></td>
										</tr>
										<tr>
											<td>goldweb</td>
											<td>Sergio Jackson</td>
											<td>132</td>
											<td class="center">elite user</td>
											<td><a class="edit" href="javascript:;">Edit</a></td>
											<td><a class="delete" href="javascript:;">Delete</a></td>
										</tr>
										<tr>
											<td>webriver</td>
											<td>Antonio Sanches</td>
											<td>462</td>
											<td class="center">new user</td>
											<td><a class="edit" href="javascript:;">Edit</a></td>
											<td><a class="delete" href="javascript:;">Delete</a></td>
										</tr>
										<tr>
											<td>gist124</td>
											<td>Nick Roberts</td>
											<td>62</td>
											<td class="center">new user</td>
											<td><a class="edit" href="javascript:;">Edit</a></td>
											<td><a class="delete" href="javascript:;">Delete</a></td>
										</tr>
									</tbody>
								</table>
							</div>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- END TAB PORTLET-->
            </div>
         </div>
         <!-- END PAGE CONTENT -->
</body>
</html>
<content tag="pageCore">
<!-- 引用核心js包 -->
 <!-- BEGIN PAGE LEVEL PLUGINS -->
   <script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
   <script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/jquery.dataTables.js"></script>
   <script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.js"></script>
   <!-- END PAGE LEVEL PLUGINS -->
   <!-- BEGIN PAGE LEVEL SCRIPTS -->
   <script type="text/javascript" src="${basepath }/static/public/javascripts/integral.js"></script>
</content>
<content tag="pageInit">
<!-- 初始化窗口 -->
<script type="text/javascript">
$(document).ready(function(){
	TableManaged.init();
});
</script>
</content>	