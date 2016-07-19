<%@page contentType="text/html; charset=utf-8"%>
<%@ page import="com.longtime.app.config.Constants"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
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
<title>${model eq 1 ?'积分':model eq 2 ?'素材':'课程' }排行榜</title>
<meta name="menu_path" content="active.menu_rank" />
<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/ixin.css" type="text/css">
		<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/appmsg_edit.css" type="text/css">
	<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/appmsg_editor.css" type="text/css">
<link rel="stylesheet" type="text/css" href="${basepath }/static/ixin/css/uploadify.css">
<script type="text/javascript">
var token = "${result.uploadToken}";
//var qiniuImageBasePath = "${result.qiniuImageBasePath}";
var qiniuImageBasePath = "<%=Constants.IMG_SERVER_DOWNLOAD%>";
var coverSuffix = "${result.coverSuffix}";
var summary = "${rank.remark}";
</script>
<style type="text/css">
			.WdateFmtErr{
				color:#000!important;
				font-weight:normal!important;
			}
			.date-input{
				display:inline-block!important;
				width:250px!important;
				border-color:rgb(229, 229, 229)!important;
			}
</style>
</head>
<body>

	<!-- 页面顶部-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
				<li><span href="#">${model eq 1 ?'积分':model eq 2 ?'素材':'课程' }排行榜</span></li>
			</ul>
			<!-- END PAGE TITLE & BREADCRUMB-->
		</div>
	</div>
	<!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-lg-12">
			<div class="portlet box yellow">
				<div class="portlet-title">
					<div class="caption">
						<i class="fa fa-bar-chart-o"></i><span>${model eq 1 ?'积分':model eq 2 ?'素材':'课程' }排行榜信息</span> 
					</div>
				</div>
				<div class="portlet-body main_bd box">
					<div class="mauto">
					<div class="col-md-12">
						<!-- 创建 start-->
						<div class="form">
							<form role="form" id="rankForm" action="${basepath }/mgr/rank/save.xhtml" method="post">
								<div class="form-body" style="min-width: 820px;">
								
									<!-- 
									<div class="form-group">
										<label for="biaoti">URL地址</label>
										<br>
										${basepath}/protal/rank/${rank.id}.xhtml
									</div>
									 -->
									<div class="form-group">
										<label for="biaoti">类型：</label>
										${model eq 1 ?'积分':model eq 2 ?'素材':'课程' }
									</div>
									
									<c:if test="${from eq 'update' }">
										<div class="form-group">
										<label for="biaoti">时间：</label>
										${rank.timestr }
									</div>
									</c:if>
									 
									<div class="form-group" id="con_title">
										<label for="biaoti">标题：<span style="color:red;">&nbsp;*
										</span></label>
										<input type="text" class="form-control" value="${rank.title }" id="title" name="title" placeholder="标题不能为空">
										<span class="help-block" style="display:none;color:red;" id="titleInfo">
											标题不能为空
										</span>
									</div>
									 
								
									<c:if test="${from ne 'update' }">
									<div class="form-group">
                             			 <label class="control-label col-md-2" style="width:80px;text-align:left;padding:0px;">统计周期：</label>
                             				 <div class="col-md-3" style="width:170px;">
                                 					<select name="datetype" id="datetype" class="form-control select2me" data-placeholder="请选择">
                                         				<option value="0">周</option>
                                         				<option value="1">月</option>
                                         				<option value="2">季度</option>
                                         				<option value="3">年</option>
                                         				<option value="4">自定义</option>
                                 					</select>
                             			 	</div>
	                             		<div class="tab-content" style="overflow: hidden;width:550px;float:left;">
	                             			<div id="week" style="display: block;" ><input class="Wdate  form-control date-input" id="d1" onfocus="WdatePicker({firstDayOfWeek:1, errDealMode:3, isShowWeek:true, onpicked:function() {$dp.$(this).value = $dp.cal.getP('y') + '年' + $dp.cal.getP('W','WW') + '周'}})" /></div>
	                             			<div id="month" class="tab-pane" ><input class="Wdate  form-control date-input" id="d2" onfocus="WdatePicker({firstDayOfWeek:1, dateFmt:'yyyy年MM月'})" /></div>
	                             			<div id="season" class="tab-pane" ><input class="Wdate  form-control date-input" id="d3" onclick="WdatePicker({firstDayOfWeek:1, dateFmt:'yyyy年M季度', isQuarter:true, isShowOK:false, disabledDates:['....-0[5-9]-..','....-1[0-2]-..'], startDate:'%y-01-01' })" /></div>
	                             			<div id="year" class="tab-pane" ><input class="Wdate  form-control date-input" id="d4" onfocus="WdatePicker({firstDayOfWeek:1, dateFmt:'yyyy年'})" /></div>
	                             			<div id="day" class="tab-pane" ><input class="Wdate  form-control date-input" id="d5" onfocus="WdatePicker({firstDayOfWeek:1, dateFmt:'yyyy年MM月dd日', maxDate:'#F{$dp.$(this)||\'2020-10-01\'}'})" />  &nbsp;&nbsp;至&nbsp;&nbsp; <input class="Wdate form-control date-input" id="d6" onfocus="WdatePicker({firstDayOfWeek:1, dateFmt:'yyyy年MM月dd日', minDate:'#F{$dp.$D(\'date_prev\')}',maxDate:'2020-10-01'})" /></div>
										</div>
										<input type="hidden" id="timestr" name="timestr" value=""/>
                          			</div>
									
									<div class="form-group" id="con_top">
										<label for="biaoti">数量：<span style="color:red;">&nbsp;*
										</span></label>
										<input type="text" class="form-control" value="10" id="top" name="top" placeholder="不能为空,1~100的整数" >
										<span class="help-block" style="display:none;color:red;" id="titleInfo">
											不能为空,1~100的整数
										</span>
									</div>
									</c:if>
									
									
									
										<input type="hidden" class="form-control" value="${model }" id="model" name="model" >
										
										<input type="hidden" class="form-control" value="${rank.id }" id="id" name="id" >
										
										<input type="hidden" class="form-control" value="${from}" id="from" name="from" >
									
										<div class="appmsg_edit_item" style="margin-bottom:10px;">
										<label for="">封面：</label>
										<div class="frm_input_box" style="border:1px solid #e5e5e5; padding-top:3px; padding-bottom:-5px;padding-left:10px;">
											<div class="upload_box">
												<div class="upload_area">
													<input type="file" name="file_upload"  id="file_upload" />
													<ul class="upload_file_box" style="display: none;" id="queue"></ul>
												</div>
											</div>
												<div style="display: none;margin-bottom:20px;" id="small_prev">
													<span id="image_cover"></span><a class="js_removeCover" href="javascript:void(0);"
													onclick="deleteCover();">删除</a>
													<input type="hidden" name="coverPath" id="coverPath" value="${rank.cover }"/>
												</div>
										</div>
									</div>
									
									<div id="js_ueditor" class="appmsg_edit_item content_edit" style=" height: 250px; overflow:hidden;">
										<label for="" class="frm_label">简介：</label>
										<input type="hidden" name="remark" value="" id="rankRemark"/>
										<div id="loading">
											<img alt="正在初始化编辑器，请稍候···" src="${basepath }/static/ixin/img/loading.gif">正在初始化编辑器，请稍候···
										</div>
										<textarea name="后台取值的key" id="myEditor" style="border: #f8f8f8;background-color: #f8f8f8; "></textarea>
										
									</div>
								</div>
							</form>
						</div>
						
						<!-- 创建 end-->
					</div>
						
					</div>
					
					<!-- 添加 end -->
					<div class="btngroup" style="text-align:center;">
							<div class="btn btn-warning" onclick="saveRankInfo('${model}');">保存</div>
							<div class="btn green" onclick="back('${model}');">返回</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>
