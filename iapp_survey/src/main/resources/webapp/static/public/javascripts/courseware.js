function check_color(o){
	if($(o).hasClass("today")){
		return ' <div class="important"></div>';
	}else if($(o).hasClass("threedays")){
		return '<div class="info"></div>';
	}else if($(o).hasClass("month")){
		return ' <div class="success"></div>';
	}else if($(o).hasClass("ago")){
		return ' <div class="warning"></div>';
	}
}
/*展示列表切换展示效果*/
var block_html= $("#list_box").html();
function block_nav(o){
	$("#list_box").html(block_html);
	$(o).parents().find(".list_style").find(".active").removeClass("active");
	$(o).parent().addClass("active");
}

function list_nav(o){
	$(o).parents().find(".list_style").find(".active").removeClass("active");
	$(o).parent().addClass("active");
	var html=[];
	html.push('<table class="table table-striped table-bordered table-advance table-hover">');
	html.push("<thead><tr><td>文件名称</td><td>上传时间</td><td>修改时间</td></tr></thead><tbody>");
	$("#list_box").find("li").each(function(){
		html.push('<tr>');
		html.push('<td class="highlight">');
		html.push(check_color($(this)));
		html.push('<span class="item_name_list">&nbsp;&nbsp;'+$(this).find(".item_name").html()+'</span>');
		html.push('</td>');
		html.push('<td>'+$(this).find(".upload_time").html()+'</td>');
		html.push('<td>'+$(this).find(".modify_time").html()+'</td>');
		html.push('</tr>');
		
	});
	html.push('</tbody></table>');
	$("#list_box").html(html.join(""));
}
/*
 * 拖拽上传文件
 * */
document.addEventListener("dragenter", function(e){  

    dropbox.style.borderColor = 'gray';  

}, false);  

document.addEventListener("dragleave", function(e){  

    dropbox.style.borderColor = 'silver';  

}, false);  

dropbox.addEventListener("dragenter", function(e){  

    dropbox.style.borderColor = 'gray';  

    dropbox.style.backgroundColor = 'white';  

}, false);  

dropbox.addEventListener("dragleave", function(e){  

    dropbox.style.backgroundColor = 'transparent';  

}, false);  

dropbox.addEventListener("dragenter", function(e){  

    e.stopPropagation();  

    e.preventDefault();  

}, false);  

dropbox.addEventListener("dragover", function(e){  

    e.stopPropagation();   

    e.preventDefault();  

}, false);  

dropbox.addEventListener("drop", function(e){  

    e.stopPropagation();  

    e.preventDefault();  

    handleFiles(e.dataTransfer.files);  

  //  submit.disabled = false;  

}, false);  

handleFiles = function(files) { 
//	alert(files.valueOf());
//	if(files.length !=1){
//		easyDialog.open({
//			  container : {
//			    header : '警告',
//			    content : '上传文件格式不正确，请上传单个文件。'
//			  },
//			  overlay : false
//			});
//	}
//    for (var i = 0; i < files.length; i++) {  
//        var file = files[i];  
//        if (!file.type.match(/image*/)) {  
//            continue;  
//        }  
//    }  
	$("#make_sure").click();
	
}  
/*点击打开文件*/
$("#dropbox").dblclick(function(){
	$("#dbopenfile").click();
	$("#dbopenfile").change(function(){
//		handleFiles($("#dbopenfile").val());
		if($("#dbopenfile").val() !="" && $("#dbopenfile").val() != null){
			DB_chuli($("#dbopenfile").val());
		}
//		alert($("#dbopenfile").val().filename());
	});
	
});
/*点击上传时的后续操作*/
function DB_chuli(files){
	var file_address =files.toString();
	var file = file_address.split(".");
	if(file[file.length-1] == "zip" || file[file.length-1] == "rar"){
		alert(1);
	}else{
		alert(0);
	}
	alert(file[1]);
}
