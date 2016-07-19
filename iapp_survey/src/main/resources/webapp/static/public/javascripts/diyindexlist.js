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
			"searchContent":$("#searchContent").val() };
	var url = basepath+"/base/admin/diyindex/list.list";
	$("#"+divId).load(encodeURI(url), data, function(){
		App.initUniform();
	});
}


function addDiyIndex(){
	window.location.href=basepath+"/base/admin/diyindex/edit.xhtml";
}
function update(id){
	window.location.href=basepath+"/base/admin/diyindex/edit.xhtml?id="+id;
}

function deleteEntity(id){
	var tempFn = function (){
		$.ajax({
			type:"POST",
	   	 	url:basepath+"/base/admin/diyindex/delete.json",
	   	 	data:{id:id},
	   	 	success:function(data){
	   	 		page(1);
	   	 	}
		});
	}
	var html="<div style='width:300px;height:50px;text-align:center;'>你确定要删除吗！</div>";
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
 * 单个删除
 * @param id
 */
function deleteSingle(id){
	var tempFn = function (){
    	$.post(basepath+"/base/admin/itest/itemblank/delete.xhtml", {ids:id }, function (ret){
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
				var html="<div style='width:400px;text-align:center;'>"+ret.message+"</div>";
				/*var failNames = "";
				for(var i=0;i<ret.failList.length;i++){
					var s = ret.failList[i];
					if(i!=ret.failList.length-1){
						failNames+= $("#name_"+s).text()+"<br>";
					} else{
						failNames+= $("#name_"+s).text();
					}
				}
				html += failNames+"</div>";*/
    			easyDialog.open({
    				container : {
    				    header : '提示',
    					content : html
    					,yesFn : function (){
    						return true;
    					}
    				}
//    				,autoClose : fail_msg_time
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
 * 批量删除
 */
function deleteGroup(){
	var items = $("input[name='ids']:checked");
	var tempFn = function (){
		$.post(basepath+"/base/admin/itest/itemblank/delete.xhtml", $.param(items), function (ret){
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
				if(items.length > 1){
					for(var i=0;i<ret.failList.length;i++){
						var s = ret.failList[i];
						if(i!=ret.failList.length-1){
							failNames+= $("#name_"+s).text()+"<br>";
						} else{
							failNames+= $("#name_"+s).text();
						}
					}
				}
				html += failNames+"</div>";
				easyDialog.open({
					container : {
					    header : '提示',
						content : html
						,yesFn : function (){
							return true;
						}
					},
//					autoClose : fail_msg_time,
					callback : function(){
						if(ret.sucNO > 0){
							page(1);
						}
					}
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
			autoClose : warn_time
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















