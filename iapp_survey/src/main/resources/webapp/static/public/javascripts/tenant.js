
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
//	loading(divId);

	var data = {"page":i, "max":max, "r":Math.random(), 
			"orderField":order.orderField, "orderDirection":order.orderDirection };
	var url = basepath+"/base/admin/tenant/list.list";
	$("#"+divId).load(encodeURI(url), data, function(){
		App.initUniform();
	});
}

/**
 * 新增商户
 */
function addTenant(){
	window.location.href = basepath+"/base/admin/tenant/toadd.xhtml";
}

$('#file_upload').uploadify({
	'formData'     : {
		'token'     : token,
	},
	'fileObjName'  : 'file',
	'buttonText' : '<i class="glyphicon glyphicon-open"></i>上传',
	'buttonClass' : 'upload_access',
	'swf'      : basepath+'/static/ixin/css/uploadify.swf',
	'uploader' : 'http://up.qiniu.com/',
	'onUploadSuccess' : function(file,data,response){
		var result = eval("("+data+")");
		$("#image_cover").html("<img style='max-width:100px;max-height:200px;' src = '"+qiniuImageBasePath+result.hash+coverSuffix+"'>");
		$("#small_prev").show();
		//文件长传完成之后，在本地保存一份文件信息的数据
		$('#coverPath').val(result.hash);
	}
});

function deleteCover(){
	$("#small_prev").hide();
	$('#coverPath').val("");
}


function saveTenantInfo(){
	if(addTenantValidate()){
		$("#tenantForm").submit();
	}
}

function updateTenantInfo(){
	if(nameValidate() ){
		$("#tenantForm").submit();
	}
}

//var options = {
//	//target: '#output',          	//把服务器返回的内容放入id为output的元素中    
//	beforeSubmit: addTenantValidate,  //提交前的回调函数
//	success: submitSuccessBak,      //提交后的回调函数
//	forceSync: true,
//	//url: url,                 	//默认是form的action， 如果申明，则会覆盖
//	//type: type,               	//默认是form的method（get or post），如果申明，则会覆盖
//	//dataType: null,           	//html(默认), xml, script, json...接受服务端返回的类型
//	clearForm: true,          		//成功提交后，清除所有表单元素的值
//	resetForm: true,          		//成功提交后，重置所有表单元素的值
//	timeout: 3000               	//限制请求的时间，当请求大于3秒后，跳出请求
//}
//
//function submitSuccessBak(ret){
//	if(ret.flag){
//		myAutoHideDialog(ret.message, "success", function (){location.href = basepath+"/base/admin/tenant/tenants.xhtml";})
//	} else{
//		mySureDialog(ret.message);
//	}
//}


/**
 * 添加用户表单提交验证
 * @returns {Boolean}
 */
function addTenantValidate(){
	if(domainIdValidate("",false) && nameValidate() && adminAccountValidate("",false)){
		return true;
	}
	return false;
}

/** 商户标识验证*/
function nameValidate(){
	var name = $("#name").val();
	if(isBlank(name)){
		$("#nameMessage").css("display","inline");
		return false;
	} else {
		$("#nameMessage").css("display","none");
		return true;
	}
}

/** 商户标识验证*/
function domainIdValidate(id,conSelf){
	var id = "id";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	var s = false;
	if(numberLetterCheck(value)){
		dwr.engine.setAsync(false);
		DWRService.uniqueValidate("tenant", "id", value,  id, conSelf, true, function (ret){
			s = ret;
		});
		dwr.engine.setAsync(true);
		if(s){
			$("#idMessage1").css("display","none");
			$("#idMessage2").css("display","none");
			return s;
		} else{
			$("#idMessage1").css("display","none");
			$("#idMessage2").css("display","inline");
			return s;
		}
	} else{
		$("#idMessage1").css("display","inline");
		$("#idMessage2").css("display","none");
		return s;
	}
}

/** 管理员账号验证 */
function adminAccountValidate(userId,conSelf){
	var id = "account";
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	var s = false;
	if(isNotBlank(value)){
		dwr.engine.setAsync(false);
		DWRService.uniqueValidate("account", "account", value, userId, conSelf, true, function (ret){
			s = ret;
		});
		dwr.engine.setAsync(true);
		if(s){
			$("#accountMessage1").css("display","none");
			$("#accountMessage2").css("display","none");
			return s;
		} else{
			$("#accountMessage1").css("display","none");
			$("#accountMessage2").css("display","inline");
			return s;
		}
	} else{
		$("#accountMessage1").css("display","inline");
		$("#accountMessage2").css("display","none");
		return s;
	}
}


/*
 * 重新初始化datatables
 * */
function reinit_datatables(){
	$('#sample_2_column_toggler input[type="checkbox"]').each(function(){
		if($(this).parent().attr("class")=="checked"){
			var iCol = parseInt($(this).attr("data-column"));//定义第几列的编号
			$('#sample_2').find("tr").each(function(){
				$(this).find("td:nth-child("+iCol+"), th:nth-child("+iCol+")").show();
			});
		}else{
			var iCol = parseInt($(this).attr("data-column"));//定义第几列的编号
			$('#sample_2').find("tr").each(function(){
				$(this).find("td:nth-child("+iCol+"), th:nth-child("+iCol+")").hide();
			});
		}
	});
}

function bind_hidden(){
	$('#sample_2_column_toggler input[type="checkbox"]').change(function(){
		var o = $(this);
		var table= $('#sample_2');
		hidden_cloumn(o,table,flag);
	});
}
/*
 * 重写隐藏列方法
 * */

function hidden_cloumn(o,table,flag){
	var flags = $(o).is("checked");
	var iCol = parseInt($(o).attr("data-column"));//定义第几列的编号
	$(table).find("tr").each(function(){
		$(this).find("td:nth-child("+iCol+"), th:nth-child("+iCol+")").toggle();
	});
}











