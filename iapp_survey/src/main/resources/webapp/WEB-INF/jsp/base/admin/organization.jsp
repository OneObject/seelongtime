<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>组织管理</title>
	<meta name="menu_path" content="system.org"/>
	<!-- BEGIN PAGE LEVEL STYLES -->
   <link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
   <link rel="stylesheet" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.css" />
   <!-- END PAGE LEVEL STYLES -->
   <!-- END PAGE LEVEL STYLES -->
   <link rel="stylesheet" href="${basepath}/static/public/JQuery zTree v3.5.15/css/zTreeStyle/zTreeStyle.css" type="text/css">
   <style type="text/css">
.ztree li span.button.add {margin-left:2px; margin-right: -1px; background-position:-144px 0; vertical-align:top; *vertical-align:middle}
.ztree li span.button.icon_01_ico_open, .ztree li span.button.icon_01_ico_close{
		margin-right: 2px;
		background: url(${basepath }/static/img/zz01.png) no-repeat scroll 0 0 transparent;
		vertical-align: top;
	} 
	
	.ztree li span.button.icon_02_ico_open, .ztree li span.button.icon_02_ico_close{
		margin-right: 2px;
		background: url(${basepath }/static/img/zz02.png) no-repeat scroll 0 0 transparent;
		vertical-align: top;
	} 
	
	.ztree li span.button.icon_03_ico_open, .ztree li span.button.icon_03_ico_close{
		margin-right: 2px;
		background: url(${basepath }/static/img/zz03.png) no-repeat scroll 0 0 transparent;
		vertical-align: top;
	} 
	
	.ztree li span.button.icon_04_ico_open, .ztree li span.button.icon_04_ico_close{
		margin-right: 2px;
		background: url(${basepath }/static/img/zz04.png) no-repeat scroll 0 0 transparent;
		vertical-align: top;
	} 
	
    .ztree li span.button.icon_05_ico_open, .ztree li span.button.icon_05_ico_close{
		margin-right: 2px;
		background: url(${basepath }/static/img/zz05.png) no-repeat scroll 0 0 transparent;
		vertical-align: top;
	} 
.ztree li span.button.icon_01_ico_docu{
		margin-right: 2px;
		background: url(${basepath }/static/img/zz01.png) no-repeat scroll 0 0 transparent;
		vertical-align: top;
	} 
	
	.ztree li span.button.icon_02_ico_docu{
		margin-right: 2px;
		background: url(${basepath }/static/img/zz02.png) no-repeat scroll 0 0 transparent;
		vertical-align: top;
	} 
	.ztree li span.button.icon_03_ico_docu{
		margin-right: 2px;
		background: url(${basepath }/static/img/zz03.png) no-repeat scroll 0 0 transparent;
		vertical-align: top;
	} 
	.ztree li span.button.icon_04_ico_docu{
		margin-right: 2px;
		background: url(${basepath }/static/img/zz04.png) no-repeat scroll 0 0 transparent;
		vertical-align: top;
	} 
	.ztree li span.button.icon_05_ico_docu{
		margin-right: 2px;
		background: url(${basepath }/static/img/zz05.png) no-repeat scroll 0 0 transparent;
		vertical-align: top;
	} 
	.label-list{
		width:100%;
		
	}
	.label-list div:first-child{
		width:100%;
		height:22px;
		line-height:22px;
		font-size:16px;
		margin-bottom:10px;
		position:relative;
	}
	.label-list div:first-child label{
		display:inline-block;
		width:2px;
		height:22px;
		background:#529bea;
		margin-right:5px;
		float:left;
	}
	.label-list div:last-child{
		width:100%:
		height:22px;
		overflow:hidden;
	}
	.label-list div:last-child span{
		display:inline-block;
		width:100px;
		float:left;
		height:22px;
		line-height:22px;
		text-align:left;
		white-space:nowrap;
	}
	.label-list div:last-child img{
		margin-right:5px;
		position:relative;
		top:-2px;
	}
    </style>
	<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/organization.css">
	<script type="text/javascript">
		var zdata = ${tree};
	</script>
</head>

