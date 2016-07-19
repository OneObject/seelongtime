<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<!DOCTYPE html>
<html lang="zh-CN">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style"
	content="black-translucent" />
<meta name="format-detection" content="telephone=no" />

<link rel="stylesheet"
	href="${basepath}/static/plugins/font-awesome-4.1.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="${basepath}/static/m_h5/css/common.css">
<link rel="stylesheet" href="${basepath}/static/m_h5/css/color.css">

<title>${taskUserVo.taskname}</title>
</head>
<body>
	<header class="ctl_header">
    	<div class="back"><a href="javascript:history.go(-1);"><i class="fa fa-angle-left"></i></a></div>
     ${taskUserVo.taskname}
	</header>
	<article class="zuoye ctl_cont">
		<section class="subInfo">
			<h2>${task.title}</h2>
			<p>${task.taskrequire }</p>
		</section>
		<section class="uploadBox">
			<textarea id="content" placeholder="我的描述（1000字以内）..."></textarea>
			<div    id="upload"></div>
			<label style="clear:left;font-size:12px;color:#999;display:block;">最多可上传5张</label>

		</section>
		<span class="uploadSub" onclick="commit()">提交</span>
	</article>
<link rel="stylesheet"
	href="${basepath}/static/m/new/css/general.css?v=2" >
<script type="text/javascript" src="${basepath}/static/m_h5/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="${basepath}/static/plugins/Huploadify/jquery.HuploadifyNew.js"></script>
<script type="text/javascript" src="${basepath}/static/m/new/plugins/shixy/libs/zepto.js"></script>
<script type="text/javascript" src="${basepath}/static/m/new/plugins/shixy/libs/zepto.touch2mouse.js"></script>
<script type="text/javascript">
var attachments = new Array();
$(function(){  
	//文本域自适应高度		
	$(".uploadBox textarea").bind("propertychange input",function(){
			if(this.scrollHeight>115){
				this.style.height=this.scrollHeight+'px';
				}			
		});
	$(".uploadBox textarea").css({"width":"100%"});
	//图片
    $('#upload').Huploadify({
		auto:true,
    	fileTypeExts:'*.jpg;*.png;*.gif;*.jpeg;*.JPG;*.PNG;*.GIF;*.JPEG',
        multi:false,
        formData:{'token':'${uptoken}'},
        fileSizeLimit:10*1024,
        showUploadedPercent:false,//是否实时显示上传的百分比，如20%
        showUploadedSize:false,
        removeTimeout:60*60*1000,
        uploader:'<%=Constant.QINIU_SERVER%>',
     	onUploadStart:function(){
        	var i = $("#upload").find(".uploadify-queue-item").length;
      		if(i>=5){
				$("#upload").find("a").hide();
   			}
		},
		onInit:function(){
       	 // alert('初始化');
		},
		onUploadComplete:function(file,data,response){
			var i = file.index;
	      	$("#progress_fileupload_1_"+i).show();
	   	    //$("#progress_fileupload_1_"+i).html("100%");  //完成之后进度可显示
	     	var result = eval("("+data+")");
			var path = result.url;
			var name = result.name;
			var extStart=name.lastIndexOf(".");
			var ext=name.substring(extStart,name.length).toUpperCase();
			if(ext==".BMP" || ext==".PNG" || ext==".GIF" || ext==".JPG" || ext==".JPEG"){
				var url="<%=Constant.IMG_SERVER_DOWNLOAD%>"	+ path + "-80x80";
				$("#pic_fileupload_1_" + i).attr("src", url);
			}
			$("#name_fileupload_1_" + i).html( name.substring(0, 6) + "...");
			$("#fileupload_1_" + i).data("imgpath", path);//把地址存在div的 data属性里待用
			var attachment = new Object();
			attachment.url = path;
			attachment.name = name;
			attachments[i] = attachment;
		},
		onCancel : function(file) {
			var i = $("#upload").find(".uploadify-queue-item").length;
			if (i <= 5) {
				$("#upload").find("a").show();
			}
			attachments[file.index] = null;
		}
	});
})	
var obj = new Object();
var taskuserid = "${taskuser.id}";
var taskid = "${task.id}";
var taskname = "${task.title}";
/**
 * 提交作业
 */
function commit(){
	var content = $("#content").val();
	if(content == null || "" == content){
		showTishi("请输入描述");
		return;
	}
	var paths='';
	var hasImgUploading = false;

	//jQuery(".uploadify-queue-item").each(function(){
  	 $("#upload").find(".uploadify-queue-item").each(function(){
		var path = jQuery(this).data("imgpath");
		if(!path){
			hasImgUploading = true;
			return ;
		}
		paths += path+',';
	 });
	if(hasImgUploading){
		J.showWarn('图片仍在上传','error');
		return ;
	}
	var validAttachments = [];
	for(var j=0;j<attachments.length;j++){
		if(attachments[j] != null){
			validAttachments.push(attachments[j]);
		}
	}
	obj.content = content;
	obj.attachments = validAttachments;
	obj.taskid=taskid;
	obj.taskname=taskname;
	$.ajax({
		type : "POST",
		url : "${basepath}/m/h5/task/commit.json",
		data : JSON.stringify(obj),
		contentType: "application/json; charset=utf-8",
		success : function(data) { 
			if(data){
				window.location.href="${basepath}/m/h5/task/index.xhtml";
			}
		},
		error : function() {
		}
	});
}
</script>

	<style type="text/css">
body {
	background: #f8f8f8;
}
</style>
</body>
</html>
