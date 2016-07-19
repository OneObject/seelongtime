var editor = UE.getEditor('myEditor');
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
		saveFile(file,result);
	}
});

editor.addListener( 'ready', function() {
	$("#loading").hide();
	if(typeof(summary)!="undefined" && $.trim(summary)!=""){
  		editor.focus();
  		editor.execCommand('cleardoc');//清空文档内容
  		editor.execCommand("insertHtml",summary); 
  	 }
});

/**
 * 保存文件
 */
function saveFile(file,result){
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
			$('#fileId').val(data);
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
		url:  basepath+"/mgr/fodder/delsourcefile.xhtml?fileId="+$('#fileId').val(),
		contentType: "application/json; charset=utf-8",
		success:function(data){
			$("#small_prev").hide();
			$('#fileId').val("");
		},
		error: function(data){
			alert("删除失败");
		}
	});
}

function saveTopicInfo(){
//	$('#summary2Long').hide();
	$('#title2Long').hide();
	if(getBytesCount($('#topicTitle').val())>255)
	{
		$('#title2Long').show();
		return;
	}
//	if(getBytesCount(editor.getContent())>255) //简介暂时没限制
//	{
//		$('#summary2Long').show();
//		return;
//	}
	$('#topicSummary').val(editor.getContent());
	var valArr = [$('#topicTitle').val(),$('#fileId').val(),$('#topicKeyWords').val(),$('#topicSummary').val()];
	var objArr = ["titleInfo","coverInfo","keywordsInfo","summaryInfo"];
	checkEmpty(valArr,objArr);
}
function saveTopicInfo1(){
	$('#topicSummary').val(editor.getContent());
	var valArr = [$('#topicTitle').val(),$('#fileId').val(),$('#topicKeyWords').val(),$('#topicSummary').val()];
	var objArr = ["titleInfo","coverInfo","keywordsInfo","summaryInfo"];
	checkEmpty(valArr,objArr);
}


function checkEmpty(valArr,objArr){
	for(i=0;i<valArr.length;i++){
		$('#'+objArr[i]).css({"display":"none"});
		if(i==2){
			if($.trim(valArr[i]) == ""){
				$('#'+objArr[i]).html("关键字不能为空");
				$('#'+objArr[i]).css({"display":"block"});
				return;
			}
		}
		if($.trim(valArr[i]) == ""&i!=2){
			$('#'+objArr[i]).css({"display":"block"});
			return;
		}
	}
	
	validateFindKey("topicKeyWords");
	
}


function getBytesCount(str)
{
  var bytesCount = 0;
  if (str != null)
  {
    for (var i = 0; i < str.length; i++)
    {
      var c = str.charAt(i);
          if (c.match(/[^\x00-\xff]/ig) != null) //全角
           {
        	  bytesCount += 2;
           }
          else
           {
        	  bytesCount += 1;
           }
    }
  }
  return bytesCount;
}
