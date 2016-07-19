/**
 * easydialog弹出框自动关闭时间常量
 */

/** 警告 */
var warn_time = 1000;
/** 成功 */
var success_time = 1000;
/** 失败，有失败信息 */
var fail_msg_time = 2000;
/** 失败，无失败信息 */
var fail_time = 1000;
/** 异常 */
var error_time = 1000;
/** 测试 */
var default_time = 1000;

/** 带有确定、取消按钮的弹出框 */
function confirmDlg(msg, fun){
	myConfirmDialog(msg, fun);
}

/** 带有确定、取消按钮的弹出框 */
function myConfirmDialog(msg, fun){
	var html="<div style='width:350px;text-align:center;'>"+msg+"</div>";
	easyDialog.open({
		container : {
		    header : '提示',
		    content : html,
		    yesFn : fun,
		    noFn : true
		}
	});
}

/** 带有确定按钮的弹出框 */
function sureDlg(msg){
	mySureDialog(msg);
}

/** 带有确定按钮的弹出框 */
function mySureDialog(msg){
	var html="<div style='width:350px;text-align:center;'>"+msg+"</div>";
	easyDialog.open({
		container : {
		    header : '提示',
			content : html
			,yesFn : function (){return true; }
		}
	});
}

/** 自动关闭的弹出框 */
function autoDlg(msg, flag, callback){
	myAutoHideDialog(msg, flag, callback);
}

/** 自动关闭的弹出框 */
function myAutoHideDialog(msg, flag, callback){
	msg = isBlank(msg)? "警告！":msg;
	flag = isBlank(flag)? "default":flag;
	
	var html="<div style='width:350px;text-align:center;'>"+msg+"</div>";
	easyDialog.open({
		container : {
		    header : '提示',
			content : html
		},
		autoClose : getTime(flag),
		callback : function(){
			if(null != callback){
				callback();
			}
		}
	});
}

function getTime(str){
	switch (str) {
	case "warn":
		return warn_time;break;
	case "success":
		return success_time;break;
	case "fail_msg":
		return fail_msg_time;break;
	case "fail":
		return fail_time;break;
	case "error":
		return error_time;break;
	case "default":
		return default_time;break;
	default:
		return success_time;break;
	}
}