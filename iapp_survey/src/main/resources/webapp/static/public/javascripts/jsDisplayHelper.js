/**
 * 使用js生成静态页面内容时工具类
 */

/**
 * 长度截取
 * str,字符串；length，长度；是否显示"..."
 */
function getSubstr(str, length, showPoint){
	if(isBlank(str)){
		return "";
	}
	if(isBlank(length)){
		length = 15;
	}
	if(isBlank(showPoint)){
		showPoint = true;
	}
	if(str.length <= 15){
		return str;
	} else{
		if(showPoint){
			return str.substring(0, length)+"...";
		} else{
			return str.substring(0, length);
		}
	}
}





