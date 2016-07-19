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
<title>文档管理</title>
<meta name="menu_path" content="course.documentmanage" />
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/testmanage.css">
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i> <a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
				<li><a href="${basepath }/base/admin/mgr/document/index.xhtml">课程管理</a><i class="icon-angle-right"></i></li>
				<li><span href="#">文档管理</span></li>
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
                            <input type="hidden" id="tid" name="tid" value="${tid}" >
                            <input type="hidden" id="orderField" name="orderField" value="${orderField }" >
                            <input type="hidden" id="orderDirection" name="orderDirection" value="${orderDirection }" >
							<input type="text" class="form-control" id="searchContent" name="searchContent" placeholder="输入用文档名进行搜索"> <span
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
	<!-- 关于这场考试的报表 start -->
	
	<!-- 关于这场考试的报表 end -->
	<div class="row">
		<div class="col-md-12">
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>文档管理
					</div>
				</div>
				<div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
                    
                    <!-- 表格内容 -->
                    <div id="table_list" ></div>
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<content tag="pageCore"> 
<!-- 引用核心js包 -->
</content>
<content tag="pageInit"> <!-- 初始化窗口 --> 
<script src="${basepath}/static/public/easydialog-v2.0/easydialog.js"></script>
<script type="text/javascript">
$(function (){
    page(1);
    $("#searchContent").keydown(function(e){
        var curKey = e.which;
           if(curKey == 13){ 
        	   page(1);
                return false;
           }
   }); 
});

/* 分页+搜索 */
//function page(i) {
  
//  var param={"page":i,"pagesize":i};
//  $("#table_list").load(url,param,function(data){
//	  });
//}
/* 分页+搜索 */
function page(i) {
    var divId = "table_list";
    
    var max = $("#"+divId+" #page_max").val()
    
    loading(divId);
    var data = {"page":i, "max":max, "r":Math.random(), "searchContent":$("#searchContent").val()};
    var url="${basepath}/base/admin/mgr/document/list.list";
    $("#"+divId).load(encodeURI(url), data, function(){
        App.initUniform();//加载复选框样式
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

</script>
</content>
