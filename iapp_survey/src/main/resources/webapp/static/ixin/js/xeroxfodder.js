//----		
var startAuto =true;		
//var editor = UE.getEditor('myEditor');
$(document).ready(function(){
	$('#file_upload').uploadify({
		'formData'     : {
			'token'     : token,
		},
		'fileObjName'  : 'file',
		//允许上传的文件后缀
        'fileTypeExts': '*.gif;*.jpg; *.png;*.jpeg;*.bmp',
    	//在浏览窗口底部的文件类型下拉菜单中显示的文本
		'fileTypeDesc': 'Image File',
		'overrideEvents' : [ 'onDialogClose' ],
		'onSelectError':function(file, errorCode, errorMsg){
			if(errorCode==-130)
				{
					alert("文件类型不支持！");
					return;
				}
		},
		'buttonText' : '<i class="glyphicon glyphicon-open"></i>上传',
		'buttonClass' : 'upload_access',
		'swf'      : basepath+'/static/ixin/css/uploadify.swf',
//		'uploader' : 'http://up.qiniu.com/',
		'uploader' : uploadurl,
		'onUploadSuccess' : function(file,data,response){
			var result = eval("("+data+")");
			$('#showImage').attr("src",qiniuImageBasePath+result.hash+coverSuffix);
			$('#showImage').show();
			$("#image_cover").html("<img style='max-width:100px;max-height:200px;' src = '"+qiniuImageBasePath+result.hash+coverSuffix+"'>");
			$("#small_prev").show();
			//文件长传完成之后，在本地保存一份文件信息的数据
			$('#coverPath').val(result.hash);
			saveFile(file,result);
		}
	});
});
/**
 * 自动同步输入框的内容
 * @param sourceObj 源控件
 * @param targetId 目标控件Id
 */
function autoSyncContent(sourceObj,targetId){
	if(targetId == 'single_title'){
		var sourceVal = $(sourceObj).val();
		if($.trim(sourceVal) != ''){
			$('#'+targetId).html(sourceVal);
		}else{
			$('#'+targetId).html('标题');
		}
	}else if(targetId == 'matter_desc'){
		var sourceVal = $(sourceObj).val();
		if($.trim(sourceVal) != ''){
			$('#'+targetId).html(sourceVal);
		}else{
			$('#'+targetId).html('');
		}
	}
}
/**
 * 自动保存
 * @param isdraft  是否是草稿
 */
function autoSave(isNotDraft){
	$('.material_saveTime').html(getCurrentTime());
	$('#js_auto_tips').css({display:'block'});
	if(isNotDraft){
		isNotDraft = true;
	}else{
		isNotDraft = false;
	}
	//增加一个判断，如果全部都为空的话，不向服务器发送请求
	if($.trim($('#author').val()) == "" && $.trim($('#title').val()) == ""
		&& $.trim($('#coverPath').val()) == "" && $.trim($('#fileId').val()) == ""
			&& $.trim($('#summary').val()) == "" && $.trim(editor.getContent()) == ""
				&& $.trim($('#sourceUrl').val()) == ""){
		return;
	}
	var requestBody = new Object();
	requestBody.author = $('#author').val();
	requestBody.ext = $('#cId').val();
	requestBody.title = $('#title').val();
	requestBody.coverPath = $('#coverPath').val();
	requestBody.fileId = $('#fileId').val();
	var summ = $.trim($('#summary').val());
	if(""==summ){
		requestBody.summary = editor.getContentTxt().substring(0,50);
	}else{
		requestBody.summary = summ;
	}
	//requestBody.content =encodeURIComponent(editor.getContent());
	requestBody.content =editor.getContent();
	
	//requestBody.content =editor.getContentTxt();
	requestBody.sourceUrl = $('#sourceUrl').val();
	
	requestBody.gotoType = 0;//DOTO
	requestBody.gotoUrl = $('#gotoUrl').val();
	requestBody.coverShowInText = $('#checkbox_info').prop('checked')?1:0;
	requestBody.baseId = $('#baseId').val();
	requestBody.id = $('#id').val();
	requestBody.isNotDraft = isNotDraft?1:0;
	requestBody.columnId = $('#columnId').val();
	var hid_id=$('#hid_id').val();
	//console.debug(JSON.stringify(requestBody));

	$.ajax({
		type: "POST",
		url:  basepath+"/mgr/xeroxfodder/save.xhtml",
		data: JSON.stringify(requestBody),
		contentType: "application/json; charset=utf-8",
		success:function(data){
			console.debug(JSON.stringify(data));
			$('#id').val(data.id);
			$('#baseId').val(data.baseId);
			var type=$("#hid_type").val();
			var channelid=$("#hid_channelid").val();
			if(isNotDraft){
				if($('#columnId').val() == 'ixinstudy'){
					location = basepath+"/mgr/study/index.xhtml";
				}else if($('#columnId').val() == 'ixinnotice'){
					location = basepath+"/mgr/notice/index.xhtml";
				}else if($('#columnId').val() == 'respNews'){
					location = basepath+"/mgr/ixin/power/index.xhtml?a=fodder"
				}else if(hid_id!=null && hid_id!=""){
					location=basepath+"/mgr/fodder/groupmessage.xhtml?id="+data.baseId;
				}else if(type!=null && type!=""){
					location=basepath+"/mgr/channelresource/tolink.xhtml?restype="+type+"&id="+channelid;
				}else{
					
					location = basepath+"/mgr/xeroxfodder/index.xhtml?from=li_fodder";
				}
			}
			
		},
		error: function(data){
			startAuto = false ;
			alert('保存失败');
		}
	});
}
/**
 * 删除封面
 */
