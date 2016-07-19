
function setType(value){
	$("#rewardType").val(value);
}

function toSubmit(){
	var type = $("#rewardType").val();
	var credit = $("#credit").val();
	var remark = $("#remark").val();
	var experience=$("#experience").val();
	if(validateCredit() && validateRemark()){
		var totalCredit = $("#totalCredit").html();
		var name = $("#name").html();
		var confirmMsg = "";
		if(type == '0'){
			if(parseInt(credit)>parseInt(totalCredit)){
				confirmMsg = "扣除积分大于用户"+name+"的总积分，本次操作会将用户积分置为0，您确认要提交吗？";
				credit = totalCredit;
			} else{
				confirmMsg = "本次操作会扣除用户"+name+"积分"+credit+"，您确认要提交吗？";
			}
		} else {
			confirmMsg = "本次操作会奖励用户"+name+"积分"+credit+"，您确认要提交吗？";
		}
		if(confirm(confirmMsg)){
			var uid = $("#uid").val();
			$.ajax({
				type:"POST",
				url:basepath+"/mgr/credit/log/createcredit.json",
				data:{"uid":uid,"rewardType":type,"credit":credit,"remark":remark,"experience":experience},
				success:function(data){
					if(data == true){
						var total = $("#totalCredit").html();
						total = parseInt(total);
						credit = parseInt(credit);
						if(type == 1){
							total = total+credit;
						}else {
							total = total-credit;
						}
						$("#totalCredit").html(total);
						$("#credit").val("");
						$("#remark").val("");
						$("#experience").val("");
						showMsgDialog("操作成功。");
					} else {
						showMsgDialog("系统出错，请稍后重试。");
					}
				},
				error:function(data){
					showMsgDialog("系统出错，请稍后重试。");
				}
			});
		}
	}
}

function addError(id){
	$("#con_"+id).addClass("has-error").focus();
}
function removeError(id){
	$("#con_"+id).removeClass("has-error");
}
function validateCredit(){
	var id = "credit";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(value>10000000000){
		showConfirmDialog("积分值超过上限（10000000000），请重新输入！");
		obj.focus();
		addError(id);
		return false;
	}
	if(isBlank(value) || !intCheck(value) || value<1 ){
		obj.focus();
		addError(id);
		return false;
	}
	removeError(id);
	return true;
}


function validateRemark(){
	var id = "remark";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(isBlank(value) || value.length>100){
		obj.focus();
		addError(id);
		return false;
	}
	removeError(id);
	return true;
}

function goBack(){
	history.back();
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

function showConfirmDialog(content){
	easyDialog.open({
        container : {
            header : '提示',
            content : '<div style="background-color: #ffffff;width:320px;height:30px;text-align:center;">'+content+'</div>',
            yesFn : function (){return true;}
        }
    });
}