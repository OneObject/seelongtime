<%@page contentType="text/html; charset=utf-8"%>
<%@ page import="com.longtime.app.config.Constants"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]>
<html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]>
<html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>排行榜</title>
<meta name="menu_path" content="active.menu_rank" />
<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/ixin.css" type="text/css">
		<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/appmsg_edit.css" type="text/css">
	<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/appmsg_editor.css" type="text/css">
<link rel="stylesheet" type="text/css" href="${basepath }/static/ixin/css/uploadify.css">
<script type="text/javascript">
var token = "${result.uploadToken}";
//var qiniuImageBasePath = "${result.qiniuImageBasePath}";
var qiniuImageBasePath = "<%=Constants.IMG_SERVER_DOWNLOAD%>";
var coverSuffix = "${result.coverSuffix}";
var summary = "${rank.remark}";
</script>
</head>
<body>

	<!-- 页面顶部-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
				<li><span href="#">排行榜</span></li>
			</ul>
			<!-- END PAGE TITLE & BREADCRUMB-->
		</div>
	</div>
	<!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-lg-12">
			<div class="portlet box yellow">
				<div class="portlet-title">
					<div class="caption">
						<i class="fa fa-bar-chart-o"></i><span>排行榜信息</span> 
					</div>
				</div>
				<div class="portlet-body main_bd box">
					<div class="mauto">
					<div class="col-md-12">
						<!-- 创建 start-->
						<div class="form">
							<form role="form" id="rankForm" action="${basepath }/mgr/rank/save.xhtml" method="post">
								<div class="form-body">
								
								
									<div class="form-group">
										<label for="biaoti">URL地址</label>
										<br>
										${basepath}/protal/rank/${rank.id}.xhtml
									</div>
									
									<div class="form-group" id="con_title">
										<label for="biaoti">标题<span style="color:red;">&nbsp;*
										</span></label>
										<input type="text" class="form-control" value="${rank.title }" id="rankTitle" name="title" placeholder="">
										<input type="hidden" name="id" value="${rank.id }">
										<span class="help-block" style="display:none;color:red;" id="titleInfo">
											标题不能为空
										</span>
									</div>
									<div class="appmsg_edit_item" style="margin-bottom:10px;">
										<label for="">封面</label>
										<div class="frm_input_box" style="border:1px solid #e5e5e5; padding-top:3px; padding-bottom:-5px;padding-left:10px;">
											<div class="upload_box">
												<div class="upload_area">
													<input type="file" name="file_upload"  id="file_upload" />
													<ul class="upload_file_box" style="display: none;" id="queue"></ul>
												</div>
											</div>
												<div style="display: none;margin-bottom:20px;" id="small_prev">
													<span id="image_cover"></span><a class="js_removeCover" href="javascript:void(0);"
													onclick="deleteCover();">删除</a>
													<input type="hidden" name="coverPath" id="coverPath" value="${rank.cover }"/>
												</div>
										</div>
									</div>
								<div id="rank_item_wrapper">
									<c:set  var="index" value="0"/>
									<c:if test="${not empty rank.items}">	<%-- --%>
									 <c:forEach items="${rank.items }" var="item" varStatus="vs">
										
										<c:set var="index" value="${vs.index+1 }"/>
									
										<div class="appmsg_edit_item" style="margin-bottom:10px;">
											<label for="" style="width: 100%" id="pai_${index}">排名${index}
												<span class="input-group-btn" style="display: block; float: right;  margin-right: 35px;">
												<button onclick="removethis(this,${index})" id="button_${index}" type="button" class="btn red"><i style="font-size: 18px;" class="fa fa-times"></i></button>
												</span>
											</label>
											<div class="frm_input_box" style="border:1px solid #e5e5e5; padding-top:3px; padding-bottom:-5px;padding-left:10px;">
												<div class="upload_box">
													<div class="upload_area">
														<input type="file" name="file_upload${index}"  id="file_upload${index}" />
														<ul class="upload_file_box" style="display: none;" id="queue"></ul>
													</div>
												</div>
													<div style="display: none;margin-bottom:20px;" id="small_prev${index }">
														<span id="image_cover${index}"></span>
														<input type="hidden" name="coverPath${index}" id="coverPath${index}" value="${item.img }"/>
													</div>
													<br>
													标题<input type="text" name="title${index}" class="form-control" value="${item.title}">  内容<input type="text" name="remark${index}" value="${item.remark }" size="50" class="form-control" >
											</div>
										</div>
										
										<c:if test="${not empty item.img}">
										<script type="text/javascript">
											$("#image_cover${index}").html("<img style='max-width:100px;max-height:200px;' src = '"+qiniuImageBasePath+"${item.img}-180x180'>");
											$("#small_prev${index}").show();
											</script>
										</c:if>
										
									</c:forEach>
										 
									</c:if>	
										
										
										<c:forEach var="i" begin="${index+1}" end="5">
											<div class="appmsg_edit_item" style="margin-bottom:10px;" id="item_${i}">
											<label for="" style="width: 100%" id="pai_${i}">排名${i}
												<span class="input-group-btn" style="display: block; float: right;  margin-right: 35px;">
												<button onclick="removethis(this,${i})" id="button_${i}" type="button" class="btn red"><i style="font-size: 18px;" class="fa fa-times"></i></button>
												</span>
											</label>
											<div class="frm_input_box" style="border:1px solid #e5e5e5; padding-top:3px; padding-bottom:-5px;padding-left:10px;">
												<div class="upload_box">
													<div class="upload_area">
														<input type="file" name="file_upload${i}"  id="file_upload${i}" />
														<ul class="upload_file_box" style="display: none;" id="queue"></ul>
													</div>
												</div>
													<div style="display: none;margin-bottom:20px;" id="small_prev${i}">
														<span id="image_cover${i}"></span>
														<input type="hidden" name="coverPath${i}" id="coverPath${i}"/>
													</div>
													<br>
													标题<input type="text" name="title${i }" class="form-control">  内容<input type="text" name="remark${i}" size="50" class="form-control" >
												</div>
											</div>
									   </c:forEach>
								</div>
														
														
									<div style="width: 45%; margin-left: 27.5%;" id="addoptions" onclick="addOption()" class="btn btn-success">
										<i class="fa fa-plus"></i>&nbsp;添加选项
									</div>
									
									<input type="hidden" value="5" name="itemindex">
									
									<div id="js_ueditor" class="appmsg_edit_item content_edit">
										<label for="" class="frm_label">简介</label>
										<input type="hidden" name="remark" value="" id="rankRemark"/>
										<div id="loading">
											<img alt="正在初始化编辑器，请稍候···" src="${basepath }/static/ixin/img/loading.gif">正在初始化编辑器，请稍候···
										</div>
										<textarea name="后台取值的key" id="myEditor" style="border: #f8f8f8;background-color: #f8f8f8;"></textarea>
										
									</div>
								</div>
					<input type="hidden" class="form-control" value="${model }" id="model" name="model" >
							</form>
						</div>
						
						<!-- 创建 end-->
					</div>
						
					</div>
					
					<!-- 添加 end -->
					<div class="btngroup" style="text-align:center;">
							<div class="btn btn-warning" onclick="saveRankInfo('${model}');">保存</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>
