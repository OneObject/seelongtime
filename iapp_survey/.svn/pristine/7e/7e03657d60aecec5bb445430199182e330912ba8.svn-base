
$(function(){
//	initUploadify(0);
//	initUploadify(1);
//	initUploadify(2);
	for(var i = 0 ; i<=count ; i++){
		initUploadify(i);
		if($("#coverPath_"+i).val()!=''){
			$("#image_cover_"+(i)).html("<img style='max-width:100px;max-height:200px;' src = '"+qiniuImageBasePath+$("#coverPath_"+i).val()+coverSuffix+"'>");
			$("#small_prev_"+(i)).show();	
		}
	}
	
});
function initUploadify(idNumber){
	$('#file_upload_'+idNumber).uploadify({
		'formData'     : {
			'token'     : token,
		},
		'fileObjName'  : 'file',
		'buttonText' : '<i class="glyphicon glyphicon-open"></i>上传',
		'buttonClass' : 'upload_access',
		'swf'      : basepath+'/static/ixin/css/uploadify.swf',
		//'uploader' : 'http://up.qiniu.com/',
		'uploader' : uploadurl,
		'onUploadSuccess' : function(file,data,response){
			var result = eval("("+data+")");
			$("#image_cover_"+idNumber).html("<img style='max-width:100px;max-height:200px;' src = '"+qiniuImageBasePath+result.hash+coverSuffix+"'>");
			$("#small_prev_"+idNumber).show();
			//文件长传完成之后，在本地保存一份文件信息的数据
			$('#coverPath_'+idNumber).val(result.hash);
			saveFile(file,result,idNumber);
		}
	});
}
function saveFile(file,result,idNumber){
	var requestBody = new Object();
	requestBody.size = result.size;
	requestBody.mimeType = result.mimeType;
	requestBody.filePath = result.url;
	
	$.ajax({
		type: "POST",
		url:  basepath+"/mgr/fodder/savesourcefile.xhtml",
		data: JSON.stringify(requestBody),
		contentType: "application/json; charset=utf-8",
		success:function(data){
			$('#fileId_'+idNumber).val(data);
		},
		error: function(data){
			alert('保存失败');
		}
	});
	
}
function addOption(){
	count = count+1;
	var currentLastId = $('#vote_options').children().last().attr("id");
	var nextIdNumber = parseInt(currentLastId.substring(currentLastId.lastIndexOf("_")+1))+1;
	var optionsInnerHtml = new Array();
	optionsInnerHtml.push('<br/><br/>');
	optionsInnerHtml.push('<div class="input-group mt5" id="option_'+nextIdNumber+'">');
	optionsInnerHtml.push('<label>图片（比例1:1 推荐大小180*180）</label>');
	optionsInnerHtml.push('	<input type="hidden" id="optionId_'+nextIdNumber+'" value=""/>');
	optionsInnerHtml.push('	<div class="frm_input_box" style="border:1px solid #e5e5e5; padding-top:3px; margin-bottom:6px; padding-bottom:-5px;padding-left:10px;">');
	optionsInnerHtml.push('		<div class="upload_box">');
	optionsInnerHtml.push('			<div class="upload_area">');
	optionsInnerHtml.push('				<input type="file" id="file_upload_'+nextIdNumber+'" />');
	optionsInnerHtml.push('				<ul class="upload_file_box" style="display: none;" id="queue"></ul>');
	optionsInnerHtml.push('			</div>');
	optionsInnerHtml.push('		</div>');
	optionsInnerHtml.push('		<div style="display: none;margin-bottom:20px;" id="small_prev_'+nextIdNumber+'">');
	optionsInnerHtml.push('			<span id="image_cover_'+nextIdNumber+'"></span>');
	optionsInnerHtml.push('			<a class="js_removeCover" href="javascript:void(0);" onclick="deleteCover(\''+nextIdNumber+'\');">删除</a>');
	optionsInnerHtml.push('			<input type="hidden" id="fileId_'+nextIdNumber+'"  value=""/>');
	optionsInnerHtml.push('			<input type="hidden" id="coverPath_'+nextIdNumber+'" value=""/>');
	optionsInnerHtml.push('		</div>');
	optionsInnerHtml.push('		<span class="help-block hidden" id="tip_coverPath_'+nextIdNumber+'" style="color: red;">图片不能为空</span>');
	optionsInnerHtml.push('	</div>');
	optionsInnerHtml.push('<label>标题（字数超过6个时会影响显示效果）</label>');
	optionsInnerHtml.push('<input type="text" class="form-control" id="option_title_'+nextIdNumber+'">');
	
	optionsInnerHtml.push('<label>链接（以http://开头）</label>');
	optionsInnerHtml.push('	<input type="text" class="form-control" id="option_url_'+nextIdNumber+'">');
	optionsInnerHtml.push('	<span class="input-group-btn">');
	optionsInnerHtml.push('		<button class="btn red" type="button"  onclick="removethis(this)"><i class="fa fa-times" style="font-size: 18px;"></i></button>');
	optionsInnerHtml.push('	</span>');
	optionsInnerHtml.push('</div>');
	$('#vote_options').append(optionsInnerHtml.join(''));
	initUploadify(nextIdNumber);
}

