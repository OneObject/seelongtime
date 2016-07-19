$(function(){
	isAllCheck();
});

function isAllCheck(){
    if($("input[name='uids'][checked!='checked']").length == 0){
        $("#itemSelectAll").attr("checked", "checked");
    }
}

function onSave() {
    var items = document.getElementsByName("uids");
    var userids=$("#userids").val();
    for(var i=0;i <items.length;i++){
        if(items[i].checked==true){
            if(saveCheck(items[i].value)==false){
            	userids += items[i].value+",";
            }
        }
        else{
            if(saveCheck(items[i].value)==true){
               if(userids.indexOf(items[i].value) >= 0){
            	   userids = userids.replace(items[i].value+",", "");
               }
            }
        } 
    }
    $("#userids").val(userids);
}

function saveCheck(insertValue){
    var userids=$("#userids").val();
    var data = userids.split(",");
    for(var i=0;i<data.length;i++){
        if(data[i]==insertValue){
            return true;
        }
    }
    return false;
}

function itemSelectAll(){
    var itemSelectAll = document.getElementById("itemSelectAll");
    var items = document.getElementsByName("uids");
    if(itemSelectAll.checked==true){
        for(var i=0;i <items.length;i++){
            items[i].checked=true;
        }
    }else{
        for(var i=0;i <items.length;i++){
            items[i].checked=false;
        }
    }
    onSave();
}


function user_exam_add(){
	var result = $("#userids").val();
	if(isBlank(result)){
		mySureDialog("您没有选择任何用户！");
		return ;
	}
	
	var url = basepath+"/base/admin/authorize/doadd.xhtml";
	var temp = $("#userids, #rcategory, #rid, #scategory");
	
	$.post(url, temp, function(ret){
		if(ret.flag){
			myAutoHideDialog(ret.message, "success");
			$("#userids").val("")
			page(1);
		} else{
			mySureDialog(ret.message);
		}
	});

}