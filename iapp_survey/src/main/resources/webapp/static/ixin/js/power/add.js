/** 验证名称 */
function v_ruleName(){
	var id = "ruleName";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(isBlank(value)){
		obj.focus();
		addError(id);
		return false;
	}
	if(value.length > $("#maxlength").text()){
		obj.focus();
		addError(id);
		return false;
	}
	removeError(id);
	return true;
}

/** 验证关键字 */
function v_keywords(){
	var id = "keywords";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	var key = $.trim($("#key").val());
	var ids = $.trim($("#id").val());
	var bo = false;
	if(isBlank(value)){
		$("#tip_keywords").html("必填，多个请以”,“分隔");
		obj.focus();
		addError(id);
		return bo;
	}
	$.ajax({
		type:"post",
		async:false,
		url:basepath+"/mgr/ixinrule/validatekeywords.json",
		data:{"skey":value,"key":key,"id":ids},
		success:function(data){
			var skeyIsExist = data;
			if(skeyIsExist){
				bo = false;
			}
			if(!skeyIsExist){
				bo = true;
				
			}
		}
	});
	if(!bo){
		obj.focus();
		addError(id);
		$("#tip_keywords").html("关键字已存在");
		return false;
	}else{
		$("#tip_keywords").html("必填，多个请以”,“分隔");
		removeError(id);
		return bo;
	}
}


/** 验证回复内容 */
function v_response(){
	var type = $("input[name='type']:checked").val();
//	alert($("#type0").attr("checked"));
//	alert($("#type1").attr("checked"));
	if(type == 0 ){
		var id = "matterIds";
		var obj = $("#"+id);
		var value = $.trim(obj.val());
		var val = $("#sumFodder").val();
		
		var data=value.split(",");
		var notBlank = false;
	    for(var i=0;i<data.length;i++){
	        if(data[i]!=""){
	        	notBlank = true;
	        }
	    }
		
		if(!notBlank || val>8){
			obj.focus();
			addError("matters");
			$("#matters_err").hide();
			$("#matters_error").show();
			return false;
		}
		$("#matters_err").show();
		$("#matters_error").hide();
		removeError("matters");
		return true;
	} else if(type == 1){
		var id = "content";
		var obj = $("#"+id);
		var value = $.trim(obj.val());
		if(isBlank(value) || getStrLen(value) >(parseInt($("#max_content").text())*2)){
			obj.focus();
			addError(id);
			return false;
		}
		removeError(id);
		return true;
	}
}

/** 验证文本消息 */
function v_content(){
	var id = "content";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(isBlank(value) || getStrLen(value) > (parseInt($("#max_content").text())*2)){
		obj.focus();
		addError(id);
		return false;
	}
	removeError(id);
	return true;
}

/** 切换类型 */
function toggle_type(type){
	if(type == 0){
		myHide2("#con_content");
		myShow2("#con_matterIds, #con_matters");
	} else if(type == 1 ){
		myHide2("#con_matterIds, #con_matters");
		myHide2("#matters_error")
		myShow2("#con_content");
	}
}

var options = {
//	target: '#output',          	//把服务器返回的内容放入id为output的元素中    
	beforeSubmit: validateAdd,  //提交前的回调函数
	success: submitSuccessBak,      //提交后的回调函数
	forceSync: true,
	//url: url,                 	//默认是form的action， 如果申明，则会覆盖
	type: 'post',               	//默认是form的method（get or post），如果申明，则会覆盖
	//dataType: null,           	//html(默认), xml, script, json...接受服务端返回的类型
//	clearForm: true,          		//成功提交后，清除所有表单元素的值
//	resetForm: true,          		//成功提交后，重置所有表单元素的值
	timeout: 3000               	//限制请求的时间，当请求大于3秒后，跳出请求
}

var optionsUpdate = {
//		target: '#output',          	//把服务器返回的内容放入id为output的元素中    
		beforeSubmit: validateUpdate,  //提交前的回调函数
		success: submitSuccessBak,      //提交后的回调函数
		forceSync: true,
		//url: url,                 	//默认是form的action， 如果申明，则会覆盖
		type: 'post',               	//默认是form的method（get or post），如果申明，则会覆盖
		//dataType: null,           	//html(默认), xml, script, json...接受服务端返回的类型
//		clearForm: true,          		//成功提交后，清除所有表单元素的值
//		resetForm: true,          		//成功提交后，重置所有表单元素的值
		timeout: 3000               	//限制请求的时间，当请求大于3秒后，跳出请求
}

