
function toViewShell(url){
	window.location.href = basepath +"/m/h5/viewshell.xhtml?url="+encodeURIComponent(url);
}


/**
 * Only for android app
 * 
 * 更改导航中的 history.go(-1)为 ajyapp.gobacks();
 * ajyapp.gobacks() 为android app中定义的js接口
 * 处理android app回退时的循环
 * 
 * 不是在a标签中的history.go(-1),要自己在页面中提供把history.go(-1)更改为ajyapp.gobacks()的changeGoback()方法
 */
function changeGoback()
{
//	$(".app_back").attr("href","javascript:ajyapp.gobacks();");
}
