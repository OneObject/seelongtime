$(function (){
	page(1);
});

/**
 * 分页+搜索
 */
function page(i, fieldId) {
	var divId = "table_list";
	//AJAX提示
	loading(divId);
	var uid = $("#uid").val();
	var data = {"uid":uid,"r":Math.random()};
	var url = basepath+"/mgr/credit/log/listfordetail.list";
	$("#"+divId).load(encodeURI(url), data, function(){

	});
	
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
