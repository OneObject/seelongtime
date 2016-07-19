<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>题库管理</title>
<meta name="menu_path" content="test.questionBank" />
   <link href="${basepath}/static/public/metronic.bootstrap/assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/testmanage.css">
</head>
<body>
	<div class="row">
		<div class="col-md-12">
            <ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i> <a href="${basepath }">首页</a>
                    <i class="icon-angle-right"></i></li>
                <li><span href="#">题库管理</span></li>
            </ul>
		</div>
	</div>
	<!-- END PAGE HEADER-->
	<!-- 全局搜索组建开始 -->
	<div class="row">
		<div class="col-md-12">
			<!--search box-->
			<div class="col-md-12 search_box">
				<div class="col-md-12">
					<!--全局搜索框-->
					<div class="col-md-6 search_container">
						<div class="input-group">
							<input id="searchContent" name="searchContent" type="text" class="form-control" placeholder="输入题库名/创建人/修改人进行搜索"> <span
								class="input-group-btn">
								<button onclick="page(1);" class="btn btn-danger" type="button">
									<i class="icon-search"></i>
								</button>
							</span>
						</div>
						<!-- /input-group -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 全局搜索组建结束-->
	<div class="row">
		<div class="col-md-12">
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>题库列表
					</div>
				</div>
				<div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
					<div class="row">
						<span class="btn btn-success table_add" onclick="addItemblank();"><i class="icon-plus"></i>&nbsp;添加题库</span>
						<span class="btn btn-danger table_add" onclick="deleteGroup();"><i class="icon-remove"></i>&nbsp;删除题库</span>
						<span class="btn btn-info table_add" onclick="downloadTemplate()"><i class="glyphicon glyphicon-download-alt"></i>&nbsp;下载导入模板</span>
					</div>
					
					<%-- 表格内容 --%>
                    <div id="table_list" class="mt10"></div>
                    
					<!-- 导入题库打卡文件管理器 -->
					<form id="importForm" action="${basepath }/base/admin/itest/testquestion/importquestion.xhtml" enctype="multipart/form-data" method="post">
						<input type="file" style="display: none;" id="openfile" name="file" >
						<input type="hidden" id="blankid" name="blankid" >
					</form>
					
	
	 <!-- 弹出层 开始 -->
    <div class="easyDialog_wrapper" id="dialogbank" style="display: none;">
        <div class="easyDialog_content">
            <h4 class="easyDialog_title" id="easyDialogTitle">
                <a href="javascript:void(0)" title="关闭窗口" class="close_btn"
                    id="closeBtn">&times;</a> <span id="dialog_title"></span>
            </h4>
            <div class="easyDialog_text">
                <div style="width:500px;" class="form-horizontal ">
		            <div class="form-group error-box" id="con_name">
		                <label class="control-label col-md-3" >题库名称：</label>
		                <div class="col-md-9">
		                    <input type="text" class="form-control" id="name" name="name" onchange="nameValidate()">
		                    <span id="tip_name" class="help-block hidden">题库名称不能为空！</span>
		                </div>
		            </div>
		            <div class="form-group">
		                <label class="control-label col-md-3">备注：</label>
		                <div class="col-md-9" id="con_content">
		                    <textarea id="content" name="content" rows="" class="form-control"
		                           cols="" style="width: 100%;height: 100px;" onchange="v_content()"></textarea>
                            <span id="tip_content" class="help-block hidden"><span id="maxLength">255</span>字以内！</span>
		                </div>
		            </div>
                </div>
		        <div class="form-group">
		            <div id="btn_con" class="col-md-offset-5 col-md-5">
		                <span id="btn_add" class="btn btn-success" onclick="submit_add()">提交</span>
		                <span id="btn_update" class="btn btn-warning" onclick="submit_update()">提交</span>
		                <span id="btn_cancel" class="btn default" onclick="easyDialog.close()">取消</span>
                        <span id="btn_close" class="btn default" onclick="easyDialog.close()">关闭</span>
		            </div>
		        </div>
            </div>
        </div>
    </div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<content tag="pageCore"> 
<!-- 引用核心js包 -->
    <%-- <script src="${basepath }/static/public/javascripts/cutPage.1.0.js" type="text/javascript"></script> --%>
    <script src="${basepath }/static/public/javascripts/itemblank.js"></script>
     <%-- dwr --%>
    <script type='text/javascript' src='${basepath }/dwr/engine.js'></script>
    <script type='text/javascript' src='${basepath }/dwr/util.js'></script>
    <script type='text/javascript' src='${basepath }/dwr/interface/DWRService.js'></script>
</content>
<content tag="pageInit"> 
	<script type="text/javascript"> 	
	$(document).ready(function(){
$("#searchContent").keydown(function(e){
        var curKey = e.which;
           if(curKey == 13){
           page(1);
                return false;
           }
   });
});
	</script>
 </content>