<content tag="pageCore"> 

<script src="${basepath }/static/ixin/js/jquery.uploadify.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${basepath }/static/ixin/plugin/ueditor1_3_6-utf8-jsp/ueditor.config.js"></script>
	<script type="text/javascript" src="${basepath }/static/ixin/plugin/ueditor1_3_6-utf8-jsp/ueditor.all.min.js"></script>
</content>
<content tag="pageInit"> <!-- 初始化窗口 --> 
<script type="text/javascript" src="${basepath }/static/ixin/js/rank.js"></script>
<script type="text/javascript">
<c:if test="${not empty rank && not empty rank.cover}">
$("#image_cover").html("<img style='max-width:100px;max-height:200px;' src = '"+qiniuImageBasePath+"${rank.cover}"+coverSuffix+"'>");
$("#small_prev").show();
</c:if>
var item_num = $('#rank_item_wrapper > div').length;
$("input[name='itemindex']").val(item_num);
for(var index=1;index<=item_num;index++){
	addFileUpload(index);
}

function addOption(){
	var add_index =  $('#rank_item_wrapper > div').length + 1;
	//alert(add_index);
	var item ='<div class="appmsg_edit_item" style="margin-bottom:10px;" id="item_'+add_index+'">'
			+'<label for="" style="width: 100%" id="pai_'+add_index+'">排名'+add_index
			+'<span class="input-group-btn" style="display: block; float: right;  margin-right: 35px;">'
			+'<button onclick="removethis(this,'+add_index+')" type="button" class="btn red" id="button_'+add_index+'"><i style="font-size: 18px;" class="fa fa-times"></i></button>'
			+'</span>'
			+'</label>'
			+'<div class="frm_input_box" style="border:1px solid #e5e5e5; padding-top:3px; padding-bottom:-5px;padding-left:10px;">'
			+'<div class="upload_box">'
			+'<div class="upload_area">'
			+'<input type="file" name="file_upload'+add_index+'"  id="file_upload'+add_index+'" />'
			+'<ul class="upload_file_box" style="display:none;" id="queue"></ul>'
			+'</div>'
			+'</div>'
			+'<div style="display: none;margin-bottom:20px;" id="small_prev'+add_index+'">'
			+'<span id="image_cover'+add_index+'"></span>'
			+'<input type="hidden" name="coverPath'+add_index+'" id="coverPath'+add_index+'"/>'
			+'</div>'
			+'<br>'
			+'标题<input type="text" name="title'+add_index+'" class="form-control"> ' 
			+'内容<input type="text" name="remark'+add_index+'" size="50" class="form-control" >'
			+'</div>'
			+'</div>'
	$("#rank_item_wrapper").append(item);
	addFileUpload(add_index);
	$("input[name='itemindex']").val(add_index);
	//alert($("input[name='itemindex']").val());
}

function removethis(_this,current_index){
	var all =  $('#rank_item_wrapper > div').length;//alert('当前有 '+add_index);
	if(all<=5){
		easyDialog.open({
	        container : {
	            header : '提示',
	            content : '<div style="background-color: #ffffff;width:260px;height:20px;text-align:center;">至少要有5项</div>'
	        },
	        autoClose:1200
	    });
		return;
		}
	$(_this).closest(".appmsg_edit_item").remove();

	for(var i = current_index+1 ;i<=all;i++){
			$("#pai_"+i+"").html($("#pai_"+i+"").html().replace("排名"+i,"排行"+(i-1)+""));
		}
}
</script>
 </content>