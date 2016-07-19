$(function (){
	page(1);
});

/**
 * 分页+搜索
 */
function page(i, fieldId) {
	var divId = "table_list";
	
	var order = getOrder(divId, fieldId);
	var max = $("#"+divId+" #page_max").val()
	
	//AJAX提示
	loading(divId);
	var data = {"page":i, "max":max, "r":Math.random(), 
			 "orderDirection":order.orderDirection,"num":$("#num").val() };
	var url = basepath+"/base/admin/mercer/loginip/list.list";
	$("#"+divId).load(encodeURI(url), data, function(){
		App.initUniform();
	});
}


























