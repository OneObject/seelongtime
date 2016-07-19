/**
 * 角色管理
 */

$(function (){
	page(1);
});

/**
 * 分页+搜索
 */
function page(i, fieldId) {
	var divId = "table_list";
	
	var order = getOrder(divId, fieldId);
	var max = $("#"+divId+" #page_max").val()
	
	//AJAX提示
	loading(divId);
	var max = $("#"+divId+" #page_max").val()
	
	var data = {"page":i, "max":max, "r":Math.random(), 
		"orderField":order.orderField, "orderDirection":order.orderDirection };
	var url = basepath+"/base/admin/role/list.list";
	$("#"+divId).load(encodeURI(url), data, function(){
		App.initUniform();
	});
}

function add_role(){
	var html = [];
	html.push('<div style="width:500px;height:250px;overflow:hidden;display:block;">');
	html.push('<div style="margin-bottom: 10px" id="con_insert_name"><span style="margin-right: 20px;float: left;margin-top: 3px;">角色名称<span class="required">*</span></span>');
	html.push('<input type="text" style="width:400px;" name="name" id="insert_name" value="" placeholder="请输入角色名称">');
	html.push('<span id="tip_insert_name" class="help-block hidden" style="margin-left:80px;">角色名称不能为空！</span></div>');
	html.push('<div style="margin-bottom: 10px" id="con_insert_remark"><span style="margin-right: 22px;margin-left: 30px;float: left;margin-top: 3px;">备注</span>');
	html.push('<textarea type="text" style="width:400px;height:120px;resize:none;" name="remark" id="insert_remark" placeholder="255字以内！"></textarea>');
	html.push('<span id="tip_insert_remark" class="help-block hidden" style="margin-left:80px;"><span id="maxLength">255</span>字以内！</span></div>');
	html.push('<div style="text-align: center;"><span class="btn btn-success" onclick="insert_role()" style="margin-right:10px">保存角色</span>');
	html.push('<span class="btn default" onclick="easyDialog.close()">取消</span></div>');
	html.push('<div>');
	easyDialog.open({
		  container : {
		    header : '添加角色',
		    content : html.join("")
		  }
		});
}

function validateAdd(){
	if(!v_insert_name() || !v_insert_remark()){
		return false;
	}
	return true;
}
function v_insert_name(){
	var id = "insert_name";
	var value = $("#"+id).val();
	if(isBlank(value)){
		addError(id);
		return false;
	} else{
		removeError(id);
		return true;
	}
}
function v_insert_remark(){
	var max = $("#maxLength").text();
	var id = "insert_remark";
	if($("#"+id).val().length > max){
		addError(id);
		return false;
	} else{
		removeError(id);
		return true;
	}
}

function addError(id){
	$("#con_"+id).addClass("has-error");
	$("#tip_"+id).removeClass("hidden");
}
function removeError(id){
	$("#con_"+id).removeClass("has-error");
	$("#tip_"+id).addClass("hidden");
}

function insert_role(){
	if(!validateAdd()){
		return;
	}
	var name = $("#insert_name").val();
	var remark = $("#insert_remark").val();
	var url = basepath+"/base/admin/role/insert.xhtml";
	$.ajax({
		url:url,
		type:"POST",
		data:{"name":name,"remark":remark},
		//contentType: "application/json; charset=utf-8",
		success:function(data){
			/*var html="<div style='width:300px;text-align:center;'>添加成功！</div>";*/
			if(data){
				myAutoHideDialog("添加成功！", "success", function(){page(1);});
			} else{
				mySureDialog("添加失败！");
			}
			
		},
		error:function(){
			mySureDialog("添加失败！");
		}
	});
	
}



/*
 * 修改角色
 * */