function submitSuccessBak(ret){
	if(ret.flag){
		location.href = basepath+"/mgr/ixin/power/index.xhtml";
//		myAutoHideDialog(ret.message, "success", function (){location.href = basepath+"/mgr/ixin/power/index.xhtml";})
	} else{
		mySureDialog(ret.message);
	}
}

$(function (){
	$("#addForm").ajaxForm(options);
	$("#updateForm").ajaxForm(optionsUpdate);
});

/** 验证增加 */
function validateAdd(){
	if(v_ruleName() && v_keywords() && v_response()){
		return true; 
	}
	return false;
}

/** 验证修改 */
function validateUpdate(){
	if(v_ruleName() && v_keywords() && v_response()){
		return true; 
	}
	return false;
}

/** 加载已选择素材 */
function appendMatters(){
	var matterIds = $("#matterIds").val();
	if(isBlank(matterIds)){
		$("#append_div").html("");
		return ;
	}
	$("#append_div").load(basepath+"/mgr/ixin/power/appendmatters.list", {"matterIds": $("#matterIds").val()});
	
	
	
}

function dropMatter(id){
	var matterIds = $("#matterIds").val();
	matterIds = matterIds.replace(id+",", "");
	$("#matterIds").val(matterIds);
	appendMatters();
}

function clear_matters(){
	$("#matterIds").val("");
	easyDialog.close();
}

/** 选择素材*/
function choose_matter(){
	easyDialog.open({
		container : 'dialogBank',
		fixed : false,
		callback : appendMatters
	});
}

/**
 * 分页+搜索
 */
function page(i, fieldId) {
	var divId = "table_list";
	
	var order = getOrder(divId, fieldId);
	var max = $("#"+divId+" #page_max").val();

	var title = $("#search_title").val();

	var data = {"page":i, "max":6, "r":Math.random(), "matterIds":$("#matterIds").val(),"multi":true,"title":title};

	var url = basepath+"/mgr/fodder/select.list";
	$("#"+divId).load(encodeURI(url), data, function(){
		choose_matter();
	});
}

function cancelInsert(){
	window.location.href = basepath+"/mgr/ixin/power/index.xhtml";
}

/** 添加错误信息 */
function addError(id){
	$("#con_"+id).addClass("has-error");
//	myShow("tip_"+id);
}
function removeError(id){
	$("#con_"+id).removeClass("has-error");
//	myHide("tip_"+id);
}
function show1Hide2(id){
	$("#tip_"+id).removeClass("hidden");
	
	$("#tip2_"+id).addClass("hidden");
}
function show2Hide1(id){
	$("#tip2_"+id).removeClass("hidden");
	
	$("#tip_"+id).addClass("hidden");
}

/**
 * 全部选中
 */
function checked_all(obj){
	if($(obj).attr("checked") == "checked"){
		$("input[name='ids']").each(function(){
			$(this).attr("checked","checked");
			$(this).parent().addClass("checked");
		});
	}else{
		$("input[name='ids']").each(function(){
			$(this).removeAttr("checked");
			$(this).parent().removeClass("checked");
		});
	}
}

function isAllCheck(){
    if($("input[name='ids'][checked!='checked']").length == 0){
        $("#itemSelectAll").attr("checked", "checked");
    }
}
function onSave(thi) {
	  var item =$(thi).parent("li").attr("h");
	  var items =$("#matterIds").val()+",";
	items+=item+",";
	$("#matterIds").val(items);
	
}
function doDelete(thi) {
	var item =$(thi).parent("li").attr("h");
	var matterIds=$("#matterIds").val();
    var data=matterIds.split(",");
    for(var i=0;i<data.length;i++){
        if(data[i]==item){
        	matterIds=matterIds.replace(data[i]+",","");
        }
    }
    $("#matterIds").val(matterIds);
}

function saveCheck(insertValue){
    var flag=false;
    var matterIds=$("#matterIds").val();
    var data=matterIds.split(",");
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
