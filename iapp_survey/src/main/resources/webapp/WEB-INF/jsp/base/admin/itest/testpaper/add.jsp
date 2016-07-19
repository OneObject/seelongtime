<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>创建试卷</title>
<meta name="menu_path" content="test.paperManage" />
<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.css" />
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/testmanage.css">
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i> <a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                <li><a href="${basepath }/base/admin/itest/testpaper/testpaper.xhtml">试卷管理</a><i class="icon-angle-right"></i></li>
                <li><span>添加试卷</span></li>
			</ul>
		</div>
	</div>
	<!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-md-12">
			<div class="portlet box green">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>添加试卷
					</div>
				</div>
				<div class="portlet-body form" style="overflow: hidden;">
					<form id="addForm" onsubmit="return validateAdd()" class="form-horizontal" role="form" action="${basepath }/base/admin/itest/testpaper/doadd.xhtml">
						<div class="form-body">
							<div class="form-group" id="con_name">
								<label class="col-md-4 control-label">试卷名称<span class="required">*</span></label>
								<div class="col-md-4">
									<input type="text" class="form-control" name="name" id="name" onchange="validateName()">
								</div>
                                  <div class="col-md-4">
                                    <span id="tip_name" for="name" class="help-block" style="">不能为空</span>
                                  </div>
							</div>
							<div class="form-group" id="con_difficulty_level">
								<label class="col-md-4 control-label">试卷难易程度</label>
								<div class="col-md-4">
									<select class="form-control select2me" id="difficulty_level" name="level">
			                            <option value="1" selected="selected">简单</option>
			                            <option value="2">一般</option>
			                            <option value="3">困难</option>
									</select>
								</div>
							</div>
							<div class="form-group" id="con_total_score">
								<label class="col-md-4 control-label">试卷总分<span class="required">*</span></label>
								<div class="col-md-4">
									<input type="text" class="form-control" name="total_score" id="total_score" onchange="validateTotalScore()">
								</div>
                                  <div class="col-md-4">
                                    <span id="tip_total_score" for="total_score" class="help-block" style="">正整数或一位小数</span>
                                  </div>
							</div>
							<div class="form-group" id="con_pass_mark">
								<label class="col-md-4 control-label">及格分数<span class="required">*</span></label>
								<div class="col-md-4">
									<input type="text" class="form-control" name="pass_mark" id="pass_mark" onchange="validatePassMark()">
								</div>
                                  <div class="col-md-4">
                                    <span id="tip_pass_mark" for="pass_mark" class="help-block" style="">正整数或一位小数</span>
                                  </div>
                                  <div class="col-md-4">
                                    <span id="tip2_pass_mark" for="pass_mark" class="help-block hidden" style="">及格分不能大于总分</span>
                                  </div>
							</div>
							<div class="form-group" id="con_descript">
								<label class="col-md-4 control-label">试卷描述</label>
								<div class="col-md-4">
									<textarea rows="3" class="form-control" name="descript" id="descript" onchange="v_descript()"></textarea>
								</div>
                                  <div class="col-md-4">
                                    <span id="tip_descript" for="descript" class="help-block" style=""><span id="maxLength">255</span>字以内</span>
                                  </div>
							</div>
						
						<div class="btn_group_center">
                            <input id="isContainAsk" name="isContainAsk" type="hidden" value="2" />
                            <input type="hidden" id="questionIds" name="questionIds" value="" >
                            <button type="submit" class="btn btn-success" >保存</button>
                            <span class="btn default" onclick="cancelInsert()">返回列表</span>
                            <span class="btn btn-info" onclick="saveToNext()">保存并下一步添加试题</span>
						</div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<content tag="pageCore"> 
<!-- 引用核心js包 -->
<script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
<script src="${basepath}/static/public/metronic.bootstrap/assets/scripts/app.js" type="text/javascript"></script>
<script src='${basepath }/static/public/javascripts/commonValidate.js' type='text/javascript' ></script>
<script src="${basepath }/static/public/javascripts/addtestpaper.js" type="text/javascript"></script>  
</content>
<content tag="pageInit">
 <!-- 初始化窗口 -->
</content>
