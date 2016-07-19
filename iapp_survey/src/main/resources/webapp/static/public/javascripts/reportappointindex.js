
$(function (){
	page(1);
});

var flag = true;
/**
 * 分页+搜索
 */
function page(i, fieldId) {
	flag = true;
	var divId = "yuyue_list";
	var max = $("#"+divId+" #page_max").val();
	
	var model = $("#model").val();
	var resid = $("#courseid").val();
	//AJAX提示
	loading(divId);

	var data = {"page":i, "max":max, "model":model ,"resid":resid,"r":Math.random()};
	var url = basepath+"/base/admin/report/appoint/list.list";
	$("#"+divId).load(encodeURI(url), data, function(){
		
	});
}

function del(id){
	var tempFn = function (){
    	$.post(basepath+"/base/admin/report/appoint/delete.json", {"id":id }, function (ret){
    		if(ret == "success"){
    			var html="<div style='width:300px;text-align:center;'>删除成功！</div>";
    			easyDialog.open({
    				container : {
    				    header : '提示',
    					content : html
    				},
    				autoClose : 1000,
    				callback : function(){page(1);}
    			});
    		} else{
    			var html="<div style='width:300px;text-align:center;'>删除失败！</div>";
    			easyDialog.open({
    				container : {
    				    header : '提示',
    					content : html
    				},
    				autoClose : 1000
    			});
    			return false;
    		}
    	});
	};
	var html="<div style='width:300px;height:50px;text-align:center;'>确定要删除吗？</div>";
	easyDialog.open({
		container : {
		    header : '提示',
		    content : html,
		    yesFn : tempFn,
		    noFn : true
		}
	});
}

