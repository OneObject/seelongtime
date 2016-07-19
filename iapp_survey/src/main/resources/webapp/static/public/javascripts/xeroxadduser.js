var zdata;
var userNameIsRepart = false;
/** 真实姓名验证 */
function nameValidate(){
	var id = "name";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(isNotBlank(value)){
		removeError(id);
		return true;
	}else{
		addError(id);
		return false;
	}
}

/** 昵称验证 */
function nickNameValidate(){
	var id = "nickName";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(isNotBlank(value)){
		return true;
	}
	if(usernameFormatCheck(value)){
		removeError(id);
		return true;
	} else{
		addError(id);
		return false;
	}
}

/** 电话验证 */
function phoneValidate(){
	var id = "phone";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(phoneFormatCheck(value)){
		removeError(id);
		return true;
	} else {
		addError(id);
		return false;
	}
}

/** 用户名验证 */
function usernameValidate(userId, conSelf){
	var id = "userName";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	var s = false;/*usernameFormatCheck(value)*/
	if(true){
		dwr.engine.setAsync(false);			
		DWRService.uniqueValidate("user","username", value, userId, conSelf, true, function (ret){
			s = ret;
		});
		dwr.engine.setAsync(true);
		if(s){
			show3Hide1_2(id);
			removeError(id);
			return s;
		} else{
			show2Hide1(id);
			addError(id);
			return s;
		}
	} else{
		show1Hide2(id);
		addError(id);
		return s;
	}
}

/** 添加用户时的用户名验证 */
function checkUserName(){
	  var userName = $.trim($("#userName").val());
	  var id = "userName";
	  if (userName.length==0){
		  show1Hide2(id);
		  addError(id);
		  userNameIsRepart = false;
	  }else{
		  $.ajax({
			  type:"POST",
			  url:basepath+"/base/admin/xeroxuser/uniqueValidate.json",
			  data:{"username":userName,"uid":''},
			  success:function(data){
				  if (data){
					  userNameIsRepart = false;
					  show2Hide1(id);
					  addError(id);
				  }else{
					  userNameIsRepart = true;
					  show3Hide1_2(id);
					  removeError(id);
				  }
			  }
		  });
	  }
}

/** 用户密码不能为空验证*/
function checkPassword(){
	  var password = $.trim($("#password").val());
	  var id = "password";
	  if (password.length < 6){
		  show1Hide2(id);
		  addError(id);
		  return false;
	  } else{
		  show1Hide2(id);
		  removeError(id);
		  return true;
	  }
}

/** 修改用户时的用户名验证 */
function checkUpdateUserName(uid){
	 var userName = $.trim($("#userName").val());
	  var id = "userName";
	  
	  if (userName.length==0){
		  show1Hide2(id);
		  addError(id);
		  userNameIsRepart = false;
	  }else{
		  $.ajax({
			  type:"POST",
			  url:basepath+"/base/admin/xeroxuser/uniqueValidate.json",
			  data:{"username":userName,"uid":uid},
			  success:function(data){
				  if (data){
					  userNameIsRepart = false;
					  show2Hide1(id);
					  addError(id);
				  }else{
					  userNameIsRepart = true;
					  show3Hide1_2(id);
					  removeError(id);
				  }
			  }
		  });
	  }
}

/**手机验证*/
function mobileValidate(userId, conSelf){
	var id = "mobile";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	
	if(value==''){
		removeError(id);
		return true;
	}
	var s = false;
	if(mobileFormatCheck(value)){
		dwr.engine.setAsync(false);
		DWRService.uniqueValidate("user", "mobile", value, userId, conSelf, true, function (ret){
			s = ret;
		});
		dwr.engine.setAsync(true);
		if(s){
			show3Hide1_2(id);
			removeError(id);
			return s;
		} else{
			show2Hide1(id);
			addError(id);
			return s;
		}
	} else{
		show1Hide2(id);
		addError(id);
		return s;
	}
}