function removethis(obj){
	if (count <= 2){
		easyDialog.open({
	        container : {
	            header : '提示',
	            content : '<div style="background-color: #ffffff;width:260px;height:20px;text-align:center;">至少要有两个选项</div>'
	        },
	        autoClose:1200
	    });
		return;
	}
	var currentObj = $(obj).parents(".input-group");
	
	var optionId = $($(obj).parent().parent().children().get(0)).val();
	if(typeof(optionId)!="undefined"&&$.trim(optionId)!=null && $.trim(optionId)!=""){
		$.post(basepath+"/mgr/vote/deletevoteoption.xhtml",{"optionId":optionId},function(){
			currentObj.remove();
		});
	}else{
		currentObj.remove();
	}
	//每执行删除操作一次选项个数减一
	count = count-1;
}



/** 添加错误信息 */
function addError(id){
	$("#con_"+id).addClass("has-error");
	myShow2("#tip_"+id);
}
function removeError(id){
	$("#con_"+id).removeClass("has-error");
	myHide2("#tip_"+id);
}

function v_questionTitle(){
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
function v_option(id){
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


function getRequestOptions(){
	var requestOptions = new Array();
	var optionObjs = $('.input-group');
	
	for(var i=0;i<optionObjs.length;i++){
		var divObj = optionObjs[i];
		var id = divObj.id;
		var index = id.substring(7,id.length);
		var j = parseInt(index);
		var optionObj = new Object();
		optionObj.id = $('#optionId_'+j).val();
		optionObj.fileid = $('#fileId_'+j).val();
		optionObj.cover = $('#coverPath_'+j).val();
		optionObj.url = $('#option_url_'+j).val();
		optionObj.title = $('#option_title_'+j).val();
		requestOptions[i] = optionObj;
	}
	return requestOptions;
}








function deleteCover(number){
	$.ajax({
		type: "GET",
		url:  basepath+"/mgr/fodder/delsourcefile.xhtml?fileId="+$('#fileId_'+number).val(),
		contentType: "application/json; charset=utf-8",
		success:function(data){
			$("#small_prev_"+number).hide();
			$('#fileId_'+number).val("");
			$('#coverPath_'+number).val("");
		},
		error: function(data){
			alert("删除失败");
		}
	});
}


//调研
function save(id){
	var indexEntity = new Object();
	var requestOptions = getRequestOptions();
	
	indexEntity.id = id;
	indexEntity.name = $('#name').val();
	
	//题目必填
	if(!v_questionTitle()){
		return;
	}
	
	if(!v_option('coverPath_0')){
		return;
	}
	
	var optionObjs = $('.input-group');
	
	for(var i=0;i<optionObjs.length;i++){
		var divObj = optionObjs[i];
		var divid = divObj.id;
		var index = divid.substring(7,divid.length);
		var j = parseInt(index);
		if(!v_option('coverPath_'+j)){
			return;
		}
		if(!v_option('option_url_'+j)){
			return;
		}
	}
	
	indexEntity.fileid = $('#fileId_'+0).val();
	indexEntity.cover = $('#coverPath_'+0).val();
	indexEntity.models = requestOptions;
	console.log(JSON.stringify(indexEntity));
	$.ajax({
		type: "POST",
		url:  basepath+"/base/admin/diyindex/save.xhtml",
		data: JSON.stringify(indexEntity),
		async: false,
		contentType: "application/json; charset=utf-8",
		success:function(data){
			window.location.href=basepath+"/base/admin/diyindex/index.xhtml";
		},
		error: function(data){
			easyDialog.open({
		        container : {
		            header : '提示',
		            content : '<div style="background-color: #ffffff;width:260px;height:20px;text-align:center;">保存失败！</div>'
		        },
		        autoClose:1200
		    });
		}
	});
}

