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
<title>导入记录管理</title>
<meta name="menu_path" content="test.importLog" />
<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/testmanage.css">
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i> <a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                <li><span href="#">导入记录管理</span></li>
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
							<input id="searchContent" name="searchContent" type="text" class="form-control" placeholder="输入文件名/题库名/导入人进行搜索"> <span
								class="input-group-btn">
								<button onclick="page(1)" class="btn btn-danger" type="button">
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
	<div class="row" id="easydialog_zero">
		<div class="col-md-12">
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>导入记录列表
					</div>
				</div>
				<div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
					<!-- 表格内容 -->
					<div id="table_list" ></div>
					
					<!-- 导入题库打卡文件管理器 -->
					<input type="file" style="display: none;" id="openfile">
				</div>
			</div>
		</div>
	</div>
     <!-- 弹出层 开始 -->
    <div class="easyDialog_wrapper" id="dialogbank" style="display: none;width:528px;">
        <div class="easyDialog_content">
            <h4 class="easyDialog_title" id="easyDialogTitle">
                <a href="javascript:void(0)" title="关闭窗口" class="close_btn"
                    id="closeBtn">&times;</a> <span id="dialog_title">详细信息</span>
            </h4>
            <div class="easyDialog_text">
                <div style="width:500px;" class="form-horizontal " id="detail_container">
                </div>
                <div class="form-group">
                    <div id="btn_con" class="col-md-offset-5 col-md-5">
                        <span id="btn_close" class="btn default" onclick="easyDialog.close()">关闭</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<!-- 弹出层 结束 -->
</body>
</html>
<content tag="pageCore"> 
<!-- 引用核心js包 -->
<script src="${basepath }/static/public/javascripts/importlog.js"></script>  
<%-- 输入验证 --%>
<script src='${basepath }/static/public/javascripts/commonValidate.js' type='text/javascript' ></script>
</content>
<content tag="pageInit"> <!-- 初始化窗口 -->
<script type="text/javascript">
$(function (){
	var message = "${message}";
	if(isNotBlank(message)){
	     var html="<div style='width:300px;text-align:center;'>${message }</div>";
	     easyDialog.open({
	         container : {
	             header : '提示',
	             content : html
	         },
	         autoClose : 1000
	     });
	}
});

</script>
 </content>