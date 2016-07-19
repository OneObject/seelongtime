/*
$(function(){
	$("#fileDragArea").dblclick(function (){
		$("#fileImage").click();
	});
});
*/

/**
 * 返回列表页
 */
function backToList(){
	window.location.href = basepath + "/base/admin/course/course/course.xhtml";
}

//ztree初始化
var setting = {
	data: {
		simpleData: {
			enable: true
		}
	}
};
function setFontCss() {
	return {color:"#000000",size:"24px",height: "30px",family:"微软雅黑"};
};

/** 选择分类 */
var settingclick = {
	view: {
		showLine: false,
		fontCss: setFontCss
	},
	data: {
		simpleData: {
			enable: true
		}
		,key: {
			title: "title"
		}
	}
};
//设置字体样式
function setFontCss() {
	return {color:"#000000",size:"14px",height: "28px",family:"微软雅黑"};
};
function choose_category(type){
	var url = basepath+"/base/admin/course/coursecategory/getcategorytree.xhtml";
	$.ajax({
		url:url,
		type:"POST",
		data:{"treeId":$("#categoryId").val(), "type":type},//,"rootid":"domain_-1","domain":"-1"
		success:function(data){
			zdata = data;
			var str='<div id="dialog_bumen" style="width:350px; height:300px;overflow-y: auto;"><div class="zTreeDemoBackground"><ul id="treeDemo" class="ztree"></ul></div></div>';

			if(type=="1"){
				easyDialog.open({
					  container : {
						    header : '选择分类',
						    content :str,
						    yesFn : sureCategory,
						    noFn : true
						  },
					  fixed : false
					  , callback : v_categoryId
					});
				$.fn.zTree.init($("#treeDemo"), settingclick, zdata);
				 $("#treeDemo").find("a[onclick='true']").click();
			}
			else{
				easyDialog.open({
					  container : {
						    header : '选择分类',
						    content :str,
						    yesFn : btnMulti,
						    noFn : true
						  },
					  fixed : false
					  , callback : v_categoryId
					});
				$.fn.zTree.init($("#treeDemo"), setting, zdata);
			}
		}
	});
	
	
	var orgIdValidate_calback = function(){
		orgIdValidate();
	}
}
function sureCategory(){
	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	var selectNodes = treeObj.getSelectedNodes();
	$("#categoryId").val(selectNodes[0].id);
	$("#category_name").val(selectNodes[0].name);
}


/** 选择课件*/
function choose_cousewear(){
	easyDialog.open({
		container : 'dialogBank',
		fixed : false
		,callback : function (){v_coursewareId();}
	});
}

/** 显示元素（针对iapp中） */
function myShow(id,id1){
	$("#"+id).removeClass("hidden");
	$("#"+id1).removeClass("hidden");
}

/** 隐藏元素（针对iapp中） */
function myHide(id,id1){
	$("#"+id).addClass("hidden");
	$("#"+id1).addClass("hidden");
	//$("#supportmobile1").attr("checked", "checked");
	//$("#supportmobileo").attr("checked", "");
	
}

/** 隐藏元素（针对iapp中） */
function mySpecial(id,id1){
	$("#"+id).addClass("hidden");
	$("#"+id1).removeClass("hidden");
}

/**
 * 选择课件
 * 分页+搜索
 */
function pageCourseware(i, fieldId) {
	var divId = "table_list";
	
	var order = getOrder(divId, fieldId);
	var max = $("#"+divId+" #page_max").val();
	var type = $('input[name="type"]:checked').val();
	var data = {"page":i, "max":max, "r":Math.random(), "searchContent":$("#searchContent").val(), 
			"coursewareId":$("#coursewareId").val(),"name":$("#searchContent").val(),
			"orderField":order.orderField, "orderDirection":order.orderDirection };
	
	var url = basepath+"/base/admin/course/courseware/listforaddcourse.list";
	if(type == 3){
		url = basepath+"/base/admin/ivideo//listforaddcourse.list";
	}
	
	$("#"+divId).load(encodeURI(url), data, function(ret){
		choose_cousewear();
		/*
		 * 选中状态效果
		 * */
		$("#list").find("li").each(function(){
			$(this).click(function(){
				$("#list").find("li").find("span[class='icon-check checked']").remove();
				$(this).append('<span class="icon-check checked"></span>');
				
				var coursewareId = $(this).attr("id");
				var name = $("#name_"+coursewareId).text();
				$("#coursewareId").val(coursewareId);
				$("#courseware_name").val(name);
			});
		});
	});
}

	
function sureCousewear(){
	var ids = $("input[name='ids']:checked");
	if(ids.length == 0){
		easyDialog.close();
		return ;
	}
	var id = $(ids[0]).val();
	$("#coursewareId").val(id);
	$("#courseware_name").val($("#name_"+id).val());
	$("#path").val($("#path_"+id).val());
	easyDialog.close();
}

