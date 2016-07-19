/** 验证名称 */
function v_ruleName() {
	var id = "ruleName";
	var obj = $("#" + id);
	var value = $.trim(obj.val());
	if (isBlank(value)) {
		obj.focus();
		addError(id);
		return false;
	}
	if (value.length > $("#maxlength").text()) {
		obj.focus();
		addError(id);
		return false;
	}
	removeError(id);
	return true;
}

/** 验证关键字 */
function v_keywords() {
	var id = "keywords";
	var obj = $("#" + id);
	var value = $.trim(obj.val());
	if (isBlank(value)) {
		obj.focus();
		addError(id);
		return false;
	}
	removeError(id);
	return true;
}

/** 验证回复内容 */
function v_response() {
	var type = $("input[name='type']:checked").val();
	// alert($("#type0").attr("checked"));
	// alert($("#type1").attr("checked"));
	if (type == 0) {
		var id = "matterIds";
		var obj = $("#" + id);
		var value = $.trim(obj.val());
		if (isBlank(value)) {
			obj.focus();
			addError(id);
			return false;
		}
		removeError(id);
		return true;
	} else if (type == 1) {
		var id = "content";
		var obj = $("#" + id);
		var value = $.trim(obj.val());
		if (isBlank(value)
				|| getStrLen(value) > parseInt($("#max_content").text())) {
			obj.focus();
			addError(id);
			return false;
		}
		removeError(id);
		return true;
	}
}

/** 验证文本消息 */
function v_content() {
	var id = "content";
	var obj = $("#" + id);
	var value = $.trim(obj.val());
	if (isBlank(value) || getStrLen(value) > parseInt($("#max_content").text())) {
		obj.focus();
		addError(id);
		return false;
	}
	removeError(id);
	return true;
}

/** 切换类型 */
function toggle_type(type) {
	if (type == 0) {
		myHide2("#con_content");
		myShow2("#con_matterIds, #con_matters");
	} else if (type == 1) {
		myHide2("#con_matterIds, #con_matters");
		myShow2("#con_content");
	}
}

var options = {
	// target: '#output', //把服务器返回的内容放入id为output的元素中
	beforeSubmit : validateAdd, // 提交前的回调函数
	success : submitSuccessBak, // 提交后的回调函数
	forceSync : true,
	// url: url, //默认是form的action， 如果申明，则会覆盖
	// type: type, //默认是form的method（get or post），如果申明，则会覆盖
	// dataType: null, //html(默认), xml, script, json...接受服务端返回的类型
	// clearForm: true, //成功提交后，清除所有表单元素的值
	// resetForm: true, //成功提交后，重置所有表单元素的值
	timeout : 3000
// 限制请求的时间，当请求大于3秒后，跳出请求
}

var optionsUpdate = {
	// target: '#output', //把服务器返回的内容放入id为output的元素中
	beforeSubmit : validateUpdate, // 提交前的回调函数
	success : submitSuccessBak, // 提交后的回调函数
	forceSync : true,
	// url: url, //默认是form的action， 如果申明，则会覆盖
	// type: type, //默认是form的method（get or post），如果申明，则会覆盖
	// dataType: null, //html(默认), xml, script, json...接受服务端返回的类型
	// clearForm: true, //成功提交后，清除所有表单元素的值
	// resetForm: true, //成功提交后，重置所有表单元素的值
	timeout : 3000
// 限制请求的时间，当请求大于3秒后，跳出请求
}

function submitSuccessBak(ret) {
	if (ret.flag) {
		location.href = basepath + "/mgr/ixin/power/index.xhtml";
		// myAutoHideDialog(ret.message, "success", function (){location.href =
		// basepath+"/mgr/ixin/power/index.xhtml";})
	} else {
		mySureDialog(ret.message);
	}
}

$(function() {
	$("#addForm").ajaxForm(options);
	$("#updateForm").ajaxForm(optionsUpdate);
});

/** 验证增加 */
function validateAdd() {
	if (v_ruleName() && v_keywords() && v_response()) {
		return true;
	}
	return false;
}

/** 验证修改 */
function validateUpdate() {
	if (v_ruleName() && v_keywords() && v_response()) {
		return true;
	}
	return false;
}