/**邮箱验证*/
function emailValidate(userId, conSelf){
	var id = "email";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(value==''){
		show1Hide2(id);
		  addError(id);
		  return false;
	}
	var s = false;
	if(emailFormatCheck(value)){
		dwr.engine.setAsync(false);
		DWRService.uniqueValidate("user", "email", value, userId, conSelf, true, function (ret){
			s = ret;
		});
		dwr.engine.setAsync(true);
		if(s){
			show3Hide1_2(id);
			removeError(id);
			return s;
		} else{
			show2Hide1(id);
			addError(id);
			return s;
		}
	} else{
		show1Hide2(id);
		addError(id);
		return s;
	}
}

/** 组织验证 */
function orgIdValidate(){
	var id = "orgId"
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(isNotBlank(value)){
		removeError(id);
		return true;
	} else {
		addError(id);
		return false;
	}
}

function jobLevelIdValidate(){
	var id="jobLevelId";
	var obj=$("#"+id);
	var value=$.trim(obj.val());
	if(isNotBlank(value)){
		removeErrot(id);
		return true;
	}else{
		addError(id);
		return false;
	}
}



/**身份证验证*/
function certificateCodeValidate(){
	var type = $("#certificateType").val();
	var id = "certificateCode";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(isBlank(value)){
		return true;
	}
	if(type != "1"){
		return true;
	}
	if(isIdCardNo(value)){
		show3Hide1_2(id);
		removeError(id);
		return true;
	} else {
		addError(id);
		return false;
	}
}

/**手机验证*/
/*function mobileValidate(){
	var id = "mobile";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(isBlank(value)){
		return true;
	}
	if(mobileFormatCheck(value)){
		removeError(id);
		return true;
	} else {
		addError(id);
		return false;
	}
}
*/
var options = {
//	target: '#output',          	//把服务器返回的内容放入id为output的元素中    
	beforeSubmit: addUserValidate,  //提交前的回调函数
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
		beforeSubmit: updateUserValidate,  //提交前的回调函数
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
		myAutoHideDialog(ret.message, "success", function (){location.href = basepath+"/base/admin/xeroxuser/usermanage.xhtml";})
	} else{
		mySureDialog(ret.message);
	}
}

$(function (){
	$("#form_sample_1").ajaxForm(options);
	$("#form_sample_2").ajaxForm(optionsUpdate);
});

/**
 * 添加用户表单提交验证
 * @returns {Boolean}
 */
function addUserValidate(){
	var userName = $.trim($("#userName").val());
	var re = /[\u4e00-\u9fa5]/; 
	if(re.test(userName)){
		alert("running");
		show1Hide2("userName");
		addError("userName");
		return false;
	}
	if (userName.length==0){
		  show1Hide2("userName");
			addError("userName");
			return false;
	}
	if(checkPassword()&&nameValidate()&&emailValidate("", false) && certificateCodeValidate() && mobileValidate("",false) && orgIdValidate()&&userNameIsRepart)
	{
		return true;
	}
	return false;
}

/**
 * 更新用户表单提交验证
 * @returns {Boolean}
 */
function updateUserValidate(){
	var userId = $("#id").val();
	var userName = $.trim($("#userName").val());
	var re = /[\u4e00-\u9fa5]/; 
	if(re.test(userName)){
		show1Hide2("userName");
		addError("userName");
		return false;
	}
	if (userName.length==0){
		  show1Hide2("userName");
			addError("userName");
			return false;
	}else{
		userNameIsRepart = true;
		if(checkPassword()&&nameValidate()&&emailValidate(userId, true) && certificateCodeValidate() && mobileValidate(userId,true) && orgIdValidate() && userNameIsRepart){
			return true;
		}
	}
	return false;
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
		$("#"+id+"_tip3").addClass("hidden");
	}
}
function show2Hide1(id){
	$("#"+id+"_tip").addClass("hidden");
	$("#"+id+"_tip3").addClass("hidden");
	if($("#"+id+"_tip2") != null){
		$("#"+id+"_tip2").removeClass("hidden");

	}
}
function show3Hide1_2(id){
	$("#"+id+"_tip3").removeClass("hidden");
	$("#"+id+"_tip2").addClass("hidden");
	$("#"+id+"_tip").addClass("hidden");
}

