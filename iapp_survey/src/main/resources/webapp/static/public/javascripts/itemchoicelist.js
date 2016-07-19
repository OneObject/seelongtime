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
    var idsStr=$("#idsStr").val();
    var namesStr = $("#namesStr").val();
    for(var i=0;i <items.length;i++){
        if(items[i].checked==true){
            if(saveCheck(items[i].value)==false){
            	idsStr += items[i].value+",";
                namesStr += $("#name_"+items[i].value).attr("title")+",";
            }
        }
        else{
            if(saveCheck(items[i].value)==true){
               if(idsStr.indexOf(items[i].value) >= 0){
                    idsStr = idsStr.replace(items[i].value+",", "");
                    namesStr = namesStr.replace($("#name_"+items[i].value).attr("title")+",", "");
               }
            }
        } 
    }
    $("#idsStr").val(idsStr);
    $("#namesStr").val(namesStr);
}

function saveCheck(insertValue){
    var flag=false;
    var idsStr=$("#idsStr").val();
    var data=idsStr.split(",");
    for(var i=0;i<data.length;i++){
        if(data[i]==insertValue){
            return true;
        }
    }
    return flag;
}
function itemSelectAll(){
    var itemSelectAll=document.getElementById("itemSelectAll");
    var items=document.getElementsByName("ids");
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

