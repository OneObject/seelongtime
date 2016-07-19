<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>通知公告</title>
	<meta name="menu_path" content="ixin.menu_notice"/>
	<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
   <link rel="stylesheet" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.css" />
	<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/course.css">
	
</head>
<body>
	<!-- 面包屑开始-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
                  <li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                  <li><span href="javascript:void(0)">通知公告</span></li>
               </ul>
			<!-- END PAGE TITLE & BREADCRUMB-->
		</div>
	</div>
	<!-- 面包屑结束-->
	
	<!-- 页面头部结束-->
         <div class="row">
              <div class="col-md-12">
               <!-- BEGIN EXAMPLE TABLE PORTLET-->
               <div class="portlet box blue">
                  <div class="portlet-title">
                     <div class="caption"><i class="icon-globe"></i>通知公告列表</div>
                  </div>
                  <div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
                      <div class="row">
                            <span class="btn btn-success table_add"  onclick="insertEntity();">
                               <i class="glyphicon glyphicon-plus"></i>添加通知公告</span>
                      </div>
                      
                      <%-- 表格内容 --%>
                      <div id="table_list" style="margin-top:10px;"></div>
                    
                  </div>
               </div>
               <!-- END EXAMPLE TABLE PORTLET-->
             </div>
         </div>
</body>
</html>
<content tag="pageCore">
<script type="text/javascript">
function insertEntity(){
	location = "${basepath}/mgr/notice/add.xhtml";
}
page(1);
function page(i){
	$('#table_list').load("${basepath}/mgr/include/noticelist.xhtml?currPage="+i);
}
var submitId = "";
var baseId = "";
var btnFn = function(){
	$.ajax({
		type: "POST",
		url:  basepath+"/mgr/notice/del.xhtml",
		data: {"id":submitId,"baseId":baseId},
		success:function(data){
			page(1);
		},
		error: function(data){
			alert('删除失败');
		}
	});  
}

function delStudy(id,bid){
	submitId = id;
	baseId = bid;
	var html = '<div style="width:350px;height:70px;text-align:center;"><h3>您确定要删除么？</h3></div>';
	easyDialog.open({
	    container : {
	    	header : '提示',
	    	content : html,
	    	yesFn : btnFn,
	    	noFn : true
	    }
	});

}
</script>
</content>
<content tag="pageInit">
</content>  