function update_role(id){
	var url = basepath+"/base/admin/role/detail.xhtml";
	$.ajax({
		url:url,
		type:"POST",
		data:{"id":id},
		//contentType: "application/json; charset=utf-8",
		success:function(data){
			var html = [];
			html.push('<div style="width:500px;height:250px;overflow:hidden;display:block;">');
			html.push('<div style="margin-bottom: 10px" id="con_update_name"><span style="margin-right: 20px;float: left;margin-top: 3px;">角色名称<span class="required">*</span></span>');
			html.push('<input type="text" style="width:400px;" name="name" id="update_name" value="'+data.name+'" placeholder="请输入角色名称">');
			html.push('<span id="tip_update_name" class="help-block hidden" style="margin-left:80px;">角色名称不能为空！</span></div>');
			html.push('<div style="margin-bottom: 10px" id="con_update_remark"><span style="margin-right: 22px;margin-left: 30px;float: left;margin-top: 3px;">备注</span>');
			html.push('<textarea type="text" style="width:400px;height:120px;resize:none;" name="remark" id="update_remark" placeholder="255字以内！">'+data.remark+'</textarea>');
			html.push('<span id="tip_update_remark" class="help-block hidden" style="margin-left:80px;"><span id="maxLength">255</span>字以内！</span></div>');
			html.push('<div style="text-align: center;"><span class="btn btn-warning" onclick="update_to_role('+"'"+data.id+"'"+')" style="margin-right:10px">保存角色</span>');
			html.push('<span class="btn default" onclick="easyDialog.close()">取消</span></div>');
			html.push('<div>');
			easyDialog.open({
				  container : {
				    header : '编辑角色',
				    content : html.join("")
				  }
			});
		}
	});
}

function validateUpdate(){
	if(!v_update_name() || !v_update_remark()){
		return false;
	}
	return true;
}
function v_update_name(){
	var id = "update_name";
	var value = $("#"+id).val();
	if(isBlank(value)){
		addError(id);
		return false;
	} else{
		removeError(id);
		return true;
	}
}
function v_update_remark(){
	var max = $("#maxLength").text();
	var id = "update_remark";
	if($("#"+id).val().length > max){
		addError(id);
		return false;
	} else{
		removeError(id);
		return true;
	}
}

/*
 * 修改-角色
 * */
function update_to_role(id){
	if(!validateUpdate()){
		return;
	}
	var url = basepath+"/base/admin/role/update.xhtml";
	var name = $("#update_name").val();
	var remark = $("#update_remark").val();
	
	$.ajax({
		url:url,
		type:"POST",
		data:{"id":id,"name":name,"remark":remark},
		success:function(data){
			if(data){
				myAutoHideDialog("修改成功！", "success", function(){page(1);});
			} else{
				mySureDialog("修改失败！");
			}
		}
	});
}

/**
 * 添加用户全部选中
 */
var flag = true;//没有选中的情况下是true
function checked_all(){
	if(flag){
		$("input[name='ids']").each(function(){
			$(this).attr("checked","checked");
			$(this).parent().addClass("checked");
		});
		flag = false;
	}else{
		$("input[name='ids']").each(function(){
			$(this).removeAttr("checked");
			$(this).parent().removeClass("checked");
		});
		flag = true;
	}
	onSave();
}

function delete_role(id){
	var html="<div style='width:300px;text-align:center;'>你是否确认删除？</div>";
	easyDialog.open({
		container : {
		    header : '提示',
			content : html,
			yesFn : function(){
				var url = basepath+"/base/admin/role/delete.xhtml";
				$.ajax({
					url:url,
					type:"POST",
					data:{"id":id},
					//contentType: "application/json; charset=utf-8",
					success:function(data){
						if(data){
							myAutoHideDialog("删除成功！", "success", function(){page(1);});
						} else{
							mySureDialog("该角色下已存在用户，不能删除！");
						}
					}
				});
			},
			noFn : true
		}/*,
		callback : function(){ 
			//getlist($("#current_page_id").val());
			location.reload();
		}*/
	});
	
}

function user_role(roleId){
	var url = basepath+"/base/admin/user_role/roleuser.xhtml?roleId="+roleId;
	location.href=url;
}

function update_permission(id){
	window.location.href=basepath+"/base/admin/permission/permissionUpdate.xhtml?id="+id;
}

function bind_hidden(){
	$('#sample_2_column_toggler input[type="checkbox"]').change(function(){
		var o = $(this);
		var table= $('#sample_2');
		hidden_cloumn(o,table,flag);
	});
}
/*
 * 重写隐藏列方法
 * */

function hidden_cloumn(o,table,flag){
	var flags = $(o).is("checked");
	var iCol = parseInt($(o).attr("data-column"));//定义第几列的编号
	$(table).find("tr").each(function(){
		$(this).find("td:nth-child("+iCol+")").toggle();
	});
}