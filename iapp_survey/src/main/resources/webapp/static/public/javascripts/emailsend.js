
var f = 0;
/**
 * 发送邮件
 * @param uids 发送用户ID，多个用户用英文逗号隔开
 * @param type 邮件类别，如0用户账号开通通知
 * @param tosendtime 定时发送时间，为空表示立即发送
 * @param remark 备注信息
 */
function addEmail(uids,type,tosendtime,remark){
	if(f == 1){
		return;
	}
	f = 1;
	if(uids == null || type == ""){
		showAutoDialog("参数不完整，请检查后提交",1000);
		f = 0;
		return;
	}
	$.ajax({
		type:"POST",
		url:basepath+"/mgr/email/add.json",
		data:{"uids":uids,"type":type,"tosendtime":tosendtime,"remark":remark},
		success:function(data){
			f = 0;
			if(data == "1"){
    			showAutoDialog("发送成功，请去邮件发送管理内查看",1500);
			} else if(data == "2"){
    			showAutoDialog("发送参数不完整，发送失败",1000);
			} else if(data == "3"){
    			showAutoDialog("邮件模板不存在，发送失败",1000);
			} else if(data == "4"){
				var html="<div style='width:350px;text-align:center;'>发送失败,未设置服务邮箱</div><div style='width:350px;text-align:center;'>请在\"系统管理－>企业配置－>邮件配置\"内设置</div>";
				easyDialog.open({
					container : {
					    header : '提示',
						content : html
						,yesFn : function (){return true; }
					}
				});
			}else {
				showAutoDialog("发送失败,请重新尝试",1000);
			}
		},
		error:function(date){
			f = 0;
			showAutoDialog("发送失败,请重新尝试",1000);
		}
	});
}

function showAutoDialog(msg,time){
	var html="<div style='width:300px;text-align:center;'>"+msg+"</div>";
	easyDialog.open({
		container : {
		    header : '提示',
			content : html
		},
		autoClose : time
	});
}

