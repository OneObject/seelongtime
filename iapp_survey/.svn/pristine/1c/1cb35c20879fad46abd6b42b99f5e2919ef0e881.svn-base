<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="en" id="top" class="no-js">
<head>
<base href="${basepath}/" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<!-- jquery library -->
<script type="text/javascript" src="http://v.jteam.cn/player/static/jquery-1.10.2.min.js"></script>
<!-- player library -->
<script type="text/javascript" src="http://v.jteam.cn/player/static/player.js?v=1.0" charset="utf-8"></script>
<!-- 为了方便升级，请用绝对路径引用该 JS，src改成 http://v.jteam.cn/player/static/player.js -->
<script src="http://v.jteam.cn/jvideo/static/jquery.swfobject.1-1-1.js" charset="utf-8"  type="text/javascript"></script>
<script type="text/javascript" src="http://v.jteam.cn/jvideo/static/common.ui.juploader-1.0.js" charset="utf-8"></script>


<script type="text/javascript" src="${basepath}/static/js/Queue.js" charset="utf-8"></script>


<script>

 var uploadQueue = new Queue();
 $(function(){
	
	setupUploader();

 });
 //初始化player 
 function setupUploader(){
	$("#uploader").juploader({
	   debug:true,
	   uploadType:"html", //html 方式上传无限制大小，但不能设定选择的文件类型， flash 有限制3G文件大小，但可以选定文件类型
	   serverUrl: "http://v.jteam.cn/jvideo/upload.do?action=upload",
	   params:{
		 uploadKey:"testkey" //用来访问平台的appKey  
	   },
	   //当有文件添加时，触发
	   onQueued:function(item,$item){
		//item 格式：{"id":"uploadPanel_0","name":"Black.Hawk.Down.2001.CD1.rmvb","fileSize":0,"speed":1,"bytes":0,"timeLeft":"99:99:99","percent":0}	   
		uploadQueue.EnQueue(item);
		showUploadProcess("init",item);
	   },
	   //当文件状态改变时触发
	   onStateChanged:function(item,status){
		// item
		// {"id":"uploadPanel_0","name":"DY43.mp4","fileSize":"910.68M","speed":"57K","bytes":"112.39K","timeLeft":"05:33:38","percent":0,"uploadUrl":"http://180.153.177.179:8880?token=x57aKryN7o9DFy0Ip5bv5t33TqMXdmPv","token":"x57aKryN7o9DFy0Ip5bv5t33TqMXdmPv","status":1}
		  var json = ($.toJSON(item));
		  if (status ==0 ){
			//开始上传
			console.log("status ==0 "+json);
			//显示上传进度信息
			showUploadProcess("start",item);
		  }else if (status == 1){
			 //这里会收到上传进度，自己根据相关信息画进度条
			 console.log("status ==1 "+json);
			 // 更新上传进度信息
			 showUploadProcess("process",item);

		  }else if (status==2){
			  $.ajax({
		            type: "POST",
		            url: "${basepath}/base/admin/ivideo/uploadstatus.xhtml",
		            data:{"token":item.token,"name":item.name,"size":item.fileSize},
		            success: function (data) {
		            	if(data.stauts<0){
		            		showUploadProcess("errorCode",item);
		            	}else if(data.stauts!=3){
		            		showUploadProcess("transcoding",item);
		            	}else if(data.stauts==3){
		            		showUploadProcess("finish",item);
		            	}
		            },
		            error: function (msg) {
		                alert(msg);
		            }
		        });

		  }
	   },
	   onError:function(errorId,errorMsg){
		  //上传失败
		  showUploadProcess("error",errorId);
	   },
	   //从队列里选择一个上传
	   onGetNextItemId:function(){
		   if(uploadQueue.IsEmpty()){
			   return null;
		   }
		   var item = uploadQueue.DeQueue();
		   if(item==null){
			   return null;
		   }
		   return item.id;
	   }
     }
	 );
 }
 
 //显示文件上传进度信息  type:init | process | finish
	 function  showUploadProcess(type,item){
			var id = item.id;
			if("init"==type){
				// 放到正在上传div中
				
				var html = '<div>文件名：[' + item.name + ']， <span id="id_'+id+'" >上传状态：<span style="color:red;">[等待上传]</span></span></div><br>';
				$(html).appendTo($("#uploadQueue")).addClass("upload-item").data("item",item).attr("data-id",item.id).addClass("upload-item");
				
				return ;
			}
			if("start"==type){
				$("#id_"+item.id).html(' [准备上传]');
				
				return;
			}
			if("process"==type){
				 //更新 上传状态信息
				$("#id_"+item.id).html(' 文件大小：['+item.fileSize+']，已上传：['+item.percent+'%]， 上传速度：['+item.speed+'/s]， 剩余时间：['+item.timeLeft+']');
				
				return;
			
			}
			if("finish"==type){
				$("#id_"+item.id).html(' 文件大小：['+item.fileSize+']， 上传状态：[上传完成]');
				return;
			}
			if("error"==type){
				if(!id){
					id=item;
				}
				$("#id_"+id).html('[上传失败]');
				return;
			}
			if("errorCode"==type){
				$("#id_"+item.id).html(' 上传状态：[上传失败]');
			}
			if("transcoding"==type){
				$("#id_"+item.id).html(' 文件大小：['+item.fileSize+']， 上传状态：[上传完成]');
			}
	   }
 