<content tag="pageCore"> 

<script src="${basepath }/static/ixin/js/jquery.uploadify.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${basepath }/static/ixin/plugin/ueditor1_3_6-utf8-jsp/ueditor.config.js"></script>
	<script type="text/javascript" src="${basepath }/static/ixin/plugin/ueditor1_3_6-utf8-jsp/ueditor.all.min.js"></script>
	<script language="javascript" type="text/javascript" src="${basepath }/static/public/My97DatePicker/WdatePicker.js"></script>
</content>
<content tag="pageInit"> <!-- 初始化窗口 --> 
<script type="text/javascript" src="${basepath }/static/ixin/js/rank.js"></script>
<script type="text/javascript">
<c:if test="${not empty rank && not empty rank.cover}">
$("#image_cover").html("<img style='max-width:100px;max-height:200px;' src = '"+qiniuImageBasePath+"${rank.cover}"+coverSuffix+"'>");
$("#small_prev").show();
</c:if>


</script>
<script type="text/javascript">
	$(function () {
		var $dateType = $("#datetype");
		
		$dateType.bind('change', function () {
			var val = this.value;
			switch (val) {
				case '0':
					$('#week').show().siblings().hide();
					break; 
				case '1':
					$('#month').show().siblings().hide();
					break; 
				case '2':
					$('#season').show().siblings().hide();
					break; 
				case '3':
					$('#year').show().siblings().hide();
					break; 
				case '4':
					$('#day').show().siblings().hide();
					break; 
				default:
					console.log('fuck ');
			}

			
			});

		});
		
</script>
 </content>