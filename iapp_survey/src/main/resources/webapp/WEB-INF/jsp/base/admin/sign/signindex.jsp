<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>今日签到</title>
<meta name="menu_path" content="system.sign" />
<link rel="stylesheet" type="text/css"
	href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet"
	href="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.css" />
<link rel="stylesheet" media="screen"
	href="${basepath }/static/public/stylesheets/course.css">
<link rel="stylesheet"
	href="${basepath }/static/public/easydialog-v2.0/easydialog.css"
	type="text/css">
</head>
<body>
	<!-- 面包屑开始-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i><a href="${basepath }">首页</a><i
					class="icon-angle-right"></i></li>
				<li><span href="javascript:void(0)">今日签到</span></li>
			</ul>
			<!-- END PAGE TITLE & BREADCRUMB-->
		</div>
	</div>
	<!-- 面包屑结束-->
	<!-- 页头-->
	<div class="row">
		<div class="col-md-12">
			<!--search box-->
			<div class="search_box" style="height: 150px">
				<div class="col-md-6" style="margin-left: 20%;margin-top: 30px;">
					<div class="col-md-4">
						<label for="startTime" style="float: left">开始时间</label>
						<input type="text"
							class="form-control" id="startTime"
							onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})">
					</div>
					<div class="col-md-4">
						<label for="endTime">结束时间 </label>
						<input type="text"
							class="form-control" id="endTime"
							onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})">
						
					</div>
					<div class="col-md-4">
						<button onclick="page(1)" class="btn btn-danger" type="button" style="margin-top: 25px;height: 34px;">
							<i class="icon-search"></i>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 页面头部结束-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN EXAMPLE TABLE PORTLET-->
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i><span id="commenttitle">签到列表</span>
					</div>
				</div>
				<div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
                      <div class="row">
                            <span class="btn btn-success table_add"  onclick="exportResult();">
                               <i class="glyphicon glyphicon-plus"></i>导出</span>
                      </div>
                      
                      <%-- 表格内容 --%>
                      <div id="table_list" style="margin-top:10px;"></div>
                    
                </div>
			</div>
			<!-- END EXAMPLE TABLE PORTLET-->
		</div>
	</div>
	
	<!-- 弹出下载界面 -->
		<div class="easyDialog_wrapper" id="easyDialogWrapperww">
			<div class="easyDialog_content">
				<h4 class="easyDialog_title" id="easyDialogTitle">
					<a href="javascript:void(0)" title="关闭窗口" class="close_btn"
						 onclick="easyDialog.close()">&times;</a><span id="content">下载</span>
				</h4>
				<div class="easyDialog_text" style="width:360px;height:120px;display:block;overflow-x:hidden;overflow-y:scroll;">
					<!-- Tab panes -->
					<div class="tab-content" id="errorMsg">
					  	 <a href="" class="btn btn-success table_add" id="exportUrl" style="width: 128px;margin-right: 100px; margin-top: 15px;" >
                              <i class="glyphicon glyphicon-plus"></i>下载
                         </a>
					</div>
				</div>
			</div>
		</div>
</body>
</html>
<content tag="pageCore"> 
<script type="text/javascript" src="${basepath }/static/public/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${basepath}/static/qqface/jquery.qqFace-huati.js"></script> 
<script type="text/javascript">
page(1);
function page(i){
	var data = {"currPage":i};
	var url = basepath+"/base/admin/sign/signlist.list";
    var startTime=$.trim($("#startTime").val());
    var endTime=$.trim($("#endTime").val());
        	 data = {"currPage":i,"startTime":startTime,"endTime":endTime};
      
	
	$('#table_list').load(encodeURI(url),data,function(){
		replace_one();
	});
}

function exportResult(){
	var startTime = $("#startTime").val();
	var endTime = $("#endTime").val();
	$.ajax({
		type:"POST",
		url:basepath+"/base/admin/sign/export.json",
		data:{"startTime":startTime,"endTime":endTime},
		success:function(data){
			if(data == "fail"){
				showMsgDialog("系统异常，请刷新后重新尝试。");
			}else if(data == "empty"){
				showMsgDialog("还没有人签到，请确认后再操作。");
			}else {
				$("#exportUrl").attr("href",basepath+"/"+data);
				$("#content").html("签到人员信息");
				easyDialog.open({
			    	container :"easyDialogWrapperww"
			    });
			}
		},
		error:function(data){
			showMsgDialog("系统异常，请刷新后重新尝试。");
		}
	});
}

function showMsgDialog(content){
	easyDialog.open({
        container : {
            header : '提示',
            content : '<div style="background-color: #ffffff;width:320px;height:60px;text-align:center;">'+content+'</div>'
        },
        autoClose:2000
    });
}


//逐个转意的方法
function replace_one(){
	$("#signlist").find(".contanttext").each(function(){
		var html = replace_em($(this).html().toString());
		$(this).html(html);
	});
}




</script> </content>
<content tag="pageInit"> </content>
