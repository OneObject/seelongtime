function page(i){
	var search = $.trim($("#searchContent").val());
	$('#table_list').load("${basepath}/mgr/include/voteactivitylist.xhtml?page="+i+"&search="+search);
}

$(document).ready(function(){
	page(1);
	//初始化uploadify插件
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
});	

var flag = false;
function save(){
	if(v_title() && validatevoteSummary() && v_voteId()){
		if(flag){
			return;
		}
		flag = true;
		$("#voteActivityForm").submit();
	}
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

function validatevoteSummary(){
	var id = 'voteSummary';
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(value.length > 200){
		obj.focus();
		addError(id);
		return false;
	}
	removeError(id);
	return true;
}

function v_voteId(){
	var id = "voteId";
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
	$("#showImage").hide();
	$("#showImage").removeAttr("src");
	$("#small_prev").hide();
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

/**
 * 选择调研问卷
 */
function chooseVote(){
	pageVote(1);
	easyDialog.open({
	  container : 'add_member_dialog',
	  fixed : false
	});
}

/**
 * 分页加载问卷列表
 * @param i
 */
function pageVote(i) {
	var divId = "table_list2";
	var max = $("#"+divId+" #page_max").val()

	var data = {"page":i, "max":max, "r":Math.random(), "search":$("#search").val()};
	var url = basepath+"/mgr/vote/choosevotelist.list";
	$("#"+divId).load(encodeURI(url), data, function(){
		
	});
}

function select_vote(){
	var checkedVote = $("input[name='selectVoteId']:checked");
	var voteId = $(checkedVote).data("id");
	var voteName = $(checkedVote).data("title");
	$("#voteId").val(voteId);
	$("#voteName").val(voteName);
	easyDialog.close();
}

