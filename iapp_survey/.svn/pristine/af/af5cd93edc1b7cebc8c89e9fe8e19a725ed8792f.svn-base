var questionType = 1;//默认单选
$(function(){
	initUploadify(1);
	$("input[name='questionType']").click(function(){
		//改变题目类型
		questionType = $(this).val();
		
		
	});
	$('#voteQuestionList').load(basepath+"/mgr/include/votequestionlist.xhtml?voteId="+voteId);
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
	count_last = count_last+1;
	var currentLastId = $('#vote_options').children().last().attr("id");
	var nextIdNumber = parseInt(currentLastId.substring(currentLastId.lastIndexOf("_")+1))+1;
	var optionsInnerHtml = new Array();
	optionsInnerHtml.push('<div class="input-group mt5" id="option_'+nextIdNumber+'">');
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
	optionsInnerHtml.push('	</div>');
	optionsInnerHtml.push('	<input type="text" class="form-control" id="option_title_'+nextIdNumber+'">');
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

function backToList(surveyOrvote){
	if(surveyOrvote=='调研'){
		surveyOrvote=1;
	}else{
		surveyOrvote=0;
	}
	window.location.href = basepath + "/mgr/vote/index.xhtml?surveyOrvote="+surveyOrvote;
}

//修改投票
function savevotequestion(){
	savequestion2(true);
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
	var id = "questionTitle";
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

function v_minscore(){
	var id = "minScore";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(isBlank(value)){
		obj.val("1");
		value = obj.val();
	}
	if(!intCheck(value) || value<1 || value>9){
		obj.focus();
		addError(id);
		return false;
	}
	removeError(id);
	return true;
}

function v_maxChooseNum(){
	var id = "maxChooseNum";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(isBlank(value)){
		obj.val(0);
		value = obj.val();
	}
	if(!intCheck(value) && value !=0 ){
		alert("请输入正整数！");
		obj.focus();
		addError(id);
		return false;
	}else if(value<0){
		alert("请输入正数！");
		obj.focus();
		addError(id);
		return false;
	}else if(parseInt(value) < parseInt($("#minChooseNum").val()) && value!=0){
		alert("最多选择个数要不小于最少选择数！");
		obj.focus();
		addError(id);
		return false;
	}else if(parseInt(value)>count){
		alert("最多选择个数不能大于选项数！");
		obj.focus();
		addError(id);
		return false;
	}
	
	
	removeError(id);
	return true;
}
function v_minChooseNum(){
	var id = "minChooseNum";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(isBlank(value)){
		obj.val(0);
		value = obj.val();
	}
	
	if(!intCheck(value) && value !=0 ){
		alert("请输入正整数！");
		obj.focus();
		addError(id);
		return false;
	}else if(value<0){
		alert("请输入正数！");
		obj.focus();
		addError(id);
		return false;
	}else if(parseInt(value) > parseInt($("#maxChooseNum").val()) && $("#maxChooseNum").val()!=0){
		alert("最少选择个数要不大于最多选择数！");
		obj.focus();
		addError(id);
		return false;
	}else if(parseInt(value)>count){
		alert("最少选择个数不能大于选项数！");
		obj.focus();
		addError(id);
		return false;
	}
	
	removeError(id);
	return true;
}

function v_maxscore(){
	var id = "maxScore";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(isBlank(value)){
		obj.val(5);
		value = obj.val();
	}
	if(!intCheck(value) || value<2 || value>10 || parseInt(value) <= parseInt($("#minScore").val())){
		obj.focus();
		addError(id);
		return false;
	}
	removeError(id);
	return true;
}

function v_content(){
	var id = "content";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(isBlank(value)){
		removeError(id);
		return true;
	}
	if(value.length>20){
		obj.focus();
		addError(id);
		return false;
	}
	removeError(id);
	return true;
}
function checkOption(){
	for(var i=1;i<=count_last;i++){
		var id = "option_title_"+i;
		var obj = $("#"+id);
		var value = $.trim(obj.val());
		if(obj.val()==undefined){
			
			continue;
		}
		if(isBlank(value)){
			obj.css("border-color","#b94a48");
			alert("选项不能为空");
			return false;
		}
		obj.css("border-color","");
	}
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
		if(isBlank($('#option_title_'+j).val())){
			continue ;
		}
		var optionObj = new Object();
		optionObj.id = $('#optionId_'+j).val();
		optionObj.fileId = $('#fileId_'+j).val();
		optionObj.coverPath = $('#coverPath_'+j).val();
		optionObj.title = $('#option_title_'+j).val();
		requestOptions[i] = optionObj;
	}
	return requestOptions;
}

function v_options(requestOptions){
	console.log(requestOptions.length);
	if(requestOptions.length > 0){
		return true;
	}
	alert("必须有一个非空选项");
	return false;
}

function savequestion(){
	savequestion2(false);
}


function savequestion2(isVote){
	var requestQuestion = new Object();
	var requestOptions = getRequestOptions();
	
	requestQuestion.id = $('#questionId').val();
	requestQuestion.title = $('#questionTitle').val();
	requestQuestion.type = $("input[name='questionType']:checked").val();
	requestQuestion.voteId = voteId;
	requestQuestion.maxChooseNum=$("#maxChooseNum").val();
	requestQuestion.minChooseNum=$("#minChooseNum").val();
	//问答
	if($("input[name='questionType']:checked").val()==3){
		if(!v_questionTitle()){
			return;
		}
	}else if(!v_questionTitle() || !v_options(requestOptions)){
		return;
	}else if(!(v_maxChooseNum() && v_minChooseNum())){
		return;
	}else if(!checkOption()){
		return;
	}
	requestQuestion.options = requestOptions;
	
	console.log(JSON.stringify(requestQuestion));
	$.ajax({
		type: "POST",
		url:  basepath+"/mgr/vote/savestep2.xhtml",
		data: JSON.stringify(requestQuestion),
		async: false,
		contentType: "application/json; charset=utf-8",
		success:function(data){
			if(isVote){
				easyDialog.open({
			        container : {
			            header : '提示',
			            content : '<div style="background-color: #ffffff;width:260px;height:20px;text-align:center;">保存成功！</div>'
			        },
			        autoClose : 1200,
			        callback : function(){
			        	window.location.href = basepath + "/mgr/vote/index.xhtml?surveyOrvote=0"
			        }
			    });
				 
			}else{
				resetForm();
				$('#voteQuestionList').load(basepath+"/mgr/include/votequestionlist.xhtml?voteId="+voteId);
			}	
		},
		error: function(data){
			easyDialog.open({
		        container : {
		            header : '提示',
		            content : '<div style="background-color: #ffffff;width:260px;height:20px;text-align:center;">保存失败！</div>'
		        },
		        autoClose:2000
		    });
		}
	});
}
function savequestion3(isVote){
	var requestQuestion = new Object();
	var requestOptions = getRequestOptions();
	
	requestQuestion.id = $('#questionId').val();
	requestQuestion.title = $('#questionTitle').val();
	requestQuestion.type = $("input[name='questionType']:checked").val();
	requestQuestion.voteId = voteId;
	//问答
	if($("input[name='questionType']:checked").val()==3){
		if(!v_questionTitle()){
			return;
		}
	}else if(!v_questionTitle() ){
		return;
	}
	requestQuestion.options = requestOptions;
	
	console.log(JSON.stringify(requestQuestion));
	$.ajax({
		type: "POST",
		url:  basepath+"/mgr/vote/savestep2.xhtml",
		data: JSON.stringify(requestQuestion),
		async: false,
		contentType: "application/json; charset=utf-8",
		success:function(data){
			if(isVote){
				easyDialog.open({
					container : {
						header : '提示',
						content : '<div style="background-color: #ffffff;width:260px;height:20px;text-align:center;">保存成功！</div>'
					},
					autoClose : 1200,
					callback : function(){
						window.location.href = basepath + "/mgr/vote/index.xhtml?surveyOrvote=0"
					}
				});
				
			}else{
				resetForm();
				$('#voteQuestionList').load(basepath+"/mgr/include/votequestionlist.xhtml?voteId="+voteId);
			}	
		},
		error: function(data){
			easyDialog.open({
				container : {
					header : '提示',
					content : '<div style="background-color: #ffffff;width:260px;height:20px;text-align:center;">保存失败！</div>'
				},
				autoClose:2000
			});
		}
	});
}

//调研
function saveSurveyQuestion(){
	var requestQuestion = new Object();
	var requestOptions = getRequestOptions();
	
	requestQuestion.id = $('#questionId').val();
	requestQuestion.title = $('#questionTitle').val();
	requestQuestion.type = $("input[name='questionType']:checked").val();
	requestQuestion.voteId = voteId;
	var must = $("input[name='must']:checked").val();
	if(isBlank(must)){
		must = "1";
	}
	requestQuestion.must = must;
	
	//题目必填
	if(!v_questionTitle()){
		return;
	}
	
	var questionType = $("input[name='questionType']:checked").val();
	
	//问答
	if(questionType==4 ){
		if(!v_minscore() || !v_maxscore() || !v_content()){
			return;
		}
	}else if(questionType == 1 || questionType == 2){
		if(!v_options(requestOptions)){
			return;
		}else if(!checkOption()){
			return;
		}
	}
	if(questionType==2){
		
		if(!v_minChooseNum() || !v_maxChooseNum()){
			return;
		}
		
	}
	//最大选择数不能大于选项数判断
	if($.trim($("#maxChooseNum").val())>requestOptions.length){
		easyDialog.open({
	        container : {
	            header : '提示',
	            content : '<div style="background-color: #ffffff;width:260px;height:20px;text-align:center;">最大选择数不能大于该题的选项数</div>'
	        },
	        autoClose:1950
	    });
		return;
	}
	
	requestQuestion.minScore = $("#minScore").val();
	requestQuestion.maxScore = $("#maxScore").val();
	requestQuestion.content = $("#content").val();
	requestQuestion.maxChooseNum = $.trim($("#maxChooseNum").val());
	requestQuestion.minChooseNum = $.trim($("#minChooseNum").val());
	requestQuestion.options = requestOptions;
	console.log(JSON.stringify(requestQuestion));
	$.ajax({
		type: "POST",
		url:  basepath+"/mgr/vote/savestep2.xhtml",
		data: JSON.stringify(requestQuestion),
		async: false,
		contentType: "application/json; charset=utf-8",
		success:function(data){
			resetForm();
			$('#voteQuestionList').load(basepath+"/mgr/include/votequestionlist.xhtml?voteId="+voteId);
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

function resetForm(){
	var formInnerHtml = new Array();
	formInnerHtml.push('<div class="form-body">');
	formInnerHtml.push('	<div class="form-group" >');
	formInnerHtml.push('		<label>选择题目类型</label>');
	formInnerHtml.push('		<div class="radio-list">');
	formInnerHtml.push('			<label class="radio-inline">');
	formInnerHtml.push('			<input type="radio" name="questionType" value="1" checked="checked"> 单选题</label>');
	formInnerHtml.push('			<label class="radio-inline">');
	formInnerHtml.push('			<input type="radio" name="questionType" value="2"> 多选题</label>');
	formInnerHtml.push('            <label class="radio-inline">');
	formInnerHtml.push('            <input type="radio" name="questionType" value="3"> 问答题</label>');
	formInnerHtml.push('			<label class="radio-inline">');
	formInnerHtml.push('			<input type="radio" name="questionType" value="4"> 打分题</label>');
	formInnerHtml.push('            <label class="radio-inline">');
	formInnerHtml.push('            <input type="radio" name="questionType" value="5"> 段落说明</label>');
	formInnerHtml.push('		</div>');
	formInnerHtml.push('	</div>');
	formInnerHtml.push('	<div id="voteContent">');
	formInnerHtml.push('		<div class="form-group" id="con_questionTitle">');
	formInnerHtml.push('			<label>题目名称</label>');
	formInnerHtml.push('			<input type="hidden" id="questionId" value=""/>');
	formInnerHtml.push('			<input type="text" class="form-control" name="voteQuestionTitle" id="questionTitle" placeholder="题目名称" onchange="v_questionTitle();">');
	formInnerHtml.push('			<span class="help-block hidden" id="tip_questionTitle">题目名称不能为空</span>');
	formInnerHtml.push('		</div>');
	
	formInnerHtml.push('<div class="row">');
	formInnerHtml.push('<div class="col-md-6 form-group" id="con_maxChooseNum" style="display: none;">');
	formInnerHtml.push('<label>最多选择个数</label>');
	formInnerHtml.push('<input type="text" class="form-control"  name="maxChooseNum" id="maxChooseNum" placeholder="设置最多选择数，默认为0，代表无限制" onchange="v_maxChooseNum();">');
	formInnerHtml.push('</div>');
	formInnerHtml.push('<div class="col-md-6 form-group" id="con_minChooseNum"  style="display: none;">');
	formInnerHtml.push('<label>最少选择个数</label>');
	formInnerHtml.push('<input type="text" class="form-control"  name="minChooseNum" id="minChooseNum" placeholder="设置最少选择数，默认为0，代表无限制，但最少要选一项" onchange="v_minChooseNum();">');
	formInnerHtml.push('</div>');
	formInnerHtml.push('</div>');
	
	formInnerHtml.push('		<div class="form-group" id="vote_must" style="display: none;">');
	formInnerHtml.push('			<input type="checkbox" value="0" name="must" id="must">');
	formInnerHtml.push('			<label for="must">该题可跳过不回答</label>');
	formInnerHtml.push('		</div>');
	formInnerHtml.push('		<div class="form-group " id="vote_options">');
	formInnerHtml.push('			<label>选项</label>');
	formInnerHtml.push('			<div class="input-group mt5" id="option_1">');
	formInnerHtml.push('				<input type="hidden" id="optionId_1" value=""/>');
	formInnerHtml.push('				<div class="frm_input_box" style="border:1px solid #e5e5e5; padding-top:3px; margin-bottom:6px; padding-bottom:-5px;padding-left:10px;">');
	formInnerHtml.push('					<div class="upload_box">');
	formInnerHtml.push('						<div class="upload_area">');
	formInnerHtml.push('							<input type="file" id="file_upload_1" />');
	formInnerHtml.push('							<ul class="upload_file_box" style="display: none;" id="queue"></ul>');
	formInnerHtml.push('						</div>');
	formInnerHtml.push('					</div>');
	formInnerHtml.push('					<div style="display: none;margin-bottom:20px;" id="small_prev_1">');
	formInnerHtml.push('						<span id="image_cover_1"></span>');
	formInnerHtml.push('						<a class="js_removeCover" href="javascript:void(0);" onclick="deleteCover(\'1\');">删除</a>');
	formInnerHtml.push('						<input type="hidden" id="fileId_1"  value=""/>');
	formInnerHtml.push('						<input type="hidden" id="coverPath_1" value=""/>');
	formInnerHtml.push('					</div>');
	formInnerHtml.push('				</div>');
	formInnerHtml.push('				<input type="text" class="form-control" id="option_title_1">');
	formInnerHtml.push('				<span class="input-group-btn">');
	formInnerHtml.push('					<button class="btn red" type="button"  onclick="removethis(this)"><i class="fa fa-times" style="font-size: 18px;"></i></button>');
	formInnerHtml.push('				</span>');
	formInnerHtml.push('			</div>');
	
	formInnerHtml.push('			<div class="input-group mt5" id="option_2">');
	formInnerHtml.push('				<input type="hidden" id="optionId_2" value=""/>');
	formInnerHtml.push('				<div class="frm_input_box" style="border:1px solid #e5e5e5; padding-top:3px; margin-bottom:6px; padding-bottom:-5px;padding-left:10px;">');
	formInnerHtml.push('					<div class="upload_box">');
	formInnerHtml.push('						<div class="upload_area">');
	formInnerHtml.push('							<input type="file" id="file_upload_2" />');
	formInnerHtml.push('							<ul class="upload_file_box" style="display: none;" id="queue"></ul>');
	formInnerHtml.push('						</div>');
	formInnerHtml.push('					</div>');
	formInnerHtml.push('					<div style="display: none;margin-bottom:20px;" id="small_prev_2">');
	formInnerHtml.push('						<span id="image_cover_2"></span>');
	formInnerHtml.push('						<a class="js_removeCover" href="javascript:void(0);" onclick="deleteCover(\'2\');">删除</a>');
	formInnerHtml.push('						<input type="hidden" id="fileId_2"  value=""/>');
	formInnerHtml.push('						<input type="hidden" id="coverPath_2" value=""/>');
	formInnerHtml.push('					</div>');
	formInnerHtml.push('				</div>');
	formInnerHtml.push('				<input type="text" class="form-control" id="option_title_2">');
	formInnerHtml.push('				<span class="input-group-btn">');
	formInnerHtml.push('					<button class="btn red" type="button"  onclick="removethis(this)"><i class="fa fa-times" style="font-size: 18px;"></i></button>');
	formInnerHtml.push('				</span>');
	formInnerHtml.push('			</div>');
	formInnerHtml.push('		</div>');	
	formInnerHtml.push('			<div class="form-group " id="vote_score" style="display:none;">');
	formInnerHtml.push('				<div class="form-group" id="con_minScore">');
	formInnerHtml.push('					<label>最低分</label>');
	formInnerHtml.push('					<input type="text" class="form-control" name="minScore" id="minScore" placeholder="1" onchange="v_minscore();">');
	formInnerHtml.push('					<span class="help-block hidden" id="tip_minScore">1-9</span>');
	formInnerHtml.push('				</div>');
	formInnerHtml.push('				<div class="form-group" id="con_maxScore">');
	formInnerHtml.push('					<label>最高分</label>');
	formInnerHtml.push('					<input type="text" class="form-control" name="maxScore" id="maxScore"  placeholder="5" onchange="v_maxscore();">');
	formInnerHtml.push('					<span class="help-block hidden" id="tip_maxScore">2-10 大于最低分</span>');
	formInnerHtml.push('				</div>');
	formInnerHtml.push('				<div class="form-group" id="con_content">');
	formInnerHtml.push('					<label>备注</label>');
	formInnerHtml.push('					<input type="text" class="form-control" name="content" id="content">');
	formInnerHtml.push('					<span class="help-block hidden" id="tip_content">20字以内</span>');
	formInnerHtml.push('				</div>');
	formInnerHtml.push('			</div>');
	formInnerHtml.push('		<div class="form-group" style="text-align: center;">');
	formInnerHtml.push('			<div class = "btn btn-success" style="width:45%" onclick="saveSurveyQuestion()"><i class="fa fa-plus" ></i>&nbsp;保存该题</div>');
	formInnerHtml.push('			<div class = "btn btn-success" onclick="addOption()" id="addoptions" style="width:45%"><i class="fa fa-plus"></i>&nbsp;添加选项</div>');
	formInnerHtml.push('		</div>');
	formInnerHtml.push('	</div>');
	formInnerHtml.push('</div>');
	
	//重置表单
	$('#questionForm').html(formInnerHtml.join(''));
	initUploadify(1);
	initUploadify(2);
	App.init();
	resetbind();
}
function deleteVoteQuestion(id){
	var msgHtml = '<div style="width:350px;height:70px;text-align:center;"><h3>您确定要删除么？</h3></div>';
	easyDialog.open({
	    container : {
	    	header : '提示',
	    	content : msgHtml,
	    	yesFn : function(){
	    		$.ajax({
	    			type: "GET",
	    			url:  basepath+"/mgr/vote/deletevotequestion.xhtml?id="+id,
	    			contentType: "application/json; charset=utf-8",
	    			success:function(data){
	    				$('#voteQuestionList').load(basepath+"/mgr/include/votequestionlist.xhtml?voteId="+voteId);
	    			},
	    			error: function(data){
	    				alert("删除失败");
	    			}
	    		});
	    	},
	    	noFn : true
	    }
	});
}

function updateVoteQuestion(id){
	$.ajax({
		type: "GET",
		url:  basepath+"/mgr/vote/updatevotequestion.xhtml?id="+id,
		contentType: "application/json; charset=utf-8",
		success:function(data){
			//alert(JSON.stringify(data));
			voteQuestionEcho(data);
		},
		error: function(data){
			alert("删除失败");
		}
	});
}

//回显数据
function voteQuestionEcho(data){
	var singleIsChecked = (data.type==1?"checked='checked'":"");
	var multiIsChecked = (data.type==2?"checked='checked'":"");
	var essayQuestion=(data.type==3?"checked='checked'":"");
	var scoreIsChecked = (data.type==4?"checked='checked'":"");
	var sectionIsChecked=(data.type==5?"checked='checked'":"");
	var mustIsChecked=(data.must==0?"checked='checked'":"");
	
	var isDisabled1 = data.type==1 ?"":"disabled=disabled";
	var isDisabled2 = data.type==2 ?"":"disabled=disabled";
	var isDisabled3 = data.type==3 ?"":"disabled=disabled";
	var isDisabled4 = data.type==4 ?"":"disabled=disabled";
	var isDisabled5 = data.type==5 ?"":"disabled=disabled";
	var voteFormInnerHtml = new Array();
	voteFormInnerHtml.push('<div class="form-body">');
	voteFormInnerHtml.push('	<div class="form-group" id="con_questionTitle">');
	voteFormInnerHtml.push('		<label>选择题目类型</label>');
	voteFormInnerHtml.push('		<div class="radio-list">');
	voteFormInnerHtml.push('			<label class="radio-inline">');
	voteFormInnerHtml.push('			<input type="radio" name="questionType" value="1" '+singleIsChecked+' '+isDisabled1+'>单选题</label>');
	voteFormInnerHtml.push('			<label class="radio-inline">');
	voteFormInnerHtml.push('			<input type="radio" name="questionType" value="2" '+multiIsChecked+' '+isDisabled2+'>多选题</label>');
	voteFormInnerHtml.push('             <label class="radio-inline">');
	voteFormInnerHtml.push('            <input type="radio" name="questionType" value="3" '+essayQuestion+' '+isDisabled3+'>问答题</label> ');
	voteFormInnerHtml.push('			<label class="radio-inline">');
	voteFormInnerHtml.push('			<input type="radio" name="questionType" value="4" '+scoreIsChecked+' '+isDisabled4+'>打分题</label>');
	voteFormInnerHtml.push('             <label class="radio-inline">');
	voteFormInnerHtml.push('            <input type="radio" name="questionType" value="5" '+sectionIsChecked+' '+isDisabled5+'>段落说明</label> ');	
	voteFormInnerHtml.push('		</div>');
	voteFormInnerHtml.push('	</div>');
	voteFormInnerHtml.push('	<div id="voteContent">');
	voteFormInnerHtml.push('		<div class="form-group">');
	voteFormInnerHtml.push('			<label>题目名称</label>');
	voteFormInnerHtml.push('			<input type="hidden" id="questionId" value="'+data.id+'"/>');
	voteFormInnerHtml.push('			<input type="text" class="form-control" value="'+data.title+'" name="voteQuestionTitle" id="questionTitle" placeholder="题目名称" onchange="v_questionTitle();">');
	voteFormInnerHtml.push('			<span class="help-block hidden" id="tip_questionTitle">题目名称不能为空</span>');
	voteFormInnerHtml.push('		</div>');
	if(data.type==2  ){
		voteFormInnerHtml.push('<div class="row">');
		voteFormInnerHtml.push('<div class="col-md-6 form-group" id="con_maxChooseNum" >');
		voteFormInnerHtml.push('<label>最多选择个数</label>');
		voteFormInnerHtml.push('<input type="text" class="form-control" value="'+data.maxChooseNum+'" name="maxChooseNum" id="maxChooseNum" placeholder="设置最多选择数，默认为0，代表无限制" onchange="v_maxChooseNum();">');
		voteFormInnerHtml.push('</div>');
		voteFormInnerHtml.push('<div class="col-md-6 form-group" id="con_minChooseNum" >');
		voteFormInnerHtml.push('<label>最少选择个数</label>');
		voteFormInnerHtml.push('<input type="text" class="form-control" value="'+data.minChooseNum+'" name="minChooseNum" id="minChooseNum" placeholder="设置最少选择数，默认为0，代表无限制，但最少要选一项" onchange="v_minChooseNum();">');
		voteFormInnerHtml.push('</div>');
		voteFormInnerHtml.push('</div>');
		
	}
	if(data.type == 1 || data.type == 2){
		voteFormInnerHtml.push('		<div class="form-group " id="vote_options">');
		voteFormInnerHtml.push('			<label>选项</label>');
		var onclickRemoveThis = "onclick='removethis(this)'";
		for(var i=0;i<data.options.length;i++){
				
			voteFormInnerHtml.push('			<div class="input-group mt5" id="option_'+(i+1)+'">');
			voteFormInnerHtml.push('				<input type="hidden" id="optionId_'+(i+1)+'" value="'+data.options[i].id+'"/>');
			voteFormInnerHtml.push('				<div class="frm_input_box" style="border:1px solid #e5e5e5; padding-top:3px; margin-bottom:6px; padding-bottom:-5px;padding-left:10px;">');
			voteFormInnerHtml.push('					<div class="upload_box">');
			voteFormInnerHtml.push('						<div class="upload_area">');
			voteFormInnerHtml.push('							<input type="file" id="file_upload_'+(i+1)+'" />');
			voteFormInnerHtml.push('							<ul class="upload_file_box" style="display: none;" id="queue"></ul>');
			voteFormInnerHtml.push('						</div>');
			voteFormInnerHtml.push('					</div>');
			voteFormInnerHtml.push('					<div style="display: none;margin-bottom:20px;" id="small_prev_'+(i+1)+'">');
			voteFormInnerHtml.push('						<span id="image_cover_'+(i+1)+'"></span>');
			voteFormInnerHtml.push('						<a class="js_removeCover" href="javascript:void(0);" onclick="deleteCover(\''+(i+1)+'\');">删除</a>');
			voteFormInnerHtml.push('						<input type="hidden" id="fileId_'+(i+1)+'"  value="'+data.options[i].fileId+'"/>');
			voteFormInnerHtml.push('						<input type="hidden" id="coverPath_'+(i+1)+'" value="'+data.options[i].coverPath+'"/>');
			voteFormInnerHtml.push('					</div>');
			voteFormInnerHtml.push('				</div>');
			voteFormInnerHtml.push('				<input type="text" class="form-control" value="'+data.options[i].title+'" id="option_title_'+(i+1)+'">');
			voteFormInnerHtml.push('				<span class="input-group-btn">');
			voteFormInnerHtml.push('					<button class="btn red" type="button"'+onclickRemoveThis+'><i class="fa fa-times" style="font-size: 18px;"></i></button>');
			voteFormInnerHtml.push('				</span>');
			voteFormInnerHtml.push('			</div>');
		}
	} else if(data.type==3){
		voteFormInnerHtml.push('			<div class="form-group" id="vote_must">');
		voteFormInnerHtml.push('				<input type="checkbox" value="0" name="must" id="must" '+mustIsChecked+'>');
		voteFormInnerHtml.push('				<label for="must">该题可跳过不回答</label>');
		voteFormInnerHtml.push('			</div>');
	} else if(data.type==4){
		voteFormInnerHtml.push('			<div class="form-group " id="vote_score">');
		voteFormInnerHtml.push('				<div class="form-group" id="con_minScore">');
		voteFormInnerHtml.push('					<label>最低分</label>');
		voteFormInnerHtml.push('					<input type="text" class="form-control" name="minScore" id="minScore" value="'+data.minScore+'" onchange="v_minscore();">');
		voteFormInnerHtml.push('					<span class="help-block hidden" id="tip_minScore">1-9</span>');
		voteFormInnerHtml.push('				</div>');
		voteFormInnerHtml.push('				<div class="form-group" id="con_maxScore">');
		voteFormInnerHtml.push('					<label>最高分</label>');
		voteFormInnerHtml.push('					<input type="text" class="form-control" name="maxScore" id="maxScore"  value="'+data.maxScore+'" onchange="v_maxscore();">');
		voteFormInnerHtml.push('					<span class="help-block hidden" id="tip_maxScore">2-10 大于最低分</span>');
		voteFormInnerHtml.push('				</div>');
		voteFormInnerHtml.push('				<div class="form-group" id="con_content">');
		voteFormInnerHtml.push('					<label>备注</label>');
		voteFormInnerHtml.push('					<input type="text" class="form-control" name="content" id="content" value="'+data.content+'">');
		voteFormInnerHtml.push('					<span class="help-block hidden" id="tip_content">20字以内</span>');
		voteFormInnerHtml.push('				</div>');
		voteFormInnerHtml.push('			</div>');
	}
	
	voteFormInnerHtml.push('		</div>');
	voteFormInnerHtml.push('		<div class="form-group" style="text-align: center;">');
	voteFormInnerHtml.push('			<div class = "btn btn-success" style="width:25%" onclick="saveSurveyQuestion()"><i class="fa fa-plus" ></i>&nbsp;保存该题</div>');
	voteFormInnerHtml.push('			<div class = "btn btn-success" onclick="resetForm()" id="addoptions" style="width:25%;"><i class="fa fa-plus"></i>&nbsp;继续添加</div>');
	if(data.type==1 || data.type==2){
		voteFormInnerHtml.push('			<div class = "btn btn-success" onclick="addOption()" id="addoptions" style="width:25%"><i class="fa fa-plus"></i>&nbsp;添加选项</div>');
	}
	voteFormInnerHtml.push('		</div>');
	voteFormInnerHtml.push('	</div>');
	voteFormInnerHtml.push('</div>');
	$('#questionForm').html(voteFormInnerHtml.join(''));
	for(i=0;i<data.options.length;i++){
		initUploadify(i+1);
		if($.trim(data.options[i].coverPath)!=''){
			$("#image_cover_"+(i+1)).html("<img style='max-width:100px;max-height:200px;' src = '"+qiniuImageBasePath+data.options[i].coverPath+coverSuffix+"'>");
			$("#small_prev_"+(i+1)).show();	
		}
	}
	var newId = $("#vote_options").find("input:last").attr("id");
	count = parseInt(newId.substring(13,14));//记录动态产生选项的个数
	count_last = parseInt(newId.substring(13,14));//记录动态产生选项的个数
	App.init();
}
