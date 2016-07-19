<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>新建栏目</title>
<meta name="menu_path" content="ixin.menu_channel" />
<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/course.css">
<link rel="stylesheet" media="screen" href="${basepath}/static/ixin/css/appmsg_editor.css" type="text/css">
 <link rel="stylesheet" type="text/css" href="${basepath }/static/ixin/css/uploadify.css">
 <style type="text/css">
 .form-horizontal .control-label, .form-horizontal .radio, .form-horizontal .checkbox, .form-horizontal .radio-inline, .form-horizontal .checkbox-inline {
padding-top: 0px;
}
 </style>
</head>
<body>

         <div class="row" >
            <div class="col-md-12">
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
               <ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
				<li><span href="#">栏目管理</span></li>
				</ul>
            </div>
         </div>
         <!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN VALIDATION STATES-->
			<div class="portlet box green">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-reorder"></i><span id="addinfo">新增信息</span>
					</div>
				</div>
				<div class="portlet-body form box_box">
					<div class="col-md-12" id="course_info">
						<div class="form-body">
							<!-- BEGIN FORM-->
							<form id="form_sample_2" class="form-horizontal">
								<div class="form-group" id="con_title">
									<label class="control-label col-md-3">栏目名称<span
										class="required">*</span></label>
									<div class="col-md-6">
										<input type="text" name="title" id="title" data-required="1" class="form-control" value="${channelEntity.title}" />
									</div>
                                    <div class="col-md-3">
                                        <span id="tip_title" for="title" class="help-block" style="">必填</span>
                                    </div>
								</div>	
								 
								<div class="form-group" >
									<label class="control-label col-md-3">显示方式</label>
									<div class="col-md-6">
									<c:forEach var="item" items="${templates }" >
										<label >
										<input type="radio" name="showType" value="${item.id }"  ${item.id eq type ?'checked="checked"':'' } style="margin-left: 0px;" />${item.name}&nbsp;&nbsp;&nbsp;
										</label>
									</c:forEach>
									
									</div>
								</div>
								 
							<div class="form-group">
									<label for="" class="control-label col-md-3"> 封面
									</label>
									<div class="col-md-6 frm_input_box " style="border: 1px solid #ddd;margin-left: 15px;width: 618px;">
										<div class="upload_box">
											<div class="upload_area">
												<input type="file" name="file_upload" id="file_upload" />
												<ul class="upload_file_box" style="display: none;" id="queue"></ul>
											</div>
										</div>
											<div style="display: none;margin-bottom:20px;" id="small_prev">
												<span id="image_cover"></span><a class="js_removeCover" href="javascript:void(0);"
												onclick="deleteCover();">删除</a>
											</div>
											<input type="hidden" id="fileId" value="">
											<input type="hidden" id="coverPath" value=""/>
									</div>
								</div>
							<div class="form-group" id="con_remark">
									<label class="control-label col-md-3">简介</label>
									<div class="col-md-6">
										<textarea rows="4" cols="" name="remark" id="remark" class="form-control mytextarea" >${channelEntity.remark}</textarea>
									</div>
									<div class="col-md-3">
                                        <span id="tip_remark" for="title"  style="color: #E22222; display: none;">简介长度过长</span>
                                    </div>
								</div>
								<!--  
								<div class="form-group" id="con_module">
			                        <label class="control-label col-md-6">
			                           <input type="radio" style="text-align:center;" checked="checked" name="module" value="0" ${channelEntity.style eq 0 ? 'checked="checked"' :''}>单图文模板<br>
			                            <img src="${basepath}/static/ixin/img/dtw.png" style="width:180px;height:240px;margin-top:10px;border:1px solid gray;"></img><br>
			                        </label>
			                        &nbsp;&nbsp;&nbsp;
			                        <label class="control-label">
			                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <input  type="radio" name="module" value="1" ${channelEntity.style eq 1 ? 'checked="checked"' :''}> 多图文模板<br>
			                            <img src="${basepath}/static/ixin/img/seriesstyle.png" style="width:180px;height:240px;margin-top:10px;border:1px solid gray;"></img><br>
			                        </label>  
			                    </div>-->
								<div class="row">
									<div class="col-md-offset-3 col-md-9" style="margin-left:80%;">
									    <input type="hidden" id="hid_id" name="hid_id" value="${channelEntity.id}">
										<button type="button" id="subButton" class="btn green">保存</button>
									</div>
								</div>
							</form>
						</div>
					</div>
					
			</div>
		</div>

	</div>
	</div>
	<!-- 弹出层显示树状结构的部门 -->
