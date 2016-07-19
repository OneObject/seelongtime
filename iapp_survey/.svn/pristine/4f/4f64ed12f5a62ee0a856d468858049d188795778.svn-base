/**
 * 角色的权限管理
 */


function authOrg(){

	var data = { id:$("#id").val() };
	var url = basepath+"/base/admin/acl/role/resource.list";
	$("#table_list").load(encodeURI(url), data, function(){
	      $.fn.zTree.init($("#all_permission"), setting, zNodes);
	      var treeObj = $.fn.zTree.getZTreeObj("all_permission");
	      treeObj.expandAll(true);
	});
	
}


function save(id){
	var treeObj = $.fn.zTree.getZTreeObj("all_permission");
	var selectNodes = treeObj.getCheckedNodes();
	var perIds="";
	for(var i=0;i<selectNodes.length;i++){
	    var node = selectNodes[i];
	    if(i!=selectNodes.length-1){
	        perIds = perIds + node.id +",";
	    }
	    else{
	        perIds = perIds + node.id;
	    }
	}
	$("#idstr").val(perIds);
	
	var name = $.trim($("#name").val());
	
	  if(name==null || name==""){
	    	$("#tip_name").addClass("has-error").focus();
	    	$("#name").focus();
	    	return;
	   }else{
		   $("#tip_name").removeClass("has-error");
	   }
	  $.ajax({
			url:basepath + "/base/admin/acl/role/save.xhtml",
			type:"post",
			data:{id:id,name:name,rids:$("#idstr").val()},
			success:function(data){
				var html="<div style='width:300px;text-align:center;'>保存成功！</div>";
				easyDialog.open({
					container : {
						header : '提示',
						content :html,
						},
					autoClose : 1000,
					fixed : false, 
					callback : function(){
						window.location.href = basepath + "/base/admin/acl/role/index.xhtml";
					}
				});
			},
			error:function(){
				var html="<div style='width:300px;text-align:center;'>保存失败！</div>";
				easyDialog.open({
					container : {
					    header : '提示',
						content : html
					},
					autoClose : 1000,
				});
			}
		});
	 
	
}




/*
 * 关联用户
 */

function openAdd(){
	pageUser(1);
	easyDialog.open({
		  container : 'add_member_dialog',
		  fixed : false
		});
}


function pageUser(i, fieldId) {
//	if(isNotBlank($("#susername").val())){
//		alert($("#susername").val());
//	}
	var divId = "table_list2";
	
	var max = $("#"+divId+" #page_max").val()

	var data = {"page":i, "max":max, "r":Math.random(), "username":$("#susername").val(),"name":$("#name").val(),
			"orgname":$("#orgname").val(),"id":$("#id").val(),'userids':$('#userids').val()};
	var url = basepath+"/base/admin/acl/role/unchoseuserlist.list";
	$("#"+divId).load(encodeURI(url), data, function(){
	});
}

/**
 * 已授权用户：分页
 */
function page(i) {
	var divId = "table_list";
	
	var max = $("#"+divId+" #page_max").val()
	
	var data = {"page":i, "max":max, "r":Math.random(),
			"id":$("#id").val()};
	var url = basepath+"/base/admin/acl/role/choseuserlist.list";
	$("#"+divId).load(encodeURI(url), data, function(){
		App.initUniform();//加载复选框样式
	});
}



function deleteGroup(){
	var items = $("input[name='ids']:checked");
	var tempFn = function (){
		$.get(basepath+"/base/admin/acl/role/delete.xhtml?rid="+$("#id").val(), $.param(items), function (ret){
			if(ret.flag){
    			myAutoHideDialog(ret.message, "success");
    			page(1);
			} else{
    			mySureDialog(ret.message);
    		}
		});
	}
	
	if(items.length == 0){
		myAutoHideDialog("没有选中任何记录！", "warn");
	} else{
		var html="<div style='width:300px;height:50px;text-align:center;'>确定要移除"+items.length+"条记录吗？</div>";
		easyDialog.open({
			container : {
			    header : '提示',
			    content : html,
			    yesFn : tempFn,
			    noFn : true
			}
		});
	}
}


/**
 * 单个删除
 * @param id
 */
function deleteSingle(id){
	var items = $("input[name='ids']:checked");
	var tempFn = function (){
    	$.get(basepath+"/base/admin/acl/role/delete.xhtml?rid="+$("#id").val()+"&ids="+id, $.param(items), function (ret){
    		if(ret.flag){
    			myAutoHideDialog(ret.message, "success");
    			page(1);
    
    		} else{
    			mySureDialog(ret.message);
    		}
    	});
	}
	var html="<div style='width:300px;height:50px;text-align:center;'>确定要移除吗？</div>";
	easyDialog.open({
		container : {
		    header : '提示',
		    content : html,
		    yesFn : tempFn,
		    noFn : true
		}
	});
}


function user_role_add(){
	var result = $("#userids").val();
	if(isBlank(result)){
		mySureDialog("您没有选择任何用户！");
		return ;
	}
	
	var url = basepath+"/base/admin/acl/role/addroleuser.xhtml";
	
	$.post(url, {id:$("#id").val(),uids:result}, function(ret){
		if(ret.flag){
			myAutoHideDialog(ret.message, "success");
			$("#userids").val("");
			$("#susername").val("");
			$("#name").val("");
			$("#orgname").val("");
			page(1);
		} else{
			mySureDialog(ret.message);
		}
	});

}






function itemSelectAll(){
    var itemSelectAll = document.getElementById("itemSelectAll");
    var items = document.getElementsByName("uids");
    if(itemSelectAll.checked==true){
        for(var i=0;i <items.length;i++){
            items[i].checked=true;
        }
    }else{
        for(var i=0;i <items.length;i++){
            items[i].checked=false;
        }
    }
    onSave();
}


function onSave() {
    var items = document.getElementsByName("uids");
    var userids=$("#userids").val();
    for(var i=0;i <items.length;i++){
        if(items[i].checked==true){
            if(saveCheck(items[i].value)==false){
            	userids += items[i].value+",";
            }
        }
        else{
            if(saveCheck(items[i].value)==true){
               if(userids.indexOf(items[i].value) >= 0){
            	   userids = userids.replace(items[i].value+",", "");
               }
            }
        } 
    }
    $("#userids").val(userids);
}


function saveCheck(insertValue){
    var userids=$("#userids").val();
    var data = userids.split(",");
    for(var i=0;i<data.length;i++){
        if(data[i]==insertValue){
            return true;
        }
    }
    return false;
}