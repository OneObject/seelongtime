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
	
}
var params = {
	fileInput: $("#fileImage").get(0),
	dragDrop: $("#fileDragArea").get(0),
	upButton: $("#fileSubmit").get(0),
	url: basepath+'/base/admin/mgr/document/add.xhtml',
	filter: function(files) {
		var arrFiles = [];
		for (var i = 0, file; file = files[i]; i++) {
			//(!file.type) &&xls xlsx doc docx ppt pptx pdf 
			if ( /\.doc$|\.docx$|\.xls$|\.xlsx$|\.ppt$|\.pptx$|\.pdf$/.test(file.name)){
				if (file.size >= 104857600) {
					sureDlg('文件"'+ file.name +'"过大，应小于100M');
					$("#fileDragArea").show();
				} else {
					arrFiles.push(file);	
				}			
			} else {
				sureDlg('文件"' + file.name + '"文件格式不匹配');
				$("#fileDragArea").show();
			}
		}
		return arrFiles;
	},
	onSelect: function(files) {
		if(files.length==0){
			$("#fileDragArea").show();
			return;
		}
		var html = '', i = 0;
		$("#preview_con").html('<div class="upload_loading"></div>');
		var funAppendImage = function() {
			file = files[i];
			if (file) {
				var reader = new FileReader()
				reader.onload = function(e) {
					html = html + '<div class="preview" id="uploadList_'+i+'">'+
										'<span class="imageHolder">'+
											'<img src="'+basepath+'/images/file.png" style="width:100px;height:100px;"/>'+
											'<span class="uploaded">'+getSubstr(file.name)+'</span>&nbsp;&nbsp;'+
											'<a href="javascript:void(0);" class="upload_delete" title="删除" data-index="'+ i +'">删除</a>'+
										'</span>'+
										'<div class="progressHolder">'+
											'<div class="progress" id="progress_'+i+'" style="background-color:green;width:0;text-align:center;"></div>'+
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
						$("#fileDragArea").show();
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
		//$("#fileDragArea").hide();上传加号按钮隐藏
	},
	onDelete: function(file) {
		$("#fileImage").val("");
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
		$("#progress_"+file.index).html(parseInt(loaded / total * 100)+'%');
	},
	onSuccess: function(file, response) {
		$("#uploadInf").append("<p>上传成功，图片地址是：" + response + "</p>");
	},
	onFailure: function(file) {
		$("#uploadInf").append("<p>图片" + file.name + "上传失败！</p>");	
		$("#uploadImage_" + file.index).css("opacity", 0.2);
		showMsgDialog("上传失败请稍后尝试！");
	},
	onComplete: function() {
		//提交按钮隐藏
		$("#fileSubmit").hide();
		//file控件value置空
		$("#fileImage").val("");
		$("#preview_con").val("");
		$("#uploadInf").append("<p>当前图片全部上传完毕，可继续添加上传。</p>");
		showMsgDialog("上传成功！");
		backToList();
	}
};
ZXXFILE = $.extend(ZXXFILE, params);
ZXXFILE.init();

function showMsgDialog(content){
	easyDialog.open({
        container : {
            header : '提示',
            content : '<div style="background-color: #ffffff;width:320px;height:60px;text-align:center;">'+content+'</div>'
        },
        autoClose:2000
    });
}

/**
 * 返回列表页
 */
function backToList(){
	window.location.href = basepath + "/base/admin/mgr/document/index.xhtml";
}