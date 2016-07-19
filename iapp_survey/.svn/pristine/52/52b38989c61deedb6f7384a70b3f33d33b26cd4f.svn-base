var editor = UE.getEditor('myEditor',{
	initialFrameHeight: 150
	
});
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


function addFileUpload(index){
$('#file_upload'+index).uploadify({
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
		$("#image_cover"+index).html("<img style='max-width:100px;max-height:100px;' src = '"+qiniuImageBasePath+result.hash+"-180x180'>");
		$("#small_prev"+index).show();
		//文件长传完成之后，在本地保存一份文件信息的数据
		$("#coverPath"+index).val(result.hash);
		
		
	}
});
}


editor.addListener( 'ready', function() {
	$("#loading").hide();
	if(typeof(summary)!="undefined" && $.trim(summary)!=""){
  		editor.focus();
  		editor.execCommand('cleardoc');//清空文档内容
  		editor.execCommand("insertHtml",summary); 
  	 }
});


/**
 * 删除封面
 */
function deleteCover(){
			$("#small_prev").hide();
			$('#coverPath').val("");
}

function saveRankInfo(model){
	$('#rankRemark').val(editor.getContent());
	if(model == 0){
		
		var valArr = [$('#rankTitle').val()];
		checkEmpty(valArr);
		
	}else{
		

		if ($("#from").val() != "update") {
			if ($.trim($("#title").val()) == "") {
				$("#con_title").addClass("has-error");
				$("#title").focus();
				return;
			} else {
				$("#con_title").removeClass("has-error");

			}

			if (!checkTimeEmpty()) {
				return;
			}

			var top = $.trim($("#top").val());
			if(!test_this(top)){
				return;
			}
			
		}
		
		
		var datetype = $("#datetype").val();
		switch (datetype) {
		case '0':
			$("#timestr").val($("#d1").val());
			break; 
		case '1':
			$("#timestr").val($("#d2").val());
			break; 
		case '2':
			$("#timestr").val($("#d3").val());
			break; 
		case '3':
			$("#timestr").val($("#d4").val());
			break; 
		case '4':
			$("#timestr").val($("#d5").val()+"~"+$("#d6").val());
			break; 
		default:
			console.log('fuck ');
	}
		
		$('#rankForm').submit();
		
	}
}


function back(model){
	location.href=basepath+"/mgr/rank/index.xhtml?model="+model;
}

function test_this(value){
	
	var reg = /^\d{1,3}$/;
	var re = value.match(reg);
	if(re){
		if(0<value&&value<=100)
			return true;
	}
    	return false;
}

function checkEmpty(valArr){
	for(i=0;i<valArr.length;i++){
		$("#con_title").removeClass("has-error");
		if($.trim(valArr[i]) == ""){
			$("#con_title").addClass("has-error");
			$("#rankTitle").focus();
			return;
		}
	}
	$('#rankForm').submit();
}

function checkTimeEmpty(){
	var datetype = $("#datetype").val();
	var flag = false;
	if(datetype == 0){
		
		flag = checkEmpty1("week","d1");
		
	}else if(datetype == 1){
		
		flag = checkEmpty1("month","d2");
		
	}else if(datetype == 2){
		
		flag = checkEmpty1("season","d3");
		
	}else if(datetype == 3){
		
		flag = checkEmpty1("year","d4");
		
	}else if(datetype == 4){
		if(checkEmpty1("day","d5")&&checkEmpty1("day","d6")){
			flag = true;
		}
	}
	return flag;
}

function checkEmpty1(id1,id2){
		$("#"+id1).removeClass("has-error");
		if($.trim($("#"+id2).val()) == ""){
			$("#"+id1).addClass("has-error");
			$("#"+id2).focus();
			return false;
		}
		return true;
}
