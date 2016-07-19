/** 获得排序规则 */
function getOrder(divId, fieldId){
    var order = new Object();
    
    if(isNotBlank(fieldId)){
        order.orderField = fieldId;
        
        var _orderField = $("#"+divId+" #"+getSpecialId(fieldId));
        if(_orderField.length > 0){
            if(_orderField.attr("class") == "sorting"){
                order.orderDirection = "_asc";
            } else if(_orderField.attr("class") == "sorting_desc"){
                order.orderDirection = "_asc";
            } else if(_orderField.attr("class") == "sorting_asc"){
                order.orderDirection = "_desc";
            }
        }
    } else if($("#"+divId+" #orderField").length > 0){
        var _orderField = $("#"+divId+" #orderField");
        order.orderField = _orderField.val();
        
        var _orderDirection = $("#"+divId+" #orderDirection");
        order.orderDirection = _orderDirection.val();
    } else{
        order.orderField = "";
        order.orderDirection = "";
    }
    
    return order;
}

/**
 * 当html元素id中有"."时，jquery需要特殊处理，获得元素
 * @param id
 */
function getSpecialObj(id){
    var index = id.indexOf(".");
    if(index > 0){
        id = id.replace(/\./g, "\\.");
    }
    return $("#"+id);
}
function getSpecialId(id){
    var index = id.indexOf(".");
    if(index > 0){
        id = id.replace(/\./g, "\\.");
    }
    return id;
}