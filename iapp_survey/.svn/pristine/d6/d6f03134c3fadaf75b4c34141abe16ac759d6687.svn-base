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
	loading("table_list");
	var data = {"page":i, "max":max, "r":Math.random(), "searchContent":$("#searchContent").val(),
			"startTime":$("#startTime").val(), "endTime":$("#endTime").val(), 
			"releaseStatus":$("#releaseStatus").val(), 
			"orderField":order.orderField, "orderDirection":order.orderDirection };
	
	var url = basepath+"/base/admin/course/course/listforrelease.list";
	$("#"+divId).load(encodeURI(url), data, function(){
		App.initUniform();
	});
}

/**
 * 单个发布/取消发布
 * @param id
 */
function updateReleaseStatusSingle(id, status){
	var msg = "";
	if(status == 1){
		msg = "确定要发布吗？";
	} else{
		msg = "确定要取消发布吗？";
	}
	var tempFn = function (){
    	$.post(basepath+"/base/admin/course/course/updatereleasestatus.xhtml", {"ids":id, "status":status }, function (ret){
    		if(ret.flag){
    			var html="<div style='width:300px;text-align:center;'>"+ret.message+"</div>";
    			easyDialog.open({
    				container : {
    				    header : '提示',
    					content : html
    				},
    				autoClose : success_time,
    				callback : function(){page(1);}
    			});
    		} else{
    			mySureDialog(ret.message);
    		}
    	});
	}
	var html="<div style='width:300px;height:50px;text-align:center;'>"+msg+"</div>";
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
 * 批量发布/取消发布
 */
function updateReleaseStatus(status){
	var msg = "";
	var filter = 1-status;
	var ids = $("input[name='ids'][alt="+filter+"]:checked")
	if(status == 1){
		msg = "确定要发布"+ids.length+"门课程吗";
	} else{
		msg = "确定要取消发布"+ids.length+"门课程吗";
	}
	
	$("#status").val(status);
	var items = $("input[name='ids']:checked, #status");
	var tempFn = function (){
		$.post(basepath+"/base/admin/course/course/updatereleasestatus.xhtml", $.param(items), function (ret){
			if(ret.flag){
				var html="<div style='width:300px;text-align:center;'>"+ret.message+"</div>";
				easyDialog.open({
					container : {
					    header : '提示',
						content : html
					},
					autoClose : success_time,
					callback : function(){
						page(1);
					}
				});
			}
			else{
				var html="<div style='width:400px;text-align:center;'>"+ret.message;
				var failNames = "";
				for(var i=0;i<ret.failList.length;i++){
					var s = ret.failList[i];
					if(i!=ret.failList.length-1){
						failNames+= $("#name_"+s).text()+"<br>";
					} else{
						failNames+= $("#name_"+s).text();
					}
				}
				html += failNames+"</div>";
				easyDialog.open({
    				container : {
    				    header : '提示',
    					content : html
    					,yesFn : function (){
    						if(ret.sucNO > 0){
    							page(1);
    						}
    						return true;
    					}
    				}
//    				,autoClose : fail_msg_time
				});
			}
		});
	}
	
	if(ids.length == 0){
		var html="<div style='width:300px;text-align:center;'>您没有选中任何记录或是你选中的记录都已经发布！</div>";
		easyDialog.open({
			container : {
			    header : '提示',
				content : html
			},
			autoClose : success_time
		});
	} else{
		var html="<div style='width:300px;height:50px;text-align:center;'>"+msg+"</div>";
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























