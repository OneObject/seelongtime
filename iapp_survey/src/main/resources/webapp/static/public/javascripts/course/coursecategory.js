var setting = {
	view : {
		showLine : false,
		fontCss : setFontCss
	},
	data : {
		simpleData : {
			enable : true
		},
		key : {
			title : "title"
		}
	},
	callback : {
		onClick : zTreeOnClick,
		onRemove : zTreeOnRemove
	},
	hunter_head : true
};

var zNodes = zdata;
var zTreenodes = treenodes;

// 设置字体样式
function setFontCss() {
	return {
		color : "#000000",
		size : "14px",
		height : "28px",
		family : "微软雅黑"
	};
};

var excludenodes;// 不能移动到的目录
// 遍历获取不能移动到的目录
function getNodes(treeNode) {
	excludenodes.push(treeNode.id);// 放入自己的id
	if (treeNode.isParent) {// 是父目录，把子节点的id也放进去
		var ns = treeNode.children;
		for ( var i = 0; i < ns.length; i++) {
			getNodes(ns[i]);
		}
	}
}

var parentNodeId = ""; //当前节点的父节点
var isParent = false;//是否为父节点
function zTreeOnClick(event, treeId, treeNode) {
 
	isParent = treeNode.isParent;
	if (treeNode.getParentNode() != null) {
		parentNodeId = treeNode.getParentNode().id;
	}
	excludenodes = new Array();
	getNodes(treeNode);
	// alert(excludenodes);

	$("#changewith").removeClass("col-md-12");
	$("#changewith").addClass("col-md-4");
	$(".control").find(".portlet").each(function() {
		$(this).hide();
	});
	var perId = $("#perId");
	perId.val(treeNode.id);
	var url = basepath + "/base/admin/course/coursecategory/detail.xhtml";
	// alert(url);
	showdetail(treeNode.id, url);
	removeAllError();
}

function removeAllError() {
	$(".has-error").removeClass("has-error");
}

function showdetail(treeId, url) {
	// alert(treeId);
	$("#detail").show("fast", function() {
		$.ajax({
			url : url,
			type : "POST",
			data : {
				"treeId" : treeId
			},
			// contentType: "application/json; charset=utf-8",
			success : function(data) {
				// alert(data.name);
				// alert(data.children);
				$("#detail_name").html(data.name);
				$("#detail_remark").html(getSubstr(data.remark));
				$("#hidden_remark").val(data.remark);
				$("#detail_domain").html(data.domain);

				if (data.isSystemType) {
					// 不能删除、修改
					$("#btn_delete_node").hide();
					$("#btn_delete_no").show();
					$("#btn_update_node").hide();
					$("#btn_update_no").show();
				} else if (!data.leaf) {
					// 不能删除
					$("#btn_delete_node").hide();
					$("#btn_delete_no").show();
					$("#btn_update_node").show();
					$("#btn_update_no").hide();
				} else {
					$("#btn_delete_node").show();
					$("#btn_delete_no").hide();
					$("#btn_update_node").show();
					$("#btn_update_no").hide();
				}
			}
		});
	});
}

function onAdd() {
	var perId = $("#perId").val();
	$("#parentId").val(perId);
	var name = $("#detail_name").html();

	$("#parenttName").html("");
	$("#parentName").html(name);

	$("#detail").hide("fast", function() {
		$("#add_node").show();
	});
}

function showurl(url){
	var perId = $("#perId").val();
	showMsgDialog(url + perId);
}


function showMsgDialog(content){
	easyDialog.open({
        container : {
            header : '提示',
            content : '<div style="background-color: #ffffff;width:460px;height:40px;text-align:center;">'+content+'</div>',
            yesFn :easyDialog.close
         },
    });
}

function onDelete() {
	var tempFn = function() {
		var perId = $("#perId").val();
		$("#delete_id").val(perId);

		var treeObj = $.fn.zTree.getZTreeObj("whole_tree");
		var nodes = treeObj.getSelectedNodes();
		var fatherNode;
		for ( var i = 0, l = nodes.length; i < l; i++) {
			fatherNode = nodes[i].getParentNode();
			$("#delete_parentId").val(fatherNode.id);
		}

		$.get(basepath + "/base/admin/course/coursecategory/delete.xhtml", $
				.param($("#delete_parentId, #delete_id")), submitSuccessBak);
	}
	var html = "<div style='width:300px;height:50px;text-align:center;'>确定要删除吗？</div>";
	easyDialog.open({
		container : {
			header : '提示',
			content : html,
			yesFn : tempFn,
			noFn : true
		}
	});
}

