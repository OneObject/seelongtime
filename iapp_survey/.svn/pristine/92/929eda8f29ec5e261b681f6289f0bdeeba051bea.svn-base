$(function (){
	setTestpaper();
	getTotalNumScore();
	detailUpdateItemblanks();
});

/** 更新自动组卷时显示题库 */
function detailUpdateItemblanks() {
	var types = $("input[name='question_type']");
	for ( var i = 0; i < types.length; i++) {
		var type = $(types[i]).val();
		var idsStr = $("#" + type + "_itemblank_ids_str").val();
		var namesStr = $("#" + type + "_itemblank_names_str").val();
		detailItemblanks(type, idsStr, namesStr);
	}
}

/** 验证名称 */
function validateName(){
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

/** 验证总分 */
function validateTotalScore(){
	var id = "total_score";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(isBlank(value)){
		obj.focus();
		addError(id);
		return false;
	}
	if(floatCheck(value)){
		removeError(id);
		return true;
	}
	obj.focus();
	addError(id);
	return false;
}

/** 验证总分（在关联试题中） */
function validateTotalScoreNext(){
	var score1 = $("#total_socre_1").text();
	var score2 = 0;
	if($("#generate_type").val()==1){
		score2 = $("#total_score_selected").text();
	} else{
		if($("#scoreNum").length!=0){
			score2 = $("#scoreNum").val();
		}
	}
	if(parseFloat(score1) == parseFloat(score2)){
		return true;
	} else{
		mySureDialog("试卷总分与已选择试题总分不一致！");
		return false;
	}
}

/** 验证及格分 */
function validatePassMark(){
	var id = "pass_mark";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(isBlank(value)){
		obj.focus();
		show1Hide2("pass_mark");
		addError(id);
		return false;
	}
	if(floatCheck(value)){
		if(parseInt(value) > parseInt($("#total_score").val())){
			obj.focus();
			show2Hide1("pass_mark");
			addError(id);
			return false;
		}
		show1Hide2("pass_mark");
		removeError(id);
		return true;
	}
	obj.focus();
	show1Hide2("pass_mark");
	addError(id);
	return false;
}

/** 验证描述 */
function v_descript(){
    var max = $("#maxLength").text();
    var id = "descript";
    var obj = $("#"+id);
    if($("#"+id).val().length > max){
        addError(id);
		obj.focus();
        return false;
    } else{
        removeError(id);
        return true;
    }
}

/** 验证增加 */
function validateAdd(){
	if(validateName() && validateTotalScore() && validatePassMark() && v_descript()){
		var data = $.param($(" #name, #level, #total_score, #pass_mark, #descript"));
		
		$.get(basepath+"/base/admin/itest/testpaper/doadd.xhtml", data, function(ret){
			if(ret.flag){
				myAutoHideDialog(ret.message, "success", function(){
					window.location.href = basepath+"/base/admin/itest/testpaper/testpaper.xhtml";
				});
			} else{
				mySureDialog(ret.message);
			}
		});
		return false;
	
	}
	return false;
}

/** 验证修改 */
function validateUpdate(){
	if(validateName() && validateTotalScore() && validatePassMark() && v_descript()){
		var data = $.param($(" #name, #level, #total_score, #pass_mark, #descript, #entityId"));
		
		$.get(basepath+"/base/admin/itest/testpaper/doupdate.xhtml", data, function(ret){
			var html="<div style='width:300px;text-align:center;'>"+ret.message+"</div>";
			if(ret.flag){
				myAutoHideDialog(ret.message, "success", function(){window.location.href = basepath+"/base/admin/itest/testpaper/testpaper.xhtml";});
			} else{
				mySureDialog(ret.message);
			}
		});
		return false;
	}
	return false;
}

/** 验证试题 */
function validateQuestions(){
	var gtype = $("#generate_type").val();
	if(gtype == 1){
		var id = "total_num_selected";
		var obj = $("#"+id);
		var value = obj.text();
		if(intCheck(value)){
//			removeError(id);
			return true;
		}
//		addError(id);
		return false;
	}
	if(gtype == 2){
		var id = "questionIds";
		var obj = $("#"+id);
		var value = obj.val();
		if(isNotBlank(value)){
//			removeError(id);
			return true;
		}
//		addError(id);
		return false;
	}
}

/** 验证关联试题 */
function validateAddNext(){
	if(validateTotalScoreNext()){
		$.get(basepath+"/base/admin/itest/testpaper/dorelatequestion.xhtml", $.param($("#addForm :input")), function(ret){
			var html="<div style='width:300px;text-align:center;'>"+ret.message+"</div>";
			if(ret.flag){
				myAutoHideDialog(ret.message, "success", function(){window.location.href = basepath+"/base/admin/itest/testpaper/testpaper.xhtml";});
			} else{
				mySureDialog(ret.message);
			}
		});
		return false;
	
	} else{
		return false;
	}
}

/** 验证增加并下一步 */
function saveToNext(){
	if(validateName() && validateTotalScore() && validatePassMark() && v_descript()){
		var data = $.param($(" #name, #level, #total_score, #pass_mark, #descript, #entityId"));
		
		$.get(basepath+"/base/admin/itest/testpaper/doadd.xhtml", data, function(ret){
			var html="<div style='width:300px;text-align:center;'>"+ret.message+"</div>";
			if(ret.flag){
				myAutoHideDialog(ret.message, "success", function(){
					window.location.href = basepath+"/base/admin/itest/testpaper/relatequestion.xhtml?paperId="+ret.paperId;});
			} else{
				mySureDialog(ret.message);
			}
		});
		return false;
	}
	return false;
}

/** 验证修改并下一步 */
function updateToNext(){
	if(validateName() && validateTotalScore() && validatePassMark() && v_descript()){
		var data = $.param($(" #name, #level, #total_score, #pass_mark, #descript, #entityId"));
		
		$.get(basepath+"/base/admin/itest/testpaper/doupdate.xhtml", data, function(ret){
			if(ret.flag){
				myAutoHideDialog(ret.message, "success", function(){
					window.location.href = basepath+"/base/admin/itest/testpaper/relatequestion.xhtml?paperId="+ret.paperId;});
			} else{
				mySureDialog(ret.message);
			}
		});
		return false;
	}
	return false;
}

/** 自动、手动组卷切换 */
function setTestpaper(){
	if($("#generate_type").val() == 2){
		myShow("con_questionIds");
		myHide("con_total_num_selected");
	} else{
		myShow("con_total_num_selected");
		myHide("con_questionIds");
	}
	closePreview();
}

/** 选择试题*/
function chooseQuestion(){
	easyDialog.open({
		container : 'chooseQuestion',
		fixed : false
	});
}

/**
 * 分页+搜索试题
 */
function pageQuestion(i, fieldId) {
	var divId = "table_list";
	
	var order = getOrder(divId, fieldId);
	var max = $("#"+divId+" #page_max").val()

	myShow("testQuestion");
	myHide("itemblankList");
	$("#edTitle").text("选择试题");
//	loading(divId);
	var data = {"page":i, "max":max, "r":Math.random(), "searchContent":$("#searchContent").val(),
			"itemId":$("#itemId").val(), "type":$("#type").val(), "questionIds":$("#questionIds").val(), 
			"orderField":order.orderField, "orderDirection":order.orderDirection };
	var url = basepath+"/base/admin/itest/testpaper/choicelist.list";
	$("#"+divId).load(encodeURI(url), data, function(){
//		App.initUniform();//加载复选框样式
		chooseQuestion();
	});
}

/** 删除试题 */
function deleteLocal(id){
	var tr = $("#tr_"+id);
	$("#questionIds").val($("#questionIds").val().replace(id+",", ""));
	tr.remove();
	if(isBlank($("#questionIds").val())){
		closePreview();
		return;
	} else{
		previewPaper();
	}
}

/** 更新总分 */
function updateAmount(){
	var $score = $(".score");
	var sum=0.0;
	for(var i=0;i<$score.length;i++){
	
		var amount = $score.get(i).value;
		if(!floatCheck(amount)){
			amount=0;
		}
		sum=sum+parseFloat(amount);
	}
	$("#scoreNum").val(sum);
} 


/** 设定结构*/
function getItemblanks(){
	easyDialog.open({
		container : 'chooseQuestion',
		fixed : false
	});
}

/**
 * 分页+搜索题库
 */
function pageItemblank(i, fieldId){
	var divId = "itemblank_list";
	
	var order = getOrder(divId, fieldId);
	var max = $("#"+divId+" #page_max").val()

	myShow("itemblankList");
	myHide("testQuestion");
	$("#edTitle").text("设定结构");
	var type = $(".in input[name='question_type']").val();
	var data = {"page":i, "max":max, "r":Math.random(), "itemblank_name":$("#itemblank_name").val(),
			//TODO 这个type要传入
			"type":type, "idsStr":$("#"+type+"_itemblank_ids_str").val(), "namesStr":$("#"+type+"_itemblank_names_str").val(), 
			"orderField":order.orderField, "orderDirection":order.orderDirection };
	var url = basepath+"/base/admin/itest/itemblank/itemchoicelist.list";
	$("#"+divId).load(encodeURI(url), data, function(){
//		App.initUniform();//加载复选框样式
		getItemblanks();
	});
}

/** 保存用户选择 */
function saveChoice(){
	if($("#generate_type").val() == 1){
		var type = $(".in input[name='question_type']").val();
		var idsStr = $("#idsStr").val();//.substring(0, $("#idsStr").val().length-1);
		var namesStr = $("#namesStr").val();//.substring(0, $("#namesStr").val().length-1);
		$("#"+type+"_itemblank_ids_str").val(idsStr);
		$("#"+type+"_itemblank_names_str").val(namesStr);
		detailItemblanks(type, idsStr, namesStr);
		updateTotalNums(type, idsStr);
	} else{ //手动组卷的试题id已经保存
		if(isBlank($("#questionIds").val())){
			closePreview();
		} else{
			previewPaper();
		}
	}
	easyDialog.close();
}

/** 更新可选题目总数 */
function updateTotalNums(type, idsStr){
    var _numMax = $("#"+type+"_num_max");
	$.post(basepath+"/testquestion/getTotalNumByItemblanksAndType.xhtml", {"idsStr":idsStr, "type":type}, function(ret){
		if(ret.flag){
			_numMax.text(ret.totalNum);
            getTotalNumScore();
		}else{
			var html="<div style='width:300px;height:50px;text-align:center;'>"+ret.message+"</div>";
			easyDialog.open({
				container : {
				    header : '提示',
				    content : html,
				    yesFn : tempFn,
				    noFn : true
				}
			});
		}
	});
}

/** 检查题目数 */
function checkNum(obj){
	var _num = $(obj);
	var _score = getScore(_num);
	var num = _num.val();
	var score = _score.val();
	var id = _num.attr("id");
	
	getTotalNumScore();
	if(isBlank(num)){
		return false;
	}
	if(!intCheck(num)){
		show1Hide2(id);
		addError2(id);
		return false;
	}
	
	var numMax = getNumMax(_num).text();
	if(parseInt(_num.val()) > parseInt(numMax)){
		show2Hide1(id);
		addError2(id);
		return false;
	}
	
	show1Hide2(id);
	removeError2(id);
	return true;
}

/** 检查分数 */
function checkScore(obj){
	var _score = $(obj);
	var _num = getNum(_score);
	var value = _score.val();
	var id = _score.attr("id");
	
	getTotalNumScore();
	if(!intCheck(_num.val())){
		addError2(id);
		return true;
	}
	
	if(isBlank(value)){
		addError2(id);
		return false;
	}
	if(!floatCheck(value)){
		addError2(id);
		return false;
	}
	removeError2(id);
	return true;
}

function getNum(_socre){
    var numId = _socre.attr("id").substring(0, _socre.attr("id").lastIndexOf("_")+1)+"num";
    return $("#"+numId);
}
function getScore(_num){
    var scoreId = _num.attr("id").substring(0, _num.attr("id").lastIndexOf("_")+1)+"score";
	return $("#"+scoreId);
}
function getNumMax(_num){
    var numMaxId = _num.attr("id").substring(0, _num.attr("id").indexOf("_")+1)+"num_max";
	return $("#"+numMaxId);
}

/** 更新总分与题目数 */
function getTotalNumScore(){
	var num_max = new Array();
	var num = new Array();
	var score = new Array();
	var total_num_max=total_num=total_score=0;
	for(var i=0; i<4; i++){
		num_max[i] = parseInt(intCheck($("#"+(i+1)+"_num_max").text())==false ? 0:$("#"+(i+1)+"_num_max").text());
		num[i] = parseInt(intCheck($("#"+(i+1)+"_question_num").val())==false ? 0:$("#"+(i+1)+"_question_num").val());
		score[i] = parseFloat(floatCheck($("#"+(i+1)+"_question_score").val())==false ? 0:$("#"+(i+1)+"_question_score").val());
	}
	for(var i=0; i<4; i++){
		total_num_max += num_max[i];
		total_num += num[i];
		total_score += score[i]*num[i];
	}
	$("#total_num_max").text(total_num_max);
	$("#total_num_selected").text(total_num);
	$("#total_score_selected").text(total_score);
}

/** 显示用户已选择题库 */
function detailItemblanks(type, idstr, namestr){
	var ids = idstr.split(",");
	var names = namestr.split(",");
	var details = [];
	for(var i=0; i<names.length-1; i++){
		details.push('<span class="tiku_name" id="span_'+ids[i]+'">'+ names[i]+ '<i class="glyphicon glyphicon-remove" onclick="removeItemblank('+type+',\''+ids[i]+'\',\''+names[i]+'\')"></i></span>');
	}
	
	$("#con_itemblank_"+type+" .tiku_name").remove();
	$("#con_itemblank_"+type).prepend(details.join(""));
}

/** 去除一个题库 */
function removeItemblank(type, id, name){
	$("#con_itemblank_"+type+" #span_"+id).remove();
	
	var idsStr = $("#"+type+"_itemblank_ids_str").val();
	var namesStr = $("#"+type+"_itemblank_names_str").val();
	
	$("#"+type+"_itemblank_ids_str").val(idsStr.replace(id+",", ""));
	$("#"+type+"_itemblank_names_str").val(namesStr.replace(name+",", ""));
}

/** 关闭预览 */
function closePreview(){
	var _obj = $("#previewBtn");
	_obj.text("试卷预览");
	_obj.attr("onclick", "previewPaper()");
	$("#preview_con").html("");
}

/** 生成预览 */
function previewPaper(){
	var _obj = $("#previewBtn");
	if(!validateQuestions()){
		mySureDialog("请先选择试题或指定组卷策略后再进行预览");
		return;
	}
	
	if($("#generate_type").val() == 2){
		$("#preview_con").load(basepath+"/base/admin/itest/testpaper/getQuestionInfo.list", {"questionIds":$("#questionIds").val(), "paperId":$("#paperId").val()}, function (){
		});
	} else{
	    var data =$.param($("#accordion :input"));
		
	    $("#preview_con").load(basepath+"/base/admin/itest/testpaper/getAutoQuestions.list", data, function (ret){
		});
	}
	_obj.text("关闭预览");
	_obj.attr("onclick", "closePreview()");
}

/** 关联试题 */
function updateEntityNext(id){
	window.location.href = basepath+"/base/admin/itest/testpaper/relatequestion.xhtml?paperId="+id;
}

/** 修改 */
function updateEntity(id){
	window.location.href = basepath+"/base/admin/itest/testpaper/update.xhtml?id="+id;
}

/** 返回到管理页 */
function cancelInsert(){
	window.location.href = basepath+"/base/admin/itest/testpaper/testpaper.xhtml";
}

/** 添加错误信息 */
function addError(id){
	$("#con_"+id).addClass("has-error");
}
function removeError(id){
	$("#con_"+id).removeClass("has-error");
}
function addError2(id){
	$("#con_"+id).addClass("you-error");
}
function removeError2(id){
	$("#con_"+id).removeClass("you-error");
}
function show1Hide2(id){
	$("#tip_"+id).removeClass("hidden");
	
	$("#tip2_"+id).addClass("hidden");
}
function show2Hide1(id){
	$("#tip2_"+id).removeClass("hidden");
	
	$("#tip_"+id).addClass("hidden");
}

/**
 * 全部选中
 */
function checked_all(obj){
	if($(obj).attr("checked") == "checked"){
		$("input[name='ids']").each(function(){
			$(this).attr("checked","checked");
			$(this).parent().addClass("checked");
		});
	}else{
		$("input[name='ids']").each(function(){
			$(this).removeAttr("checked");
			$(this).parent().removeClass("checked");
		});
	}
}

/** 更新页内导航样式 */
function updateTriangle(id){
	$.each($(".triangle"), function (){
		var _this = $(this);
		if(_this.attr("id") == id){
//			if(_this.addClass.indexOf("glyphicon-chevron-left") > 0){
				_this.addClass("glyphicon-chevron-down");
				_this.removeClass("glyphicon-chevron-left");
//			}
		} else{
			_this.removeClass("glyphicon-chevron-down");
			_this.addClass("glyphicon-chevron-left");
		}
	})
//	removeClass("glyphicon-chevron-down");
//	$(".triangle").addClass("glyphicon-chevron-left");
//	$("#"+id).addClass("");
}
