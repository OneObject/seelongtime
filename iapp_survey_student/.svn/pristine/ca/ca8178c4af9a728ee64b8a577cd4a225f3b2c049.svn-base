
function listFeed(){
	alert("runing");
	var divId = "feedList";
	//AJAX提示
	loading(divId);
	var data = {"r":Math.random()};
	
	var url = "${basepath}/feed/list.list";
	$("#"+divId).load(encodeURI(url), data, function(){
		
	});
}

listFeed();