/** 加载已选择素材 */
function appendMatters() {
	var matterIds = $("#matterIds").val();
	if (isBlank(matterIds)) {
		$("#append_div").html("");
		return;
	}
	$("#append_div").load(basepath + "/mgr/ixin/power/appendmatters.list", {
		"matterIds" : $("#matterIds").val()
	});
}

function dropMatter(id) {
	var matterIds = $("#matterIds").val();
	matterIds = matterIds.replace(id, "");
	$("#matterIds").val(matterIds);
	appendMatters();
}

function clear_matters() {
	$("#matterIds").val("");
	easyDialog.close();
}

/** 选择素材 */
function choose_matter() {
	easyDialog.open({
		container : 'dialogBank',
		fixed : false,
		callback : appendMatters
	});
}

function buttonsubmiting(obj, isSubmit, defauttitle) {
	if (isSubmit) {
		$(obj).html("提交中...");
		$(obj).attr('disabled', "true")

	} else {
		$(obj).html(defauttitle);
		$(obj).removeAttr('disabled');
	}

}

function subbtn(obj, debug, account_type, authentication) {
	var matterIds = $("#matterIds").val();
	var ids = matterIds.split(",");
	var arrayObj = new Array();
	for ( var i = 0; i < ids.length; i++) {
		if (ids[i] != null && ids[i] != "") {
			arrayObj.push(ids[i]);
		}
	}

	if (arrayObj.length == 0) {
		showMsgDialog("你还没有选择素材");
		return;
	}
	if (arrayObj.length > 8) {
		var le = arrayObj.length - 8;
		showMsgDialog("一条消息只能包含8条素材，请删除多余的" + le + "条素材");
		return;
	}

	var msg;
	if (debug) {
		msg = "你确定验证(只创建素材)";
		if (!confirm(msg)) {
			return;
		}
	}

	var createFn = function() {// 创建或发送消息
	var btnTitle = $(obj).html();
		buttonsubmiting(obj, true, "");
		var value = $(".optiondialog :checked").val();
	//	alert(value);

		$
				.ajax({
					type : "POST",
					url : basepath + "/mgr/msg/sendmultimsg.json",
					data : {
						"id" : arrayObj,
						"optiontype" : value,
						"debug" : debug
					},
					success : function(rs) {
						if (rs) {
							if (rs.code) {
								easyDialog
										.open({
											container : {
												header : '成功',
												content : '<div style="background-color: #ffffff;width:320px;height:40px;text-align:center;">'
														+ rs.msg + '</div>'
											}
										});
							} else {
								easyDialog
										.open({
											container : {
												header : '失败',
												content : '<div style="background-color: #ffffff;width:320px;height:40px;text-align:center;">'
														+ rs.msg + '</div>'
											}
										});
							}
						} else {
							showMsgDialog("失败");
						}
						buttonsubmiting(obj, false, btnTitle);
					},
					error : function() {
						showMsgDialog("异常！");
						buttonsubmiting(obj, false, btnTitle);
					}
				});
	};

	var html = [];
	if ("1" == account_type && "1" == authentication) {// 已认证服务号
		var msg = "系统绑定的是已认证服务号，可以群发消息。你确定要进行消息群发吗(直接发送给用户)？";
		html.push('<div class="optiondialog" style="width:400px;height:150px;"><span>说明:');
		html.push(msg + '</span><span><input type="radio" name="optiontype" value="1" id="qunfa" checked="checked" /><label for="qunfa">群发消息</label></span><span><input type="radio" name="optiontype" value="2" id="tongbu"  /><label for="tongbu">同步素材至公众平台</label></span><span><input type="radio" name="optiontype" value="3" id="tongbufasong"/><label for="tongbufasong">群发消息且同步素材至公众平台</label></span></div>');
	} else {
		html.push('<div style="width:380px;height:80px;"><span>说明:');
		var msg = "系统绑定的不是已认证服务号,只能同步图文素材至公众平台，在公众平台内进行消息群发。<br>";
		html.push(msg + '</span>你确定同步图文素材至微信公众平台吗(需要登录微信平台发送)？</div>');
	}
	easyDialog.open({
		container : {
			header : '请选择具体的操作',
			content : html.join(""),
			yesFn : createFn,
			noFn : true
		}
	});
}