/** 验证分类 */
function v_categoryId(){
	var id = "categoryId";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(isBlank(value)){
		obj.focus();
		addError(id);
		return false;
	}
	removeError(id);
	return true;
}

/** 验证名称 */
function v_name(){
	var id = "name";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(isBlank(value)){
		obj.focus();
		addError(id);
		return false;
	}
	removeError(id);
	return true;
}

/** 验证编号 */
function v_courseNO(id, conSelf){
	var id = "courseNO";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	var s = false;
	if(numberLetterCheck(value)){
		dwr.engine.setAsync(false);
		DWRService.uniqueValidate("course", "courseNO", value, id, conSelf, true, function (ret){
			s = ret;
		});
		dwr.engine.setAsync(true);
		if(s){
			show1Hide2(id);
			removeError(id);
			return s;
		} else{
			show2Hide1(id);
			addError(id);
			obj.focus();
			return s;
		}
	} else{
		show1Hide2(id);
		addError(id);
		obj.focus();
		return s;
	}
}

/** 验证课件 */
function v_coursewareId(){
	var id = "coursewareId";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(isBlank(value)){
		obj.focus();
		addError(id);
		return false;
	}
	removeError(id);
	return true;
}

/** 验证课件首页 */
function v_startPage(){
	var id = "startPage";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(isBlank(value)){
		obj.focus();
		addError(id);
		return false;
	}
	if(!/^[\w-]+\.(html|htm|xhtml)$/.test(value)){
		obj.focus();
		addError(id);
		return false;
	}
	removeError(id);
	return true;
}

/** 验证时长 */
function v_length(){
	var id = "length";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(isBlank(value)){
		removeError(id);
		return true;
	}
	if(zeroIntCheck(value)){
		removeError(id);
		return true;
	}
	obj.focus();
	addError(id);
	return false;
}

/** 验证分数 */
function v_score(){
	var id = "score";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(isBlank(value)){
		removeError(id);
		return true;
	}
	if(zeroIntCheck(value)){
		var score = parseInt(value);
		if(0<=score && score<=100){
			removeError(id);
			return true;
		}
	}
	obj.focus();
	addError(id);
	return false;
}

/** 验证有效期 */
/*function v_validityDate(){
	var id = "validityDate";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(isBlank(value)){
		obj.focus();
		addError(id);
		return false;
	}
	removeError(id);
	return true;
}*/

/** 验证简介 */
function v_descript(){
	var id = "descript";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(value.length > 3000){
		obj.focus();
		addError(id);
		return false;
	}
	removeError(id);
	return true;
}

/** 验证备注 */
function v_remark(){
	var id = "remark";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(value.length>255){
		obj.focus();
		addError(id);
		return false;
	}
	removeError(id);
	return true;
}

/** 验证增加 */
function validateAdd(){
	if(!v_categoryId() || !v_name() || !v_courseNO("", false) || !v_coursewareId() || !v_length() || !v_score() || !v_descript() || !v_remark()){
		return false;
	}
	if($("input[name='type']").val() == 1){
		if(!v_startPage()){
			return false;
		}
	}

	$("#subButton").attr("onclick", "");
	
	var form = document.getElementById("form_sample_1");
	var xhr = new XMLHttpRequest();
	xhr.open('post', $(form).attr("action"), true);
	
	var fd = new FormData(form);
	xhr.onreadystatechange = function(e) {
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				var ret = $.parseJSON(xhr.responseText);
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
	    			var html="<div style='width:300px;text-align:center;'>"+ret.message+"</div>";
	    			easyDialog.open({
	    				container : {
	    				    header : '提示',
	    					content : html
	    					,yesFn : function (){easyDialog.close(); }
	    				}
	    				,callback : function(){
	    					$("#subButton").attr("onclick", "validateAdd()");
    					}
	    			});
				}
			} else{
    			var html="<div style='width:300px;text-align:center;'>请求出错！</div>";
    			easyDialog.open({
    				container : {
    				    header : '提示',
    					content : html
    					,yesFn : function (){easyDialog.close(); }
    				}
    				,callback : function(){
    					$("#subButton").attr("onclick", "validateAdd()");
					}
    			});
			}
			xhr = null;
		}
	};
	xhr.send(fd);
}

