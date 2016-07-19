
function checkIsEmpty(obj,infoId){
	var inputVal = $.trim($(obj).val())
	if(!inputVal){
		$('#'+infoId).css({"display":"block"});
	}else{
		$('#'+infoId).css({"display":"none"});
	}
}
function saveFile(file,result){
	var requestBody = new Object();
	requestBody.size = result.size;
	requestBody.mimeType = result.mimeType;
	requestBody.filePath = result.url;
	//requestBody.name = result.name;
	//console.debug(JSON.stringify(requestBody));
	
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

$(document).ready(function(){
	//初始化uploadify插件
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
			$("#image_cover").html("<img style='max-width:100px;max-height:200px;' src = '"+qiniuImageBasePath+result.hash+coverSuffix+"'>");
			$("#small_prev").show();
			//文件长传完成之后，在本地保存一份文件信息的数据
			$('#coverPath').val(result.hash);
			saveFile(file,result);
		}
	});
	
	//保存投票信息
	$('#saveVoteInfo').click(function(){
		//获取基本信息start
		var title = $('#title').val();
		var fileId = $('#fileId').val();
		var coverPath = $('#coverPath').val();
		var voteStartTime = $('#voteStartTime').val();
		var voteEndTime = $('#voteEndTime').val();
		var voteAuthor = $('#voteAuthor').val();
		var voteSummary = $('#voteSummary').val();
		var voteKeyWords = $('#voteKeyWords').val();
		var voteId = $('#voteId').val();
		var voteQId = $('#voteQId').val();
		//获取基本信息end
		
		//定义与VoteVO对应的js类
		var voteObj = new Object();
		//对voteObj对象的各个基本属性赋值
		voteObj.id = voteId;
		voteObj.title = title;
		voteObj.coverPath = coverPath;
		voteObj.fileId = fileId;
		voteObj.startTimeStr = voteStartTime;
		voteObj.endTimeStr = voteEndTime;
		voteObj.author = voteAuthor;
		voteObj.summary = voteSummary;
		voteObj.keywords = voteKeyWords;
		//基本信息赋值结束
		
		//给投票中添加问题，问题是一个数组
		var questions = new Array();
	
		var voteQuestionObjs = $('.voteQuestionTitle');
		for(i=0;i<voteQuestionObjs.length;i++){
			//外层循环，每循环一次代表有一个问题
			var question = new Object();
			var voteQId = $(voteQuestionObjs.get(i)).attr("id");
			//题目标题
			var voteQuestionTitle = $(voteQuestionObjs.get(i)).val();
			question.qtitle = voteQuestionTitle;//问题题目赋值
			question.qid = $('#'+voteQId).next().val();
			//每个题目对应多个选项
			var options = new Array();
			var voteOptionObjs = $('.'+voteQId+'_voteOption');
			for(j=0;j<voteOptionObjs.length;j++){
				//题目选项
				var optionVal = $(voteOptionObjs.get(j)).val();
				var option = new Object();
				var oid = $(voteOptionObjs.get(j)).next().val();
				option.ocontent = optionVal;
				option.oid = oid;
				options[j] = option;
			}
			question.options = options;
			questions[i] = question;
		}
		voteObj.questions = questions;
		//voteObj赋值完毕
		
		//控制台调试信息
		//console.debug(JSON.stringify(voteObj));
		
		//保存信息
		$.ajax({
			type: "POST",
			url:  basepath+"/mgr/vote/save.xhtml",
			data: JSON.stringify(voteObj),
			contentType: "application/json; charset=utf-8",
			success:function(data){
				location = basepath+"/mgr/vote/index.xhtml";
			},
			error: function(data){
				alert('保存失败');
			}
		});
	});
});	
function saveStep1(){
	if(v_saveStep1()){
		var title = $("#title").val();
		var remark = $("#voteSummary").val();
		var cover = $("#coverPath").val();
		$.ajax({
			type:"post",
			url:basepath+"/mgr/survey/savebasicinfo.json",
			data:{"title":title,"remark":remark,"cover":cover},
			success:function(data){
					if(data.result){
						window.open(basepath+"/mgr/survey/add_detail.xhtml?id="+data.id);
					}
				}
		});
	}
}




function v_saveStep1(){
	if(v_title()){
		return true;
	}
	return false;
}

function v_title(){
	var id = "title";
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

/** 添加错误信息 */
function addError(id){
	$("#con_"+id).addClass("has-error");
	myShow2("#tip_"+id);
}
function removeError(id){
	$("#con_"+id).removeClass("has-error");
	myHide2("#tip_"+id);
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

function showMsgDialog(content){
	easyDialog.open({
        container : {
            header : '提示',
            content : '<div style="background-color: #ffffff;width:260px;height:20px;text-align:center;">'+content+'</div>'
        },
        autoClose:1200
    });
}