function page(i, fieldId) {
	var divId = "table_list";
	var order = getOrder(divId, fieldId);
	var max = $("#" + divId + " #page_max").val();

	var data = {
		"page" : i,
		"max" : 6,
		"add" : true,
		"r" : Math.random(),
		"matterIds" : $("#matterIds").val(),
		"multi" : true
	};

	var url = basepath + "/mgr/ixin/power/listmatters.list";
	$("#" + divId).load(encodeURI(url), data, function() {
		choose_matter();
	});
}

function cancelInsert() {
	window.location.href = basepath + "/mgr/ixin/power/index.xhtml";
}

/** 添加错误信息 */
function addError(id) {
	$("#con_" + id).addClass("has-error");
	// myShow("tip_"+id);
}
function removeError(id) {
	$("#con_" + id).removeClass("has-error");
	// myHide("tip_"+id);
}
function show1Hide2(id) {
	$("#tip_" + id).removeClass("hidden");

	$("#tip2_" + id).addClass("hidden");
}
function show2Hide1(id) {
	$("#tip2_" + id).removeClass("hidden");

	$("#tip_" + id).addClass("hidden");
}


function onSave(thi) {
	// var items = $(thi).parent("li").attr("h");
	var item = $(thi).parent("li").attr("h");
	var items = $("#matterIds").val() + ",";
	items += item + ",";
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


function saveCheck(insertValue) {
	var flag = false;
	var matterIds = $("#matterIds").val();
	var data = matterIds.split(",");
	for ( var i = 0; i < data.length; i++) {
		if (data[i] == insertValue) {
			return true;
		}
	}
	return flag;
}
function itemSelectAll() {
	var itemSelectAll = document.getElementById("itemSelectAll");
	var items = document.getElementsByName("ids");
	if (itemSelectAll.checked == true) {
		for ( var i = 0; i < items.length; i++) {
			items[i].checked = true;
		}
	} else {
		for ( var i = 0; i < items.length; i++) {
			items[i].checked = false;
		}
	}
	onSave();
}

function showMsgDialog(content) {
	easyDialog.open({
		container : {
			header : '提示',
			content : '<div style="background-color: #ffffff;width:260px;height:40px;text-align:center;">'
					+ content + '</div>'
		},
		autoClose : 1200
	});
}




function changeShow(_this) {//切换图文模式，还是文本模式
	var temp = $(_this).data('href');
	if (temp === 'msg-model-1') {
		$('#msg-model-2').hide();
		$('#msg-model-1').show();
	} else if (temp === 'msg-model-2') {
		$('#msg-model-1').hide();
		$('#msg-model-2').show();
	}
}

function dropUid(id) {
	var userids = $("#userids").val();
	userids = userids.replace(id, "");
	$("#userids").val(userids);
}

function dropOid(id) {
	var oids = $("#oids").val();
	oids = oids.replace(id, "");
	$("#oids").val(oids);
}

function removeTag(_this) {//删除被点击的tag标签
	var id = $(_this).data("id");
	$(_this).remove();
	dropUid(id);
	dropOid(id);
}

function createTagList(data, filterBoxId) { //data：json格式数据（必须包含name，id两个属性）, filterBoxId：需要过滤的标签容器的id
	var len, tempObj;
	var attr = '',
		cont = '',
		aid = '';
	var html = '';
	var created;
	var $tempBox;
	
	if (filterBoxId) {
		$tempBox = $(filterBoxId);
	}
	if (!data) {
		return false;
	}
	len = data.length;
	for (var i = 0; i < len; i++) {
		tempObj = data[i];
		attr = '';
		for (var prop in tempObj) {
			if (tempObj.hasOwnProperty(prop)) {
				if (prop === 'name') { //name 是一个约定的属性，必须含有，用于填充span标签
					cont = tempObj[prop];
				}
				if (prop === 'id' && filterBoxId) { //id 是一个约定的属性，必须含有，用于过滤已添加的span标签
					aid = tempObj['id'];
					created = $tempBox.find('#aid' + aid);
					if (created.length > 0) {
						created.remove();
					}
				}
				attr += ('data-' + prop + '="' + tempObj[prop] + '" ');
			}
		}
		html += ('<span class="tag" id="aid' + aid + '" ' + attr + ' onclick="removeTag(this);">' + cont + '<a href="#">x</a></span>');
	}
	if (html !== '') {
		$tempBox.html('');
		if (filterBoxId === '#tag-box-1') {
			$('#tag-info-1').show();
		} else if (filterBoxId === '#tag-box-2') {
			$('#tag-info-2').show();
		}
		$tempBox.show();
	} else {
		$tempBox.html('');
		if (filterBoxId === '#tag-box-1') {
			$('#tag-info-1').hide();
		} else if (filterBoxId === '#tag-box-2') {
			$('#tag-info-2').hide();
		}
		$tempBox.hide();		
	}
	insertTagList(filterBoxId, html); //向指定容器，插入过滤后生成的span标签
};

function insertTagList(id, html) {//向指定容器，插入html
	$(id).append(html);
}
var submitFlag = 0;
function sendToCp() {
	if(submitFlag == 1){
		return ;
	}
	submitFlag = 1;
	
	var contentType = $('input:radio[name="contentType"]:checked').val();
	var matterIds = $("#matterIds").val();
	var content = $("#content").val();

	var isFosum = $('#isFosun').val();
	if(null==isFosum || ""==isFosum){
		isFosum = "false";
	}
	
	var ids = matterIds.split(",");
	var fodderIds = new Array();
	for ( var i = 0; i < ids.length; i++) {
		if (ids[i] != null && ids[i] != "") {
			fodderIds.push(ids[i]);
		}
	}
	
	if(contentType == 0){
		if (fodderIds.length == 0) {
			showMsgDialog("你还没有选择素材");
			submitFlag = 0;
			return;
		}
		if (fodderIds.length > 8) {
			var le = fodderIds.length - 8;
			showMsgDialog("一条消息只能包含8条素材，请删除多余的" + le + "条素材");
			submitFlag = 0;
			return;
		}

		if(isFosum=="true" && fodderIds.length > 1){
			var le = fodderIds.length - 8;
			showMsgDialog("一条消息只能选择1条素材，请删除多余的素材");
			submitFlag = 0;
			return;
		}


	} else {
		if(content == null || content == ""){
			showMsgDialog("文本消息内容不能为空");
			submitFlag = 0;
			return;
		}
	}
	
	var uids = $("#userids").val();
	var oids = $("#oids").val();

	var obj = $("#sendToCp");
	var btnTitle = $(obj).html();
	buttonsubmiting(obj, true, "");
	var sendFn = function() {// 创建或发送消息
		$.ajax({
			type : "POST",
			url : basepath + "/mgr/msg/sendtocp.json",
			data : {
				"uids" : uids,
				"oids" : oids,
				"contentType" : contentType,
				"fodderIds" : matterIds,
				"content" : content
			},
			success : function(rs) {
				if (rs) {
					if (rs.code) {
						easyDialog.open({
									container : {
										header : '成功',
										content : '<div style="background-color: #ffffff;width:320px;height:40px;text-align:center;">'
												+ rs.msg + '</div>',
										yesFn :  function (){return true; }
									}
								});
					} else {
						easyDialog
								.open({
									container : {
										header : '失败',
										content : '<div style="background-color: #ffffff;width:320px;height:40px;text-align:center;">'
												+ rs.msg + '</div>',
										yesFn :  function (){return true; }
									}
								});
					}
				} else {
					showMsgDialog("失败");
				}
				submitFlag = 0;
				buttonsubmiting(obj, false, btnTitle);
			},
			error : function() {
				submitFlag = 0;
				showMsgDialog("异常！");
				buttonsubmiting(obj, false, btnTitle);
			}
		});
	};

	var html = '<div style="width:300px;height:50px;text-align:center;">确定要发送吗？</div>';
	easyDialog.open({
		container : {
			header : '提示',
			content : html,
			yesFn : sendFn,
			noFn : true
		}
	});
}

