<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>职级管理</title>
	<meta name="menu_path" content="system.joblevel"/>
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
</head>

<body>
<!-- BEGIN PAGE HEADER-->
         <div class="row" >
            <div class="col-md-12">
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
               <ul class="page-breadcrumb breadcrumb">
                  <%-- <li>
                     <i class="icon-home">
                     </i>
                     <a href="${basepath }">首页</a> 
                     <i class="icon-angle-right">
                     </i>
                  </li> --%>
                  <li>
                     <span href="#">职级管理</span>
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
						<i class="icon-cogs"> </i> <span>职级结构</span>
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
						<ul id="joblevel_tree" class="ztree">
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
						<i class="icon-leaf"> </i> <span>职级详情</span>
						<input type="hidden" name="jobLevelId" id="jobLevelId" value=""/>
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
							<td><span id="detail_name">职级树</span></td>
						</tr>
						<tr>
							<td>备注：</td>
							<td><span id="detail_remark"></span></td>
						</tr>
					</table>
					<div class="btn_group_center">
					
						<ltacl:checkAcl resourceId="121">
							<span class="btn btn-success" onclick="onAdd()">
								增加子节点
							</span>
						</ltacl:checkAcl>
						<ltacl:checkAcl resourceId="122">
						</ltacl:checkAcl>
	                        <span id="btn_update_node"  class="btn btn-warning" style="" onclick="onUpdate()">
	                                                                              修改
	                        </span>
	                       <!--  <span id="btn_update_no"  class="btn default" style="cursor: default;">
	                                                                                    修改
	                        </span> -->
						<ltacl:checkAcl resourceId="123">
							<span id="btn_delete_node" class="btn btn-danger" style="display: inline ;" onclick="onDelete()" >
								删除
							</span>
							 <!-- 
							<span id="btn_delete_no" class="btn default" style="display: inline;cursor: default;">
								删除
							</span>-->
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
					<form action="${basepath }/base/admin/joblevel/insert.xhtml" id="form_add" method="post" class="form-horizontal" onsubmit="return validateAdd()">
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
									<input type="text" name="name" id="add_name" onchange="" class="form-control" placeholder="职级名称"><input type="hidden" id="parentId" name="parentId" value="">
							</div>
							<div class="col-md-4">
                                <span for="add_name" class="help-block" style="">请务必填写职级名称.</span>
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
                                <ltacl:checkAcl resourceId="121">
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
					<form action="${basepath }/base/admin/joblevel/update.xhtml" method="post" id="form_update" class="form-horizontal">
					
						<div class="form-group" id="update_name_con">
							<label class="control-label col-md-3">名称<span
								class="required">*</span></label>
							<div class="col-md-4">
								<!--<input type="text" name="name" data-required="1" class="form-control"/>-->
									<input type="text" name="name" id="update_name" value="" class="form-control" placeholder="职级名称"> <input type="hidden" name="update_parentId" id="update_parentId" value=""/>
							</div>
							<div class="col-md-4">
                                <span for="update_name_name" class="help-block" style="">请务必填写职级名称.</span>
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
                                <ltacl:checkAcl resourceId="122">
                                 <button type="submit" class="btn red">确认修改</button>
                                 </ltacl:checkAcl>
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
 <script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.core-3.5.js" type="text/javascript"></script>
 <script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.excheck-3.5.js" type="text/javascript"></script>
 <script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.exedit-3.5.js" type="text/javascript"></script>
