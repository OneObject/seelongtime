<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<title>参与情况信息</title>
<meta name="menu_path" content="active.menu_survey" />
<link rel="stylesheet" media="screen" href="${basepath}/static/ixin/css/ixin.css" type="text/css">
<link rel="stylesheet" media="screen" href="${basepath}/static/ixin/css/appmsg_edit.css" type="text/css">
<link rel="stylesheet" media="screen" href="${basepath}/static/ixin/css/appmsg_editor.css" type="text/css">
<link rel="stylesheet" type="text/css" href="${basepath }/static/ixin/css/uploadify.css">
<link href="${basepath }/static/plugins/bootstrap-switch-master/docs/bootstrap-switch.css" rel="stylesheet">
<script src="${basepath }/static/plugins/bootstrap-switch-master/docs/bootstrap-switch.js"></script>
</head>
<body>

	<!-- 页面顶部-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i> <a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                <li><a href="#">培训活动</a><i class="icon-angle-right"></i></li>
				<li><a href="#">调研统计</a><i class="icon-angle-right"></i></li>
				<li><span >参与情况</span></li>
			</ul>
			<!-- END PAGE TITLE & BREADCRUMB-->
		</div>
	</div>
	
<!-- END PAGE HEADER-->
	<!-- 全局搜索组建开始 -->
	<ul class="nav nav-tabs">
         <li class="active tabLi" > <a href="#tenantbasic" data-toggle="tab" onclick="changeTabPan('1')">参与用户</a></li>
         <li class="tabLi" > <a href="#mgrsitebasic" id="tabAttFodder" data-toggle="tab" onclick="changeTabPan('0')">未参与用户</a></li>
    </ul>
    <div class="tab-content">
      <!-- Tab panes -->
      <div class="tab-pane  active" id="tenantbasic">
			<div class="row">
		<div class="col-md-12">
			<div class="portlet box yellow">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>参与用户信息
					</div>
				</div>
				<div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
					<div class="mauto">
						<div class="col-md-12">
						</div>
					</div> 
	
					<div id="joinuser_list" class="mt10">
	
					</div>
				</div>
			</div>
		</div>
		</div>
	  </div>
      
      <!-- 以下是微信端租户站点的配置页面 -->
      <div class="tab-pane" id="mgrsitebasic">
      	<div class="row">
		<div class="col-md-12">
			<div class="portlet box yellow">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>未参与用户信息
					</div>
				</div>
				<div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
					<div class="mauto">
						<div class="col-md-12">
						</div>
					</div> 
	
						<div id="nojoinuser_list" class="mt10">
							
						</div>
				</div>
			</div>
		</div>
	</div>
      </div>
       </div>
	<!-- 条件选择结束 -->
	
</body>
</html>
<content tag="pageCore">
<script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
<script type="text/javascript">
var _type = 1;
changeTabPan(_type,1,10);

function changeTabPan(type,page_index,page_num){
	_type = type;
	var data = {"voteid":"${voteid}","type":type,"page":page_index,"max":page_num};
	var id_show = "joinuser_list";
	var id_clean = "nojoinuser_list";
	if (type!=1){
		id_show = "nojoinuser_list";
		id_clean = "joinuser_list";
	}
	$("#"+id_clean).html("");
	$("#"+id_show).load(basepath+"/mgr/vote/querystudentinfo.list", data);
}

function page(i) {
	var max = $("#page_max").val();
	changeTabPan(_type,i,max);
	
}


</script>
</content>
<content tag="pageInit"> <!-- 初始化窗口 --> 
</content>