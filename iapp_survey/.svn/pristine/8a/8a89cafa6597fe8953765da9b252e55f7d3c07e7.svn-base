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
	var url = basepath+"/mgr/ixin/custommenu/detail.xhtml";
	//alert(url);
	showdetail(treeNode.id, url);
	removeAllError();
} 

function removeAllError(){
	$(".has-error").removeClass("has-error");
}

function releaseMenu(){
	var btn = $("#releaseBtn");
	btn.prop("disabled", true);
	var level1 = $(".level1").length;
	var con = false;
	if(level1==0){
		if(confirm("当前菜单为空，如发布菜单，则公众号的菜单将被删除，确认要发布吗？")){
			con = true;
		}
	} else {
		con = true;
	}
	if(con){
		$.get(basepath+"/mgr/ixin/custommenu/relasecustommenu.xhtml", function (ret){
			if(ret.flag){
				myAutoHideDialog(ret.message, "success");
			} else{
				mySureDialog(ret.message);
			}
			btn.removeProp("disabled");
		});

	}
}

function showdetail(treeId, url){
	$("#detail").show("fast",function(){
		$.ajax({
			url:url,
			type:"POST",
			data:{"treeId":treeId},
			//contentType: "application/json; charset=utf-8",
			success:function(data){
				var depth = data.node.depth;
				var isLeaf = data.node.isLeaf;
				var childCount = data.childCount;
				
				$("#detail_name").text(data.node.name);
				$("#detail_depth").val(depth);
				$("#detail_childCount").val(childCount);
				$("#detail_leaf").val(data.node.isLeaf);
				
				if(depth == 2){
					myHide("con_detail");
					myShow("con_tip");
					$("#btn_update_node").hide();
					$("#btn_delete_node").hide();
					
					if(childCount >= 3){
						myHide2("#con_btn");
						$("#btn_add_node").hide();
					} else{
						myShow2("#con_btn");
						$("#btn_add_node").show();
					}
				} else{
					myHide("con_tip");
					myShow("con_detail");
					myShow2("#con_btn");
					
					if(depth == 3){
						if(childCount >= 5){
							$("#btn_add_node").hide();
						} else{
							$("#btn_add_node").show();
						}
					} else{
						$("#btn_add_node").hide();
						$("#btn_update_node").hide();
						$("#btn_delete_node").hide();
					}
					
					if(!isLeaf){
						$("#detail .leaf_data").addClass("hidden");
						$("#btn_delete_node").hide();
						$("#btn_update_node").show();
					} else{
						$("#detail .leaf_data").removeClass("hidden");
						$("#btn_delete_node").show();
						$("#btn_update_node").show();
						if(data.node.type == 0 || data.node.type==2){
							$("#detail_type").text("内容");
							if(data.node.type == 0){
								$("#update_contentType").val("key");
								$("#update_content").val(data.node.keycode);
							}else {
								$("#update_contentType").val("url");
								$("#update_content").val(data.node.linkurl);
							}
							
							
							var refoptionname = data.node.refoptionname;
							if(refoptionname == "" || refoptionname==null){
								refoptionname = data.node.keycode;
							}
							$("#con_detail_keycode").show();
							$("#update_contentName").val(refoptionname);
							$("#detail_keycode").text(refoptionname);			
							$("#con_detail_url").hide();
						} else{
							$("#detail_type").text("链接");
							$("#update_contentType").val("url");
							$("#update_content").val(data.node.linkurl);
							var refoptionname = data.node.refoptionname;
							if(refoptionname == "" || refoptionname==null){
								refoptionname = data.node.keycode;
							}
							$("#update_contentName").val(refoptionname);
							$("#detail_keycode").text(refoptionname);
							$("#con_detail_url").show();
							$("#detail_url").html(data.node.linkurl);
							$("#con_detail_keycode").hide();
						} 
					}
				}
			}
		});
	});
}
var optiontype = "";
function onAdd(){
	optiontype = "add";
	var perId = $("#perId").val();
	$("#parentId").val(perId);
	var name = $("#detail_name").html();
	
	//$("#parenttName").html("");
	$("#parentName").html(name);
	
	$("#detail").hide("fast",function(){
		$("#add_node").show();
	});
}

