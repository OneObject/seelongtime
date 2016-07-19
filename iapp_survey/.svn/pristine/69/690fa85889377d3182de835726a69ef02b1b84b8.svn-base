<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta name="menu_path" content="active.menu_activity" />
<title>活动报名册</title>
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
				<li><span href="#">活动管理</span></li>
			</ul>
			<!-- END PAGE TITLE & BREADCRUMB-->
		</div>
	</div>


	<ul class="nav nav-tabs">

		<li class="${param.from eq 'person' ?'':'active'} tabLi" id="li_baoming"><a href="#baoming"
			onclick="topage(this);" data-toggle="tab"> 报名册 </a></li>
		<%--
		<li class="${param.from eq 'person' ?'active':''} tabLi" id="li_person"><a href="#person"
			onclick="topage(this);" data-toggle="tab"> 指定人员 </a></li>
		 --%>


	</ul>

	<div class="tab-content">
		<div class="tab-pane ${param.from eq 'person' ?'':'active'} " id="baoming" style="position: relative;">
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN EXAMPLE TABLE PORTLET-->
					<div class="portlet box blue">
						<div class="portlet-body"
							style="overflow: hidden; padding-bottom: 100px;">
							<div class="row">
								<span class="btn btn-success table_add"
									onclick="exportApplyRecord('${activityId}');"> <i
									class="glyphicon glyphicon-log-out"></i>导出报名册记录
								</span>
							</div>

							<%-- 表格内容 --%>
							<div id="table_list" style="margin-top: 10px;"></div>

						</div>
					</div>
					<!-- END EXAMPLE TABLE PORTLET-->
				</div>
			</div>
		</div>
		
		<div class="tab-pane ${param.from eq 'person' ?'active':''}" id="person" style="position: relative;">
			<div class="row">
				<div class="col-md-12">
				
					<div class="search_condition">
						<div class="row" style="margin: 0;width:100%;">
							<div class="left_lable" style="margin-top: 8px;">
								<span class="">签到状态</span>
							</div>
							<div class="left_condition">
								<div class="col-md-2">
                            		<select class="form-control select2me" data-placeholder="选择" name="signinstatus" id="signinstatus" onchange="page(1);" >
                                		<option value="1">全部</option>
                                		<option value="2">已签到</option>
                                		<option value="3">未签到</option>
                           			 </select>
								</div>
							</div>
							<div class="left_condition" style="float:right;">
								<span class="btn btn-success table_add"
									onclick="importExcel('${activityId}');"> <i
									class="glyphicon glyphicon-log-out"></i>导入
								</span>
							</div>
						</div>
					</div>
					<!-- BEGIN EXAMPLE TABLE PORTLET-->
					<div class="portlet box blue">
						<div class="portlet-body" style="overflow: hidden; padding-bottom: 100px;">

							<%-- 表格内容 --%>
							<div id="table_list1" style="margin-top: 10px;"></div>

						</div>
					</div>
					<!-- END EXAMPLE TABLE PORTLET-->
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
 	var from = '${param.from}';
 	
 	page(1);
 	
	function page(i) {
		
		if("person" == from){
			pageperson(i);
		}else{
			applypage(i);
		}
	}
	
	function applypage(i) {
		$('#table_list').load(
				"${basepath}/mgr/ixinnofilter/applyRecordList.xhtml?id=${activityId}&currPage="
						+ i);
	}

	
	
	function pageperson(i) {
		var status = $("#signinstatus").val();
		$('#table_list1').load(
				"${basepath}/mgr/activity/personlist.list?id=${activityId}&currPage="
						+ i +"&status="+status);
	}

	/**
	 * 导出活动报表
	 */
	function exportApplyRecord(activityId) {
		var html = [];
		$
				.ajax({
					type : "POST",
					url : basepath + "/mgr/activity/exportapplyrecord.json",
					data : {
						"activityId" : activityId
					},
					success : function(data) {
						if (data.flag) {
							html
									.push("<div style='width:300px;height:80px;text-align:center;'>");
							html.push("<div><span style='font-size: 14px;'>"
									+ data.message + "</span></div>");
							html.push("<div><span class='btn btn-success'>");
							html
									.push("<a href='"+basepath+"/"+data.activityexcelpath+"' style='color: white;text-decoration: none;'>点击下载活动报表到本地</a>");
							html.push("</span></div></div>");
						} else {
							html
									.push("<div style='width:300px;height:80px;text-align:center;'>");
							html.push("<span style='font-size: 14px;'>"
									+ data.message + "</span></div>");
						}

						easyDialog.open({
							container : {
								header : "提示",
								content : html.join("")
							},
						});
					},
					error : function(data) {
						html
								.push("<div style='width:300px;height:80px;text-align:center;'>");
						html.push("<span style='font-size: 14px;'>"
								+ data.message + "</span></div>");
						easyDialog.open({
							container : {
								header : "提示",
								content : html.join("")
							},
							autoClose : 3000
						});
					}
				});
	}


	function topage(_thi){
		var tab = $(_thi).parent().attr("id");
		if("li_person" == tab){
			from = "person";
		}else{
			from = "apply";
		}
		page(1);
		return false;
		
	}


	function importExcel(){
		window.location.href="${basepath}/mgr/activity/excelload.xhtml?id=${activityId}";
	}
</script>
</content>  
