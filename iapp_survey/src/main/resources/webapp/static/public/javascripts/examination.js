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
	//输入考试名进行搜索
	var content = $("#searchContent").val();
	if("输入考试名进行搜索" == $("#searchContent").val()){
		content ="";
	}
	//AJAX提示
//	loading(divId);
	var data = {"page":i, "max":max, "r":Math.random(), "searchContent":content,
			"status":$("#status").val(), 
			"orderField":order.orderField, "orderDirection":order.orderDirection };
	var url = basepath+"/base/admin/itest/examination/list.list";
	$("#"+divId).load(encodeURI(url), data, function(){
		App.initUniform();//加载复选框样式
	});
	
}

/** 添加 */
function insertEntity(){
	//window.location.href = basepath+"/base/admin/itest/examination/add.xhtml";
	window.location.href = basepath+"/mgr/itest/exam/step1.xhtml";
}

/** 详情 */
function detailEntity(id){
	window.location.href = basepath+"/base/admin/itest/examination/detail.xhtml?id="+id;
}

/** 修改 */
function updateEntity(id){
	//window.location.href = basepath+"/base/admin/itest/examination/update.xhtml?id="+id;
	window.location.href = basepath+"/mgr/itest/exam/step1.xhtml?id="+id;
}

/** 发布 */
function release(id){
	var tempFn = function(){
		$.get(basepath+"/base/admin/itest/examination/release.xhtml?id="+id, function(ret){
			if(ret.flag){
    			var html="<div style='width:400px;text-align:center;'>"+ret.message+"</div>";
    			easyDialog.open({
    				container : {
    				    header : '提示',
    					content : html
    				},
    				autoClose : success_time,
    				callback : page(1)
    			});
    		}
		});
	}

	var html="<div style='width:300px;height:50px;text-align:center;'>确定要发布吗？</div>";
	easyDialog.open({
		container : {
		    header : '提示',
		    content : html,
		    yesFn : tempFn,
		    noFn : true
		}
	});
}

/** 刷新试卷 */
function refreshtestpaper(id){
	var tempFn = function(){
		$.get(basepath+"/base/admin/itest/examination/refreshtestpaper.xhtml?id="+id, function(ret){
			if(ret.flag){
    			var html="<div style='width:300px;text-align:center;'>"+ret.message+"</div>";
    			easyDialog.open({
    				container : {
    				    header : '提示',
    					content : html
    				},
    				autoClose : success_time,
    				callback : page(1)
    			});
    		}
		});
	}

	var html="<div style='width:300px;height:50px;text-align:center;'>确定要刷新试卷吗？</div>";
	easyDialog.open({
		container : {
		    header : '提示',
		    content : html,
		    yesFn : tempFn,
		    noFn : true
		}
	});
}

/** 取消发布 */
function cancelrelease(id){
	var tempFn = function(){
		$.get(basepath+"/base/admin/itest/examination/cancelrelease.xhtml?id="+id, function(ret){
			if(ret.flag){
    			var html="<div style='width:300px;text-align:center;'>"+ret.message+"</div>";
    			easyDialog.open({
    				container : {
    				    header : '提示',
    					content : html
    				},
    				autoClose : success_time,
    				callback : page(1)
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
//    				,autoClose : fail_msg_time
    			});
			}
		});
	}

	var html="<div style='width:300px;height:50px;text-align:center;'>确定要取消发布吗？</div>";
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
 * 返回列表页
 */
function backToList(){
	window.location.href = basepath + "/base/admin/itest/examination/examination.xhtml";
}

/**
 * 详情页中删除
 * @param id
 */
function deleteSingleInDetail(id){
	var tempFn = function (){
    	$.post(basepath+"/base/admin/itest/examination/delete.xhtml", {ids:id }, function (ret){
    		if(ret.flag){
    			var html="<div style='width:300px;text-align:center;'>"+ret.message+"</div>";
    			easyDialog.open({
    				container : {
    				    header : '提示',
    					content : html
    				},
    				autoClose : success_time,
    				callback : function(){window.location.href = basepath+"/base/admin/itest/examination/examination.xhtml";}
    			});
    		} else{
				var html="<div style='width:400px;text-align:center;'>"+ret.message;
				var failNames = "";
				/*for(var i=0;i<ret.failList.length;i++){
					var s = ret.failList[i];
					if(i!=ret.failList.length-1){
						failNames+= $("#name_"+s).text()+"<br>";
					} else{
						failNames+= $("#name_"+s).text();
					}
				}*/
				html += failNames+"</div>";
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
 * 单个删除
 * @param id
 */
function deleteSingle(id){
	var tempFn = function (){
    	$.post(basepath+"/base/admin/itest/examination/delete.xhtml", {ids:id }, function (ret){
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
				var html="<div style='width:400px;text-align:center;'>"+ret.message;
				var failNames = "";
				/*for(var i=0;i<ret.failList.length;i++){
					var s = ret.failList[i];
					if(i!=ret.failList.length-1){
						failNames+= $("#name_"+s).text()+"<br>";
					} else{
						failNames+= $("#name_"+s).text();
					}
				}*/
				html += failNames+"</div>";
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
		$.post(basepath+"/base/admin/itest/examination/delete.xhtml", $.param(items), function (ret){
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
/*考试授权管理*/
function open_accredit(id){
	var html =[];
	html.push('<div style="width:300px;height:100px;background-color:#fff;text-algin:center;">');
	html.push('<div style="width:100%;overflow:hidden;display:block;">');
	html.push('<span class="btn btn-info btn-lg" style="float:left;margin:0px 10px;"><i class="icon-leaf"></i>&nbsp;组织授权</span>');
	html.push('<span class="btn yellow btn-lg" style="float:right;margin:0px 10px;"><i class="icon-user-md"></i>&nbsp;人员授权</span>');
	html.push("</div>");
	html.push('<span class="btn default btn-block"style="clear:both;margin-top:20px;"onclick="easyDialog.close()">取消</span>');
	html.push("</div>");
	easyDialog.open({
		  container : {
		    header : '选择授权方式',
		    content : html.join("")
		  }
		});
}


/**
 * 批量授权
 */
function  authorizeGroup(){
	var items=$("input[name='ids']:checked");
	//没有选中的
	if(items.length<=0){
		var html="<div style='width:300px;text-align:center;'>您还没有选择任意一门考试</div>";
		easyDialog.open({
			container : {
			    header : '提示',
				content : html
			},
			autoClose : success_time,
			callback : function(){
			}
		});
		return;
	}
	
	var ids="";
	
	items.each(function(){
		ids=ids+$(this).val()+",";
	});
	
	
	var url=basepath+"/base/admin/authorize/authorizegroup.xhtml?ids="+ids+"&rcategory=1&scategory=1";
	
	window.open(url,"blank");
}




