/** 验证修改 */
function validateUpdate(){
	if(!v_categoryId() || !v_name() || !v_length() || !v_score() || !v_descript() || !v_remark()){
		return false;
	}
	if($("input[name='type']").val() == 1){
		if(!v_startPage()){
			return false;
		}
	}

	$("#subButton").attr("onclick", "");
	
	var form = document.getElementById("form_sample_2");
	var xhr = new XMLHttpRequest();
	xhr.open('post', $(form).attr("action"), true);
	
	var fd = new FormData(form);
	xhr.onreadystatechange = function(e) {
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				var ret = $.parseJSON(xhr.responseText);
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
	    			var html="<div style='width:300px;text-align:center;'>"+ret.message+"</div>";
	    			easyDialog.open({
	    				container : {
	    				    header : '提示',
	    					content : html
	    					,yesFn : function (){easyDialog.close(); }
	    				}
	    				,callback : function(){
	    					$("#subButton").attr("onclick", "validateAdd()");
    					}
	    			});
				}
			} else{
    			var html="<div style='width:300px;text-align:center;'>请求出错！</div>";
    			easyDialog.open({
    				container : {
    				    header : '提示',
    					content : html
    					,yesFn : function (){easyDialog.close(); }
    				}
    				,callback : function(){
    					$("#subButton").attr("onclick", "validateAdd()");
					}
    			});
			}
			xhr = null;
		}
	};
	xhr.send(fd);
}


/** 上传图片配置 */
/*
var params = {
	fileInput: $("#fileImage").get(0),
	dragDrop: $("#fileDragArea").get(0),
	upButton: null,
	url: '',
	filter: function(files) {
		var arrFiles = [];
		var passfix = new Array("jpg", "gif", "png", "jpeg");
		for (var i = 0, file; file = files[i]; i++) {
			var fix = file.name.substring(file.name.lastIndexOf('.')+1, file.name.length).toLowerCase();
			var sign = false;
			for(var i=0;i<passfix.length;i++){
				if(passfix[i]==fix){
					sign=true;
					break;
				}
			}
			if (sign) {
				if (file.size >= 1048576) {
					mySureDialog('文件"'+ file.name +'"过大，应小于1M');
				} else{
					arrFiles = [];
					arrFiles.push(file);
				}			
			} else {
				mySureDialog('文件"' + file.name + '"格式不正确 。');
			}
		}
		return arrFiles;
	},
	onSelect: function(files) {
		if(files.length >= 1){
			files = files.slice(files.length-1, files.length);
			$("#isChooseLogo").val(true);
			$("#imgDetail").hide();
		}
		var html = '', i = 0;
		$("#preview_con").html('<div class="upload_loading"></div>');
		var funAppendImage = function() {
			file = files[i];
			if (file) {
				var reader = new FileReader()
				reader.onload = function(e) {
					html = html + '<div id="uploadList_'+ i +'" class="upload_append_list"><p><strong>' + getSubstr(file.name) + '</strong>'+ 
							'&nbsp;&nbsp;&nbsp;<a href="javascript:" class="upload_delete" title="删除" data-index="'+ i +'">删除</a><br />' +
							'<img id="uploadImage_' + i + '" src="' + e.target.result + '" class="upload_image"  style="width:117px; height:100px;" /></p>'+ 
							'<span id="uploadProgress_' + i + '" class="upload_progress"></span>' +
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
						if(files.length == 0){
							$("#isChooseLogo").val(false);
						}
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
	}
};

*/
//ZXXFILE = $.extend(ZXXFILE, params);
//ZXXFILE.init();

/** 添加错误信息 */
function addError(id){
	$("#con_"+id).addClass("has-error").focus();
//	myShow("tip_"+id);
//	obj.focus();
}
function removeError(id){
	$("#con_"+id).removeClass("has-error");
//	myHide("tip_"+id);
}
function show1Hide2(id){
	$("#tip_"+id).removeClass("hidden");
	
	$("#tip2_"+id).addClass("hidden");
}
function show2Hide1(id){
	$("#tip2_"+id).removeClass("hidden");
	
	$("#tip_"+id).addClass("hidden");
}

