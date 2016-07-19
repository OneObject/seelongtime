<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta name="menu_path" content="video.videoProduction"/>
<title>视频管理</title>
	<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
   <link rel="stylesheet" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.css" />
	<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/video.css">
	<style>
	.search_box .col-md-2{
		margin: 15px 0;
	}
	</style>
</head>
<body>
	<!-- 面包屑开始-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i> <a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
				<li><span href="#">视频</span></li>
			</ul>
			<!-- END PAGE TITLE & BREADCRUMB-->
		</div>
	</div>
	<!-- 面包屑结束-->
	<!-- 搜索 -->
         <div class="row">
            <div class="col-md-12">
               <!--search box-->
              <div class="col-md-12 search_box">
                   <!--全局搜索框-->
                   <div class="col-md-2">
                   	<input type="text" class="form-control" id="search1" name="search1" placeholder="视频名称">
                   </div>
                   <div class="col-md-2">
                   	<input type="text" class="form-control" id="search2" name="search2" placeholder="状态"> 
                   	状态：<br/>-1：转码失败<br/>0：正在转码<br/>10：成功转码 
                   </div>
                   <div class="col-md-2">
                   	<input type="text" class="form-control" id="search3" name="search3" placeholder="id"> 
                   </div>
                   <div class="col-md-2">
                   	<input type="text" class="form-control" id="search4" name="search4" placeholder="视频id"> 
                   </div>
                   <div class="col-md-2">
                   	<input type="text" class="form-control" id="search5" name="search5" placeholder="domain域"> 
                   </div>
                   <div class="col-md-2">
                   	<input type="hidden" class="form-control" id="search6" name="search6" placeholder="预留搜索" > 
                   </div>   
                  
                   <span class="input-group-btn" style="text-align:right;margin-bottom:15px;float:left;width:100%;display:block;">
                       <button class="btn btn-danger" type="button" onclick="page(1)" style="float:right;margin-right:20px;">
                           <i class="icon-search"></i>
                       </button>
                   </span>
              </div>
            </div>
         </div>

	<!-- 页面头部结束-->
         <div class="row">
              <div class="col-md-12">
               <!-- BEGIN EXAMPLE TABLE PORTLET-->
               <div class="portlet box blue">
                  <div class="portlet-title">
                     <div class="caption"><i class="icon-globe"></i>视频列表</div>
                  </div>
                  <div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
                     <!--  <div class="row">
                            <span class="btn btn-success table_add"  onclick="insertEntity();">
                               <i class="glyphicon glyphicon-plus"></i>添加课程</span>
                      </div> -->
                      
                      <%-- 表格内容 --%>
                      <div id="table_list" style="margin-top:10px;overflow:auto;"></div>
                    
                  </div>
               </div>
               <!-- END EXAMPLE TABLE PORTLET-->
             </div>
         </div>
</body>
</html>
<content tag="pageCore">
 <!-- END PAGE LEVEL PLUGINS -->
 <script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/jquery.dataTables.min.js"></script>

<!-- BEGIN PAGE LEVEL PLUGINS -->
   <script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
   <script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.js"></script>
 <script src="${basepath}/static/public/metronic.bootstrap/assets/scripts/app.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript" src="${basepath }/static/public/My97DatePicker/WdatePicker.js"></script>

<script type="text/javascript" src="${basepath }/static/public/javascripts/ivideo/video.js" charset="UTF-8"></script>    
</content>
<content tag="pageInit">
<script type="text/javascript">
$(function (){
	page(1);
});

/**
 * 分页+搜索
 */
function page(i) {
	
	/搜索的参数值 */
	var name = $.trim($("#search1").val());
	var status = $.trim($("#search2").val());
	var id = $.trim($("#search3").val());
	var videoid = $.trim($("#search4").val());
	var domain = $.trim($("#search5").val());
	
	var divId = "table_list";
	
	/* var order = getOrder(divId, fieldId); */
	
	var max = $("#"+divId+" #page_max").val();
	max = max != null ? max : 10; 
	var data = {"page":i,"max":max,"status":status,"videoid":videoid, "domain":domain, "id":id, "r":Math.random(), "name":name};
	var url = basepath+"/base/admin/ivideo/video2list.list";
	$("#"+divId).load(encodeURI(url), data, function(){
		App.initUniform();
	});
}




      /* $(document).ready(function() {
         $('#datetimepicker_start').datetimepicker({language: 'zh-CN',pickerPosition:'bottom-left',autoclose:true,minView:2});
         $('#datetimepicker_end').datetimepicker({language: 'zh-CN',pickerPosition:'bottom-left',autoclose:true,minView:2});
      }); */
</script>
</content>  
