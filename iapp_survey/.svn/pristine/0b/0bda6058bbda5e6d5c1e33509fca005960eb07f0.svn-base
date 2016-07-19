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
	var url = basepath+"/base/admin/itest/itemblank/list.list";
	$("#"+divId).load(encodeURI(url), data, function(){
		App.initUniform();
	});
}

/**添加题库*/
function addItemblank(){
	removeError();
	$("#dialog_title").text("添加题库");
	$("#btn_con .btn").hide();
	$("#btn_add").show();
	$("#btn_cancel").show();
	
	$("#name").val("");
	$("#content").val("");
	$("#blankid").val("");

	$("#name").removeAttr("readonly");
	$("#content").removeAttr("readonly");
	
	easyDialog.open({
		container : 'dialogbank',
		fixed : false
	});
}

/** 下载模板 */
function downloadTemplate(){
	window.location.href = basepath+"/modelfile/试题导入模板.xls"
}

/**
 * 添加题库提交
 */
function submit_add(){
	if(!nameValidate() || !v_content()){
		return;
	}
	$.post(basepath+"/base/admin/itest/itemblank/add.xhtml", {"name":$("#name").val(), "content":$("#content").val()}, function (ret){
		var html="<div style='width:300px;text-align:center;'>"+ret.message+"</div>";
		if(ret.flag){
			easyDialog.open({
				container : {
					header : '提示',
					content : html,
				},
				autoClose : success_time,
				callback : function(){page(1);}
			});
		} else{
			easyDialog.open({
				container : {
				    header : '提示',
					content : html
					,yesFn : function (){
						return true;
					}
				}
//				,autoClose : fail_msg_time
			});
		}
	});
}

/**
 * 修改
 */
function updateItemblank(name, content, id){
	removeError();
	$("#dialog_title").text("修改题库");
	$("#btn_con .btn").hide();
	$("#btn_update").show();
	$("#btn_cancel").show();
	
	$("#name").val(name);
	$("#content").val(content);
	$("#blankid").val(id);

	$("#name").removeAttr("readonly");
	$("#content").removeAttr("readonly");
	
	  easyDialog.open({
		  container : 'dialogbank',
		  fixed : false
		});
}

/**
 * 修改
 */
function submit_update(){
	if(!nameValidate() || !v_content()){
		return;
	}
	$.post(basepath+"/base/admin/itest/itemblank/update.xhtml", {"name":$("#name").val(), "content":$("#content").val(), "blankid":$("#blankid").val()}, function (ret){
		var html="<div style='width:300px;text-align:center;'>"+ret.message+"</div>";
		if(ret.flag){
			easyDialog.open({
				container : {
					header : '提示',
					content : html,
				},
				autoClose : success_time,
				callback : function(){page(1);}
			});
		} else{
			easyDialog.open({
				container : {
				    header : '提示',
					content : html
					,yesFn : function (){
						return true;
					}
				}
//				,autoClose : fail_msg_time
			});
		}
	});
}

/**
 * 查看详情
 */
function detailItemblank(name, content, id){
	$("#dialog_title").text("题库信息");
	$("#btn_con .btn").hide();
	$("#btn_close").show();

	$("#name").val(name);
	$("#content").val(content);
	$("#blankid").val(id);
	
	$("#name").attr("readonly", "readonly");
	$("#content").attr("readonly", "readonly");
	  easyDialog.open({
		  container : 'dialogbank',
		  fixed : false
		});
}

/**
 * 输入验证
 * @returns {Boolean}
 */
function nameValidate(){
	if(isBlank($("#name").val())){
		addError("name");
		return false;
	} else{
		removeError("name");
		return true;
	}
}
function v_content(){
	var max = $("#maxLength").text();
	if($("#content").val().length > max){
		addError("content");
		return false;
	} else{
		removeError("content");
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

/**
 * 添加试题
 */
function addQuestion(id){
	window.location.href = basepath+"/base/admin/itest/testquestion/add.xhtml?blankid="+id;
}

/**
 * 导入试题
 */
function importQuestion(id){
	$("#openfile").click();
	$("#openfile").change(function (){
		$("#blankid").val(id);
		 easyDialog.open({
   		  container :'loading_img',
   		  fixed : false,
   		  overlay:true
   		});
		$("#importForm")[0].submit();
		$("#import_"+id).attr("onclick", "javascript:void(0);");
		$("#blankid").val("");
	});
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
function removeError(){
	$('.error-box').removeClass('has-error');
	$('#tip_name').addClass('hidden');

}























