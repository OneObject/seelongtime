
function openupload() { 
		easyDialog.open({
			container : 'easyDialogWrapper1',
			fixed : false
		});
}

function savestep1(){
	if(checkattachment()&&checktitle()){
		var id = $("#id").val();
		var fileid = $("#fileid").val();
		var cover = $("#cover").val();
		var title = $("#title").val();
		var remark = $("#remark").val();
		
		  $.ajax({
		    	 type:"POST",
		    	 url:basepath+"/base/admin/resource/savestep1.json",
		    	 data:{id:id,resid:fileid,cover:cover,title:title,remark:remark},
		    	 success:function(data){
		    		 if(data!=null ){
		    			 next2(data);
		    		 }else{
		    			 alert("信息添加失败");
		    		 }
		    	 }
		    });
		
	}
}

function next1(id) {
	window.location.href=basepath+"/base/admin/resource/step1.xhtml?id=" + id;
}

function next2(id) {
	window.location.href = basepath + "/base/admin/resource/step2.xhtml?id=" + id;
}

function next3(id) {
	window.location.href = basepath + "/base/admin/resource/step3.xhtml?id=" + id;
}



function savestep2(id) {
	var ischecked = $("#myswitch3").is(':checked');
	var openstatus = 0;
	if(ischecked){
		 openstatus = 1;
	}else{
		 openstatus = 0;
	}
	var id = $("#id").val();
	 $.ajax({
    	 type:"POST",
    	 url:basepath+"/base/admin/resource/savestep2.json",
    	 data:{id:id,openstatus:openstatus},
    	 success:function(data){
    		 if(data!=null ){
    			 next3(data);
    		 }else{
    			 alert("信息添加失败");
    		 }
    	 }
    });
}

function savestep3(release){
	var id = $("#id").val();
	 $.ajax({
    	 type:"POST",
    	 url:basepath+"/base/admin/resource/savestep3.json",
    	 data:{id:id,release:release},
    	 success:function(data){
    		 if(data!=null ){
    			 window.location.href= basepath +"/base/admin/resource/resource.xhtml";
    		 }else{
    			 alert("信息添加失败");
    		 }
    	 }
    });
}

function checkattachment(){
	var id = "fileid";
	var content = $.trim($("#"+id).val());
	if(content==""){
		addError(id);
		return false;
	}else{
		removeError(id);
		return true;
	}
}

function checktitle(){
	var id = "title";
	var title = $.trim($("#"+id).val());
	if(title==""){
		addError(id);
		return false;
	}else{
		removeError(id);
		return true;
	}
}
function addError(id){
	$("#con_"+id).addClass("has-error");
}
function removeError(id){
	$("#con_"+id).removeClass("has-error");
}

/**
 * 修改
 */
function updateItemblank(name, content, id){
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


var params = {
		fileInput : $("#uploadfile").get(0),
		dragDrop : $("#uploadattachment").get(0),
		upButton : $("#fileSubmit").get(0),
		url : basepath + '/base/admin/resource/savefiles.xhtml',
		filter : function(files) {
			var arrFiles = [];
			for ( var i = 0, file; file = files[i]; i++) {
					if (file.size >= 104857600) {
						sureDlg('文件"' + file.name + '"过大，应小于100M');
					} else {
						arrFiles.push(file);
					}
				
			}
			return arrFiles;
		},
		onSelect : function(files) {
			var html = '', i = 0;
			$("#preview_con").html('<div class="upload_loading"></div>');
			var funAppendImage = function() {
				file = files[i];
				if (file) {
					var reader = new FileReader();
					reader.onload = function(e) {
						html = html + '<div class="preview" id="uploadList_' + i
								+ '">';
						html = html + '<span class="imageHolder">';
						html = html
								+ '<img src="'
								+ basepath
								+ '/images/f.png" style="width:40px;height:40px;margin-top:5px;margin-left:5px;"/>';
						html = html + '<span class="uploaded">'
								+ getSubstr(file.name) + '</span>&nbsp;&nbsp;';
						html = html
								+ '<a href="javascript:void(0);" class="upload_delete" title="删除" data-index="'
								+ i + '">删除</a>';
						html = html + '<span id="uploadProgress_' + i
								+ '" style="margin-left:100px;"></span>';
						html = html + '</span></div>';
						i++;
						funAppendImage();
					};
					reader.readAsDataURL(file);
					var body = "";
					body = body
							+ '<tr><td>'
							+ file.name
							+ '</td><td><span class="btn btn-primary btn-sm btn-block" style="display:none;" id="uploadchoose" k="'
							+ file.name
							+ '" t="" onclick="choice(this)">选择</span></td></tr>';
					$("#uploadattachment").html(body);

				} else {
					$("#preview_con").html(html);
					if (html) {
						// 删除方法
						$(".upload_delete").click(
								function() {
									ZXXFILE.funDeleteFile(files[parseInt($(this)
											.attr("data-index"))]);
									return false;
								});
						// 提交按钮显示
						$("#fileSubmit").show();
					} else {
						// 提交按钮隐藏
						$("#fileSubmit").hide();
					}
				}
			};
			funAppendImage();
		},
		onDelete : function(file) {
			$("#uploadfile").val("");
			$("#uploadList_" + file.index).fadeOut();
		},
		onProgress : function(file, loaded, total) {
			$("#fileSubmit").hide();
			var eleProgress = $("#uploadProgress_" + file.index);
			var percent = (loaded / total * 100).toFixed(2) + '%';
			eleProgress.html(percent);
		},
		onSuccess : function(file, response) {
			// 解析出id
			var begin = response.indexOf("id") + 5;
			var end = response.indexOf(",") - 1;
			var id = response.substring(begin, end);	
			$("#uploadattachment #uploadchoose").attr("t", id);
		},
		onFailure : function(file) {
		},
		onComplete : function() {
			// 提交按钮隐藏
			$("#fileSubmit").hide(10000);
			$("#uploadfile").val("");
			$("#uploadchoose").show();
		}
	};
	ZXXFILE = $.extend(ZXXFILE, params);
	ZXXFILE.init();


	function choice(thi) {
		var id = $(thi).attr("t");
		var name = $(thi).attr("k");
		$("#fileid").val(id);
		$("#resname").val(name);
		easyDialog.close();
	}















