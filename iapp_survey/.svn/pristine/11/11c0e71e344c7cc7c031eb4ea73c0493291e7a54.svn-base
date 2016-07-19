/** 验证分数 */
function validateScore(){
	var id = "score";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(isBlank(value)){
		obj.focus();
		addError(id);
		return false;
	}
	if(floatCheck(value) > 0){
		removeError(id);
		return true;
	}
	obj.focus();
	addError(id);
	return false;
}

/** 验证名称 */
function validateTitle(){
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

/** 验证备注 */
function v_mark(){
	var id = "mark";
	var max = $("#maxLength").text();
	if($("#"+id).val().length > max){
		addError(id);
		return false;
	} else{
		removeError(id);
		return true;
	}
}

/** 验证答案 */
function validateAnswer(){
	var id="replaceAll";
	if(answerFlag==1){
		if($("input[name='trueOrFalse']:checked").length>0){
			return true;
		} else{
			mySureDialog("必须选择一个答案！");
			return false;
		}
	} else if(answerFlag==2){
	  var i=$("input[name='qs_answer']").length;
	 $("input[name='qs_answer']").each(function(){
		 var content = $("#qs_option"+$(this).val());
			if(isBlank(content.val())){
				i=i-1;
				//mySureDialog("必须输入选项内容！");
				//content.focus();
				//return false;
				if(i>0){
				content.parent().parent().remove();
				}else{
					mySureDialog("必须选择一个答案！");
					return false;
				}
			}
	 });
		if($("input[name='qs_answer']:checked").length>0){
			return true;
		} else{
			mySureDialog("必须选择一个答案！");
			return false;
		}
	}else if(answerFlag==3){
		var radios = $("input[name='qm_answer']");
		var i=radios.length;
	
		for(var i=0; i<radios.length; i++){
			var content = $("#qs_option"+$(radios[i]).val());
			if(isBlank(content.val())){
				i=i-1;
				//mySureDialog("必须输入选项内容！");
				//content.focus();
				//return false;
				if(i>0){
				content.parent().parent().remove();
				}else{
					mySureDialog("必须选择一个答案！");
					return false;
				}
			}
		}
		if($("input[name='qm_answer']:checked").length>1){
			return true;
		} else{
			mySureDialog("多选题答案必须大于等于2个");
			return false;
		}
	}else if(answerFlag==4){
		if(isNotBlank($("textarea[name='ask_answer']").val())){
			return true;
		} else{
			mySureDialog("必须输入答案！");
			return false;
		}
	}
}


function validatename(){
	var itemid=$("#itemId").val();
	if(itemid=="" || itemid==null){
		addError("itemId");
		return false;
	}else{
		removeError("itemId");
		return true;
	}
}


var options = {
	beforeSubmit: validateAdd,  //提交前的回调函数
	success: submitSuccessBak,      //提交后的回调函数
	forceSync: true,
	//url: url,                 	//默认是form的action， 如果申明，则会覆盖
	type: "get",               	//默认是form的method（get or post），如果申明，则会覆盖
	//dataType: null,           	//html(默认), xml, script, json...接受服务端返回的类型
	clearForm: true,          		//成功提交后，清除所有表单元素的值
	resetForm: true,          		//成功提交后，重置所有表单元素的值
	timeout: 3000               	//限制请求的时间，当请求大于3秒后，跳出请求
}

var optionsUpdate = {
	beforeSubmit: validateUpdate,  //提交前的回调函数
	success: submitSuccessBak,      //提交后的回调函数
	forceSync: true,
	//url: url,                     	//默认是form的action， 如果申明，则会覆盖
	type: "get",          	//默认是form的method（get or post），如果申明，则会覆盖
	//dataType: null,           	//html(默认), xml, script, json...接受服务端返回的类型
	clearForm: true,          		//成功提交后，清除所有表单元素的值
	resetForm: true,          		//成功提交后，重置所有表单元素的值
	timeout: 3000               	//限制请求的时间，当请求大于3秒后，跳出请求
}

function submitSuccessBak(ret){
	if(ret.flag){
		myAutoHideDialog(ret.message, "success", function(){window.location.href = basepath+"/base/admin/itest/testquestion/testquestion.xhtml"});
	} else{
		mySureDialog(ret.message);
	}
}

$(function (){
	$("#addForm").ajaxForm(options);
	$("#updateForm").ajaxForm(optionsUpdate);
})


/** 验证增加 */
function validateAdd(){
	if(validateScore() && validateTitle() && validateAnswer() && v_mark() && validatename()){
		return true;
	}
	return false;
}

/** 验证修改 */
function validateUpdate(){
	if(validateScore() && validateTitle() && validateAnswer() && v_mark() && validatename()){
		return true;
	}
	return false;
}

function cancelAdd(){
	window.location.href = basepath+"/base/admin/itest/testquestion/testquestion.xhtml";
}

/** 添加错误信息 */
function addError(id){
	$("#con_"+id).addClass("has-error");
}
function removeError(id){
	$("#con_"+id).removeClass("has-error");
}

var flag=4;
function init(num){
	answerFlag = num;
	if(num == 2){
		var $html = '<div id="q_content">'+
					'<table class="col-md-8" id="qs_001">'+
					'<tr><td colspan="3" style="text-align: right;"><a class="btn btn-success right" href="javascript:void(0);" onclick="addOPT();"><i class="icon-plus"></i>添加</a></td></tr>'+
					'<tr>'+
						'<td height="30" style="line-height: 30px"><label class="radio-inline"><input type="radio" value="1" name="qs_answer"/></label><input type="hidden" value="1" name="qs_answerHid"/></td>'+
						'<td><textarea class="form-control " style="height:60px;" name="option1" id="qs_option1"  value=""></textarea></td>'+
						'<td style="padding-left:15px;"><a class="btn yellow" href="javascript:void(0);" onclick="delOPT(this);"><i class="icon-remove"></i>删除</a></td>'+
					'</tr>'+
					'<tr>'+
						'<td height="30" style="line-height: 30px"><label class="radio-inline"><input type="radio" value="2" name="qs_answer"/></label><input type="hidden" value="2" name="qs_answerHid"/></td>'+
						'<td><textarea class="form-control " style="height:60px;" name="option2" id="qs_option2"  value=""></textarea></td>'+
						'<td style="padding-left:15px;"><a class="btn yellow" href="javascript:void(0);" onclick="delOPT(this);"><i class="icon-remove"></i>删除</a></td>'+
					'</tr>'+
					'<tr>'+
						'<td height="30" style="line-height: 30px"><label class="radio-inline"><input type="radio" value="3" name="qs_answer"/></label><input type="hidden" value="3" name="qs_answerHid"/></td>'+
						'<td><textarea class="form-control " style="height:60px;" name="option3" id="qs_option3"  value=""></textarea></td>'+
						'<td style="padding-left:15px;"><a class="btn yellow" href="javascript:void(0);" onclick="delOPT(this);"><i class="icon-remove"></i>删除</a></td>'+
					'</tr>'+
					'<tr>'+
						'<td height="30" style="line-height: 30px"><label class="radio-inline"><input type="radio" value="4" name="qs_answer"/></label><input type="hidden" value="4" name="qs_answerHid"/></td>'+
						'<td><textarea class="form-control " style="height:60px;" name="option4" id="qs_option4"  value=""></textarea></td>'+
						'<td style="padding-left:15px;"><a class="btn yellow" href="javascript:void(0);" onclick="delOPT(this);"><i class="icon-remove"></i>删除</a></td>'+
					'</tr>'+
					'</table></div>';
		return $html;
	}else if(num == 3){
		var $html = '<div id="q_content">'+
					'<table class="col-md-8" id="qm_002">'+
					'<tr><td colspan="3" style="text-align: right;"><a class="btn btn-success right" href="javascript:void(0);" onclick="addOPT2();"><i class="icon-plus"></i>添加</a></td></tr>'+
					'<tr>'+
						'<td height="30" style="line-height: 30px" class=""><input type="checkbox" value="1" name="qm_answer"/><input type="hidden" value="1" name="qs_answerHid"/></td>'+
						'<td><textarea class="form-control " style="height:60px;" name="option1" id="qs_option1"  value=""></textarea></td>'+
						'<td style="padding-left:15px;"><a class="btn yellow" href="javascript:void(0);" onclick="delOPT(this);"><i class="icon-remove"></i>删除</a></td>'+
					'</tr>'+
					'<tr>'+
						'<td height="30" style="line-height: 30px" class=""><input type="checkbox" value="2" name="qm_answer"/><input type="hidden" value="2" name="qs_answerHid"/></td>'+
						'<td><textarea class="form-control " style="height:60px;" name="option2" id="qs_option2"  value=""></textarea></td>'+
						'<td style="padding-left:15px;"><a class="btn yellow" href="javascript:void(0);" onclick="delOPT(this);"><i class="icon-remove"></i>删除</a></td>'+
					'</tr>'+
					'<tr>'+
						'<td height="30" style="line-height: 30px" class=""><input type="checkbox" value="3" name="qm_answer"/><input type="hidden" value="3" name="qs_answerHid"/></td>'+
						'<td><textarea class="form-control " style="height:60px;" name="option3" id="qs_option3"  value=""></textarea></td>'+
						'<td style="padding-left:15px;"><a class="btn yellow" href="javascript:void(0);" onclick="delOPT(this);"><i class="icon-remove"></i>删除</a></td>'+
					'</tr>'+
					'<tr>'+
						'<td height="30" style="line-height: 30px" class=""><input type="checkbox" value="4" name="qm_answer"/><input type="hidden" value="4" name="qs_answerHid"/></td>'+
						'<td><textarea class="form-control " style="height:60px;" name="option4" id="qs_option4"  value=""></textarea></td>'+
						'<td style="padding-left:15px;"><a class="btn yellow" href="javascript:void(0);" onclick="delOPT(this);"><i class="icon-remove"></i>删除</a></td>'+
					'</tr>'+
					'</table></div>';
		return $html;
	}else if(num == 1){
		var $html = '<div class="radio-list" id="judge" >'+
						'<label class="radio-inline">'+
							'<input type="radio" value="1" name="trueOrFalse" id="trueOrFalse1" checked="checked">正确'+
						'</label> '+
						'<label class="radio-inline">'+
							'<input type="radio" value="0"  name="trueOrFalse" id="trueOrFalse2"> 错误'+
						'</label>'+
					'</div>';
		return $html;
	}
	else if(num == 4){
		var $html = '<div id="q_content">'+
						'<table class="col-md-6" id="tf_003">'+
							'<tr><td><textarea class="form-control" name="ask_answer" id="ask_answer" style="height:100px;"></textarea></td></tr>'+
						'</table>'+
					'</div>';
		return $html;
	}
}
function addOPT(){
	var optionNo = $("#optionNo").val();
	var optionCount = $("#optionCount").val();
	if(!isNaN(optionNo)){
		flag=optionNo;
		$("#optionNo").val(parseInt(optionNo)+1);
	}
	if(isNaN(optionNo)){
		if(!isNaN(optionCount)){
			flag=optionCount;
			$("#optionNo").val(parseInt(optionCount)+1);
		}
	}
	flag = flag+1;
	var html = '<tr>'+
					'<td height="30" style="line-height: 30px"><label class="radio-inline"><input type="radio" value="'+flag+'" name="qs_answer"/></label><input type="hidden" value="'+flag+'" name="qs_answerHid"/></td>'+
					'<td><textarea class="form-control " style="height:60px;" name="option'+flag+'" id="qs_option'+flag+'"  value=""></textarea></td>'+
					'<td style="padding-left:15px;"><a class="btn yellow" href="javascript:void(0);" onclick="delOPT(this);"><i class="icon-remove"></i>删除</a></td>'+
				'</tr>';
	$('#qs_001').append(html);
	var content = $('#q_content').get(0);
	var height = content.style.height;
	content.style.height=(parseInt(height)+40)+"px";
    App.initUniform();
}
function delOPT(is){
	$(is).parent().parent().remove();
	var content = $('#q_content').get(0);
	var height = content.style.height;
	content.style.height=(parseInt(height)-40)+"px";
}
function backQ(){
	$.colorbox.close();
}

var flag2 = 4;
function addOPT2(){
	var optionNo = $("#optionNo").val();
	var optionCount = $("#optionCount").val();
	if(!isNaN(optionNo)){
		flag2=optionNo;
		$("#optionNo").val(parseInt(optionNo)+1);
	}
	if(isNaN(optionNo)){
		if(!isNaN(optionCount)){
			flag2=optionCount;
			$("#optionCount").val(parseInt(optionCount)+1);
		}
	}
	flag2++;
	var $html = '<tr>'+
					'<td height="30" style="line-height: 30px" class=""><input type="checkbox" value="'+flag2+'" name="qm_answer"/><input type="hidden" value="'+flag2+'" name="qs_answerHid"/></td>'+
					'<td><textarea class="form-control " style="height:60px;" name="option'+flag2+'" id="qs_option'+flag2+'"  value=""></textarea></td>'+
					'<td style="padding-left:15px;"><a class="btn yellow" href="javascript:void(0);" onclick="delOPT(this);"><i class="icon-remove"></i>删除</a></td>'+
				'</tr>';
	$('#qm_002').append($html);
	var content = $('#q_content').get(0);
	var height = content.style.height;
	content.style.height=(parseInt(height)+40)+"px";
    App.initUniform();
}