</script>
<title>上传测试页面</title>
</head>
<body>
<!-- <h2 style="padding: 0px;margin: 0px;">上传视频</h2> -->
<div style="width:90%; margin: 10px auto; ">
	<div id="uploader"></div>
</div>
<div id="tx_father" style="width:90%; margin:auto; z-index:80;">

<div style="margin:0 4px; background:#B0BEC7; height:1px; overflow:hidden;"></div>
<div style="margin:0 2px; border:1px solid #B0BEC7; border-width:0 2px; background:#E1E7E9; height:1px; overflow:hidden;"></div>
<div style="margin:0 1px; border:1px solid #B0BEC7; border-width:0 1px; background:#E1E7E9; height:1px; overflow:hidden;"></div>
<div style="margin:0 1px; border:1px solid #B0BEC7; border-width:0 1px; background:#E1E7E9; height:1px; overflow:hidden;"></div>
<div style="background:#E1E7E9; border:1px solid #B0BEC7; border-width:0 1px;">
 <div style="font-size:12px; font-weight:bolder; font-family:Verdana; color:#258; padding:2px 10px 5px;">
  <!--标题，这里想要换背景色，就在这个div的style中增加background-color属性，换了之后需要设定一下宽度，不然很丑 -->
 </div>
 <div style="background:#FFF; margin:0 3px; font-size:12px; font-family:Verdana; color:#333; padding:5px 10px; overflow:hidden;">
 
	
<h3>上传队列</h3>
<div id="uploadQueue" style="color:#00F"></div>

 </div>
 
 
</div>
<div style="margin:0 1px; border:1px solid #B0BEC7; border-width:0 1px; background:#E1E7E9; height:1px; overflow:hidden;"></div>
<div style="margin:0 1px; border:1px solid #B0BEC7; border-width:0 2px; background:#E1E7E9; height:1px; overflow:hidden;"></div>
<div style="margin:0 2px; border:1px solid #B0BEC7; border-width:0 2px; background:#E1E7E9; height:1px; overflow:hidden;"></div>
<div style="margin:0 4px; background:#B0BEC7; height:1px; overflow:hidden;"></div>

<p style="color: gray;font-size: 12px;">
文件支持:<br/>
avi、flv、f4v、mkv、webm、mov、mp4、m4a、m4v、3gp 、mpg、vob、ts、m2ts、wmv、rm、wav、mp3、wma、flac、ape、arm、ogg等主流视频、音频格式
</p>
</div>
</body>
</html> 
