var zdata;

/** 真实姓名验证 */
function usernameValidate(){
	var id = "username";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(isNotBlank(value)){
		removeError(id);
		return true;
	}
	else{
		addError(id);
		return false;
	}
}

/** 昵称验证 */
function passwordValidate(){
	var id = "password";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(isNotBlank(value)){
		removeError(id);
		return true;
	}
	else{
		addError(id);
		return false;
	}
}

/**
 * 添加用户表单提交验证
 * @returns {Boolean}
 */
function loginValidate(){
	if(usernameValidate("", false) && passwordValidate("", false)){
		return true;
	}
	return false;
}

function login(){
	if(usernameValidate("", false) && passwordValidate("", false)){
		$.post(basepath+"/base/admin/dologin.xhtml", {"username":$("#username").val(), "password":$("#password").val()}, function (ret){
			if(ret.flag){
				window.location.href = basepath+"/base/admin/user/usermanage.xhtml";
			} else{
				alert(ret.message);
			}
		});
	}
}

/** 错误信息的显示控制 */
function addError(id){
	$("#"+id+"_con").addClass("has-error");
	$("#"+id).focus();
}
function removeError(id){
	$("#"+id+"_con").removeClass("has-error");
}
function show1Hide2(id){
	$("#"+id+"_tip").removeClass("hidden");
	
	if($("#"+id+"_tip2") != null){
		$("#"+id+"_tip2").addClass("hidden");
	}
}
function show2Hide1(id){
	$("#"+id+"_tip").addClass("hidden");
	
	if($("#"+id+"_tip2") != null){
		$("#"+id+"_tip2").removeClass("hidden");
	}
}






