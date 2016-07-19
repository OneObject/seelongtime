$(function(){
	isAllCheck();
});

function isAllCheck(){
    if($("input[name='ids'][checked!='checked']").length == 0){
        $("#itemSelectAll").attr("checked", "checked");
    }
}

function onSave() {
    var items = document.getElementsByName("ids");
    var questionIds=$("#questionIds").val();
    for(var i=0;i <items.length;i++){
        if(items[i].checked==true){
            if(saveCheck(items[i].value)==false){
            	questionIds += items[i].value+",";
            }
        }
        else{
            if(saveCheck(items[i].value)==true){
               if(questionIds.indexOf(items[i].value) >= 0){
            	   questionIds = questionIds.replace(items[i].value+",", "");
               }
            }
        } 
    }
    $("#questionIds").val(questionIds);
}

function saveCheck(insertValue){
    var questionIds=$("#questionIds").val();
    var data = questionIds.split(",");
    for(var i=0;i<data.length;i++){
        if(data[i]==insertValue){
            return true;
        }
    }
    return false;
}

function itemSelectAll(){
    var itemSelectAll = document.getElementById("itemSelectAll");
    var items = document.getElementsByName("ids");
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