function setFontCss() {
	return {color:"#000000",size:"20px",height: "24px",family:"微软雅黑"};
};
var setting = {
	view: {
		showLine: false,
		fontCss: setFontCss
	},
	data: {
		simpleData: {
			enable: true
		}
		,key: {
			title: "title"
		}
	},
	check: {
		enable: true,
		//nocheckInherit: false,
		autoCheckTrigger:false,
		chkStyle: "checkbox",
		chkboxType: { "Y": "", "N": "" }
	},
};

var settingclick = {
	view: {
		showLine: false,
		fontCss: setFontCss
	},
	data: {
		simpleData: {
			enable: true
		}
		,key: {
			title: "title"
		}
	}
};

var code;		

function showCode(str) {
	if (!code) code = $("#code");
	code.empty();
	code.append("<li>"+str+"</li>");
}

var btnFn = function(){
	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	var selectNodes = treeObj.getSelectedNodes();
	$("#orgId").val(selectNodes[0].id);
	$("#orgName").val(selectNodes[0].name);
	$("#choose_org").attr("onclick", "open_dialog('"+selectNodes[0].id+"','1')");
	easyDialog.close();
};

var jobLevelBtnFn=function(){
	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	var selectNodes = treeObj.getSelectedNodes();
	$("#jobLevelId").val(selectNodes[0].id);
	$("#jobLevelName").val(selectNodes[0].name);
	$("#choose_org").attr("onclick", "jobLevel_dialog('"+selectNodes[0].id+"')");
	easyDialog.close();
};


var btnMulti = function(){
	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	var selectNodes = treeObj.getCheckedNodes();
	var orgIds="";
	var orgNames="";
	for(var i=0;i<selectNodes.length;i++){
		var node = selectNodes[i];
		if(i!=selectNodes.length-1){
			orgIds = orgIds + node.id +",";
			orgNames = orgNames +node.name +",";
		}
		else{
			orgIds = orgIds + node.id;
			orgNames = orgNames +node.name;
		}
		
		
	}
	$("#orgId").val(orgIds);
	$("#orgName").val(orgNames);
	easyDialog.close();
};

function jobLevel_dialog(nodeId){
	var url=basepath+"/base/admin/joblevel/getJobLevels.json";
	$.ajax({
		url:url,
		type:"post",
		data:{"treeId":nodeId},
		success:function(data){
			zdata = data;
			var str='<div id="dialog_bumen"><div class="zTreeDemoBackground"><ul id="treeDemo" class="ztree"></ul></div></div>';
			easyDialog.open({
				  container : {
					    header : '选择职级',
					    content :str,
					    yesFn : jobLevelBtnFn,
					    noFn : true
					  },
				  fixed : false
				  , callback : jobLevelIdValidate_calback
				});
			$.fn.zTree.init($("#treeDemo"), settingclick, zdata);
			 $("#treeDemo").find("a[onclick='true']").click();
			 var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
		}
	});
	
	var jobLevelIdValidate_calback = function(){
		jobLevelIdValidate();
	}
	
}


function open_dialog(nodeId,type){
	var url = basepath+"/base/admin/organization/getorgs.xhtml";
	$.ajax({
		url:url,
		type:"POST",
		data:{"treeId":nodeId,"type":type},
		//contentType: "application/json; charset=utf-8",
		success:function(data){
			zdata = data;
			var str='<div id="dialog_bumen"><div class="zTreeDemoBackground"><ul id="treeDemo" class="ztree"></ul></div></div>';
			

			if(type=="1"){
				easyDialog.open({
					  container : {
						    header : '选择部门',
						    content :str,
						    yesFn : btnFn,
						    noFn : true
						  },
					  fixed : false
					  , callback : orgIdValidate_calback
					});
				$.fn.zTree.init($("#treeDemo"), settingclick, zdata);
				 $("#treeDemo").find("a[onclick='true']").click();
			}
			else{
				easyDialog.open({
					  container : {
						    header : '选择部门',
						    content :str,
						    yesFn : btnMulti,
						    noFn : true
						  },
					  fixed : false
					  , callback : orgIdValidate_calback
					});
				$.fn.zTree.init($("#treeDemo"), setting, zdata);
			}
			
			
			var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
			if(nodeId != null && nodeId != ""){
				//TODO 以后这里要传入id
			}
		}
	});
	
	
	var orgIdValidate_calback = function(){
		orgIdValidate();
	}
}		





