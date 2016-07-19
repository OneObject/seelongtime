<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<%@page language="java" import="com.longtime.app.config.Constants"%>
<!DOCTYPE html>
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>邮件详情</title>
<meta name="menu_path" content="system.emailManage" />
	<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
  	<link rel="stylesheet" href="${basepath}/static/public/easydialog-v2.0/easydialog.css">
  	<link rel="stylesheet" href="${basepath}/static/css/active.css">
  	<script src="${basepath}/static/public/easydialog-v2.0/easydialog.min.js"></script>
  	<script language="javascript" type="text/javascript" src="${basepath }/static/public/My97DatePicker/WdatePicker.js"></script>
  	<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/testmanage.css">
  	<link href="${basepath }/static/plugins/bootstrap-switch-master/docs/bootstrap-switch.css" rel="stylesheet">
	<script src="${basepath }/static/plugins/bootstrap-switch-master/docs/bootstrap-switch.js"></script>
	<style type="text/css">
		div.checker, div.checker span, div.checker input {
			width: auto;height: auto;
		}
	</style>
  	<script type="text/javascript">
		function resizeheightforedite(o){
		    $(".edite-img").height($(o).height());
		    $(".edite-img").attr("style","margin-top:-"+$(o).height()+"px;height:"+$(o).height()+"px;line-height:"+$(o).height()+"px;");
		}
		function showother(){
		    $(".othermsg").slideToggle("fast");
		    $(".moremsg").slideToggle("fast");
		    $(".moremsg-up").slideToggle("fast");
		}	
	</script>
</head>
<body>
	  <!-- 创建考试基本信息 -->
       <!-- BEGIN PAGE HEADER-->
         <div class="row" >
            <div class="col-md-12">
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
               <ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i> <a href="${basepath }/mgr/email/index.xhtml">邮件发送管理</a><i class="icon-angle-right"></i></li>
				<li><span>邮件详情</span></li>
				</ul>
               <!-- END PAGE TITLE & BREADCRUMB-->
            </div>
         </div>
         <!-- END PAGE HEADER-->
		<div class="col-md-12">
			<!-- BEGIN VALIDATION STATES-->
			<div class="portlet box green">
				<div class="portlet-title">
					<div class="caption">
						<i class="fa fa-bookmark-o"></i><span>基本信息</span>
					</div>
				</div>
				<div class="portlet-body form box_box">
					<div class="col-md-12" id="course_info" style="padding-top: 10px;">
			            <div class="preview-style" style="border-top-width: 0px;border-right-width: 0px;border-bottom-width: 0px;border-left-width: 0px;">
			                <div class="portlet-body form" style="overflow: hidden;">
			                	<form id="addForm" class="form-horizontal">
									<div class="form-body">
										<div class="form-group">
											<label class="col-md-2 control-label">编号</label>
											<div class="col-md-10">
												<input type="text" class="form-control" disabled="disabled" value="${entity.no }">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label">用户名</label>
											<div class="col-md-10">
												<input type="text" class="form-control" disabled="disabled" value="${entity.username }">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label">姓名</label>
											<div class="col-md-10">
												<input type="text" class="form-control" disabled="disabled" value="${entity.name }">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label">邮箱</label>
											<div class="col-md-10">
												<input type="text" class="form-control" disabled="disabled" value="${entity.email }">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label">主题</label>
											<div class="col-md-10">
												<input type="text" class="form-control" disabled="disabled" value="${entity.subject }">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label">状态</label>
											<div class="col-md-10">
												<input type="text" class="form-control" disabled="disabled" value="${entity.status == -1 ?'失败': entity.status == 0 ?'待发送' : entity.status == 1 ?'成功' : '' }">
											</div>
										</div>
										
										<c:if test="${entity.status == -1 }">
											 <div class="form-group">
						                        <label class="col-md-2 control-label">失败原因</label>
						                        <div class="col-md-10">
						                        <textarea class="form-control"  style="border: #f8f8f8;background-color: #f8f8f8;">${entity.errmsg}</textarea>
						                        </div>
							                  </div>
						                  </c:if>
										
										<div class="form-group">
											<label class="col-md-2 control-label">预计发送时间</label>
											<div class="col-md-10">
												<input type="text" class="form-control" disabled="disabled" value="${ltfun:dateLongToStringFormat(entity.tosendtime, 'yyyy-MM-dd HH:mm')  }">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label">发送时间</label>
											<div class="col-md-10">
												<input type="text" class="form-control" disabled="disabled" value="${ltfun:dateLongToStringFormat(entity.sendtime, 'yyyy-MM-dd HH:mm')  }">
											</div>
										</div>
										 <div class="form-group">
					                        <label class="col-md-2 control-label">内容</label>
					                        <div class="col-md-10">
					                        <textarea name="content" id="email-content" style="border: #f8f8f8;background-color: #f8f8f8;">${entity.content}</textarea>
					                        </div>
						                  </div>
						                  
						                  <div class="form-group"  style="text-align: right;">
							              			<span class="btn btn-warning" onclick="backToList();"><i class="glyphicon glyphicon-arrow-left"></i>&nbsp;&nbsp;返回</span>
							              		</div>
									</div>
								</form>
							</div>
			            </div>
					</div>
				</div>
			</div>
		</div>
	  <script type="text/javascript" src="${basepath }/static/ixin/plugin/ueditor1_3_6-utf8-jsp/ueditor.config.js"></script>
  <script type="text/javascript" src="${basepath }/static/ixin/plugin/ueditor1_3_6-utf8-jsp/ueditor.all.min.js"></script>
  <script src="${basepath }/static/public/javascripts/emailsendindex.js" type="text/javascript"></script>
	<script type="text/javascript">
		var editor = UE.getEditor('email-content');
	</script>
</body>
</html>
