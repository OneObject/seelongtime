function validateAdd(){
    if(validateAllScore()){
        $.get(basepath+"/base/admin/itest/examination/saveMarking.xhtml", $.param($("#addForm :input")), function(ret){
            var html="<div style='width:300px;text-align:center;'>"+ret.message+"</div>";
            if(ret.flag){
                easyDialog.open({
                    container : {
                        header : '提示',
                        content : html,
                    },
                    autoClose : 2000,
                    callback : function(){
                        window.location.href = basepath+"/base/admin/itest/examination/markpaperlistcon.xhtml?id="+ret.examid;
                    }
                });
            } else{
                easyDialog.open({
                    container : {
                        header : '提示',
                        content : html,
                    },
                    autoClose : 2000
                });
            }
        });
        return false;
    }
    return false;
}

/** 验证所有分数 */
function validateAllScore(){
	var _objs = $(".defen");
	for(var i=0; i<_objs.length; i++){
		$(_objs[i]).change();
	}
	var _errors = $(".has_error");
	if(_errors.length > 0){
		return false;
	}
	return true;
}

/** 验证分数 */
function validateScore(id){
    var id = "score_"+id;
    var obj = $("#"+id);
    var value = $.trim(obj.val());
    if(isBlank(value)){
        obj.focus();
        addError(id);
        return false;
    }
    if(!zeroFloatCheck(value)){
        obj.focus();
        addError(id);
        return false;
    }
    var total = $("#total_"+id).text();
    if(parseFloat(value)>parseFloat(total)){
        obj.focus();
        addError(id);
        return false;
    }
    removeError(id);
    return true;
}

/** 添加错误信息 */
function addError(id){
	$("#con_"+id).addClass("has_error");
    myShow("tip_"+id);
    $("#"+id).focus();
//    alert($("#"+id).val());
}
function removeError(id){
	$("#con_"+id).removeClass("has_error");
    myHide("tip_"+id);
}
function cancelInsert(){
	location.href = basepath + "/base/admin/itest/examination/markpaperlistcon.xhtml?id="+$("#examid").val(); 
}
