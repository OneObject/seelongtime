$(function (){
	page(1);
});

/**
 * 分页+搜索
 */
function page(i, fieldId) {
	var divId = "table_list";
	var max = $("#"+divId+" #page_max").val();
	
	//AJAX提示
	loading(divId);

	var data = {"searchContent":$("#searchContent").val(),
			"page":i, "max":max, "r":Math.random()};
	var url = basepath+"/mgr/credit/log/list.list";
	$("#"+divId).load(encodeURI(url), data, function(){

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
