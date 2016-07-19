/**
 * 自动保存素材
 */
function autoSave(is) {
	var release = 0;
	var dateStr = getCurrentDateTime();
	$('.material_saveInfo').css({
		display : 'block'
	});
	$('.material_saveTime').html(dateStr);
	// 获取表单元素的值
	var title = $('.js_title').val();
	var show = $('#checkbox_info').prop("checked")?1:0;
	var author = $('.js_author').val();
	var desc = $('.js_desc').val();
	var resourceUrl = $('.js_url').val();
	var baseId = $('#material_baseId').val();
	var singleId = $('#material_singleId').val();
	var fileId = $('#material_fileId').val();
	var content = editor.getContent();

	// 如果所有的值都是空的，不保存，否则调用保存接口，保存文件
	if (checkIsEmpty(author) && checkIsEmpty(title) && checkIsEmpty(desc)
			&& checkIsEmpty(resourceUrl)
			&& checkIsEmpty(fileId) && checkIsEmpty(content)) {
		return ;
	}
	var obj = new Object();
	obj.title = title;
	obj.author = author;
	obj.fileId = fileId;
	obj.desc = desc;
	obj.resourceUrl = resourceUrl;
	obj.baseId = baseId;
	obj.materialId = singleId;
	obj.content = content;
	obj.coverShowInText = show;
	var release = 1;
	if(is != 1){
		obj.release = 0;
	}else{
		obj.release = 1;
	}
	
	$.ajax({
		type : "POST",
		url : basePathUrl + "/mgr/ixin/savesinglemsg.xhtml",
		data : JSON.stringify(obj),
		contentType : "application/json; charset=utf-8",
		success : function(data) {
			console.debug(data);
			// 保存完成之后，更新文件的baseId,图文消息的Id。
			if(data.success == 'true'){
				$('#material_baseId').val(data.baseId);
				$('#material_singleId').val(data.materialId);
				
				if(is == 1){
					alert('保存成功');
				}
			}

		},
		error : function(msg) {
			alert(msg);
		}
	});
}

function checkIsEmpty(param) {
	if (param == null || $.trim(param) == "" ||$.trim(param).length == 0) {
		return true;
	}
	return false;
}

function getCurrentDateTime() {
	var date = new Date();
	var mYear = date.getFullYear();
	var mMonth = date.getMonth() < 9 ? ("0" + (date.getMonth() + 1)) : date
			.getMonth() + 1;
	var mDay = date.getUTCDate() < 10 ? ("0" + date.getUTCDate()) : date
			.getUTCDate();
	var mHour = date.getHours() < 10 ? ("0" + date.getHours()) : date
			.getHours();
	var mMinute = date.getMinutes() < 10 ? ("0" + date.getMinutes()) : date
			.getMinutes();
	var mSecond = date.getSeconds() < 10 ? ("0" + date.getSeconds()) : date
			.getSeconds();
	return mYear + "/" + mMonth + "/" + mDay + " " + mHour + ":" + mMinute
			+ ":" + mSecond;
}