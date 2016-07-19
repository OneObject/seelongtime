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
<title>阅卷</title>
<meta name="menu_path" content="test.testManage" />
<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/testmanage.css">
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i> <a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                <li><a href="${basepath }/base/admin/itest/examination/examination.xhtml">考试管理</a><i class="icon-angle-right"></i></li>
				<li><span>阅卷</span></li>
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
                            <input type="hidden" id="examid" name="examid" value="${examid }" >
							<input type="text" class="form-control" id="searchContent" name="searchContent" placeholder="输入用户名进行搜索"> <span
								class="input-group-btn" onclick="page(1)">
								<button class="btn btn-danger" type="button">
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
						<i class="icon-globe"></i>待阅卷列表
					</div>
				</div>
				<div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
                    <!-- 表格内容 -->
                    <div id="table_list" >
                    </div>
					
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
<content tag="pageCore"> 
<script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
<!-- 引用核心js包 -->
</script>
  
</content>
<content tag="pageInit"> <!-- 初始化窗口 --> 
<script type="text/javascript">
$(function (){
    page(1);
});

/* 分页+搜索 */
function page(i, fieldId) {
    var divId = "table_list";
    
    var order = getOrder(divId, fieldId);
    var max = $("#"+divId+" #page_max").val()
    
    //AJAX提示
    loading(divId);
    var data = {"page":i, "max":max, "r":Math.random(), "searchContent":$("#searchContent").val(), 
            "examid":$("#examid").val(),
            "orderField":order.orderField, "orderDirection":order.orderDirection };
    var url = basepath+"/base/admin/itest/examination/markpaperlist.list";
    $("#"+divId).load(encodeURI(url), data, function(){
        App.initUniform();//加载复选框样式
    });
}
</script>
</content>
