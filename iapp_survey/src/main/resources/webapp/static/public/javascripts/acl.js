/**
 * 角色的权限管理
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
	max = max != null ? max : 10;
	
	var data = {"page":i, "max":max, "r":Math.random(),};
	var url = basepath+"/base/admin/acl/role/list.list";
	$("#"+divId).load(encodeURI(url), data, function(){
		App.initUniform();
	});
}

function tosave(id){
	if (id==null || id == "") {
		id="";
	}
	window.location.href=basepath + "/base/admin/acl/role/tosave.xhtml?id="+id;
	
}


function deleteRole(id){
	var tempFn = function (){
    	$.post(basepath+"/base/admin/acl/role/delete.json", {id:id }, function (ret){
    		if(ret.flag){
    			var html="<div style='width:300px;text-align:center;'>"+ret.message+"</div>";
    			easyDialog.open({
    				container : {
    				    header : '提示',
    					content : html
    				},
    				autoClose : 1000,
    				callback : function(){page(1);}
    			});
    		}else{
    			var html="<div style='width:300px;text-align:center;'>"+ret.message+"</div>";
    			easyDialog.open({
    				container : {
    				    header : '提示',
    					content : html
    				},
    				autoClose : 3000
    			});
    		}
    	});
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
