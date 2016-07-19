$(function (){
	page(1);
});

/**
 * 分页+搜索
 */
function page(i, fieldId) {
	var divId = "table_listu";
	var order = getOrder(divId, fieldId);
	var max = $("#"+divId+" #page_max").val()
	
	//AJAX提示
	loading(divId);
	var data = {"page":i, "max":max, "r":Math.random(), "name":$("#searchContent").val()};
	
	var url = basepath+"/base/admin/course/package/list.list";
	$("#"+divId).load(encodeURI(url), data, function(){
		App.initUniform();
	});
}

var canflush = true;
function doflushVideoStatus(){
	if(canflush){
		canflush = false;
		if(confirm("本次刷新可能比较耗费时间,你确定刷新吗?")){
			$.ajax({
				   type: "POST",
				   url: basepath+"/base/admin/ivideo/doflush.xhtml",
				   success: function(msg){
					   canflush = true;
				       alert("刷新成功!");
				       page(1);
				   }
			});
		}
	}else{
		alert('视频状态刷新中...');
	}
	
}
function deletePackage(id,status){
	var content="";
	
	if(status=="1"){
		content="删除";
	}else{
		content="取消删除";
	}
	
	var tempFn=function(){
		$.post(basepath+"/base/admin/course/package/deletepackage.xhtml", {"id":id}, function (ret){
			if(ret){
    			var html="<div style='width:300px;text-align:center;'>"+content+"成功！</div>";
    			easyDialog.open({
    				container : {
    				    header : '提示',
    					content : html
    				},
    				autoClose : success_time,
    				callback : function(){page(1);}
    			});
    		} else{
				var html="<div style='width:400px;text-align:center;'>"+content+"失败！</div>";
    			easyDialog.open({
    				container : {
    				    header : '提示',
    					content : html
    					,yesFn : function (){
    						return true;
    					}
    				}
    			});
    			return false;
    		}
		});
	}
	var html="<div style='width:300px;height:50px;text-align:center;'>确定要"+content+"吗？</div>";
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
 * 
 * @param id
 */
function doRelease(id,status){
	var content = "";
	
	if(status == "1"){
		content = "删除";
	} else {
		content = "取消删除";
	}
	var tempFn = function (){
    	$.post(basepath+"/base/admin/ivideo/delvideo.xhtml", {"id":id,"isrelease":status }, function (ret){
    		if(ret){
    			var html="<div style='width:300px;text-align:center;'>"+content+"成功！</div>";
    			easyDialog.open({
    				container : {
    				    header : '提示',
    					content : html
    				},
    				autoClose : success_time,
    				callback : function(){page(1);}
    			});
    		} else{
				var html="<div style='width:400px;text-align:center;'>"+content+"失败！</div>";
    			easyDialog.open({
    				container : {
    				    header : '提示',
    					content : html
    					,yesFn : function (){
    						return true;
    					}
    				}
    			});
    			return false;
    		}
    	});
	}
	
	var html="<div style='width:300px;height:50px;text-align:center;'>确定要"+content+"吗？</div>";
	easyDialog.open({
		container : {
		    header : '提示',
		    content : html,
		    yesFn : tempFn,
		    noFn : true
		}
	});
}

function viewEntity(){
	window.location.href=basepath+"/base/admin/course/package/view.xhtml";
}



/** 添加 */
function insertEntity(){
	var categoryId=$("#categoryId").val();
	var packageid=$("#packageid").val();
	var name=$("#name").val();
	var issupport=$("input[name='supportmobile']:checked").val();
	var qiniuHash=$("#qiniuHash").val();
	var descript=$("#descript").val();
	if(name==null || name==""){
		alert("名称不能为空");
		return;
	}
	if(qiniuHash==null || qiniuHash==""){
		alert("封面图片不能为空");
		return;
	}
	var param="categoryId="+categoryId+"&name="+name+"&issupport="+issupport+"&qiniuHash="+qiniuHash+"&descript="+descript+"&packageid="+packageid;
	$.ajax({
		   type: "POST",
		   url: basepath+"/base/admin/course/package/add.xhtml",
		   data: param,
		   success: function(msg){
			   if(msg.isok=="true"){
                  window.location.href=basepath+"/base/admin/course/package/viewlinkcourse.xhtml?packageid="+msg.packageid;
			   }else{
				   alert("系列创建失败");
			   }
		   }
		});
}

/** 详情 */
function detailEntity(id){
	window.location.href = basepath+"/base/admin/course/package/detail.xhtml?id="+id;
}

/** 修改 */
function updateEntity(id){
	window.location.href = basepath+"/base/admin/course/package/update.xhtml?id="+id;
}

/**
 * 返回列表页
 */
function backToList(){
	window.location.href = basepath + "/base/admin/course/package/index.xhtml";
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
    	$.post(basepath+"/base/admin/ivideo/alreadyupload.list", {ids:id }, function (ret){
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
