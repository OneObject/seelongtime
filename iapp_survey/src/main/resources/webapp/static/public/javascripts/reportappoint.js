var f = 0;
/**
 * 添加预约报表任务
 * @param module 模块名，如课程course，考试exam等，根据该字段寻找处理该预约的业务方法
 * @param category 报表类别，识别具体的报表类型
 * @param name 报表名称
 * @param params 报表参数，类似与map对象，如var param = new Object();param.id="id";param.name="name";
 * @param remark 根据主要参数生成，用于具体标示预约任务详情
 */
function addAppoint(module,category,name,params,remark,resid){
	if(f == 1){
		return;
	}
	f = 1;
	if(module == null || module == "" || category == null || category == "" || name == null || name == ""){
		alert("参数不完整，请检查后提交!");
		f = 0;
		return;
	}
	var tempFn2 = function (){
		$.ajax({
			type:"POST",
			url:basepath+"/base/admin/report/appoint/add.json",
			data:{"module":module,"category":category,"reportname":name,"remark":remark,"resid":resid,"params":JSON.stringify(params)},
			success:function(data){
				f = 0;
				if(data.id != null){
					var html="<div style='width:300px;text-align:center;'>预约成功，可前去报表预约管理内查看结果！</div>";
	    			easyDialog.open({
	    				container : {
	    				    header : '提示',
	    					content : html
	    				},
	    				autoClose : 1500,
	    			});
	    			page(1);
				} else {
					var html="<div style='width:300px;text-align:center;'>预约失败，请重新尝试！</div>";
	    			easyDialog.open({
	    				container : {
	    				    header : '提示',
	    					content : html
	    				},
	    				autoClose : 1000,
	    			});
				}
			},
			error:function(date){
				f = 0;
				var html="<div style='width:300px;text-align:center;'>预约失败，请重新尝试！</div>";
    			easyDialog.open({
    				container : {
    				    header : '提示',
    					content : html
    				},
    				autoClose : 1000,
    			});
			}
		});
	};
	
	var tempFn3 = function(){
		f = 0;
		easyDialog.close();
	};
	var html="<div style='width:300px;height:50px;text-align:center;'>确定要进行预约查询吗？</div>";
	easyDialog.open({
		container : {
		    header : '提示',
		    content : html,
		    yesFn : tempFn2,
		    noFn : tempFn3
		}
	});
}



