
$(function(){

	var covers = coverpaths.split(",");
	for(var i = 0 ; i<count ; i++){
		initUploadify(i);
		$("#coverPath_"+i).val(covers[i]);
		$("#image_cover_"+(i)).html("<img style='max-width:100px;max-height:200px;' src = '"+qiniuImageBasePath+$("#coverPath_"+i).val()+coverSuffix+"'>");
		$("#small_prev_"+(i)).show();	
	}
	for(var i = 5;i>count;i--){
		initUploadify(i-1);
		
	}
	
});
function initUploadify(idNumber){
	$('#file_upload_'+idNumber).uploadify({
		'formData'     : {
			'token'     : token,
		},
		'fileObjName'  : 'file',
		'buttonText' : '<i class="glyphicon glyphicon-open"></i>上传',
		'buttonClass' : 'upload_access',
		'swf'      : basepath+'/static/ixin/css/uploadify.swf',
		//'uploader' : 'http://up.qiniu.com/',
		'uploader' : uploadurl,
		'onUploadSuccess' : function(file,data,response){
			var result = eval("("+data+")");
			$("#image_cover_"+idNumber).html("<img style='max-width:100px;max-height:200px;' src = '"+qiniuImageBasePath+result.hash+coverSuffix+"'>");
			$("#small_prev_"+idNumber).show();
			//文件长传完成之后，在本地保存一份文件信息的数据
			$('#coverPath_'+idNumber).val(result.hash);
			saveFile(file,result,idNumber);
		}
	});
}
function saveFile(file,result,idNumber){
	var requestBody = new Object();
	requestBody.size = result.size;
	requestBody.mimeType = result.mimeType;
	requestBody.filePath = result.url;
	
	$.ajax({
		type: "POST",
		url:  basepath+"/mgr/fodder/savesourcefile.xhtml",
		data: JSON.stringify(requestBody),
		contentType: "application/json; charset=utf-8",
		success:function(data){
			$('#fileId_'+idNumber).val(data);
		},
		error: function(data){
			alert('保存失败');
		}
	});
	
}

function deleteCover(number){

	$("#small_prev_"+number).hide();
	$('#fileId_'+number).val("");
	$('#coverPath_'+number).val("");
}




/** 添加错误信息 */
function addError(id){
	$("#con_"+id).addClass("has-error");
	myShow2("#tip_"+id);
}
function removeError(id){
	$("#con_"+id).removeClass("has-error");
	myHide2("#tip_"+id);
}

function v_empty(id){
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(isBlank(value)){
		obj.focus();
		addError(id);
		return false;
	}
	removeError(id);
	return true;
}



//调研
function save(id){
	
	var isnew = false;
	
	if($("#isnew").attr("checked")){
		isnew = true;
	}
	if(!v_empty("name")){
		return;
	}
	if(!v_empty("type")){
		return;
	}
	/*
	if(!v_empty("goodname")){
		return;
	}
	*/
	var name = $("#name").val();
	var type = $("#type").val();
	var goodname = $("#goodname").val();
	var cid = $("#cid").val();
	var englishname = $("#englishname").val();
	
	var covers = "";
	for(var i = 0 ; i < 5 ; i++){
		if($("#coverPath_"+i).val()!=null&&$("#coverPath_"+i).val()!=""){
			covers += $("#coverPath_"+i).val()+",";
		}
	}
	
	$.ajax({
		type: "POST",
		url:  basepath+"/base/admin/product/save.json",
		data: {id:id,name:name,type:type,goodname:goodname,englishname:englishname,cid:cid,covers:covers,isnew:isnew},
		success:function(data){
			easyDialog.open({
		        container : {
		            header : '提示',
		            content : '<div style="background-color: #ffffff;width:260px;height:20px;text-align:center;">保存成功！</div>'
		        },
		        autoClose:1200,
		        callback:function(){
		        	window.location.href=basepath+"/base/admin/productproperty/index.xhtml?pid="+data;
		        }
		    });
		},
		error: function(data){
			easyDialog.open({
		        container : {
		            header : '提示',
		            content : '<div style="background-color: #ffffff;width:260px;height:20px;text-align:center;">保存失败！</div>'
		        },
		        autoClose:1200
		    });
		}
	});
}


function open_dialog(){
	var url = basepath+"/base/admin/product/getcategorys.xhtml";
	//var url = basepath+"/base/admin/organization/getorgs.xhtml";
	$.ajax({
		url:url,
		type:"POST",
		data:{type:1},
		success:function(data){
			zdata = data;
			var str='<div id="dialog_bumen" style="width:420px;"><div class="zTreeDemoBackground"><ul id="treeDemo" class="ztree"></ul></div></div>';
			easyDialog.open({
					  container : {
						    header : '选择分类',
						    content :str,
						    yesFn : btnFn,
						    noFn : true
						  },
					  fixed : false
					  , callback : orgIdValidate_calback
			});
			$.fn.zTree.init($("#treeDemo"), settingclick, zdata);
			$("#treeDemo").find("a[onclick='true']").click();
			var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
			
		}
	});
	
	
	var orgIdValidate_calback = function(){
		orgIdValidate();
	}
}


var btnFn = function(){
	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	var selectNodes = treeObj.getSelectedNodes();
	$("#cid").val(selectNodes[0].id);
	$("#cname").val(selectNodes[0].name);
	$("#choose_oid").attr("onclick", "open_dialog()");
	easyDialog.close();
};

var orgIdValidate_calback = function(){
	orgIdValidate();
}

function orgIdValidate(){
	var id = "cid"
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	if(isNotBlank(value)){
		removeError(id);
		return true;
	} else {
		addError(id);
		return false;
	}
}


function setFontCss() {
	return {color:"#000000",size:"20px",height: "24px",family:"微软雅黑"};
};
var setting = {
	view: {
		showLine: false,
		fontCss: setFontCss
	},
	data: {
		simpleData: {
			enable: true
		}
		,key: {
			title: "title"
		}
	},
	check: {
		enable: true,
		//nocheckInherit: false,
		autoCheckTrigger:false,
		chkStyle: "checkbox",
		chkboxType: { "Y": "", "N": "" }
	},
};

var settingclick = {
	view: {
		showLine: false,
		fontCss: setFontCss
	},
	data: {
		simpleData: {
			enable: true
		}
		,key: {
			title: "title"
		}
	}
};

var code;		

function showCode(str) {
	if (!code) code = $("#code");
	code.empty();
	code.append("<li>"+str+"</li>");
}
