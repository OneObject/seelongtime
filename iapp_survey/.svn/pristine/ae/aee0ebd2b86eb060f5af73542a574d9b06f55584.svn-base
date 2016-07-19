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
	},
	hunter_head :true
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
	var perId = $("#perId");
	perId.val(treeNode.id);
	var url = basepath+"/base/admin/permission/detail.xhtml";
	//alert(url);
	showdetail(treeNode.id,url);
	removeAllError();
} 

function removeAllError(){
	$(".has-error").removeClass("has-error");
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
				$("#detail_url").html("");
				$("#detail_url").html(data.url);
				$("#detail_sourceId").html("");
				$("#detail_sourceId").html(data.sourceId);
				$("#detail_remark").html("");
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
			
		});
		
//        		detail_remark
	});
}
function onDetail(){
	
}

function onAdd(){
	var perId = $("#perId").val();
	$("#parentId").val(perId);
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
	var tempFn = function (){
    	var perId = $("#perId").val();
    	$("#delete_id").val(perId);
    	
    	var treeObj = $.fn.zTree.getZTreeObj("permission_tree");
		var nodes = treeObj.getSelectedNodes();
		var fatherNode;
		for (var i=0, l=nodes.length; i < l; i++) {
			fatherNode = nodes[i].getParentNode();
			$("#delete_parentId").val(fatherNode.id);
		}
    	
//		document.getElementById("form_delete").submit(); 
		$.get(basepath+"/base/admin/permission/delete.xhtml", $.param($("#delete_parentId, #delete_id")), submitSuccessBak);
	}
	var html="<div style='width:300px;height:50px;text-align:center;'>确定要删除吗？</div>";
	easyDialog.open({
		container : {
		    header : '提示',
		    content : html,
		    yesFn : tempFn,
		    noFn : true
		}
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
		myAutoHideDialog(ret.message, "success", function (){location.href = basepath+"/base/admin/permission/permission.xhtml?id="+ret.id;})
	} else{
		mySureDialog(ret.message);
	}
}

$(function (){
	$("#form_add").ajaxForm(options_add);
	$("#form_update").ajaxForm(options_update);
//	$("#form_delete").ajaxForm(options_delete);
});

function onUpdate(){
	var perId = $("#perId").val();
	$("#update_parentId").val(perId);
	
	var name = $("#detail_name").html();
	var url = $("#detail_url").html();
	var sourceId = $("#detail_sourceId").html();
	var remark = $("#detail_remark").html();
	
	$("#update_name").val(name);
	$("#update_url").val(url);
	$("#update_sourceId").val(sourceId);
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
    if(validateAddName() && validateAddUrl() && validateAddSourceId(false) && v_add_content()){
        return true;
    }
    return false;
}

//修改更能验证
function validateUpdate(){
  if(validateUpdateName() && validateUpdateUrl() && validateUpdateSourceId(true) && v_update_content()){
	  return true;
  }
  return false;
}

function validateAddName(){
	var id = "add_name";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(nameFormatCheck(value)){
		removeError(id);
		return true;
	} else{
        addError(id);
        return false;
	}
}
function validateUpdateName(){
	var id = "update_name";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(nameFormatCheck(value)){
		removeError(id);
		return true;
	} else{
		addError(id);
		return false;
	}
}
function validateAddUrl(){
	var id = "add_url";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(isBlank(value)){
        addError(id);
        return false;
	} else{
        removeError(id);
        return true;
	}
}
function validateUpdateUrl(){
	var id = "update_url";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(isBlank(value)){
		addError(id);
		return false;
	} else{
		removeError(id);
		return true;
	}
}
function validateAddSourceId(conSelf){
	var id = "add_sourceId";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	var s = false;
	if(numCheck(value)){
		dwr.engine.setAsync(false);
		DWRService.uniqueValidate("permission", "sourceId", value, "", conSelf, true, function (ret){
			s = ret;
		});
		dwr.engine.setAsync(true);
		if(s){
    		show1Hide2(id);
			removeError(id);
			return s;
		} else{
			show2Hide1(id);
			addError(id);
			return s;
		}
	} else{
		show1Hide2(id);
		addError(id);
		return s;
	}
}

function validateUpdateSourceId(conSelf){
	var id = "update_sourceId";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	var s = false;
	if(numCheck(value)){
		dwr.engine.setAsync(false);
		DWRService.uniqueValidate("permission", "sourceId", value, $("#update_parentId").val(), conSelf, true, function (ret){
			s = ret;
		});
		dwr.engine.setAsync(true);
		if(s){
    		show1Hide2(id);
			removeError(id);
			return s;
		} else{
			show2Hide1(id);
			addError(id);
			return s;
		}
	} else{
		show1Hide2(id);
		addError(id);
		return s;
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

function numCheck(value){
	return /[0-9]/.test(value);
}

function nameFormatCheck(name){
	 if(isBlank(name) || name.length<1 || name.length>15){
         return false;
     }
     return true;
}

function validateName2(){
     var name = $("#update_name").val();
   if(isBlank(name) || name.length<1 || name.length>15){
         addError("update_name");
         return false;
     }
     else{
         removeError("update_name");
         return true;
     }
}

/** 错误信息的显示控制 */
function addError(id){
	$("#"+id+"_con").addClass("has-error");
	$("#"+id).focus();
}
function removeError(id){
	$("#"+id+"_con").removeClass("has-error");
}
function show1Hide2(id){
	$("#"+id+"_tip").removeClass("hidden");
	
	if($("#"+id+"_tip2") != null){
		$("#"+id+"_tip2").addClass("hidden");
	}
}
function show2Hide1(id){
	$("#"+id+"_tip").addClass("hidden");
	
	if($("#"+id+"_tip2") != null){
		$("#"+id+"_tip2").removeClass("hidden");
	}
}