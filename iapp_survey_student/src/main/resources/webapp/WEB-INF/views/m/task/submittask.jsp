<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>${task.title }</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="${basepath }/static/css/320.css">
</head>
<body>
<section class="task-detail-box">
    <span class="task-detail-time" style="">${task.title }</span>
      <span class="task-need" ><strong></strong></span>
            <p>
                ${task.taskrequire}
            </p>
           
    <hr>
    <div id="submit">
	    <span class="task-textarea">
	       <textarea placeholder="我的描述(1000字以内)···" id="descript" style="height: 150px;"></textarea>
	    </span>
	  
	    <!--附件展示  -->
	      <!--  
	    <div class="preview-area" style="display: none;">
	    	<ul>
	    		<li>
	    			<div class="funjian-item">
	    				<div class="imgbox">
	    					<img alt="图片预览" src="${basepath }/static/img/course/d_320x180_02.png" id="pic">
	    				</div>
	    				<div class="detail-control">
	    					<div class="itemdetail">
		    					<div class="progress">
								  <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 10%">
								    <span class="sr-only">10%完成</span>
								  </div>
								</div>
								<span class="fujian-name">这里显示的是附件的名称</span>
	    					</div>
							<div class="fujian-control">
								<span class="btn btn-danger"><i class="fa fa-times"></i>&nbsp;移除</span>
							</div>
	    				</div>
	    			</div>
	    		</li>
	    	</ul>
	    </div>
	    -->
	    <!-- end -->
	    <hr style="margin-bottom: 0px;">
	     <div  id="upload">
	    </div>
	    <label style="font-size: 12px;color:#999;font-weight: normal;">* 点击加号上传图文</label>
	    <input type="hidden" id="taskid" value="${task.id }">
	    <input type="hidden" id="taskname" value="${task.title }">
	    <span class="btn btn-success btn-block" onclick="submit();">提交</span>
    </div>
    
    <span class="alert alert-warning task-detail-time" id="result" style="display: none;">已参与，谢谢参加。</span>
</section>

<script type="text/javascript" src="${basepath }/static/plugins/Huploadify/jquery.Huploadify.js"></script>
<script type="text/javascript">
	var obj = new Object();
	var i=1;
	var attachments = new Array();
    $(function(){
        $('#upload').Huploadify({
            auto:true,
            fileTypeExts:'*',
            multi:true,
            formData:{'token':'${uptoken}'},
            fileSizeLimit:1024*1024,
            showUploadedPercent:false,//是否实时显示上传的百分比，如20%
            showUploadedSize:false,
            removeTimeout:60*60*1000,
            uploader:'<%=Constant.QINIU_SERVER%>',
            onUploadStart:function(){
               // alert('开始上传');
            },
            onInit:function(){
                //alert('初始化');
            },
            onUploadComplete:function(file,data,response){
            	$("#progress_fileupload_1_"+i).show();
            	$("#progress_fileupload_1_"+i).html("100%");
            	var result = eval("("+data+")");
				var path = result.url;
				var name = result.name;
				var extStart=name.lastIndexOf(".");
				var ext=name.substring(extStart,name.length).toUpperCase();
				if(ext==".BMP" || ext==".PNG" || ext==".GIF" || ext==".JPG" || ext==".JPEG"){
					var url="<%=Constant.IMG_SERVER_DOWNLOAD%>"+path;
					$("#pic_fileupload_1_"+i).attr("src",url);
				}
				$("#name_fileupload_1_"+i).html(name.substring(0,6)+"...");
				var attachment = new Object();
				attachment.url = path;
				attachment.name = name;
				attachments[i] = attachment;
				i++;
            },
            onCancel:function(file){
            	attachments[file.index] = null;
            }
        });
    });
    
    var flag = false;
    
    function submit(){
    	if(flag){
    		alert("内容已提交，请等待。");
    		return;
    	}
    	var descript = $("#descript").val();
    	if(!descript){
    		alert("我的描述不能为空");
    		return;
    	}
    	if(descript.length>1000){
    		alert("我的描述内容不能大于1000字。");
    		return;
    	}
    	flag = true;
    	obj.content = descript;
		var validAttachments = [];
		for(var j=0;j<attachments.length;j++){
			if(attachments[j] != null){
				validAttachments.push(attachments[j]);
			}
		}
    	obj.attachments = validAttachments;
    	obj.taskid=$("#taskid").val();
    	obj.taskname=$("#taskname").val();
    	$.ajax({
    		url:"${basepath}/m/task/dosubmit.json",
    		type:"POST",
    		data:JSON.stringify(obj),
    		contentType: "application/json; charset=utf-8",
    		success:function(data){
    			if(data){
    				$("#submit").hide();
        			$("#result").show();
    			} else {
    				alert('操作失败，请再次尝试，如果多次尝试仍未成功，请联系管理员！');
    				flag = false;
    			}
    		},
    		error: function(data){
    			alert('操作失败，请再次尝试，如果多次尝试仍未成功，请联系管理员！');
    			flag = false;
    		}
    	});
    }
</script>
</body>
</html>