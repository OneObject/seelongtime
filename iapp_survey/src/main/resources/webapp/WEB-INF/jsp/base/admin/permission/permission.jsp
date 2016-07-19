<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>权限管理</title>
	<meta name="menu_path" content="system.permission"/>
	<!-- BEGIN PAGE LEVEL STYLES -->
   <link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
   <link rel="stylesheet" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.css" />
   <!-- END PAGE LEVEL STYLES -->
   <!-- END PAGE LEVEL STYLES -->
   <link rel="stylesheet" href="${basepath}/static/public/JQuery zTree v3.5.15/css/zTreeStyle/zTreeStyle.css" type="text/css">
   <style type="text/css">
.ztree li span.button.add {margin-left:2px; margin-right: -1px; background-position:-144px 0; vertical-align:top; *vertical-align:middle}
    </style>
	<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/organization.css">
	<script type="text/javascript">
		var zdata = ${tree};
		//alert(zdada);
	</script>
</head>

<body>
<!-- BEGIN PAGE HEADER-->
         <div class="row" >
            <div class="col-md-12">
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
                <!-- <h3 class="page-title">
              权限管理
               </h3> -->
               <ul class="page-breadcrumb breadcrumb">
                  <li>
                     <i class="icon-home">
                     </i>
                     <a href="${basepath }">首页</a> 
                     <i class="icon-angle-right">
                     </i>
                  </li>
                  <li>
                     <span href="javascript:void(0)">权限管理</span>
                     </i>
                  </li>
               </ul>
               <!-- END PAGE TITLE & BREADCRUMB-->
            </div>
         </div>
         <!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-md-12" id="changewith">
			<div class="portlet myblue box">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-cogs"> </i> <span>权限结构</span>
					</div>
					<div class="tools add_btn">
						<!-- <i class="icon-plus">
                         </i>
                         <span onclick="add_root_node();">添加分类</span>-->
					</div>
				</div>
				<div class="portlet-body">
					<!--树状结构的显示-->
					<div class="zTreeDemoBackground left">
						<ul id="permission_tree" class="ztree">
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		
		
		<div class="col-md-8 control">
			<!-- 详情 -->
			<div class="portlet purple box" id="detail">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-leaf"> </i> <span>权限详情</span><input type="hidden" name="perId" id="perId" value=""/>
						<input type="hidden" id="root" name="root" value=${tree } >
					</div>
					<div class="tools add_btn">
						<!-- <i class="icon-plus">
                         </i>
                         <span onclick="add_root_node();">添加分类</span>-->
					</div>
				</div>
				
				<div class="portlet-body">
					<table class="org_table">
						<tr>
							<td>名称：</td>
							<td><span id="detail_name">根</span></td>
						</tr>
						<tr>
							<td>地址：</td>
							<td><span id="detail_url">/iapp</span></td>
						</tr>
						<tr>
							<td>权限id：</td>
							<td><span id="detail_sourceId">0</span></td>
						</tr>
						<tr>
							<td>备注：</td>
							<td><span id="detail_remark">最高权限</span></td>
						</tr>
					</table>
					<div class="btn_group_center">
                    <ltacl:checkAcl resourceId="141">
						<span class="btn btn-success" onclick="onAdd()">
							增加子节点
						</span>
                    </ltacl:checkAcl>
                    <ltacl:checkAcl resourceId="142">
						<span id="btn_update_node"  class="btn btn-warning" style="" onclick="onUpdate()">
							修改
						</span>
						<span id="btn_update_no"  class="btn default" style="cursor: default;">
							修改
						</span>
                    </ltacl:checkAcl>
                     <ltacl:checkAcl resourceId="143">
						<span id="btn_delete_node" class="btn btn-danger" style="display: inline ;" onclick="onDelete()" >
							删除
						</span>
						<span id="btn_delete_no" class="btn default" style="display: inline;cursor: default;">
							删除
						</span>
                     </ltacl:checkAcl>
					</div>
				</div>
			</div>
			
			
			
			<!-- 新增 -->
			<div class="portlet mygreen box" id="add_node" style="display: none;">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-plus"> </i> <span>新增</span>
					</div>
					<div class="tools add_btn">
						<!-- <i class="icon-plus">
                         </i>
                         <span onclick="add_root_node();">添加分类</span>-->
					</div>
				</div>
				<div class="portlet-body">
					<form action="${basepath }/base/admin/permission/insert.xhtml" id="form_add" class="form-horizontal" onsubmit="return validateAdd()">
						<div class="form-group">
							<label class="control-label col-md-3">父节点<span
								class="required">*</span></label>
							<div class="col-md-4">
								<span class="parentname" id="parentName">节点1</span><input type="hidden" name="parentId" id="parentId" value=""/>
							</div>
						</div>
						<div class="form-group" id="add_name_con">
							<label class="control-label col-md-3">名称<span
								class="required">*</span></label>
							<div class="col-md-4">
								<!--<input type="text" name="name" data-required="1" class="form-control"/>-->
									<input type="text" name="name" id="add_name" onchange="validateAddName()" class="form-control" placeholder="权限名称"><input type="hidden" id="parentId" name="parentId" value="">
							</div>
							<div class="col-md-4">
                                <span for="add_name" class="help-block" style="">必填，长度1至15位</span>
                              </div>
						</div>
						<div class="form-group" id="add_url_con">
							<label class="control-label col-md-3">路径<span
								class="required">*</span></label>
							<div class="col-md-4">
								<!--<input type="text" name="name" data-required="1" class="form-control"/>-->
									<input type="text" name="url" id="add_url" onchange="validateAddUrl()" class="form-control" placeholder="路径"><input type="hidden" id="parentId" name="parentId" value="">
							</div>
							<div class="col-md-4">
                                <span for="add_url" class="help-block" style="">/user/*（代表用户管理）<br>/user/add.*（代表添加用户）</span>
                              </div>
						</div>
						<div class="form-group" id="add_sourceId_con">
							<label class="control-label col-md-3">权限id<span
								class="required">*</span></label>
							<div class="col-md-4">
								<!--<input type="text" name="name" data-required="1" class="form-control"/>-->
									<input type="text" name="sourceId" id="add_sourceId" onchange="validateAddSourceId(false)" class="form-control" placeholder="权限id"><input type="hidden" id="parentId" name="parentId" value="">
							</div>
                            <div class="col-md-4">
                                <span id="add_sourceId_tip" for="update_sourceId" class="help-block" style="">必填，只能为数字</span>
                              </div>
                              <div class="col-md-4">
                                <span id="add_sourceId_tip2" for="update_sourceId" class="help-block hidden" style="">权限id已经被使用！</span>
                              </div>
						</div>
						<div class="form-group" id="add_remark_con">
							<label class="control-label col-md-3">备注</label>
							<div class="col-md-4">
								<!--<input type="text" name="name" data-required="1" class="form-control"/>-->
									<textarea class="mytextarea" name="remark" id="add_remark"></textarea>
							</div>
                            <div class="col-md-4">
                                <span for="add_remark_tip" class="help-block" style=""><span id="add_maxLength">255</span>字以内</span>
                              </div>
						</div>
						<div class="form-actions fluid">
                              <div class="col-md-offset-3 col-md-9">
                              <ltacl:checkAcl resourceId="141">
                                 <button type="submit" class="btn green">确认新增</button>
                              </ltacl:checkAcl>
                                 <button type="button" class="btn default" onclick="cancelAdd()">取消新增</button>                              
                              </div>
                           </div>
					</form>
					
				</div>
			</div>
			<!-- 编辑 -->
			<div class="portlet yellow box" id="update_node" style="display: none;" onsubmit="return validateUpdate()">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-edit"> </i> <span>修改</span>
					</div>
					<div class="tools add_btn">
						<!-- <i class="icon-plus">
                         </i>
                         <span onclick="add_root_node();">添加分类</span>-->
					</div>
				</div>
				<div class="portlet-body">
					<form action="${basepath }/base/admin/permission/update.xhtml" id="form_update" class="form-horizontal">
					
						<div class="form-group" id="update_name_con">
							<label class="control-label col-md-3">名称<span
								class="required">*</span></label>
							<div class="col-md-4">
								<!--<input type="text" name="name" data-required="1" class="form-control"/>-->
									<input type="text" name="name" id="update_name" onchange="validateUpdateName()" value="" class="form-control" placeholder="权限名称"> <input type="hidden" name="update_parentId" id="update_parentId" value=""/>
							</div>
							<div class="col-md-4">
                                <span for="update_name_name" class="help-block" style="">必填，长度1至15位</span>
                              </div>
						</div>
                        <div class="form-group" id="update_url_con">
                            <label class="control-label col-md-3">路径<span
                                class="required">*</span></label>
                            <div class="col-md-4">
                                <!--<input type="text" name="name" data-required="1" class="form-control"/>-->
                                    <input type="text" name="url" id="update_url" onchange="validateUpdateUrl()" class="form-control" placeholder="路径"><input type="hidden" id="parentId" name="parentId" value="">
                            </div>
                            <div class="col-md-4">
                                <span for="update_url" class="help-block" style="">/user/*（代表用户管理）<br>/user/add.*（代表添加用户）</span>
                              </div>
                        </div>
                        <div class="form-group" id="update_sourceId_con">
                            <label class="control-label col-md-3">权限id<span
                                class="required">*</span></label>
                            <div class="col-md-4">
                                <!--<input type="text" name="name" data-required="1" class="form-control"/>-->
                                    <input type="text" name="sourceId" id="update_sourceId" onchange="validateUpdateSourceId(true)" class="form-control" placeholder="权限id"><input type="hidden" id="parentId" name="parentId" value="">
                            </div>
                            <div class="col-md-4">
                                <span id="update_sourceId_tip" for="update_sourceId" class="help-block" style="">必填，只能为数字</span>
                              </div>
                              <div class="col-md-4">
                                <span id="update_sourceId_tip2" for="update_sourceId" class="help-block hidden" style="">权限id已经被使用！</span>
                              </div>
                        </div>
						<div class="form-group" id="update_remark_con">
							<label class="control-label col-md-3">备注</label>
							<div class="col-md-4">
								<!--<input type="text" name="name" data-required="1" class="form-control"/>-->
									<textarea class="mytextarea" id="update_remark" name="remark"></textarea>
							</div>
                            <div class="col-md-4">
                                <span for="update_remark_tip" class="help-block" style=""><span id="update_maxLength">255</span>字以内</span>
                              </div>
						</div>
						<div class="form-actions fluid">
                              <div class="col-md-offset-3 col-md-9">
                              <ltacl:checkAcl resourceId="142">
                                 <button type="submit" class="btn red">确认修改</button>
                              </ltacl:checkAcl>
                                 <button type="button" class="btn default" onclick="cancelUpdate()">取消修改</button>                              
                              </div>
                           </div>
					</form>
				</div>
			</div>
			
			<div>
				<form action="${basepath }/base/admin/permission/delete.xhtml" id="form_delete" class="form-horizontal">
					<input type="hidden" name="delete_id" id="delete_id" value=""/>
					<input type="hidden" name="delete_parentId" id="delete_parentId" value=""/>
				</form>
			
			</div>
			
                    <!-- <div id="test"></div> -->
			
		</div>
	</div>

</body>
</html>
<content tag="pageCore">
<!-- 引用核心js包 -->
 <!-- END PAGE CONTENT-->
     <script src="${basepath }/static/public/easydialog-v2.0/easydialog.min.js" type="text/javascript"></script>
     <script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.core-3.5.js" type="text/javascript"></script>
     <script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.excheck-3.5.js" type="text/javascript"></script>
     <script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.exedit-3.5.js" type="text/javascript"></script>
     <script src="${basepath }/static/public/javascripts/permission.js" type="text/javascript"></script> 
     <%-- 输入验证 --%>
     <script src='${basepath }/static/public/javascripts/commonValidate.js' type='text/javascript' ></script>
     <%-- dwr --%>
    <script type='text/javascript' src='${basepath }/dwr/engine.js'></script>
    <script type='text/javascript' src='${basepath }/dwr/util.js'></script>
    <script type='text/javascript' src='${basepath }/dwr/interface/DWRService.js'></script> 
</content>
<content tag="pageInit">
<!-- 初始化窗口 -->
<script>
      $(document).ready(function() { 
        $.fn.zTree.init($("#permission_tree"), setting, zNodes);
        
        $("#permission_tree").find("a[onclick='true']").click();
      });
</script>
   
   
  
</content>	