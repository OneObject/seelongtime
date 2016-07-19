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
	关联用户
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
<script type="text/javascript"
	src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
	<script src="${basepath }/static/public/javascripts/addacl.js" type="text/javascript"></script>
<script type="text/javascript">

$(function (){
	
	page(1);
	
});

function checked_all(obj) {

	if ($(obj).attr("checked") == "checked") {
		$("input[name='ids']").each(function() {
			$(this).attr("checked", "checked");
			$(this).parent().addClass("checked");
		});
	} else {
		$("input[name='ids']").each(function() {
			$(this).removeAttr("checked");
			$(this).parent().removeClass("checked");
		});
	}
}

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
				关联用户
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
						关联用户
						</span>
					</div>
				</div>
				<div class="portlet-body form box_box">
					<div class="col-md-12" id="course_info">
							<div class="portlet-body"style="overflow: hidden; padding-bottom: 100px;">
								
									<!-- 用户授权 -->
										<div class="portlet-body" style="overflow: hidden;">
											<div class="row">
													<!-- 添加用户的按钮 -->
													<span class="btn btn-success add_role" onclick="openAdd()"><i
														class="icon-plus"></i>添加管理员</span> <span
														class="btn btn-danger add_role" onclick="deleteGroup()"><i
														class="icon-remove"></i>移除用户</span>
											</div>
												<input type="hidden" name="userids" id="userids"
														value="" />
													<!-- 表格内容 -->
													<div id="table_list" class="mt10"></div>
										</div>
							




								<div class="form-group" style="text-align: right;padding-right:30%;">
									<input type="hidden" id="id" name="id" value="${id}" /> 
									<%--
									<span
										class="btn btn-success" onclick="javascript:window.history.go(-1);" ><i
										class="glyphicon glyphicon-floppy-save" ></i>&nbsp;&nbsp;返回
									</span> 
									 --%>
								</div>
							</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
		<!-- 选择用户弹出层 开始 -->
	<div id="add_member_dialog"
		style="display: none; width: 800px; height: 700px; overflow-x: hidden; overflow-y: auto;">
		<h4 class="easyDialog_title" id="easyDialogTitle">
			&nbsp;&nbsp;选择用户 <a href="javascript:void(0)"
				onclick="easyDialog.close();" title="关闭窗口" class="close_btn"
				id="closeBtn">&times;&nbsp;&nbsp;</a>
		</h4>
		<div class="easyDialog_text">
			<table>
				<tr>
					<td><span>用户名:</span> <input type="text" name="susername"
						id="susername"><br></td>
					<td><span>姓名:</span> <input type="text" name="name"
						id="name"><br></td>
					<td><span>部门:</span> <input type="text" name="orgname"
						id="orgname"></td>
					<td><span class="btn yellow" onclick="pageUser(1)"
						style="margin: 10px;"><i class="icon-search"></i>检索</span></td>
				</tr>
			</table>
			<!-- <span>姓名:</span> <input type="text" name="username" id="username"><br>
					            <span>部门:</span> <input type="text" name="orgname" id="orgname">
					            <span class="btn yellow" onclick="pageUser(1)"><i   class="icon-search"></i>检索</span> -->

			<!-- 表格 -->
			<div id="table_list2" style="overflow: auto; width: 100%;"></div>

			<div class="easyDialog_footer">
				<button class="btn default dialog-btn" onclick="easyDialog.close()">关闭</button>
				<button class="btn btn-success dialog-btn" onclick="user_role_add()">确定添加</button>
			</div>
		</div>
	</div>
	
</body>
</html>

