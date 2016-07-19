/**
 * 角色成员管理
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
	
	var data = {"page":i, "max":max, "roleId":$("#roleId").val(), "r":Math.random(), 
			"orderField":order.orderField, "orderDirection":order.orderDirection };
	var url = basepath+"/base/admin/user_role/listbyrole.list";
	$("#"+divId).load(encodeURI(url), data, function(){
		App.initUniform();
	});
}

/**
 * 选择用户分页
 */
function pageForChooseUser(i, fieldId){
	var divId = "table_list2";
	
	var order = getOrder(divId, fieldId);
	var max = $("#"+divId+" #page_max").val()
	
	var userIds=$("#userCheckIds").val();
	var userName = $("#searchName").val();
	var orgName = $("#searchOrg").val();
	
	var data = {"page":i, "max":max, "r":Math.random(), "searchContent":$("#searchContent").val(), 
			"userName":userName, "orgName":orgName, "roleId":$("#roleId").val(), "userIds":userIds, 
			"orderField":order.orderField, "orderDirection":order.orderDirection};
	
	var url = basepath+"/base/admin/user_role/listforchooseuser.list";
	
	$("#table_list2").load(encodeURI(url), data, function(ret){
		chooseUser();
	});
}

/**
 * 保存用户角色关联
 * @param roleId
 */
function user_role_add(roleId){
	var result = $("#userCheckIds").val();
	if(isBlank(result)){
		mySureDialog("您没有选择任何用户！");
		return ;
	}
	var url = basepath+"/base/admin/user_role/save.xhtml";
	
	$.post(url, {"roleId":roleId,"ids":result}, function(data){
		if(data){
			myAutoHideDialog("用户角色添加成功！", "success" ,function (){page(1)});
			$("#userCheckIds").val("");
		}
	});
}


/**
 * 多选框的回显
 */
function onSave(){
	var questions=document.getElementsByName("uids");
	var oldData_temp=$("#userCheckIds").val();
	var data;
	data=oldData_temp.split(",");
	for(var i=0;i <questions.length;i++){
		if(questions[i].checked==true){
			if(saveCheck(questions[i].value)==false){
				oldData_temp=oldData_temp+questions[i].value+",";
			}
		}
		else{
			if(saveCheck(questions[i].value)==true){
			   if(oldData_temp.indexOf(questions[i].value)!=0){
			  	oldData_temp=oldData_temp.replace(","+questions[i].value+",",",");
			   }else if(oldData_temp.indexOf(questions[i].value)==0){
			   		oldData_temp=oldData_temp.substring(questions[i].value.length+1,oldData_temp.length);
			   }
			}
		} 
	}		
	$("#userCheckIds").val(oldData_temp);
}

function saveCheck(insertValue){
	var flag=false;
	var oldData_temp=$("#userCheckIds").val();
	var data=oldData_temp.split(",");
	for(var i=0;i<data.length;i++){
		if(data[i]==insertValue){
			return true;
		}
	}
	return flag;
}

function isContains(sorStr,desStr){
	if(sorStr.indexOf(desStr)>=0){
		return true;
	}
	return false;
}

/**
 * 单个移除用户
 * @param userRoleId
 */
function user_role_delete(userRoleId){
	var html="<div style='width:300px;text-align:center;'>确定要移除用户的"+$("#rolename").text()+"角色吗？</div>";
	easyDialog.open({
		container : {
		    header : '提示',
			content : html,
			yesFn : function(){
				var url = basepath+"/base/admin/user_role/delete.xhtml";
				$.post(url, {"userRoleId":userRoleId}, function(data){
					if(data){
						myAutoHideDialog("操作成功！", "success", function (){page(1);});
					}
					else{
						mySureDialog("操作失败！");
					}
				});
			},
			noFn : true
		}
	});
}

/**
 * 批量移除用户
 */
function remove_users(){
	var obj = document.getElementsByName("ids");
	var result = "";
	for (var i = 0; i < obj.length; i++) {  
	    if (obj[i].checked)  {  
	    	result = result + obj[i].value+",";  
	    } 
    }
	
	if(result==""){
		mySureDialog("请选择要移除的对象！");
		return;
	}
	
	var html="<div style='width:300px;text-align:center;'>确定要删除选中用户的"+$("#rolename").text()+"角色吗？</div>";
	easyDialog.open({
		container : {
		    header : '提示',
			content : html,
			yesFn : function(){
				var url = basepath+"/base/admin/user_role/remove.xhtml";
				$.post(url, {"userRoleIds":result}, function(data){
					if(data){
						myAutoHideDialog("操作成功！", "success", function (){page(1);});
					} else{
						mySureDialog("操作失败！");
					}
				});
			},
			noFn : true
		},
	});
}

/**
 * 角色下用户列表全部选中
 */
function checked_all_ur(obj){
	if($(obj).attr("checked") == "checked"){
		$("input[name='ids']").each(function(){
			$(this).attr("checked","checked");
			$(this).parent().addClass("checked");
		});
	}else{
		$("input[name='ids']").each(function(){
			$(this).removeAttr("checked");
			$(this).parent().removeClass("checked");
		});
	}
}
/**
 * 角色下用户列表全部选中
 */
function checked_all_users(obj){
	if($(obj).attr("checked") == "checked"){
		$("input[name='uids']").each(function(){
			$(this).attr("checked","checked");
			$(this).parent().addClass("checked");
		});
	}else{
		$("input[name='uids']").each(function(){
			$(this).removeAttr("checked");
			$(this).parent().removeClass("checked");
		});
	}
	onSave();
}

function chooseUser(){
	easyDialog.open({
	  container : 'add_member_dialog',
	  fixed : false
	});
}

