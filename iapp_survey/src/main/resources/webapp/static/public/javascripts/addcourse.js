function choose_cousewear(){
//	course_info
//	choose_coursewear
	$("#course_info").removeClass("col-md-12");
	$("#course_info").addClass("col-md-6");
	$("#choose_coursewear").show();
}
$("#dropbox").click(function(){
	$("#dbopenfile").click();
	
});
/*
 * 关闭课件选择的文件列表
 * 不管是选择课件还是上传成功后都要调用此方法
 * */
function closewearlist(){
	$("#course_info").removeClass("col-md-6");
	$("#course_info").addClass("col-md-12");
	$("#choose_coursewear").hide();
}
/*
 * 确认选择的方法，自己写
 * */
function chooseIt(){
	closewearlist();
	
}
/*
 * 选中状态效果
 * */
$("#list").find("li").each(function(){
	$(this).click(function(){
		$("#list").find("li").find("span[class='icon-check checked']").remove();
		$(this).append('<span class="icon-check checked"></span>');
	});
});