function deleteCover(){
	$.ajax({
		type: "GET",
		url:  basepath+"/mgr/xeroxfodder/delsourcefile.xhtml?fileId="+$('#fileId').val(),
		contentType: "application/json; charset=utf-8",
		success:function(data){
			$("#showImage").hide();
			$("#showImage").removeAttr("src");
			$("#small_prev").hide();
			$('#fileId').val("");
		},
		error: function(data){
			alert("删除失败");
		}
	});
}
/**
 * 保存文件
 * @param file
 * @param result
 */
function saveFile(file,result){
	var requestBody = new Object();
	requestBody.size = result.size;
	requestBody.mimeType = result.mimeType;
	requestBody.filePath = result.url;
	//requestBody.name = result.name;
	//console.debug(JSON.stringify(requestBody));
	
	$.ajax({
		type: "POST",
		url:  basepath+"/mgr/xeroxfodder/savesourcefile.xhtml",
		data: JSON.stringify(requestBody),
		contentType: "application/json; charset=utf-8",
		success:function(data){
			$('#fileId').val(data);
		},
		error: function(data){
			alert('保存失败');
		}
	});
	
}
/**
 * 提交
 */
$('#js_submit').click(function(){
	if($.trim($('.js_title').val()) == ''){
		alert('标题不能为空');
		return;
	}
	if($.trim($('#fileId').val()) == ''){
		alert('封面不能为空');
		return;
	}
	if($.trim(editor.getContentTxt()) == ''){
		alert('内容必须要有纯文本内容');
		return;
	}
	if(editor.getContent().length>50000){
		alert('内容必须小于50000个字符');
		return;
	};
	autoSave(true);
})

function getCurrentTime(){
	var date = new Date();
	var yearStr = date.getFullYear();
	var monthStr  = (date.getMonth()<9)?"0"+(date.getMonth()+1):date.getMonth()+1;
	var dayStr = date.getDate()<=9?"0"+date.getDate():date.getDate();
	var hourStr = date.getHours()<=9?"0"+date.getHours():date.getHours();
	var minuteStr = date.getMinutes()<=9?"0"+date.getMinutes():date.getMinutes();
	var secondStr = date.getSeconds()<=9?"0"+date.getSeconds():date.getSeconds();
	var returnStr = yearStr+"/"+monthStr+"/"+dayStr+" "+hourStr+":"+minuteStr+":"+secondStr;
	return returnStr;
}
$('#js_preview').click(function(){
	alert('预览功能稍后开放');
})