$(function (){
	if(pageindex != null){
		var divId = "table_list";
		//AJAX提示
		loading(divId);
		var data = {"page":pageindex, "max":pagesize,
				"r":Math.random(), "searchContent":name,
				"startTime":startTime, "endTime":endTime, 
				"releaseStatus":releaseStatus, 
				"orderField":orderField, 
				"orderDirection":orderDirection };
		var url = basepath+"/base/admin/course/course/list.list";
		$("#"+divId).load(encodeURI(url), data, function(){
		});
	} 
	else
	{
		page(1);
	}
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
	var data = {"page":i, "max":max, "r":Math.random(), "searchContent":$("#searchContent").val(),"categoryid":$("#orgId").val(),
			"startTime":$("#startTime").val(), "endTime":$("#endTime").val(), 
			"releaseStatus":$("#releaseStatus").val(), 
			"orderField":order.orderField, "orderDirection":order.orderDirection };
	var url = basepath+"/base/admin/course/course/list.list";
	$("#"+divId).load(encodeURI(url), data, function(){
	});
}

/** 添加 */
function insertEntity(){
	window.location.href = basepath+"/mgr/course/step1.xhtml";
}

/** 详情 */
function detailEntity(id){
	window.location.href = basepath+"/base/admin/course/course/detail.xhtml?id="+id;
}

/** 修改 */
function updateEntity(id){
	window.location.href = basepath+"/mgr/course/step1.xhtml?id="+id;
}

/**
 * 返回列表页
 */
function backToList(){
	var url = "/base/admin/course/course/course.xhtml";
	var from = $("#from").val();
	if(from == "platform"){
		url = "/base/admin/course/course/platform.xhtml";
	}
	window.location.href = basepath + url;
}

/**
 * 查看详情
 */
function detailCourseware(){
	easyDialog.open({
		container : 'dialogbank',
		fixed : false
	});
}

/**
 * 详情页中删除
 * @param id
 */
function deleteSingleInDetail(id){
	var tempFn = function (){
    	$.post(basepath+"/base/admin/course/course/delete.xhtml", {ids:id }, function (ret){
    		if(ret.flag){
    			var html="<div style='width:300px;text-align:center;'>"+ret.message+"</div>";
    			easyDialog.open({
    				container : {
    				    header : '提示',
    					content : html
    				},
    				autoClose : success_time,
    				callback : function(){window.location.href = basepath+"/base/admin/course/course/course.xhtml";}
    			});
    		} else{
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


function dotop(id,index){
	var tempFn = function (){
    	$.post(basepath+"/base/admin/course/course/top.xhtml", {id:id ,index:index}, function (ret){
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
	var msg = "";
	if(index<1){
		msg = "取消";
	}
	var html="<div style='width:300px;height:50px;text-align:center;'>确定要"+msg+"置顶吗？</div>";
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
    	$.post(basepath+"/base/admin/course/course/delete.xhtml", {ids:id }, function (ret){
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
 * 批量授权
 */
function  authorizeGroup(){
	var items=$("input[name='ids']:checked");
	//没有选中的
	if(items.length<=0){
		var html="<div style='width:300px;text-align:center;'>您还没有选择任意一门课程</div>";
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
	
	var url=basepath+"/base/admin/authorize/authorizegroup.xhtml?ids="+ids+"&rcategory=2&scategory=1";
	
	window.open(url,"blank");
}

/**
 * 批量删除
 */
function deleteGroup(){
	var items = $("input[name='ids']:checked");
	var tempFn = function (){
		$.post(basepath+"/base/admin/course/course/delete.xhtml", $.param(items), function (ret){
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
	
	if(items.length == 0){
		var html="<div style='width:300px;text-align:center;'>您没有选中任何记录！</div>";
		easyDialog.open({
			container : {
			    header : '提示',
				content : html
			},
			autoClose : success_time
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



/** 用户选中选择查找课程分类 */
function check_obj(obj, fatherOrgId, id, name, isLeaf){
	$(obj).attr("click", "");
	$("#orgId").val(id);

	page(1);
	var _this = $(obj);
	var org_con = $("#clear_org_con");
	if(!isLeaf){
		org_con.find("li").each(function(){
			$(this).removeClass("item_checked");
		});
		 var html = '<li class="check_item item_checked"  onclick="clearOrg(this,\''+id+'\')"><span >'+name+'</span></li>';
         org_con.append(html); 
         var li_con = $("#li_con");
         $.ajax({
     		type: "POST",
     		url: basepath+"/base/admin/course/course/getChildCourseCategory.json",
     		data: {"id":id},
     		dataType:"json",
     		success: function(data){
     			li_con.find("li").remove();
     			var list = data;
     			for(var i = 0;i < list.length;i++){
     				html='<li class="check_item" onclick="check_obj(this, \''+id+'\', \''+list[i].id+'\',\''+list[i].name+'\' ,'+list[i].isLeaf+')">';
     				html+="<span>"+list[i].name+"</span></li>";
     				li_con.append(html);
     			}
     			
     		}
     		
     	});
		
		
	} else{
		$("#clear_org_con").find("li").each(function(){
			$(this).removeClass("item_checked");
		});
		_this.parent().find("li").removeClass("item_checked");
		_this.addClass("item_checked");
		//$("#clear_org").removeClass("item_checked");
	}
	
}


/** 清空课程分类选择 */
function clearOrg(obj,rootId){
	$(obj).addClass("item_checked");
	var org_con = $("#clear_org_con");
	var li_con = $("#li_con");
	var index = $(obj).index();
	org_con.find("li").each(function(){
		if($(this).index()>index){
			$(this).remove();
		}
	});
	li_con.find("li").each(function(){
		$(this).removeClass("item_checked");
	});
	var html = null;
	$.ajax({
 		type: "POST",
 		url: basepath+"/base/admin/course/course/getChildCourseCategory.json",
 		data: {"id":rootId},
 		dataType:"json",
 		success: function(data){
 			li_con.find("li").remove();
 			var list = data;
 			for(var i = 0;i < list.length;i++){
 				html='<li class="check_item" style="margin-bottom:10px;" onclick="check_obj(this, \''+rootId+'\', \''+list[i].id+'\',\''+list[i].name+'\' ,'+list[i].isLeaf+')">';
 				html+="<span>"+list[i].name+"</span></li>";
 				
 				li_con.append(html);
 			}
 			
 		}
 		
 	});

    getRootChildren(rootId);
}



/** 下拉菜单查找root节点用户，更新课程分类列表*/
function getRootChildren(fatherOrgId){
	var id = fatherOrgId;
	$("#orgId").val(id);
	page(1);

}

















