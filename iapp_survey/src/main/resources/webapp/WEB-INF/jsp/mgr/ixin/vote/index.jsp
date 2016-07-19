<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>调研管理</title>
	<meta name="menu_path" content="active.menu_survey"/>
	<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
    <link rel="stylesheet" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.css" />
	<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/course.css">
	<style type="text/css">
		.qrcodeTable table{
			position:relative;
			left: 47px;
		}
	</style>
</head>
<body>
	<!-- 面包屑开始-->
	<div class="row">
		<div class="col-md-12">
			<ul class="page-breadcrumb breadcrumb">
                 <%--  <li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                   --%><li><span href="javascript:void(0)">调研问卷列表</span></li>
               </ul>
			<!-- END PAGE TITLE & BREADCRUMB-->
		</div>
	</div>
	<!-- 面包屑结束-->
    <div class="row">
           <div class="col-md-12">
              <!--search box-->
             <div class="col-md-12 search_box">
                 <div class="col-md-12">
                  <!--全局搜索框-->
                  <div class="col-md-6 search_container">
                      <div class="input-group">
                          <input type="hidden" id="status" name="status" value="" >
                           <input type="text" class="form-control" value="${name}" id="searchContent" name="searchContent" placeholder="输入标题进行搜索"> <span
                               class="input-group-btn" >
                               <button class="btn btn-danger" type="button" onclick="page(1)">
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
	<!-- 页面头部结束-->
         <div class="row">
              <div class="col-md-12">
               <!-- BEGIN EXAMPLE TABLE PORTLET-->
               <div class="portlet box blue">
                  <div class="portlet-title">
                     <div class="caption"><i class="icon-globe"></i>调研问卷列表</div>
                  </div>
                  <div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
                      <div class="row">
                            <span class="btn btn-success table_add"  onclick="insertEntity();">
                               <i class="glyphicon glyphicon-plus"></i>添加调研问卷</span>
                      </div>
                      
                      <%-- 表格内容 --%>
                      <div id="table_list" style="margin-top:10px;"></div>
                    
                  </div>
               </div>
               <!-- END EXAMPLE TABLE PORTLET-->
             </div>
         </div>
         <div  id="qrcodeTablebox" style="display:none; width: 380px;">
			<div id="qrcodeTable" class="qrcodeTable" style="margin: 0px auto 15px;"></div>
			<div id="url" style="word-break:break-all;width: 380px;"></div>
			<div class="copy-btn" style="cursor: pointer;text-align:center;color:#529bea;line-height:32px;width:150px;margin:0 auto;"> 点击复制URL</div>
		</div>
</body>
</html>
<content tag="pageCore"></content>
<content tag="pageInit">
<script type="text/javascript" src="${basepath }/static/public/easydialog-v2.0/easydialog.min.js"></script>
<script type="text/javascript" src="${basepath }/static/js/jquery.qrcode.min.js"></script>
<script type="text/javascript" src="${basepath }/static/js/jquery.zclip.js"></script>
<script type="text/javascript">
function insertEntity(){
	location = "${basepath}/mgr/vote/add.xhtml";
}

function loading(id){
	$("#"+id).prepend('<section class="loading" id="loading" class="loading"><i class="icon-2x icon-spinner icon-spin"></i></section>');
}

var voteId = "";
page(1);
function page(i){
	loading("table_list");
	var search = $.trim($("#searchContent").val());
	$('#table_list').load("${basepath}/mgr/include/votelist.xhtml?page="+i+"&search="+search);
}

var btnFn = function(){
	$.ajax({
		type: "POST",
		url:  basepath+"/mgr/vote/del.xhtml",
		data: {"voteId":voteId},
		success:function(data){
			page(1);
			return true;
		},
		error: function(data){
			alert('删除失败');
		}
	});
	
};
function delVote(id){
	voteId = id;
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

function showMsgDialog(content){
	easyDialog.open({
        container : {
            header : '提示',
            content : '<div style="background-color: #ffffff;width:260px;height:20px;text-align:center;">'+content+'</div>'
        },
        autoClose:1200
    });
}

function showContent(content){
	easyDialog.open({
        container : {
            header : '提示',
            content : '<div style="background-color: #ffffff;width:460px;height:40px;text-align:center;">'+content+'</div>',
            yesFn : easyDialog.close
         },
    });
}

</script>


</content>  
