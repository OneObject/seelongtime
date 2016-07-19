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

var zNodes =zdata;

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
	var orgId = $("#orgId");
	orgId.val(treeNode.id);
	var url = basepath+"/base/admin/xeroxorganization/org_detail.xhtml";
	//alert(url);
	showdetail(treeNode.id,url);
} 

function showdetail(treeId,url){
	//alert(treeId);
	$("#detail").show("fast",function(){
		$.ajax({
			url:url,
			type:"POST",
			data:{"treeId":treeId},
			//contentType: "application/json; charset=utf-8",
			success:function(data){
				//alert(data.name);
				$("#detail_name").html("");
				$("#detail_name").html(data.name);
				$("#detail_remark").html("");
				$("#detail_remark").html(data.remark);
				
				if(data.isSystemType){
					//不能删除、修改
					$("#btn_delete_node").hide();
					$("#btn_delete_no").show();
					$("#btn_update_node").show();
					$("#btn_update_no").hide();
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
				/*if(data.isSystemType==1||!data.leaf){
					$("#btn_delete_node").hide();
					$("#btn_delete_no").show();
				}
				else{
					$("#btn_delete_node").show();
					$("#btn_delete_no").hide();
				}*/
			}
			
		});
		
//        		detail_remark
	});
}
function onDetail(){
	
}

function onLoadOrg(){
   window.location.href=basepath+"/base/admin/xeroxorganization/orgloadindex.xhtml";
}

function onAdd(){
	
	var orgId = $("#orgId").val();
	$("#parentId").val(orgId);
	var name = $("#detail_name").html();
	
	$("#parenttName").html("");
	
	$("#parentName").html(name);
	
	$("#detail").hide("fast",function(){
		//$("#detail_name").html("");
		//$("#detail_remark").html("");
		$("#add_node").show();
	});
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
		//autoClose : 2000,
		//callback : function(){window.location.href = basepath+"/base/admin/user/usermanage.xhtml";}
	});
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
		myAutoHideDialog(ret.message, "success", function (){location.href = basepath+"/base/admin/xeroxorganization/organization.xhtml?id="+ret.id;})
	} else{
		mySureDialog(ret.message);
	}
}

$(function (){
	$("#form_add").ajaxForm(options_add);
	$("#form_update").ajaxForm(options_update);
//	$("#form_delete").ajaxForm(options_delete);
});

function confirmBtn(){
	var orgId = $("#orgId").val();
	$("#delete_id").val(orgId);
	
	var treeObj = $.fn.zTree.getZTreeObj("organization_tree");
	var nodes = treeObj.getSelectedNodes();
	var fatherNode;
	for (var i=0, l=nodes.length; i < l; i++) {
		fatherNode = nodes[i].getParentNode();
		$("#delete_parentId").val(fatherNode.id);
	}
//        	document.form_delete.submit();

	$.get(basepath+"/base/admin/xeroxorganization/delete.xhtml", $.param($("#delete_parentId, #delete_id")), submitSuccessBak);
//	document.getElementById("form_delete").submit(); 
	
}

function onUpdate(){
	
	var orgId = $("#orgId").val();
	$("#update_parentId").val(orgId);
	
	var name = $("#detail_name").html();
	
	var remark = $("#detail_remark").html();
	
	$("#update_name").val(name);
	$("#update_remark").val(remark);
	
	$("#detail").hide("fast",function(){
		//$("#detail_name").html("");
		//$("#detail_remark").html("");
		$("#update_node").show();
	});
	
}

function zTreeOnRemove(event, treeId, treeNode) {
	alert(treeNode.tId + ", " + treeNode.name);
}

function cancelAdd(){
	$("#detail").show();
	$("#add_node").hide();
}

function cancelUpdate(){
	$("#detail").show();
	$("#update_node").hide();
}


//验证 
//新增功能验证
function validateAdd(){
	  if(!v_add_name() || !v_add_content()){
		  return false;
	  }
	  return true;
}
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

//修改更能验证
function validateUpdate(){
    if(!v_update_name() || !v_update_content()){
        return false;
    }
    return true;
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
