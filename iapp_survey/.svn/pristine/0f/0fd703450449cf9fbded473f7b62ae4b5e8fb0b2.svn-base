<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>抽奖管理</title>
<meta name="menu_path" content="active.menu_ggk" />
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
				<li><span href="#">抽奖管理</span></li>
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
                     <div class="caption"><i class="icon-globe"></i>抽奖列表</div>
                  </div>
                  <div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
                      <div class="row">
                            <span class="btn btn-success table_add"  onclick="insertEntity();">
                               <i class="glyphicon glyphicon-plus"></i>添加抽奖活动</span>
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
</content>
<content tag="pageInit"> <!-- 初始化窗口 --> 
<script type="text/javascript">
page(1);
function page(i){
	$('#table_list').load("${basepath}/mgr/ixinnofilter/rewardlist.xhtml?currPage="+i);
}
function insertEntity(){
	location = "${basepath}/mgr/scratchcard/createscratchcard.xhtml";
}
var m = "";
var btnFn = function(){
	$.ajax({
		type: "POST",
		url:  basepath+"/mgr/scratchcard/deletereward.xhtml",
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
function delReward(id){
	m = id;
	var html = '<div style="width:350px;height:70px;text-align:center;"><h3>您确定要删除该抽奖么？</h3></div>';
	easyDialog.open({
	    container : {
	    	header : 'ajy温馨提示',
	    	content : html,
	    	yesFn : btnFn,
	    	noFn : true
	    }
	});
}

var btnFn2 = function(){
	$.ajax({
		type: "POST",
		url:  basepath+"/mgr/scratchcard/stoprewardactive.xhtml",
		data: {"rewardId":m},
		success:function(data){
			page(1);
			return true;
		},
		error: function(data){
			alert('终止抽奖失败');
		}
	});
	
};
function stopReward(id){
	m = id;
	var html = '<div style="width:350px;height:70px;text-align:center;"><h3>您确定要终止该抽奖么？</h3></div>';
	easyDialog.open({
	    container : {
	    	header : 'ajy温馨提示',
	    	content : html,
	    	yesFn : btnFn2,
	    	noFn : true
	    }
	});
}
</script>
</content>