<body>
<!-- BEGIN PAGE HEADER-->
         <div class="row" >
            <div class="col-md-12">
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
               <ul class="page-breadcrumb breadcrumb">
                 <%--  <li>
                     <i class="icon-home">
                     </i>
                     <a href="${basepath }">首页</a> 
                     <i class="icon-angle-right">
                     </i>
                  </li> --%>
                  <li>
                     <span href="#">组织管理</span>
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
						<i class="icon-cogs"> </i> <span>组织结构</span>
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
						<ul id="organization_tree" class="ztree">
						</ul>
					</div>
				</div>
				
			</div>
			<div>
				<span class="btn btn-success" onclick="onLoadOrg()">
								批量导入组织
				</span>
				</div>
		</div>
		
		
		
		<div class="col-md-8 control">
			<!-- 详情 -->
			<div class="portlet purple box" id="detail">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-leaf"> </i> <span>组织详情</span><input type="hidden" name="orgId" id="orgId" value=""/>
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
							<td><span id="detail_name">组织树</span></td>
						</tr>
						<tr>
							<td>备注：</td>
							<td><span id="detail_remark"></span></td>
						</tr>
					</table>
					<div class="btn_group_center">
					
							<span class="btn btn-success" onclick="onAdd()">
								增加子节点
							</span>
	                        <span id="btn_update_node"  class="btn btn-warning" style="" onclick="onUpdate()">
	                                                                              修改
	                        </span>
	                       <!--  <span id="btn_update_no"  class="btn default" style="cursor: default;">
	                                                                                    修改
	                        </span> -->
							<span id="btn_delete_node" class="btn btn-danger" style="display: inline ;" onclick="onDelete()" >
								删除
							</span>
							 <!-- 
							<span id="btn_delete_no" class="btn default" style="display: inline;cursor: default;">
								删除
							</span>-->
					</div>
				</div>
			</div>
			<c:if test="${isWXQY }">
	<div class="label-list">
		<div><label></label>图标说明：</div>
		<div>
			<span><img alt="" src="${basepath }/static/img/zz01.png">已同步</span>
			<span><img alt="" src="${basepath }/static/img/zz02.png">同步失败</span>
			<span><img alt="" src="${basepath }/static/img/zz03.png">新增未同步</span>
			<span><img alt="" src="${basepath }/static/img/zz04.png">修改未同步</span>
			<span><img alt="" src="${basepath }/static/img/zz05.png">删除未同步</span>			
		</div>
	
	</div>
			
			</c:if>
			
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
					<form action="${basepath }/base/admin/organization/insert.xhtml" id="form_add" class="form-horizontal" onsubmit="return validateAdd()">
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
									<input type="text" name="name" id="add_name" onchange="" class="form-control" placeholder="组织名称">
							</div>
							<div class="col-md-4">
                                <span for="add_name" id="error-for-add" class="help-block" style="">请务必填写组织名称.</span>
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
                                 <button type="submit" class="btn green">确认新增</button>
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
					<form action="${basepath }/base/admin/organization/update.xhtml" id="form_update" class="form-horizontal">
					
						<div class="form-group" id="update_name_con">
							<label class="control-label col-md-3">名称<span
								class="required">*</span></label>
							<div class="col-md-4">
								<!--<input type="text" name="name" data-required="1" class="form-control"/>-->
									<input type="text" name="name" id="update_name" value="" class="form-control" placeholder="组织名称"> <input type="hidden" name="update_parentId" id="update_parentId" value=""/>
							</div>
							<div class="col-md-4">
                                <span for="update_name_name"  id="department-error" class="help-block" style="">请务必填写组织名称.</span>
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
                                 <button type="submit" class="btn red">确认修改</button>
                                 <button type="button" class="btn default" onclick="cancelUpdate()">取消修改</button>                              
                              </div>
                           </div>
					</form>
					
				</div>
			</div>
			
			<div>
				<form action="${basepath }/base/admin/delete.xhtml" id="form_delete" class="form-horizontal">
					<input type="hidden" name="delete_id" id="delete_id" value=""/>
					<input type="hidden" name="delete_parentId" id="delete_parentId" value=""/>
				</form>
			
			</div>
			
			
		</div>
	</div>

</body>
</html>
<content tag="pageCore">
<!-- 引用核心js包 -->
 <!-- END PAGE CONTENT-->
     <script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.core-3.5.js" type="text/javascript"></script>
     <script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.excheck-3.5.js" type="text/javascript"></script>
     <script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.exedit-3.5.js" type="text/javascript"></script>
      <script src="${basepath }/static/public/javascripts/organization.js" type="text/javascript"></script>  
</content>
<content tag="pageInit">
<!-- 初始化窗口 -->
<script>
      $(document).ready(function() { 
        $.fn.zTree.init($("#organization_tree"), setting, zNodes);
        
        $("#organization_tree").find("a[onclick='true']").click();
      });
      function v_update_name(){
    	    var name = $("#update_name").val();
    	    var nameVal = $.trim(name);
    	    var temp = document.getElementById('department-error');
    	    if (nameVal === "") {
    	    	 temp.innerHTML = '请务必填写组织名称.';
	   	         addError("update_name");
		         return false;
    	    }
    	    if (nameVal.length > 32) {
    	    	 temp.innerHTML = '组织名称必须小于32个字符.';
	   	         addError("update_name");
		         return false;    	    	
    	    }
            removeError("update_name");
            return true;
    	}
      function v_add_name(){
  	    var name = $("#add_name").val();
  	    var nameVal = $.trim(name);
  	    var temp = document.getElementById('error-for-add');
  	    if (nameVal === "") {
  	    	 temp.innerHTML = '请务必填写组织名称.';
	   	         addError("add_name");
		         return false;
  	    }
  	    if (nameVal.length > 32) {
  	    	 temp.innerHTML = '组织名称必须小于32个字符.';
	   	         addError("add_name");
		         return false;    	    	
  	    }
          removeError("add_name");
          return true;
  	}
</script>
</content>	