</body>
</html>
<content tag="pageCore">
<script src='${basepath }/static/public/javascripts/easydialog-static-params.js' type='text/javascript' ></script>
<script src="${basepath }/static/ixin/js/jquery.uploadify.min.js" type="text/javascript"></script>
<script type="text/javascript">
var basepath = "${basepath}";
var token = "${result.uploadToken}";
//var qiniuImageBasePath = "${result.qiniuImageBasePath}";
var qiniuImageBasePath = "<%=Constants.IMG_SERVER_DOWNLOAD%>";
var coverSuffix = "${result.coverSuffix}";
"${channelEntity.cover}";
<c:if test="${ not empty channelEntity.cover}">
$('#coverPath').val("${channelEntity.cover}");
$("#image_cover").html("<img style='max-width:100px;max-height:200px;' src = '"+qiniuImageBasePath+"${channelEntity.cover}"+coverSuffix+"'>");
$("#small_prev").show();	
</c:if>
$(document).ready(function(){
    var hid_id=$("#hid_id").val();

    if(hid_id!=null && hid_id!=""){
           $("#addinfo").html("修改信息");
           $("title").html("修改栏目");
           $("#subButton").html("修改"); 
        }
	$("#subButton").click(function(){
		 $("#tip_remark").hide(); 
		if(hid_id!=null && hid_id!=""){
              update();
              return;
			}
         //栏目名称
        var title=$.trim($("#title").val());
        if(title==null || title==""){
            $("#con_title").addClass("has-error");
            return;
            }else{
                $("#con_title").removeClass("has-error");
                }
        if(getBytesCount(title)>=255)
            {
        	$("#con_title").addClass("has-error");
        	$("#tip_title").html("栏目名称过长！");
            return;
            }
        else
            {
        	$("#tip_title").html("必填");
        	$("#con_title").removeClass("has-error");
            }
      
       var remark=$.trim($("#remark").val()); 
       if(getBytesCount(remark)>=255)
           {
           		$("#tip_remark").show();
           		return;
           }
       else
           {
				$("#tip_remark").hide();
           }    
       var style=0;
       var cover = $("#coverPath").val();
       var showType = $('input[name="showType"]:checked').val();
        $.ajax({
              url:"${basepath}/mgr/channel/addchannel.json",
              data:{"title":title,"remark":remark,"style":style,"cover":cover,"showType":showType},
              type:"post",
              success:function(data){
                  if(data){
                	 showDialogMessage("添加成功");
                  		setTimeout(function(){
                      		window.location.href="${basepath}/mgr/channel/index.xhtml";
                      	},1000);
                      }else{
                    	  showDialogMessage("添加失败");
                      }
                  }
           });
		});

	//上传封面
	$('#file_upload').uploadify({
		'formData'     : {
		'token'     : token,
		},
		'fileObjName'  : 'file',
		'buttonText' : '<i class="glyphicon glyphicon-open"></i>上传',
		'buttonClass' : 'upload_access',
		'swf'      : basepath+'/static/ixin/css/uploadify.swf',
		//'uploader' : 'http://up.qiniu.com/',
		'uploader' : uploadurl,
		'onUploadSuccess' : function(file,data,response){
			var result = eval("("+data+")");
			$("#image_cover").html("<img style='max-width:100px;max-height:200px;' src = '"+qiniuImageBasePath+result.hash+coverSuffix+"'>");
			$("#small_prev").show();
		    //文件长传完成之后，在本地保存一份文件信息的数据
			$('#coverPath').val(result.hash);
			saveFile(file,result);
		}
	});
});

function deleteCover(){
	$.ajax({
		type: "GET",
		url:  basepath+"/mgr/fodder/delsourcefile.xhtml?fileId="+$('#fileId').val(),
		contentType: "application/json; charset=utf-8",
		success:function(data){
			$("#small_prev").hide();
			$('#fileId').val("");
			$('#coverPath').val("");
		},
		error: function(data){
			alert("删除失败");
		}
	});
}

function saveFile(file,result){
	var requestBody = new Object();
	requestBody.size = result.size;
	requestBody.mimeType = result.mimeType;
	requestBody.filePath = result.url;
	//requestBody.name = result.name;
	//console.debug(JSON.stringify(requestBody));
	
	$.ajax({
		type: "POST",
		url:  basepath+"/mgr/fodder/savesourcefile.xhtml",
		data: JSON.stringify(requestBody),
		contentType: "application/json; charset=utf-8",
		success:function(data){
			$('#fileId').val(data);
		},
		error: function(data){
			alert('保存失败');
		}
	});
	
}
function update(){
	var id=$("#hid_id").val();

    var title=$.trim($("#title").val());
    if(title==null || title==""){
        $("#con_title").addClass("has-error");
        return;
        }else{
            $("#con_title").removeClass("has-error");
            }
    if(getBytesCount(title)>=255)
    {
	$("#con_title").addClass("has-error");
	$("#tip_title").html("栏目名称过长！");
    return;
    }
else
    {
	$("#tip_title").html("必填");
	$("#con_title").removeClass("has-error");
    }

var remark=$.trim($("#remark").val()); 
if(getBytesCount(remark)>=255)
   {
   		$("#tip_remark").show();
   		return;
   }
else
   {
		$("#tip_remark").hide();
   } 
    var style=0;
    var cover = $("#coverPath").val();
    var showType = $('input[name="showType"]:checked').val();
    $.ajax({
        url:"${basepath}/mgr/channel/update.json",
        data:{"title":title,"remark":remark,"id":id,"style":style,"cover":cover,"showType":showType},
        type:"post",
        success:function(data){
            if(data){
            	showDialogMessage("修改成功");
            	setTimeout(function(){
               		 window.location.href="${basepath}/mgr/channel/index.xhtml";
                },1000);
                }else{
                	showDialogMessage("修改失败");
                    }
            }
     });
}

function getBytesCount(str)
{
  var bytesCount = 0;
  if (str != null)
  {
    for (var i = 0; i < str.length; i++)
    {
      var c = str.charAt(i);
          if (c.match(/[^\x00-\xff]/ig) != null) //全角
           {
              bytesCount += 2;
           }
          else
           {
              bytesCount += 1;
           }
    }
  }
  return bytesCount;
}

function showDialogMessage(text){

	var html = '<div style="width:280px;height:40px;text-align:center;">'+text+'</div>';
	easyDialog.open({
   	 	container : {
    	header : '提示',
    	content : html
   		},
   		autoClose : 2000
});
	
}


</script>
</content>
<content tag="pageInit">
<!-- 初始化窗口 -->
</content>	
