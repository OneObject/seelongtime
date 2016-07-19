<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>课件详情</title>
<meta name="menu_path" content="course.courseManage"/>
<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/course.css">
<link rel="stylesheet" href="${basepath}/static/public/JQuery zTree v3.5.15/css/zTreeStyle/zTreeStyle.css" type="text/css">

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
                     <a href="${basepath }">首页</a> 
                     <i class="icon-angle-right">
                     </i>
                  </li>
                  <li>
                     <a href="${basepath }/base/admin/course/course.xhtml">课件管理</a>
                     <i class="icon-angle-right">
                     </i>
                  </li>
                  <li><span>课件详情</span></li>
               </ul>
               <!-- END PAGE TITLE & BREADCRUMB-->
            </div>
         </div>
         <!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN VALIDATION STATES-->
			<div class="portlet box purple">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-reorder"></i><span>课件详情</span>
					</div>
				</div>
				<div class="portlet-body form box_box">
					<div class="col-md-12" id="course_info">
						<div class="form-body">
							<!-- BEGIN FORM-->
							<form id="form_sample_2" enctype="multipart/form-data" class="form-horizontal" method="post" action="${basepath }/base/admin/course/course/doadd.xhtml" onsubmit="return validateAdd();">
								<div class="form-group" id="con_name">
									<label class="control-label col-md-3">课件名称<span
										class="required">*</span></label>
									<div class="col-md-4">
                                            <label class="control-label"><span>${entity.name }</span></label>
									</div>
								</div>
								<div class="form-group" id="con_courseNO">
									<label class="control-label col-md-3">课件路径<span
										class="required">*</span></label>
									<div class="col-md-4">
                                            <label class="control-label"><span>${entity.path }</span></label>
									</div>
								</div>
								<div class="form-group" id="con_validityDate">
									<label class="control-label col-md-3">创建人</label>
									<div class="col-md-4">
                                            <label class="control-label"><span>${entity.creater }</span></label>
									</div>
								</div>
								<div class="form-group" id="con_validityDate">
									<label class="control-label col-md-3">创建日期</label>
									<div class="col-md-4">
                                            <label class="control-label"><span>${ltfun:dateLongToStringFormat(entity.createTime,'yyyy-MM-dd HH:mm') }</span></label>
									</div>
								</div>
								<div class="row">
									<div class="col-md-offset-3 col-md-9">
		                                 <button type="button" class="btn default" onclick="backToList();">返回</button>          
									</div>
								</div>

							</form>
							<!-- END FORM-->
						</div>
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
<script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="${basepath }/static/public/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${basepath }/static/public/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.core-3.5.js" type="text/javascript"></script>
<script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.excheck-3.5.js" type="text/javascript"></script>
<script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.exedit-3.5.js" type="text/javascript"></script>
<%-- html5上传 --%>
<script src="${basepath }/static/public/javascripts/course/zxxFile.js" type="text/javascript"></script>
<script type="text/javascript" src="${basepath }/static/public/javascripts/course/courseware.js" charset="UTF-8"></script>    
</content>
<content tag="pageInit">
<!-- 初始化窗口 -->
</content>	
