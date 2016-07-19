<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp" %>
<!DOCTYPE html>
<!--[if IE 8]>
<html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]>
<html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <title>素材管理</title>
    <meta name="menu_path" content="ixin.menu_matter"/>
    <link rel="stylesheet" media="screen" href="${basepath}/static/ixin/css/ixin.css" type="text/css">
    <link rel="stylesheet"  href="${basepath}/static/ixin/css/base.css" type="text/css">
    <link rel="stylesheet"  href="${basepath}/static/ixin/css/media.css" type="text/css">
    <link rel="stylesheet" href="${basepath}/static/ixin/css/media_list.css" type="text/css">
    <link rel="stylesheet" href="${basepath }/static/public/easydialog-v2.0/easydialog.css" type="text/css">
    
</head>
<body>

<!-- 页面顶部-->
<div class="row">
    <div class="col-md-12">
        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
        <ul class="page-breadcrumb breadcrumb">
            <li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
            <li><span href="javascript:void(0)">素材管理</span></li>
         </ul>
        <!-- END PAGE TITLE & BREADCRUMB-->
    </div>
</div>
<!-- END PAGE HEADER-->
<!---->

<div class="row">
    <div class="col-lg-12">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-reorder"></i><span>草稿箱</span>
                </div>
                <div style="text-align:right;">
                	<a href="${basepath }/mgr/fodder/index.xhtml" style="color:#fff;">返回素材列表</a>
                </div>
            </div>
            <div class="portlet-body box" id="msgListBody">
            
            </div>
        </div>
    </div>
</div>
</body>
</html>
<content tag="pageCore">
<script type="text/javascript" src="${basepath }/static/public/easydialog-v2.0/easydialog.min.js"></script>
<script type="text/javascript">
page(1);
function page(i){
	$('#msgListBody').load("${basepath}/mgr/include/fodderdrafflist.xhtml?currPage="+i);
}
var m = "";
var btnFn = function(){
	$.ajax({
		type: "POST",
		url:  basepath+"/mgr/fodder/deldraff.xhtml",
		data: {"id":m},
		success:function(data){
			page(1);
			return true;
		},
		error: function(data){
			alert('删除失败');
		}
	});
	
};
function deldraff(id){
	m = id;
	var html = '<div style="width:350px;height:70px;text-align:center;"><h3>您确定要删除该素材么？</h3></div>';
	easyDialog.open({
	    container : {
	    	header : '提示',
	    	content : html,
	    	yesFn : btnFn,
	    	noFn : true
	    }
	});
}
function editDraff(id){
	location = basepath+"/mgr/fodder/editdraff.xhtml?id="+id;
}
</script>
</content>
<content tag="pageInit">
    <!-- 初始化窗口 -->
</content>