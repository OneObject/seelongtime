<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>
	<c:choose>
		<c:when test="${not empty entity.name}">修改角色</c:when><c:otherwise>添加角色</c:otherwise>
	</c:choose>
</title>
<meta name="menu_path" content="system.role" />
<link rel="stylesheet" type="text/css"
	href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet" type="text/css"
	href="${basepath}/static/css/active.css">
<link rel="stylesheet"
	href="${basepath}/static/public/easydialog-v2.0/easydialog.css">
<script
	src="${basepath}/static/public/easydialog-v2.0/easydialog.min.js"></script>
<link rel="stylesheet" media="screen"
	href="${basepath }/static/public/stylesheets/role.css">
<link rel="stylesheet"
	href="${basepath}/static/public/JQuery zTree v3.5.15/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<script
	src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.core-3.5.js"
	type="text/javascript"></script>
<script
	src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.excheck-3.5.js"
	type="text/javascript"></script>
<script
	src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.exedit-3.5.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
	<script src="${basepath }/static/public/javascripts/addacl.js" type="text/javascript"></script>
<script type="text/javascript">

$(function (){
	
	authOrg();
	
});

</script>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
				<%-- <li><i class="icon-home"></i><a href="${basepath }">首页</a><i
					class="icon-angle-right"></i></li> --%>
				<li><a
					href="${basepath }/base/admin/acl/role/index.xhtml">权限管理</a><i
					class="icon-angle-right"></i></li>
				<li><span>
				<c:choose>
					<c:when test="${not empty entity.name}">修改角色</c:when><c:otherwise>添加角色</c:otherwise>
				</c:choose>
			</span></li>
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
					<div class="caption">
						<i class="icon-reorder"></i><span>
						<c:choose>
							<c:when test="${not empty entity.name}">修改角色</c:when><c:otherwise>添加角色</c:otherwise>
						</c:choose>
						</span>
					</div>
				</div>
				<div class="portlet-body form box_box">
					<div class="col-md-12" id="course_info">
							<div class="portlet-body"style="overflow: hidden; padding-bottom: 100px;">
								<div class="form-group" id="tip_name">
										<label class="col-sm-2 control-label" style="margin-top:17px;text-align: right">角色名称：</label>	
											<div class="col-sm-10" style="margin-left:-20px;padding-left:40px;">							
												<input type="text"  name="name" id="name" data-required="1" placeholder="不能为空" class="form-control" value="${entity.name}" style="margin-top:10px;width:60%;"/>
				       						 </div>
				  				</div>
								<div class="row">
				  					
									<div class="tab-content">
				
										<div
											class="tab-pane active"
											id="panel2">
											<div class="col-md-12">
												<label class="col-sm-2 control-label" style="margin-top:17px;text-align: right">角色资源：</label>	
												<div id="table_list"></div>
											</div>
										</div>
									</div>

								</div>

								<div class="form-group" style="text-align: right;padding-right:30%;">
									<input type="hidden" id="id" name="id" value="${id}" /> <span
										class="btn btn-success" onclick="save('${id}');"><i
										class="glyphicon glyphicon-floppy-save"></i>&nbsp;&nbsp;保存</span> 
								</div>
							</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

