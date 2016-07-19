$(function (){
	
});

/** 验证名称 */
function validateexamName(){
	var id = "examName";
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

/** 验证编号 */
function validateexamNo(){
	var id = "examNo";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(isBlank(value)){
		obj.focus();
		addError(id);
		return false;
	}
	if(!numberCheck(value)){
		obj.focus();
		addError(id);
		return false;
	}
	removeError(id);
	return true;
}

/** 验证关键字 */
function validatekeyword(){
	var id = "keyword";
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

/** 验证考试时长 */
function validateexamDate(){
	var id = "examDate";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(isBlank(value)){
		obj.focus();
		addError(id);
		return false;
	}
	if(!intCheck(value)){
		obj.focus();
		addError(id);
		return false;
	}
	removeError(id);
	return true;
}

/** 验证负责人 */
function validatemanager(){
	var id = "manager";
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

/** 验证试卷数 */
function validatepaperNum(){
	var id = "paperNum";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(isBlank(value) || !intCheck(value) || value<1 || value>20){
		obj.focus();
		addError(id);
		return false;
	}
	removeError(id);
	return true;
}

/** 验证重考次数 */
function validateexamTimes(){
	var id = "examTimes";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(isBlank(value) || !numberCheck(value) || value<0 || value>100){
		obj.focus();
		addError(id);
		return false;
	}
	removeError(id);
	return true;
}

/** 验证开始结束时间 */
function validatetime(){
	var id = "time";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(isBlank($("#startTime").val()) || isBlank($("#endTime").val())){
		obj.focus();
		addError(id);
		return false;
	}
	removeError(id);
	return true;
}

/** 验证试卷 */
function validatepaperId(){
	var id = "paperId";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(isBlank(value)){
		obj.focus();
		addError(id);
		return false;
	}
	if(parseInt(value)<0){
		obj.focus();
		addError(id);
		return false;
	}
	removeError(id);
	return true;
}

/** 验证备注 */
function v_mark(){
    var max = $("#maxLength").text();
    var id = "mark";
    if($("#"+id).val().length > max){
        addError(id);
		obj.focus();
        return false;
    } else{
        removeError(id);
        return true;
    }
}

var options = {
//	target: '#output',          	//把服务器返回的内容放入id为output的元素中    
	beforeSubmit: validateAdd,  //提交前的回调函数
	success: submitSuccessBak,      //提交后的回调函数
	forceSync: true,
	//url: url,                 	//默认是form的action， 如果申明，则会覆盖
	//type: type,               	//默认是form的method（get or post），如果申明，则会覆盖
	//dataType: null,           	//html(默认), xml, script, json...接受服务端返回的类型
	clearForm: true,          		//成功提交后，清除所有表单元素的值
	resetForm: true,          		//成功提交后，重置所有表单元素的值
	timeout: 3000               	//限制请求的时间，当请求大于3秒后，跳出请求
}

var optionsUpdate = {
//		target: '#output',          	//把服务器返回的内容放入id为output的元素中    
		beforeSubmit: validateUpdate,  //提交前的回调函数
		success: submitSuccessBak,      //提交后的回调函数
		forceSync: true,
		//url: url,                 	//默认是form的action， 如果申明，则会覆盖
		//type: type,               	//默认是form的method（get or post），如果申明，则会覆盖
		//dataType: null,           	//html(默认), xml, script, json...接受服务端返回的类型
		clearForm: true,          		//成功提交后，清除所有表单元素的值
		resetForm: true,          		//成功提交后，重置所有表单元素的值
		timeout: 3000               	//限制请求的时间，当请求大于3秒后，跳出请求
}

function submitSuccessBak(ret){
	if(ret.flag){
		myAutoHideDialog(ret.message, "success", function (){location.href = basepath+"/base/admin/itest/examination/examination.xhtml";})
	} else{
		mySureDialog(ret.message);
	}
}

$(function (){
	$("#addForm").ajaxForm(options);
	$("#updateForm").ajaxForm(optionsUpdate);
});

/** 验证增加 */
function validateAdd(){
	if(validateexamName() && validateexamNo() && validatekeyword() && validateexamDate() && validatemanager()
			  && validateexamTimes() && validatetime() && validatepaperId() && v_mark() ){
		var temp = false;
		if($("#paperType").val() == 1){
			if(validatepaperNum()){
				temp = true;
			}
		} else{
			temp = true;
		}
		return temp; 
	}
	return false;
}

/** 验证修改 */
function validateUpdate(){
	if(validateexamName() && validateexamNo() && validatekeyword() && validateexamDate() && validatemanager()
			  && validateexamTimes() && validatetime() && validatepaperId() && v_mark() ){
		var temp = false;
		if($("#paperType").val() == 1){
			if(validatepaperNum()){
				temp = true;
			}
		} else{
			temp = true;
		}
		return temp; 
	}
	return false;
}

/** 保存试卷id */
function addPaper(){
	var paperIds = $("input[name='ids']:checked");
	if(paperIds.length == 0){
		easyDialog.close();
		return ;
	}
	var paperId = $(paperIds[0]).val();
	$("#paperId").val(paperId);
	var paperType = $("#generate_type"+paperId).val();
	$("#paperType").val(paperType);
	$("#paperName").val($("#name_"+paperId).text());
	
	if(paperType == 1){
		myShow("con_paperNum");
	} else {
		myHide("con_paperNum");
	}
	easyDialog.close();
	
	validatepaperId();
}

/** 选择试题*/
function choose_paper(){
	easyDialog.open({
		container : 'dialogBank',
		fixed : false
	});
}

/**
 * 分页+搜索
 */
function page(i, fieldId) {
	var divId = "table_list";
	
	var order = getOrder(divId, fieldId);
	var max = $("#"+divId+" #page_max").val()

	var data = {"page":i, "max":max, "r":Math.random(), "paper_name":$("#paper_name").val(),
			"paper_id":$("#paperId").val(), "paper_descript":$("#paper_descript").val(), "paper_type":$("#paper_type").val(), 
			"orderField":order.orderField, "orderDirection":order.orderDirection };
	var url = basepath+"/base/admin/itest/testpaper/chooseList.list";
	$("#"+divId).load(encodeURI(url), data, function(){
		choose_paper();
	});
}

function cancelInsert(){
	window.location.href = basepath+"/base/admin/itest/examination/examination.xhtml";
}

/** 添加错误信息 */
function addError(id){
	$("#con_"+id).addClass("has-error");
//	myShow("tip_"+id);
}
function removeError(id){
	$("#con_"+id).removeClass("has-error");
//	myHide("tip_"+id);
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

