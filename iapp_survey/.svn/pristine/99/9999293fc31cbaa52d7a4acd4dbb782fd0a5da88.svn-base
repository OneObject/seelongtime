
var report_f = 0;
/**
 * 查询关键字使用总次数和总人数
 * @param keyword 关键字
 * @param callback 回调函数
 * 回传参数 map {"totalTimes":10,"totalUsers":10}
 */
function keywordReport(keyword,callback){
	if(report_f == 1){
		return;
	}
	
	report_f = 1;
	if(keyword == null || keyword == ""){
		showMsgDialog("关键字不能为空，请检查后提交");
		report_f = 0;
		return;
	}
	$.ajax({
		type:"POST",
		url:basepath+"/report/system/keyword.json",
		data:{"keyword":keyword},
		success:function(data){
			report_f = 0;
			callback(data);
		},
		error:function(date){
			report_f = 0;
			callback(null);
		}
	});
}

function showMsgDialog(content) {
	easyDialog
			.open({
				container : {
					header : '提示',
					content : '<div style="background-color: #ffffff;width:260px;height:20px;text-align:center;">'
							+ content + '</div>'
				},
				autoClose : 1200
			});
}