function onUpdate(){
	optiontype = "update";
	var perId = $("#perId").val();
	$("#update_parentId").val(perId);
	
	var name = $("#detail_name").text();
	var type = $("#detail_type").text();
	var keycode = $("#detail_keycode").text();
	var url = $("#detail_url").text();
	var isleaf = $("#detail_leaf").val();

	$("#update_name").val(name);
	
	if(isleaf==0){
		$("#update_node .leaf_data").addClass("hidden");
	} else{
		$("#update_node .leaf_data").removeClass("hidden");
		
		if(type == "内容"){
			myShow("update_keycode_con");
			myHide("update_url_con");
			$("#update_type0").attr("checked", "checked");
			$("#update_contentName").val(keycode);
		} else{
			myShow("update_url_con");
			myHide("update_contentName_con");
			$("#update_type1").attr("checked", "checked");
			$("#update_url").val(url);
		}
		App.initUniform();//加载复选框样式
	}
	
	$("#detail").hide("fast",function(){
		$("#update_node").show();
	});
	
}

function toggleAdd(obj){
	var _this = $(obj);
	var value = _this.val();
	if(value == 0){
		myShow("add_contentName_con");
		myHide("add_url_con");
	} else{
		myShow("add_url_con");
		myHide("add_contentName_con");
	}
}

function toggleUpdate(obj){
	var _this = $(obj);
	var value = _this.val();
	if(value == 0){
		myShow("update_contentName_con");
		myHide("update_url_con");
	} else{
		myShow("update_url_con");
		myHide("update_contentName_con");
	}
}

