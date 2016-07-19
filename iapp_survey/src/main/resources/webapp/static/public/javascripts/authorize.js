$(function (){
	if($("#scategory").val() == 1){
		authUser();
	} else if($("#scategory").val() == 2){
		authOrg();
	}else if($("#scategory").val()==4){
		authJobLevel();
	}else if($("#scategory").val()==5){
		authGroup();
	}
});

/**
 * 已授权用户：分页
 */
function page(i, fieldId) {
	var divId = "table_list";
	
	var order = getOrder(divId, fieldId);
	var max = $("#"+divId+" #page_max").val()
	
	var data = {"page":i, "max":max, "r":Math.random(), "rcategory":$("#rcategory").val(),
			"rid":$("#rid").val(), "scategory":$("#scategory").val(), 
			"orderField":order.orderField, "orderDirection":order.orderDirection };
	var url = basepath+"/base/admin/authorize/detail.list";
	$("#"+divId).load(encodeURI(url), data, function(){
		App.initUniform();//加载复选框样式
	});
}
/**
 * 已授权用户组：分页
 * @param i
 */
function group(i){
	var max=$("#table_list5 #page_max").val();
	
	var data={"currentpage":i,"pagesize":max,"r":Math.random(),"rcategory":$("#rcategory").val(),"rid":$("#rid").val(),"scategory":$("#scategory").val(),"pageFn":"group"};
	
	var url=basepath+"/base/admin/authorize/detail.list";
	
	$("#table_list5").load(encodeURI(url),data,function(){
		App.initUniform();
	});
	
	
}

/** 用户授权 */
function authUser(){
	$("#scategory").val(1); 
	page(1);
}

/** 组织授权 */
function authOrg(){
//	page(1);
	$("#scategory").val(2);
	var data = {"rcategory":$("#rcategory").val(), "rid":$("#rid").val(), "scategory":$("#scategory").val()};
	var url = basepath+"/base/admin/authorize/detail.list";
	$("#table_list3").load(encodeURI(url), data, function(){
	      $.fn.zTree.init($("#all_permission"), setting, zNodes);
	      var treeObj = $.fn.zTree.getZTreeObj("all_permission");
	      treeObj.expandAll(true);
	});
	
}
/**
 * 职级授权
 */
function authJobLevel(){
	$("#scategory").val(4);
	var data={"rcategory":$("#rcategory").val(), "rid":$("#rid").val(), "scategory":$("#scategory").val()};
	var url=basepath+"/base/admin/authorize/detail.list";
	$("#table_list4").load(encodeURI(url),data,function(){
		 $.fn.zTree.init($("#all_permission2"), setting, zNodes2);
	      var treeObj2 = $.fn.zTree.getZTreeObj("all_permission2");
	      treeObj2.expandAll(true);
	});
}
/**
 * 用户组授权
 */
function authGroup(){
	$("#scategory").val(5);
	group(1);
}


/**
 * 未授权用户：分页
 */
function pageUser(i, fieldId) {
//	if(isNotBlank($("#susername").val())){
//		alert($("#susername").val());
//	}
	var divId = "table_list2";
	
	var order = getOrder(divId, fieldId);
	var max = $("#"+divId+" #page_max").val()

	var data = {"page":i, "max":max, "r":Math.random(), "username":$("#susername").val(),"name":$("#name").val(),
			"orgname":$("#orgname").val(),"label":$("#label").val(), "userids":$("#userids").val(), "rcategory":$("#rcategory").val(),
			"rid":$("#rid").val(), "scategory":$("#scategory").val(), 
			"orderField":order.orderField, "orderDirection":order.orderDirection };
	var url = basepath+"/base/admin/authorize/chooseuser.list";
	$("#"+divId).load(encodeURI(url), data, function(){
	});
}


function grouplist(i){
	var pagesize=$("#table_list6 #page_max").val();
	
	var data={"pageFn":"grouplist","currentpage":i,"pagesize":pagesize,"r":Math.random(),"searchcontent":$("#searchcontent").val(),"rcategory":$("#rcategory").val(),"rid":$("#rid").val(), "scategory":$("#scategory").val()};
	
	var url=basepath+"/base/admin/authorize/choosegroup.list";
	
	$("#table_list6").load(encodeURI(url),data,function(){
		
	});
	
}






/** 添加用户弹出框 */
function openAdd(){
	pageUser(1);
	easyDialog.open({
		  container : 'add_member_dialog',
		  fixed : false
		});
}

function addgroup(){
	grouplist(1);
	easyDialog.open({
		  container:'add_member_dialog2',
		  fixed:false
	});
}

/**
 * 单个删除
 * @param id
 */
function deleteSingle(id){
	var items = $("input[name='ids']:checked, #rcategory, #rid, #scategory");
	var tempFn = function (){
    	$.get(basepath+"/base/admin/authorize/delete.xhtml?ids="+id, $.param(items), function (ret){
    		if(ret.flag){
    			myAutoHideDialog(ret.message, "success");
    			if($("#scategory").val()==5){
    				group(1);
    			}else{
    			page(1);
    			}
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

/**
 * 批量删除
 */
function deleteGroup(){
	var items = $("input[name='ids']:checked, #rcategory, #rid, #scategory");
	var iditems = $("input[name='ids']:checked");
	var tempFn = function (){
		$.get(basepath+"/base/admin/authorize/delete.xhtml", $.param(items), function (ret){
			if(ret.flag){
    			myAutoHideDialog(ret.message, "success");
    			if($("#scategory").val()==5){
    			  group(1);	
    			}else{
    			page(1);
    			}
			} else{
    			mySureDialog(ret.message);
    		}
		});
	}
	
	if(iditems.length == 0){
		myAutoHideDialog("没有选中任何记录！", "warn");
	} else{
		var html="<div style='width:300px;height:50px;text-align:center;'>确定要移除"+iditems.length+"条记录吗？</div>";
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
 * 全部选中
 */
function checked_all(obj){
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




















