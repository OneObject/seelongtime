<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>作业管理</title>
<meta name="menu_path" content="ixin.menu_task" />
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
				<li><span href="#">作业管理</span></li>
			</ul>
			<!-- END PAGE TITLE & BREADCRUMB-->
		</div>
	</div>
	<!-- 面包屑结束-->
	<!-- 搜索 -->
	<!-- 页面头部结束-->
         <div class="row">
              <div class="col-md-12">
               <!-- BEGIN EXAMPLE TABLE PORTLET-->
               <div class="portlet box blue">
                  <div class="portlet-title">
                     <div class="caption"><i class="icon-globe"></i>作业列表</div>
                  </div>
                  <div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
                      <div class="row">
                            <span class="btn btn-success table_add"  onclick="viewtask();">
                               <i class="glyphicon glyphicon-plus"></i>新建作业</span>
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
</content>
<content tag="pageInit">
<script type="text/javascript">
    page(1);
    function page(i){
        var max=$("#table_list #page_max").val();
        var page=i;
        var r=Math.random();
        var url="${basepath}/mgr/task/tasklist.list";
        var data={"page":page,"max":max,"r":r};
        $("#table_list").load(encodeURI(url), data, function(){
        	App.initUniform();
            }); 
        }


     function viewtask(){
         window.location.href="${basepath}/mgr/task/viewtask.xhtml";
     }

</script>
</content>  
