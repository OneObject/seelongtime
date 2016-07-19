<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]>
<html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]>
<html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>新增商户</title>
<meta name="menu_path" content="system.tenant"/>
<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/ixin.css" type="text/css">
		<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/appmsg_edit.css" type="text/css">
	<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/appmsg_editor.css" type="text/css">
<link rel="stylesheet" type="text/css" href="${basepath }/static/ixin/css/uploadify.css">
<script type="text/javascript">
var token = "${result.uploadToken}";
var qiniuImageBasePath = "${result.qiniuImageBasePath}";
var coverSuffix = "-80x80";
var summary = "${entity.summary}";
</script>
</head>
<body>

	<!-- 页面顶部-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
				<%-- <li><i class="icon-home"></i> <a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
				 --%><li><span href="${basepath }/base/admin/tenant.xhtml">商户管理</span></li>
				<li><span href="#">新增商户</span></li>
			</ul>
			<!-- END PAGE TITLE & BREADCRUMB-->
		</div>
	</div>
	<!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-lg-12">
			<div class="portlet box yellow">
				<div class="portlet-title">
					<div class="caption">
						<i class="fa fa-bar-chart-o"></i><span>商户信息</span> 
					</div>
				</div>
				<div class="portlet-body main_bd box">
					<div class="mauto">
					<div class="col-md-12">
						<!-- 创建 start-->
						<div class="form">
							<form role="form" id="tenantForm" action="${basepath}/base/admin/tenant/add.xhtml" method="post">
								<div class="form-body">
									<div class="form-group">
										<label for="biaoti">商户标识(只能输入英文和数字,后台将统一转成小写字符)</label>
										<input type="text" class="form-control" id="id" name="id" placeholder="">
										<span class="help-block" style="display:none;color:red;" id="idMessage1">
											不能为空,只能输入英文和数字
										</span>
										<span class="help-block" style="display:none;color:red;" id="idMessage2">
											已存在相同标识的商户
										</span>
									</div>
									<div class="form-group">
										<label for="biaoti">商户名称</label>
										<input type="text" class="form-control" id="name" name="name" placeholder="">
										<span class="help-block" style="display:none;color:red;" id="nameMessage">
											不能为空
										</span>
									</div>
									<div class="form-group">
										<label for="biaoti">管理员账号</label>
										<input type="text" class="form-control" id="account" name="account" placeholder="">
										<span class="help-block" style="display:none;color:red;" id="accountMessage1">
											不能为空
										</span>
										<span class="help-block" style="display:none;color:red;" id="accountMessage2">
											已存在相同账号的用户
										</span>
									</div>
									<div class="form-group">
										<label for="biaoti">管理员密码</label>
										<input type="text" class="form-control"id="pwd" name="pwd" placeholder="">
									</div>
									<div class="appmsg_edit_item" style="margin-bottom:10px;">
										<label for="">logo</label>
										<div class="frm_input_box" style="border:1px solid #e5e5e5; padding-top:3px; padding-bottom:-5px;padding-left:10px;">
											<div class="upload_box">
												<div class="upload_area">
													<input type="file" name="file_upload"  id="file_upload" />
													<ul class="upload_file_box" style="display: none;" id="queue"></ul>
												</div>
											</div>
												<div style="display: none;margin-bottom:20px;" id="small_prev">
													<span id="image_cover"></span><a class="js_removeCover" href="javascript:void(0);"
													onclick ="deleteCover();">删除</a>
													<input type="hidden" name="coverPath" id="coverPath" />
												</div>
										</div>
									</div>
								</div>
							</form>
						</div>
						<!-- 创建 end-->
					</div>
						
					</div>
					<!-- 添加 end -->
					<div class="btngroup" style="text-align:center;">
							<div class="btn btn-warning" onclick="saveTenantInfo();">保存</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>
<content tag="pageCore"> 
<script src="${basepath }/static/ixin/js/jquery.uploadify.min.js" type="text/javascript"></script>
</content>
<content tag="pageInit"> <!-- 初始化窗口 --> 
<script type='text/javascript' src='${basepath }/dwr/engine.js'></script>
<script type='text/javascript' src='${basepath }/dwr/util.js'></script>
<script type='text/javascript' src='${basepath }/dwr/interface/DWRService.js'></script>
<script type="text/javascript" src="${basepath }/static/public/javascripts/tenant.js"></script>
<script type="text/javascript">
<c:if test="${not empty tenant && not empty tenant.logo}">
$("#image_cover").html("<img style='max-width:100px;max-height:100px;' src = '"+qiniuImageBasePath+"${tenant.logo}"+coverSuffix+"'>");
$("#small_prev").show();
</c:if>
</script>
 </content>