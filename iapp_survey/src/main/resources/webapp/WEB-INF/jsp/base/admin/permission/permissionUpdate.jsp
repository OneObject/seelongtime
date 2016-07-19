<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>角色权限管理</title>
	<meta name="menu_path" content="system.role"/>
	<link rel="stylesheet" href="${basepath}/static/public/JQuery zTree v3.5.15/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/role.css">
</head>
<body>
    <div class="row">
        <div class="col-md-12">
			<ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i> <a href="javascript:void(0);">首页</a><i class="icon-angle-right"></i></li>
				<li><a href="${basepath }/base/admin/role/role.xhtml">角色管理</a><i class="icon-angle-right"></i></li>
				<li><a href="javascript:void(0)">权限修改</a></li>
			</ul>
		</div>
	</div>
	<!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-md-12">
			<div class="portlet box purple" id="box_box">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-foursquare"></i>权限详情
					</div>
				</div>
				<div class="portlet-body">
					<div class="row">
					   <form action="${basepath }/base/admin/permission/saveRolePermission.xhtml" method="post" id="saveRolePermission">
						<div class="col-md-12 role_detail add_box role_detail_text">
							<h4><strong>角色名称：</strong></h4>
							    <input type="hidden" id="roleId" name="roleId" value="${role.id }" >
								<div class="text">${role.name }</div>
							<h4><strong>角色备注：</strong></h4>
								<div class="text">${ltfun:html2Text(role.remark, 15)}</div>
								<!-- 添加用户的按钮 -->
							<!-- <span class="btn btn-success add_role" onclick="toadd()"><i class="icon-plus"></i>添加权限</span> -->
							<input id="idstr" name="idstr" value=${idstr } type="hidden">
							<span class="btn default add_role" onclick="javascript:location.href='${basepath }/base/admin/role/role.xhtml'">返回</span>
                              <ltacl:checkAcl resourceId="111">
							<span class="btn btn-success add_role" onclick="saveUserPermission();"><i class="icon-plus"></i>提交</span>
                              </ltacl:checkAcl>
						</div>
						<!-- <div class="col-md-6">
							<div class="zTreeDemoBackground left">
								<ul id="organization_tree" class="ztree">
								</ul>
							</div>
						</div> -->
						<div class="col-md-6" id="add_premission">
							<div class="col-md-5">
								<div class="zTreeDemoBackground left">
									<ul id="all_permission" class="ztree">
									</ul>
								</div>
							</div>
							<!-- <div class="col-md-1">
								<span class="btn btn-success left">提交</span>
							</div>
							<div class="col-md-1">
								<span class="btn default cancle" onclick="cancle_add()">返回</span>
							</div> -->
						</div>
						</form>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<content tag="pageCore">
<!-- 引用核心js包 -->
     <script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.core-3.5.js" type="text/javascript"></script>
     <script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.excheck-3.5.js" type="text/javascript"></script>
     <script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.exedit-3.5.js" type="text/javascript"></script>
     <script src="${basepath }/static/public/javascripts/permissionUpdate.js" type="text/javascript"></script>
</content>
<content tag="pageInit">
<!-- 初始化窗口 -->
	<script type="text/javascript">
	   var zNodes = ${idstr};
		$(document).ready(function() { 
	        $.fn.zTree.init($("#all_permission"), setting, zNodes);
	        var treeObj = $.fn.zTree.getZTreeObj("all_permission");
	        treeObj.expandAll(true);
	        //$.fn.zTree.init($("#all_permission"), setting, zNodes);
	      });
		/* function toadd(){
			$("#box_box").removeClass("purple");
			$("#box_box").addClass("green");
			$("#add_premission").show();
		}
		function cancle_add(){
			添加成功后调用一下这个方法
			$("#box_box").removeClass("green");
			$("#box_box").addClass("purple");
			$("#add_premission").hide();
		} */
	</script>
</content>	