function onDelete(){
	var tempFn = function (){
    	var perId = $("#perId").val();
    	$("#delete_id").val(perId);
    	
    	var treeObj = $.fn.zTree.getZTreeObj("whole_tree");
		var nodes = treeObj.getSelectedNodes();
		var fatherNode;
		for (var i=0, l=nodes.length; i < l; i++) {
			fatherNode = nodes[i].getParentNode();
			$("#delete_parentId").val(fatherNode.id);
		}
    	
		$.get(basepath+"/mgr/ixin/custommenu/delete.xhtml", $.param($("#delete_parentId, #delete_id")), submitSuccessBak);
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
//	clearForm: true,          		//成功提交后，清除所有表单元素的值
//	resetForm: true,          		//成功提交后，重置所有表单元素的值
	timeout: 3000               	//限制请求的时间，当请求大于3秒后，跳出请求
}

var options_update = {
		beforeSubmit: validateUpdate,  //提交前的回调函数
		success: submitSuccessBak,      //提交后的回调函数
		forceSync: true,
//		clearForm: true,          		//成功提交后，清除所有表单元素的值
//		resetForm: true,          		//成功提交后，重置所有表单元素的值
		timeout: 3000               	//限制请求的时间，当请求大于3秒后，跳出请求
}

function submitSuccessBak(ret){
	if(ret.flag){
		myAutoHideDialog(ret.message, "success", function (){window.location.href = basepath+"/mgr/ixin/custommenu/index.xhtml?id="+ret.id;})
	} else{
		mySureDialog(ret.message);
	}
}

$(function (){
	$("#form_add").ajaxForm(options_add);
	$("#form_update").ajaxForm(options_update);
//	$("#form_delete").ajaxForm(options_delete);
});

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
//新增验证
function validateAdd(){
    if(v_add_name() && v_add_keycode() && v_add_url()){
        return true;
    }
    return false;
}

//修改验证
function validateUpdate(){
	if($("#detail_leaf").val() ==0 ){
		if(v_update_name()){
			return true;
		}
	} else{
		if(v_update_name() && v_update_keycode() && v_update_url()){
			return true;
		}
	}
	return false;
}

//删除验证
function validateDelete(){
	var tempFn = function (){
    	var perId = $("#perId").val();
    	$("#delete_id").val(perId);
    	
    	var treeObj = $.fn.zTree.getZTreeObj("whole_tree");
		var nodes = treeObj.getSelectedNodes();
		var fatherNode;
		for (var i=0, l=nodes.length; i < l; i++) {
			fatherNode = nodes[i].getParentNode();
			$("#delete_parentId").val(fatherNode.id);
		}
    	
		return true;
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
	return false;
}

/** 新增名验证 */
function v_add_name(){
	var id = "add_name";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(nameFmtCheck(value, 1)){
        removeError(id);
        return true;
	} else{
        addError(id);
        return false;
	}
}
function nameFmtCheck(value, depth){
	if(isNotBlank(value)){
		var nodeDepth = parseInt($("#detail_depth").val())+parseInt(depth);
		if(getStrLen(value) <= $("#max_name_"+nodeDepth).text()){
			return true;
		}
	}
	return false;
}

/** 新增keycode验证 */
function v_add_keycode(){
	if($("#add_type1").attr("checked") == "checked"){
		return true;
	}
	
	var id = "add_contentName";
	var vid = "add_content";
	var obj = $("#"+vid);
	var value = $.trim(obj.val());
	
	if(isNotBlank(value)){
		removeError(id);
		return true;
	} else{
		addError(id);
		return false;
	}
}
/** 新增url验证 */
function v_add_url(){
	if($("#add_type0").attr("checked") == "checked"){
		return true;
	}
	
	var id = "add_url";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	
	if(isNotBlank(value)){
		removeError(id);
		return true;
	} else{
		addError(id);
		return false;
	}
}

/** 更新分类名验证 */
function v_update_name(){
	var id = "update_name";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(nameFmtCheck(value, 0)){
		removeError(id);
		return true;
	} else{
		addError(id);
		return false;
	}
}
/** 更新keycode验证 */
function v_update_keycode(){
	if($("#update_type1").attr("checked") == "checked"){
		return true;
	}
	
	var id = "update_contentName";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(isNotBlank(value)){
		removeError(id);
		return true;
	} else{
		addError(id);
		return false;
	}
}
/** 更新url验证 */
function v_update_url(){
	if($("#update_type0").attr("checked") == "checked"){
		return true;
	}
	var id = "update_url";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(isNotBlank(value)){
		removeError(id);
		return true;
	} else{
		addError(id);
		return false;
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

/** 选择试题*/
function choose_paper(){
	easyDialog.open({
		container : 'dialogBank',
		fixed : false
	});
}

/**
 * 分页+搜索
 */
function page(i) {
	var divId = "table_list";
	var data = {"page":i,"max":"10", "r":Math.random(),"contentType":$("#contentType").val()};
	var url = basepath+"/mgr/ixin/custommenu/choosecontent.list";
	$("#"+divId).load(encodeURI(url), data, function(){
		choose_paper();
	});
}

/**选择内容 */
function addContent(){
	var content = $("input[name='identifier']:checked");
	if(content.length == 0){
		easyDialog.close();
		return ;
	}
	var value = $(content).val();
	var type = $(content).attr("rel");
	var contentName = $(content).parents("tr").find("span").html();
	var contentType = $("#contentType").val();
	var prefix = "";
	if(contentType == 2){
		prefix = "活动:";
	} else if(contentType == 3){
		prefix = "投票:";
	} else if(contentType == 4){
		prefix = "抽奖:";
	} else if(contentType == 5){
		prefix = "关键词回复:";
	}
	contentName = prefix+contentName;
	$("#"+optiontype+"_contentName").val(contentName);
	$("#"+optiontype+"_contentType").val(type);
	$("#"+optiontype+"_content").val(value);
	
	easyDialog.close();
}