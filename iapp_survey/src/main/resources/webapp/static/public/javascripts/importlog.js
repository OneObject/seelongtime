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
	var data = {"page":i, "max":max, "r":Math.random(),
			"searchContent":$("#searchContent").val(), 
			"orderField":order.orderField, "orderDirection":order.orderDirection };
	var url = basepath+"/base/admin/itest/importlog/list.list";
	$("#"+divId).load(encodeURI(url), data, function(){
//		alert("success");
	});
}

/** 详情 */
function detailItem(id){
	$("#detail_container").load(basepath+"/base/admin/itest/importlog/detail.list", {"id":id});
	var html = $("#dialogbank").html();
	  easyDialog.open({
		  container : 'dialogbank'
//		  follow : 'searchContent',
//		  followX : -20,
//		  followY : 0
//		  ,overlay : true
		  ,fixed : false
	  });
}

/** 查看错误信息 */
function showError(id){
	window.location.href = basepath+"/base/admin/itest/testquestion/import_question_result.xhtml?id="+id;
}

function undoImport(id){
	var tempFn = function (){
    	$.get(basepath+"/base/admin/itest/importlog/undo.xhtml?id="+id, function (ret){
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
    		} else{
    			var html="<div style='width:300px;text-align:center;'>"+ret.message+"</div>";
    			easyDialog.open({
    				container : {
    				    header : '提示',
    					content : html
    					,yesFn : function (){
    						return true;
    					}
    				}
//    				,autoClose : 2000
    			});
    			return false;
    		}
    	});
	}
	var html="<div style='width:300px;height:50px;text-align:center;'>确定要撤销此次导入的试题吗？</div>";
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
 * 导入试题管理
 */
function questionManage(id){
	window.location.href = basepath+"/base/admin/itest/testquestion/testquestion.xhtml?logId="+id;
}

/**
 * 全部选中
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
	
}