function onUpdate() {
	var perId = $("#perId").val();
	$("#update_parentId").val(perId);

	$("#parent_node").empty(); //清空节点
//	alert(zTreenodes);
	for ( var i = 0; i < zTreenodes.length; i++) {// 所有节点 
		var str = "";
		for( var m = 1; m < zTreenodes[i].depth; m++)
			str += "----"; 
		$("#parent_node").append(
				"<option value='" + zTreenodes[i].id + "'>" + str + zTreenodes[i].name + "</option>");
		for ( var j = 0; j < excludenodes.length; j++) {// 不能移动的节点
			if (zTreenodes[i].id == excludenodes[j]) {//移除不能移动的节点
				$("#parent_node option[value='" + excludenodes[j] + "']").remove();
			}
		}
	}  
	
	$("#parent_node option[value='" + parentNodeId + "']").attr("selected",
			"selected");// 选中当前节点的默认父节点

	var name = $("#detail_name").html();
	var remark = $("#hidden_remark").val();
	var domain = $("#detail_domain").html();

	$("#update_name").val(name);
	$("#update_remark").val(remark);
	$("#update_domain").html(domain);

	$("#detail").hide("fast", function() {
		$("#update_node").show();
	});

}

var options_add = {
	beforeSubmit : validateAdd, // 提交前的回调函数
	success : submitSuccessBak, // 提交后的回调函数
	forceSync : true,
	clearForm : true, // 成功提交后，清除所有表单元素的值
	resetForm : true, // 成功提交后，重置所有表单元素的值
	timeout : 3000
// 限制请求的时间，当请求大于3秒后，跳出请求
}

var options_update = {
	beforeSubmit : validateUpdate, // 提交前的回调函数
	success : submitSuccessBak, // 提交后的回调函数
	forceSync : true,
	clearForm : true, // 成功提交后，清除所有表单元素的值
	resetForm : true, // 成功提交后，重置所有表单元素的值
	timeout : 3000
// 限制请求的时间，当请求大于3秒后，跳出请求
}

function submitSuccessBak(ret) {
	if (ret.flag) {
		myAutoHideDialog(
				ret.message,
				"success",
				function() {
					location.href = basepath
							+ "/base/admin/course/coursecategory/coursecategory.xhtml?id="
							+ ret.id;
				})
	} else {
		mySureDialog(ret.message);
	}
}

$(function() {
	$("#form_add").ajaxForm(options_add);
	$("#form_update").ajaxForm(options_update);
	// $("#form_delete").ajaxForm(options_delete);
});

function zTreeOnRemove(event, treeId, treeNode) {
	alert(treeNode.tId + ", " + treeNode.name);
}

function cancelAdd() {
	$("#detail").show();
	$("#add_node").hide();
}

function cancelUpdate() {
	$("#detail").show();
	$("#update_node").hide();
}

// 验证
// 新增验证
function validateAdd() {
	if (validateAddName() && validateAddMark()) {
		return true;
	}
	return false;
}

// 修改验证
function validateUpdate() {
	if (validateUpdateName() && validateUpdateMark()) {
		return true;
	}
	return false;
}

// 删除验证
function validateDelete() {
	var tempFn = function() {
		var perId = $("#perId").val();
		$("#delete_id").val(perId);

		var treeObj = $.fn.zTree.getZTreeObj("whole_tree");
		var nodes = treeObj.getSelectedNodes();
		var fatherNode;
		for ( var i = 0, l = nodes.length; i < l; i++) {
			fatherNode = nodes[i].getParentNode();
			$("#delete_parentId").val(fatherNode.id);
		}

		return true;
	}

	var html = "<div style='width:300px;height:50px;text-align:center;'>确定要删除吗？</div>";
	easyDialog.open({
		container : {
			header : '提示',
			content : html,
			yesFn : tempFn,
			noFn : true
		}
	});
	return false;
}

/** 新增分类名验证 */
function validateAddName() {
	var id = "add_name";
	var obj = $("#" + id);
	var value = $.trim(obj.val());
	if (nameFormatCheck(value)) {
		removeError(id);
		return true;
	} else {
		addError(id);
		return false;
	}
}
/** 新增备注验证 */
function validateAddMark() {
	var id = "add_remark";
	var obj = $("#" + id);
	var value = $.trim(obj.val());
	if ($.trim(value).length < 256) {
		removeError(id);
		return true;
	} else {
		addError(id);
		return false;
	}
}

/** 更新分类名验证 */
function validateUpdateName() {
	var id = "update_name";
	var obj = $("#" + id);
	var value = $.trim(obj.val());
	if (nameFormatCheck(value)) {
		removeError(id);
		return true;
	} else {
		addError(id);
		return false;
	}
}
/** 更新备注验证 */
function validateUpdateMark() {
	var id = "update_remark";
	var obj = $("#" + id);
	var value = $.trim(obj.val());
	if ($.trim(value).length < 256) {
		removeError(id);
		return true;
	} else {
		addError(id);
		return false;
	}
}

function nameFormatCheck(value) {
	if (isBlank(value) || value.length < 1 || value.length > 15) {
		return false;
	}
	return true;
}

/** 错误信息的显示控制 */
function addError(id) {
	$("#" + id + "_con").addClass("has-error");
	$("#" + id).focus();
}
function removeError(id) {
	$("#" + id + "_con").removeClass("has-error");
}
function show1Hide2(id) {
	$("#" + id + "_tip").removeClass("hidden");

	if ($("#" + id + "_tip2") != null) {
		$("#" + id + "_tip2").addClass("hidden");
	}
}
function show2Hide1(id) {
	$("#" + id + "_tip").addClass("hidden");

	if ($("#" + id + "_tip2") != null) {
		$("#" + id + "_tip2").removeClass("hidden");
	}
}