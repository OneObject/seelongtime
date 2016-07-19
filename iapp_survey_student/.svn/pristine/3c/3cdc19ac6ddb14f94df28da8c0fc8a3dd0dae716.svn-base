/**
 * 统一验证:注意在验证时先去除空格
 */

/** 获得中英文字符串长度 */
function getStrLen(str){
	return str.replace(/[^\x00-\xff]/g,"**").length;
}

/** 数字验证 */
function numberCheck(value){
	var value = $.trim(value);
	if(isBlank(value)){
		return false;
	}
	var reg = /^[0-9]*$/;
	return reg.test(value);
}

/** 字母验证 */
function letterCheck(value){
	var value = $.trim(value);
	if(isBlank(value)){
		return false;
	}
	var reg = /^[A-Za-z]*$/;
	return reg.test(value);
}

/** 数字+字母验证 */
function numberLetterCheck(value){
	var value = $.trim(value);
	if(isBlank(value)){
		return false;
	}
	var reg = /^[0-9A-Za-z]*$/;
	return reg.test(value);
}

/** 用户名验证
 * 数字，大小写字母，下划线
 *  */
function usernameFormatCheck(value){
	var value = $.trim(value);
	var reg = /^[0-9A-Za-z_]{6,15}$/;
	return reg.test(value);
}

/** 邮箱验证 */
function emailFormatCheck(value){
	var value = $.trim(value);
//	var reg = /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/;
	var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
	return reg.test(value);
}

/** 电话验证 */
function phoneFormatCheck(value){
	value = $.trim(value);
	var reg = /^(\d{11})|((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$/;
	return reg.test(value);
}

/** 非负整数验证 */
function zeroIntCheck(value){
	if(parseInt(value)==0){
		return true;
	}
	value = $.trim(value);
	var reg = /^[1-9]\d*$/;
	return reg.test(value);
}

/** 正整数验证 */
function intCheck(value){
	value = $.trim(value);
	var reg = /^[1-9]\d*$/;
	return reg.test(value);
}

/** 可为0一位小数验证 */
function zeroFloatCheck(value){
	if(parseInt(value)==0){
		return true;
	}
	if(intCheck(value)){
		return true;
	}
	if(parseFloat(value) > 0){
		if(value.indexOf(".")!=value.length-2){
			return false;
		}
		return true;
	}
	return false;
}

/** 一位小数验证 */
function floatCheck(value){
	if(intCheck(value)){
		return true;
	}
	if(parseFloat(value) > 0){
		if(value.indexOf(".")!=value.length-2){
			return false;
		}
		return true;
	}
	return false;
}

/** 手机验证 */
function mobileFormatCheck(value){
	value = $.trim(value);
	var reg = /^1\d{10}$/;
	return reg.test(value);
}

/** 身份证验证 */
function isIdCardNo(value) {
	value = $.trim(value);
	var reg = /(^\d{15}$)|(^\d{17}([0-9]|X|x)$)/;
	return reg.test(value);
}

/** 不为空 */
function isNotBlank(str){
	return !isBlank($.trim(str));
}

/** 为空 */
function isBlank(str){
	if($.trim(str)==null || $.trim(str)==""){
		return true;
	}
	return false;
}

/** 显示元素（针对iapp中） */
function myShow2(str){
	$(str).removeClass("hidden");
}

/** 隐藏元素（针对iapp中） */
function myHide2(str){
	$(str).addClass("hidden");
}

/** 显示元素（针对iapp中） */
function myShow(id){
	$("#"+id).removeClass("hidden");
}

/** 隐藏元素（针对iapp中） */
function myHide(id){
	$("#"+id).addClass("hidden");
}

/** 显示元素（针对iapp中） */
function myObjShow(obj){
	obj.removeClass("hidden");
}

/** 隐藏元素（针对iapp中） */
function myObjHide(obj){
	obj.addClass("hidden");
}






