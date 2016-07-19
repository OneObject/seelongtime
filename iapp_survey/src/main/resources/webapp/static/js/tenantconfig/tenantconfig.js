$('#file_upload').uploadify({
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
		$("#image_cover").html("<img style='max-width:100px;max-height:200px;' src = '"+qiniuImageBasePath+result.hash+coverSuffix+"'>");
		$("#small_prev").show();
		//文件长传完成之后，在本地保存一份文件信息的数据
		$('#coverPath').val(result.hash);
	}
});


$('#file_upload2').uploadify({
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
		$("#image_cover2").html("<img style='max-width:100px;max-height:200px;' src = '"+qiniuImageBasePath+result.hash+coverSuffix+"'>");
		$("#small_prev2").show();
		//文件长传完成之后，在本地保存一份文件信息的数据
		$('#coverPath2').val(result.hash);
	}
});


$('#file_upload3').uploadify({
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
		$("#image_cover3").html("<img style='max-width:100px;max-height:200px;' src = '"+qiniuImageBasePath+result.hash+coverSuffix+"'>");
		$("#small_prev3").show();
		//文件长传完成之后，在本地保存一份文件信息的数据
		$('#coverPath3').val(result.hash);
	}
});


function deleteCover2(){
	$("#small_prev2").hide();
	$("#coverPath2").val("");
}

function deleteCover(){
	$("#small_prev").hide();
	$('#coverPath').val("");
}

function deleteCover3(){
	$("#small_prev3").hide();
	$('#coverPath3').val("");
}


function saveTenantInfo(){
	var name=$("#tenantName").val();
	if(name=="" || name ==null){
		$("#tenantInfo").show();
		return
	}else{
		$("#tenantInfo").hide();
	}
	//var coverPath=$("#coverPath").val();
	//if(coverPath=="" || coverPath==null){
	//	return;
	//}
	
	$("#tenantForm").submit();

}