</content>
<content tag="pageInit">
<!-- 初始化窗口 -->
<script type="text/javascript">
      var zdata = ${tree};
      var setting = {
    			view: {
    				showLine: false,
    				fontCss: setFontCss
    			},
    			data: {
    				simpleData: {
    					enable: true
    				}
    				,key: {
    					title: "title"
    				}
    			},
    			callback: {
    				onClick: zTreeOnClick,
    				onRemove: zTreeOnRemove
    			}
    		};

    //设置字体样式
      function setFontCss() {
      	return {color:"#000000",size:"14px",height: "28px",family:"微软雅黑"};
      };

      function zTreeOnClick(event, treeId, treeNode) {
    		$("#changewith").removeClass("col-md-12");
    		$("#changewith").addClass("col-md-4");
    		$(".control").find(".portlet").each(function(){
    			$(this).hide();
    		});
    		var jobLevelId = $("#jobLevelId");
    		jobLevelId.val(treeNode.id);
    		showDetail(treeNode.id);
    	}
      function showDetail(treeid){
          var url="${basepath}/base/admin/joblevel/detail.json";
          $("#detail").show("fast",function(){
        	  $.ajax({
      			url:url,
      			type:"POST",
      			data:{"treeId":treeid},
      			success:function(data){
                  if(data!=null){
                	  $("#detail_name").html(data.name);
                	  $("#detail_remark").html(data.remark);
                	  if(data.isSystemType){
      					//不能删除、修改
      					$("#btn_delete_node").hide();
      					$("#btn_delete_no").show();
      					$("#btn_update_node").hide();
      					$("#btn_update_no").show();
      				} else if(!data.leaf){
      					//不能删除
      					$("#btn_delete_node").hide();
      					$("#btn_delete_no").show();
      					$("#btn_update_node").show();
      					$("#btn_update_no").hide();
      				} else{
      					$("#btn_delete_node").show();
      					$("#btn_delete_no").hide();
      					$("#btn_update_node").show();
      					$("#btn_update_no").hide();
      				}
                   }
      			}
      			});
          });
          }
      function validateAdd(){
    	  if(!v_add_name() || !v_add_content()){
    		  return false;
    	  }
    	  return true;
      }

      function validateUpdate(){
    	    if(!v_update_name() || !v_update_content()){
    	        return false;
    	    }
    	    return true;
    	}
      var options_add = {
    			beforeSubmit: validateAdd,  //提交前的回调函数
    			success: submitSuccessBak,      //提交后的回调函数
    			forceSync: true,
    			clearForm: true,          		//成功提交后，清除所有表单元素的值
    			resetForm: true,          		//成功提交后，重置所有表单元素的值
    			timeout: 3000               	//限制请求的时间，当请求大于3秒后，跳出请求
    		}

      var options_update = {
    			beforeSubmit: validateUpdate,  //提交前的回调函数
    			success: submitSuccessBak,      //提交后的回调函数
    			forceSync: true,
    			clearForm: true,          		//成功提交后，清除所有表单元素的值
    			resetForm: true,          		//成功提交后，重置所有表单元素的值
    			timeout: 3000               	//限制请求的时间，当请求大于3秒后，跳出请求
    		}
      function submitSuccessBak(ret){
    		if(ret.flag){
    			myAutoHideDialog(ret.message, "success", function (){location.href = basepath+"/base/admin/joblevel/index.xhtml?id="+ret.id;})
    		} else{
    			mySureDialog(ret.message);
    		}
    	}

      function onDelete(){
    		var html="<div style='width:300px;text-align:center;'>你是否确认删除？</div>";
    		easyDialog.open({
    			container : {
    			    header : '提示',
    				content : html,
    				yesFn : confirmBtn,
    				noFn : true
    			},
    		});
    	}
      function confirmBtn(){
    		var jobLevelId = $("#jobLevelId").val();
    		$("#delete_id").val(jobLevelId);
    		
    		var treeObj = $.fn.zTree.getZTreeObj("joblevel_tree");
    		var nodes = treeObj.getSelectedNodes();
    		var fatherNode;
    		for (var i=0, l=nodes.length; i < l; i++) {
    			fatherNode = nodes[i].getParentNode();
    			$("#delete_parentId").val(fatherNode.id);
    		}

    		$.get(basepath+"/base/admin/joblevel/delete.xhtml", $.param($("#delete_parentId, #delete_id")), submitSuccessBak);
    	}
      function zTreeOnRemove(event, treeId, treeNode) {
    	}

      $(document).ready(function() { 
        $.fn.zTree.init($("#joblevel_tree"), setting, zdata);
        $("#joblevel_tree").find("a[onclick='true']").click();
        $("#form_add").ajaxForm(options_add);
    	$("#form_update").ajaxForm(options_update);
      });
</script>
<script type="text/javascript">
function onAdd(){
	var jobLevelId = $("#jobLevelId").val();
	$("#parentId").val(jobLevelId);
	var name = $("#detail_name").html();
	$("#parentName").html("");
	$("#parentName").html(name);
	$("#detail").hide("fast",function(){
		$("#add_node").show();
	});
}
function cancelAdd(){
	$("#detail").show();
	$("#add_node").hide();
}
function onUpdate(){
	var jobLevelId = $("#jobLevelId").val();
	$("#update_parentId").val(jobLevelId);
	var name = $("#detail_name").html();
	var remark = $("#detail_remark").html();
	$("#update_name").val(name);
	$("#update_remark").val(remark);
	$("#detail").hide("fast",function(){
		$("#update_node").show();
	});
}
function cancelUpdate(){
	$("#detail").show();
	$("#update_node").hide();
}

//验证 
//新增功能验证
function v_add_name(){
  var name = $("#add_name").val();
  if(name==null || name==""){
      addError("add_name");
       return false;
   } else{
       removeError("add_name");
       return true;
   }
}
function v_add_content(){
  var max = $("#add_maxLength").text();
  var id = "add_remark";
  if($("#"+id).val().length > max){
      addError(id);
      return false;
  } else{
      removeError(id);
      return true;
  }
}

function v_update_name(){
    var name = $("#update_name").val();
     if(name==null||name==""){
         addError("update_name");
         return false;
     }
     else{
         removeError("update_name");
         return true;
     }
}
function v_update_content(){
    var max = $("#update_maxLength").text();
    var id = "update_remark";
    if($("#"+id).val().length > max){
        addError(id);
        return false;
    } else{
        removeError(id);
        return true;
    }
}

function addError(id){
	$("#"+id+"_con").addClass("has-error");
}
function removeError(id){
	$("#"+id+"_con").removeClass("has-error");
}

</script>


















</content>	