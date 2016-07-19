$(function (){
	page(1);
});

/**
 * 分页+搜索
 */
function page(i, fieldId) {
	var divId = "table_list";
	var max = $("#"+divId+" #page_max").val();
	var searchText = $("#searchContent").val();
	
	if (searchText === '输入标题/作者名称进行搜索')　{
		searchText = '';
	}
	//AJAX提示
	loading(divId);

	var data = {"searchContent": searchText,
			"page":i, "max":max, "r":Math.random()};
	var url = basepath+"/base/admin/iask/listforquestion.list";

	$("#"+divId).load(encodeURI(url), data, function(){

	});
	
}

/**
 * 删除
 * @param id
 */
function deleteQuestion(id,pageNo){
	var tempFn = function (){
		$.ajax({
			type:"POST",
			url:basepath+"/base/admin/iask/question/delete.json",
			data:{"id":id},
			success:function(data){
				if(data == "success"){
					var html="<div style='width:300px;text-align:center;'>操作成功</div>";
	    			easyDialog.open({
	    				container : {
	    				    header : '提示',
	    					content : html
	    				},
	    				autoClose : 1200,
	    				callback : function(){page(pageNo);}
	    			});
				} else {
					showSureMsgDialog("删除失败，请刷新后重新尝试！");
				}
    			
			},
			error:function(data){
				showSureMsgDialog("系统异常，请刷新后重新尝试！");
			}
		});
	}
	
	var html="<div style='width:300px;height:40px;text-align:center;'>确定要删除吗？</div>";
	easyDialog.open({
		container : {
		    header : '提示',
		    content : html,
		    yesFn : tempFn,
		    noFn : true
		}
	});
}

function showSureMsgDialog(content){
	easyDialog.open({
        container : {
            header : '提示',
            content : '<div style="background-color: #ffffff;width:300px;height:50px;text-align:center;">'+content+'</div>'
        },
        yesFn : function(){return true;}
    });
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
