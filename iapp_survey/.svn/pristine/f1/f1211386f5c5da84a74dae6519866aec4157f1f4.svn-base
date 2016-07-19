$(function (){
	page(1);
});
$(function (){
	$("#updateForm").ajaxForm(optionsUpdate);
});
/**
 * 分页+搜索
 */
function page(i, fieldId) {
	var divId = "table_list";
	//AJAX提示
	loading(divId);
	var data = { "searchContent":$("#searchContent").val()};
	var url = basepath+"/mgr/credit/list.list";
	$("#"+divId).load(encodeURI(url), data, function(){

	});
	
}

function openCredit(status){
	var option = "";
	if(status == '0'){
		option = "禁用";
	}else {
		option = "启用";
	}
	var msg = "你确定要"+option+"积分吗？";
	if(confirm(msg)){
		var id = $("#statusId").val();
		$.ajax({
			type:"POST",
			url:basepath+"/mgr/credit/changestatus.json",
			data:{"id":id,"status":status},
			success:function(data){
				if(data == true){
					showMsgDialog(option+"积分成功！");
					var htm = "";
					if(status=="0"){
						htm = "<span class=\"btn btn-success table_add\" onclick=\"openCredit('1')\">&nbsp;启用积分</span>";
					} else {
						htm = "<span class=\"btn btn-danger table_add\" onclick=\"openCredit('0')\">&nbsp;禁用积分</span>";
					}
					$("#openStatusOption").html(htm);
				}else {
					showMsgDialog(option+"积分出错！");
				}
				
			},
			error:function(data){
				showMsgDialog("系统错误，请稍后尝试！");
			}
		});
	}
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

/** 添加 */
function insertEntity(){
	//window.location.href = basepath+"/base/admin/itest/examination/add.xhtml";
	window.location.href = basepath+"/mgr/itest/exam/step1.xhtml";
}

/** 详情 */
function detailEntity(id){
	window.location.href = basepath+"/base/admin/itest/examination/detail.xhtml?id="+id;
}

/** 修改 */
function updateEntity(id,ruleName){
	window.location.href = basepath+"/mgr/credit/update.xhtml?id="+id;
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

/**
 * 取消按钮
 */
function cancelBtn(){
	window.location.href = basepath+"/mgr/credit/creditmanage.xhtml";
}




/**
 *修改积分规则表单提交前的回调函数
 */
var optionsUpdate = {
		beforeSubmit: updateCreditRule,  //提交前的回调函数
		success: submitSuccessBak,      //提交后的回调函数
		forceSync: true,
		type:"post",
		timeout: 3000               	//限制请求的时间，当请求大于3秒后，跳出请求
}


/**
 * 修改积分规则
 */
function updateCreditRule(){
	//验证输入的数值是否是正整数
	var credit = $.trim($("#credit").val());
	var cycleTime = $.trim($("#cycleTime").val());
	var rewardNum = $.trim($("#rewardNum").val());
	var resourceRewardNum = $.trim($("#resourceRewardNum").val());
	if (credit.indexOf(".")==-1&&cycleTime.indexOf(".")==-1&&rewardNum.indexOf(".")==-1&&resourceRewardNum.indexOf(".")==-1){
		if (zeroIntCheck(credit)&&zeroIntCheck(cycleTime)&&zeroIntCheck(rewardNum)&&zeroIntCheck(resourceRewardNum)){
			return true;
		}
	}
	if(!zeroIntCheck(credit)||credit.indexOf(".")>0){
		$("#credit").css("borderWidth","1px");
		$("#credit").css("border-color","red");
		$("#errorcredit").css("color","red");
	}else{
		$("#credit").css("borderWidth","1px");
		$("#credit").css("border-color","#ABADB3");
		$("#errorcredit").css("color","#ABADB3");
	}
	if(!zeroIntCheck(cycleTime)||cycleTime.indexOf(".")>0){
		$("#cycleTime").css("borderWidth","1px");
		$("#cycleTime").css("border-color","red");
		$("#errorcycleTime").css("color","red");
	}else{
		$("#cycleTime").css("borderWidth","1px");
		$("#cycleTime").css("border-color","#ABADB3");
		$("#errorcycleTime").css("color","#ABADB3");
	}
	if(!zeroIntCheck(rewardNum)||rewardNum.indexOf(".")>0){
		$("#rewardNum").css("borderWidth","1px");
		$("#rewardNum").css("border-color","red");
		$("#errorrewardNum").css("color","red");
	}else{
		$("#rewardNum").css("borderWidth","1px");
		$("#rewardNum").css("border-color","#ABADB3");
		$("#errorrewardNum").css("color","#ABADB3");
	}
	if(!zeroIntCheck(resourceRewardNum)||resourceRewardNum.indexOf(".")>0){
		$("#resourceRewardNum").css("borderWidth","1px");
		$("#resourceRewardNum").css("border-color","red");
		$("#errorresourceRewardNum").css("color","red");
	}else{
		$("#resourceRewardNum").css("borderWidth","1px");
		$("#resourceRewardNum").css("border-color","#ABADB3");
		$("#errorresourceRewardNum").css("color","#ABADB3");
	}
	return false;
}


function submitSuccessBak(ret){
	if(ret.flag){
		myAutoHideDialog(ret.msg, "success", function (){location.href = basepath+"/mgr/credit/creditmanage.xhtml";})
	} else{
		mySureDialog(ret.msg);
	}
}





















