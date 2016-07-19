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

function mySureDialog(msg){
	var html="<div style='width:350px;text-align:center;'>"+msg+"</div>";
	easyDialog.open({
		container : {
		    header : '提示',
			content : html
			,yesFn : function (){easyDialog.close(); }
		}
	});
}