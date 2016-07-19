//----
var editor = UE.getEditor('myEditor');
$(document).ready(function(){
	$('#file_upload').uploadify({
		'formData'     : {
			'token'     : token,
		},
		'fileObjName'  : 'file',
		'buttonText' : '<i class="glyphicon glyphicon-open"></i>上传',
		'buttonClass' : 'upload_access',
		'swf'      : basepath+'/static/ixin/css/uploadify.swf',
		'uploader' : 'http://up.qiniu.com/',
		'onUploadSuccess' : function(file,data,response){
			var result = eval("("+data+")");
			$('#showImage').attr("src",qiniuImageBasePath+result.hash+coverSuffix);
			$('#showImage').show();
			$("#image_cover").html("<img style='max-width:100px;max-height:200px;' src = '"+qiniuImageBasePath+result.hash+coverSuffix+"'>");
			$("#small_prev").show();
			//文件长传完成之后，在本地保存一份文件信息的数据
			saveFile(file,result);
		}
	});
   editor.addListener( 'ready', function( editor ) {
  	  $("#loading").hide();
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
function autoSaveMatter(isdraft){
	$('.material_saveTime').html(getCurrentTime());
	$('#js_auto_tips').css({display:'block'});
	
	var requestBody = new Object();
	requestBody.columnId = $('#columnId').val();
	requestBody.id = $('#baseId').val();
	requestBody.isdraft = !isdraft;
	requestBody.sourceBaseId = $('#sourceBaseId').val();
	var matterInfos = new Array();
	var obj = new Object();
	obj.id=$('#matterId').val();
	obj.title=$('.js_title').val();
	obj.author=$('.js_author').val();
	obj.fileId=$('#fileId').val();
	obj.coverShowInText=$('#checkbox_info').prop("checked")?1:0;
	obj.desc=$('.js_desc').val();
	obj.content=editor.getContent();
	obj.originalLink=$('.js_url').val();
	matterInfos[0] = obj;
	requestBody.matterInfos = matterInfos;
	console.debug(JSON.stringify(requestBody));
	$.ajax({
		type: "POST",
		url:  basepath+"/mgr/matter/savesingle.xhtml",
		data: JSON.stringify(requestBody),
		contentType: "application/json; charset=utf-8",
		success:function(data){
			if(!isdraft){
				$('#baseId').val(data.baseId);
				$('#sourceBaseId').val(data.sourceBaseId);
				$('#matterId').val(data.matterId);
			}else{
				if($('#columnId').val() == 'ixinstudy'){
					location = basepath+"/mgr/study/index.xhtml";
				}else if($('#columnId').val() == 'ixinnotice'){
					location = basepath+"/mgr/notice/index.xhtml";
				}else{
					location = basepath+"/mgr/matter/index.xhtml";
				}
			}
		},
		error: function(data){
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
		url:  basepath+"/mgr/matter/delfile.xhtml?fileId="+$('#fileId').val(),
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
	console.debug(JSON.stringify(requestBody));
	
	$.ajax({
		type: "POST",
		url:  basepath+"/mgr/matter/savefile.xhtml",
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
	autoSaveMatter(true);
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