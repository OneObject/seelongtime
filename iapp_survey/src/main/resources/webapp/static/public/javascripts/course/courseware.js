$(function (){
	page(1);
	
	$("#fileDragArea").click(function (){
		$("#fileImage").click();
	});
});

/**
 * 分页+搜索
 */
function page(i, fieldId) {
	var divId = "list_box";
	
	var order = getOrder(divId, fieldId);
	var max = $("#"+divId+" #page_max").val()
	
	var data = {"page":i, "max":max, "r":Math.random(), "searchContent":$("#searchContent").val(),
			"orderField":order.orderField, "orderDirection":order.orderDirection };
	var url = basepath+"/base/admin/course/courseware/list.list";
	
	//AJAX提示
	loading(divId);
	$("#"+divId).load(encodeURI(url), data, function(ret){
		App.initUniform();
		if($("#block_nav").hasClass("active")){
			block_nav();
		} else{
			list_nav();
		}
		

	    $(".list_item_folder").mouseover(function(){
	    	var obj = $(this).children(".remove_item");
	        myShow($(obj).attr("id"));
	    });
	    
	    $(".list_item_folder").mouseout(function(){
	    	var obj = $(this).children(".remove_item");
	        myHide($(obj).attr("id"));
	    });
	});
	
}
var params = {
	fileInput: $("#fileImage").get(0),
	dragDrop: $("#fileDragArea").get(0),
	upButton: $("#fileSubmit").get(0),
	url: basepath+'/base/admin/course/courseware/savefiles.xhtml',
	filter: function(files) {
		var arrFiles = [];
		for (var i = 0, file; file = files[i]; i++) {
			//(!file.type) &&
			if ( /^.*.zip$/.test(file.name) /* for IE10 */) {
				if (file.size >= 209715200) {
					sureDlg('文件"'+ file.name +'"过大，应小于200M');
//					alert('文件"'+ file.name +'"过大，应小于100M');	
				} else {
					arrFiles.push(file);	
				}			
			} else {
				sureDlg('文件"' + file.name + '"不是zip文件。');
//				alert('文件"' + file.name + '"不是zip文件。');	
			}
		}
		return arrFiles;
	},
	onSelect: function(files) {
		var html = '', i = 0;
		$("#preview_con").html('<div class="upload_loading"></div>');
		var funAppendImage = function() {
			file = files[i];
			if (file) {
				var reader = new FileReader()
				reader.onload = function(e) {
					html = html + '<div class="preview" id="uploadList_'+i+'">'+
										'<span class="imageHolder">'+
											'<img src="'+basepath+'/images/zip.png" style="width:100px;height:100px;"/>'+
											'<span class="uploaded">'+getSubstr(file.name)+'</span>&nbsp;&nbsp;'+
											'<a href="javascript:void(0);" class="upload_delete" title="删除" data-index="'+ i +'">删除</a>'+
										'</span>'+
										'<div class="progressHolder">'+
											'<div class="progress" id="progress_'+i+'" style="background-color:green;width:0;"></div>'+
										'</div>'+
									'</div>'; 
					
					i++;
					funAppendImage();
				}
				reader.readAsDataURL(file);
			} else {
				$("#preview_con").html(html);
				if (html) {
					//删除方法
					$(".upload_delete").click(function() {
						ZXXFILE.funDeleteFile(files[parseInt($(this).attr("data-index"))]);
						return false;	
					});
					//提交按钮显示
					$("#fileSubmit").show();	
				} else {
					//提交按钮隐藏
					$("#fileSubmit").hide();	
				}
			}
		};
		funAppendImage();		
	},
	onDelete: function(file) {
		$("#uploadList_" + file.index).fadeOut();
	},
	onDragOver: function() {
		$(this).addClass("upload_drag_hover");
	},
	onDragLeave: function() {
		$(this).removeClass("upload_drag_hover");
	},
	onProgress: function(file, loaded, total) {
		$("#progress_"+file.index).width((loaded / total * 100).toFixed(2));
	},
	onSuccess: function(file, response) {
		$("#uploadInf").append("<p>上传成功，图片地址是：" + response + "</p>");
	},
	onFailure: function(file) {
		$("#uploadInf").append("<p>图片" + file.name + "上传失败！</p>");	
		$("#uploadImage_" + file.index).css("opacity", 0.2);
	},
	onComplete: function() {
		//提交按钮隐藏
		$("#fileSubmit").hide();
		//file控件value置空
		$("#fileImage").val("");
		$("#preview_con").val("");
		$("#uploadInf").append("<p>当前图片全部上传完毕，可继续添加上传。</p>");
		page(1);
	}
};
ZXXFILE = $.extend(ZXXFILE, params);
ZXXFILE.init();

/*展示列表切换展示效果*/
function block_nav(){
	myShow("block_content");
	myHide("list_content");
	$('#block_nav').addClass("active");
	$('#list_nav').removeClass("active");
}

function list_nav(){
	myShow("list_content");
	myHide("block_content");
	$('#list_nav').addClass("active");
	$('#block_nav').removeClass("active");
}

/**
 * 单个删除
 * @param id
 */
function deleteSingle(id){
	var tempFn = function (){
    	$.post(basepath+"/base/admin/course/courseware/delete.xhtml", {ids:id }, function (ret){
    		if(ret.flag){
    			myAutoHideDialog(ret.message, "success", function(){page(1); });
    		} else{
//				var html="<div style='width:400px;text-align:center;'>"+ret.message;
				var failNames = "";
				for(var i=0;i<ret.failList.length;i++){
					var s = ret.failList[i];
					if(i!=ret.failList.length-1){
						failNames+= $("#name_"+s).text()+"<br>";
					} else{
						failNames+= $("#name_"+s).text();
					}
				}
//				html += failNames+"</div>";
				mySureDialog(ret.message + failNames);
    		}
    	});
	}
	confirmDlg("确定要删除吗？", tempFn);
}

/**
 * 批量删除
 */
function deleteGroup(){
	var items = $("input[name='ids']:checked");
	var tempFn = function (){
		$.post(basepath+"/base/admin/course/courseware/delete.xhtml", $.param(items), function (ret){
			if(ret.flag){
				autoDlg(ret.message, "success", function(){page(1); });
				/*var html="<div style='width:300px;text-align:center;'>"+ret.message+"</div>";
				easyDialog.open({
					container : {
					    header : '提示',
						content : html
					},
					autoClose : success_time,
					callback : function(){
						page(1);
					}
				});*/
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
 * 返回列表页
 */
function backToList(){
	window.location.href = basepath + "/base/admin/course/course/course.xhtml";
}