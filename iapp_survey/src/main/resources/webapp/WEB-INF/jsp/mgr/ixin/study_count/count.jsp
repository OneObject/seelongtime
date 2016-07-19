<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]>
<html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]>
<html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>统计</title>
	
<meta name="menu_path" content=""/>
	
<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/ixin.css" type="text/css">
	<script language="javascript" type="text/javascript" src="${basepath }/static/public/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript">
	function count1(){
		var start = $("#start").val();
		var end = $("#end").val();
		var domain = $("#domain").val();
		$.ajax({
			url:"${basepath}/mgr/studycount/countjoblevel.json",
			data:{start:start,end:end,domain:domain},
			type:"GET",
			success:function(data){
				alert(data);
			}
		});
	}
	function count2(){
		var start = $("#start").val();
		var end = $("#end").val();
		var domain = $("#domain").val();
		$.ajax({
			url:"${basepath}/mgr/studycount/countcategory.json",
			data:{start:start,end:end,domain:domain},
			type:"GET",
			success:function(data){
				alert(data);
			}
		});
	}
	function count3(){
		var start = $("#start").val();
		var end = $("#end").val();
		var domain = $("#domain").val();
		$.ajax({
			url:"${basepath}/mgr/studycount/countday.json",
			data:{start:start,end:end,domain:domain},
			type:"GET",
			success:function(data){
				alert(data);
			}
		});
	}
	function count4(){
		var start = $("#start").val();
		var end = $("#end").val();
		var domain = $("#domain").val();
		$.ajax({
			url:"${basepath}/mgr/studycount/countmonth.json",
			data:{start:start,end:end,domain:domain},
			type:"GET",
			success:function(data){
				alert(data);
			}
		});
	}

	function count5(){
		var start = $("#start").val();
		var end = $("#end").val();
		var domain = $("#domain").val();
		$.ajax({
			url:"${basepath}/mgr/studycount/countdayvisitweb.json",
			data:{start:start,end:end,domain:domain},
			type:"GET",
			success:function(data){
				alert(data);
			}
		});
	}
	</script>
</head>
<body>

<c:if test="${ param.key eq '2014'}">

	<!-- 页面顶部-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
			</ul>
			<!-- END PAGE TITLE & BREADCRUMB-->
		</div>
	</div>
	<!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-lg-12">
			<div class="portlet box green">
				<div class="portlet-title">
					<div class="caption">
						<i class="fa fa-bar-chart-o"></i><span>统计</span> 
					</div>
				</div>
				<div class="portlet-body main_bd box">
					<!-- 添加 start -->
					<div class="mauto">
					<div class="col-md-12">
						<!-- 创建 start-->
						<div class="form">
							<form role="form" id="Form" action="" method="post">
									<div class="form-group">
										<label for="biaoti">开始时间</label>
										<input type="text" class="form-control" id="start"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd', maxDate:'#F{$dp.$D(\'end\')}'})">
									</div>
									<div class="form-group">
										<label for="biaoti">结束时间</label>
										<input type="text" class="form-control" id="end"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd', minDate:'#F{$dp.$D(\'start\')}'})">
									</div>
									<div class="form-group">
										<label for="biaoti">domain</label>
										<input type="text" class="form-control" name="domain" id="domain">
									</div>
								</form>
						</div>
						
						<!-- 创建 end-->
					</div>
						
					</div>
					
					<div class="btngroup">
							<div class="btn btn-block btn-success" onclick="count1()">各职级微课程学习统计</div>
					</div>
					<div class="btngroup">
							<div class="btn btn-block btn-warning" onclick="count2()">各分类微课程学习统计</div>
					</div>
					<div class="btngroup">
							<div class="btn btn-block btn-success" onclick="count3()">每日微课程学习统计</div>
					</div>
					<div class="btngroup">
							<div class="btn btn-block btn-warning" onclick="count4()">每月微课程学习统计</div>
					</div>
					<div class="btngroup">
							<div class="btn btn-block btn-success" onclick="count5()">每日访问量统计</div>
					</div>
				</div>
			</div>
		</div>

	</div>
 </c:if>
</body>
</html>


