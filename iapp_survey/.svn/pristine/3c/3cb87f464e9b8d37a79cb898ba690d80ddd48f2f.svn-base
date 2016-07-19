
$(function (){
	page(1);
});

var flag = true;
/**
 * 分页+搜索
 */
function page(i, fieldId) {
	flag = true;
	var divId = "table_list";
	var max = $("#"+divId+" #page_max").val();
	var searchContent = $("#searchContent").val();
	//AJAX提示
	loading(divId);

	var data = {"searchContent":searchContent,"page":i, "max":max, "r":Math.random() };
	var url = basepath+"/mgr/email/list.list";
	$("#"+divId).load(encodeURI(url), data, function(){
		
	});
}

function checked_all(o){
	if(flag){
		$("input[name='ids']").each(function(){
			$(this).attr("checked","checked");
			$(this).parent().addClass("checked");
		});
		flag = false;
	}else{
		$("input[name='ids']").each(function(){
			$(this).removeAttr("checked");
			$(this).parent().removeClass("checked");
		});
		flag = true;
	}
	
}



function deleteGroup(){
	var items = $("input[name='ids']:checked");
	var tempFn = function (){
    	$.post(basepath+"/mgr/email/delete.json", $.param(items), function (ret){
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

function toDetail(id){
	window.location.href = basepath + "/mgr/email/detail.xhtml?id="+id;
}

/**
 * 返回列表页
 */
function backToList(){
	window.history.go(-1);
}



