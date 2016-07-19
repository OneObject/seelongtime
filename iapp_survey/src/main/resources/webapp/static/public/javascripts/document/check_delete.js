/*
 * 单个删除
 */
function deleteSingleInDetail(id){
	var tempFn = function (){
    	$.post(basepath+"/base/admin/mgr/document/delete.json",{ids:id}, function(ret){
    		if(ret.flag){
    			var html="<div style='width:300px;text-align:center;'>删除成功！</div>";
    			easyDialog.open({
    				container : {
    				    header : '提示',
    					content : html
    				},
    				autoClose : 1000,
    				callback :page(1)
    			});
    		} else{
    			var html="<div style='width:300px;text-align:center;'>删除失败 </div>";
    			easyDialog.open({
    				container : {
    				    header : '提示',
    					content : html
    				},
    				autoClose : 1000
    			});
    			return false;
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
/**
 *重新转换 
 */
function changestatus(id){
    	$.post(basepath+"/base/admin/mgr/document/changestatus.json",{"id":id}, function(ret){
    		if(ret){
    			var html="<div style='width:300px;text-align:center;'>操作成功！</div>";
    			easyDialog.open({
    				container : {
    				    header : '提示',
    					content : html
    				},
    				autoClose : 1000,
    				callback :page(1)
    			});
    		} else{
    			var html="<div style='width:300px;text-align:center;'>操作失败 </div>";
    			easyDialog.open({
    				container : {
    				    header : '提示',
    					content : html
    				},
    				autoClose : 1000
    			});
    			return false;
    		}
    	});
}
/*
 * 失败原因
 */
function checkreason(failmsg)
{
	var html="<div style='width:300px;text-align:center;'>"+failmsg+" </div>";
	easyDialog.open({
		container : {
		    header : '提示',
			content : html,
			noFn: true,
			noText : '关闭'
		},
	});	
}





var flag = true;

/**
 * 全部选中
 */
//var flag = true;//没有选中的情况下是true
function checked_all(o){
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

/**
 * 批量删除
 */
function deleteGroup(){
	var items = $("input[name='ids']:checked");
	var tempFn = function (){
		$.post(basepath+"/base/admin/mgr/document/delete.json", $.param(items), function (ret){
			if(ret.flag){
				flag = true;
    			var html="<div style='width:300px;text-align:center;'>删除成功！</div>";
    			easyDialog.open({
					container : {
					    header : '提示',
						content : html
					},
					autoClose : success_time,
					callback : function(){
						flag = true;
						page(1);
					}
				});
			} else{
    			var html="<div style='width:300px;text-align:center;'>删除失败！</div>";
    			easyDialog.open({
    				container : {
    				    header : '提示',
    					content : html
    				},
					autoClose : 1000
				});
			}
		});
	}
	
	if(items.length == 0){
		var html="<div style='width:300px;text-align:center;'>您没有选中任何记录！</div>";
		easyDialog.open({
			container : {
			    header : '提示',
				content : html
			},
			autoClose : 1000
		});
	} else{
		var html="<div style='width:300px;height:50px;text-align:center;'>确定要删除"+items.length+"条记录吗？</div>";
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

