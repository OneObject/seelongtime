<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>创建考试</title>
<meta name="menu_path" content="test.testManage" />
<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.css" /><%-- 
<link rel="stylesheet" media="screen" href="${basepath }/static/public/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css"> --%>
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/testmanage.css">
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i> <a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
				<li><a href="${basepath }/base/admin/itest/examination/examination.xhtml">考试管理</a><i class="icon-angle-right"></i></li>
				<li><span href="#">创建考试</span></li>
			</ul>
		</div>
	</div>
	<!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-md-12">
			<div class="portlet box green">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>创建考试
					</div>
				</div>
				<div class="portlet-body form" style="overflow: hidden;">
					<form id="addForm" onsubmit="return validateAdd()" class="form-horizontal" role="form" action="${basepath }/base/admin/itest/examination/doadd.xhtml">
						<div class="form-body">
							<div class="form-group" id="con_examName">
								<label class="col-md-4 control-label">考试名称<span class="required">*</span></label>
								<div class="col-md-4">
									<input type="text" class="form-control" name="examName" id="examName" onchange="">
								</div>
                                <div class="col-md-4">
                                  <span id="tip_examName" for="examName" class="help-block " style="">必填</span>
                                </div>
							</div>
							<div class="form-group" id="con_examNo">
								<label class="col-md-4 control-label">考试编号<span class="required">*</span></label>
								<div class="col-md-4">
									<input type="text" class="form-control" name="examNo" id="examNo" onchange="validateexamNo()" placeholder="">
								</div>
                                <div class="col-md-4">
                                  <span id="tip_examNo" for="examNo" class="help-block " style="">必填，数字</span>
                                </div>
							</div>
							<div class="form-group" id="con_keyword">
								<label class="col-md-4 control-label">关键字<span class="required">*</span></label>
								<div class="col-md-4">
									<input type="text" class="form-control" name="keyword" id="keyword" onchange="validatekeyword()">
								</div>
                                <div class="col-md-4">
                                  <span id="tip_keyword" for="keyword" class="help-block " style="">必填</span>
                                </div>
							</div>
                            <div class="form-group" id="con_examDate">
                                <label class="col-md-4 control-label">考试时长<span class="required">*</span></label>
                                <div class="col-md-4">
                                    <input type="text" class="form-control" name="examDate" id="examDate" onchange="validateexamDate()" placeholder="">
                                </div>
                                <div class="col-md-4">
                                  <span id="tip_examDate" for="examDate" class="help-block " style="">必填，正整数，单位：分钟</span>
                                </div>
                            </div>
                            <div class="form-group" id="con_manager">
                                <label class="col-md-4 control-label">考试负责人<span class="required">*</span></label>
                                <div class="col-md-4">
                                    <input type="text" class="form-control" name="manager" id="manager" onchange="validatemanager()">
                                </div>
                                <div class="col-md-4">
                                  <span id="tip_manager" for="manager" class="help-block " style="">必填</span>
                                </div>
                            </div>
                            <div class="form-group" id="con_examTimes">
                                <label class="col-md-4 control-label">重考次数<span class="required">*</span></label>
                                <div class="col-md-4">
                                    <input type="text" class="form-control" name="examTimes" id="examTimes"  onchange="validateexamTimes()" placeholder="">
                                </div>
                                <div class="col-md-4">
                                  <span id="tip_examTimes" for="examTimes" class="help-block " style="">必填，范围：0~100，0表示不限次数</span>
                                </div>
                            </div>
							<!-- <div class="form-group" id="con_domain">
								<label class="col-md-4 control-label">域</label>
								<div class="col-md-4">
									<select class="form-control select2me" name="domain" id="domain" onchange="">
					                    <option value="all">所有</option>
					                    <option value="ksf">康师傅</option>
					                    <option value="longtimeit">龙泰</option>
									</select>
								</div>
                                <div class="col-md-4">
                                  <span id="tip_domain" for="domain" class="help-block hidden" style="">必填</span>
                                </div>
							</div> -->
							<div class="form-group" id="con_time">
								<label class="col-md-4 control-label">开始结束时间<span class="required">*</span></label>
								<div class="col-md-4">
									<div class="col-md-5">
										<input type="text" id="startTime" name="startTime" value="${nowtime }" 
										 onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm', maxDate:'#F{$dp.$D(\'endTime\')}'})" class="form-control Wdate"/>
									</div>
									<div class="col-md-1">
										<span class="time_zhi">至</span>
									</div>
									<div class="col-md-5">
										<input type="text" id="endTime" name="endTime" value="${nowtime }" 
										 onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm', minDate:'#F{$dp.$D(\'startTime\')}'})" class="form-control Wdate"/>
									</div>
								</div>
                                <div class="col-md-4">
                                  <span id="tip_time" for="time" class="help-block " style="">必填</span>
                                </div>
							</div>
							<div class="form-group" id="con_paperId">
									<label class="control-label col-md-4">选择试卷<span class="required">*</span></label>
									<div class="col-md-4">
										<div class="input-group">
											<input type="text" class="form-control" onclick="page(1)" placeholder="请选择试卷" readonly="readonly" name="paperName" id="paperName">
												<span class="input-group-addon choose_btn" onclick="page(1)">
												<i class="icon-zoom-in"></i>&nbsp;&nbsp;点击选择</span>
										</div>
									</div>
                                <div class="col-md-4">
                                  <span id="tip_paperId" for="paperId" class="help-block " style="">必填</span>
                                </div>
								</div>
							<div class="form-group hidden" id="con_paperNum">
								<label class="col-md-4 control-label">生成试卷数<span class="required">*</span></label>
								<div class="col-md-4">
									<input type="text" class="form-control" name="paperNum" id="paperNum" onchange="validatepaperNum()" placeholder="范围为：1~20">
								</div>
                                <div class="col-md-4">
                                  <span id="tip_paperNum" for="paperNum" class="help-block " style="">请输入一个介于 1和20之间的整数</span>
                                </div>
							</div>
							<div class="form-group" id="con_score">
								<label class="col-md-4 control-label">立即显示分数</label>
								<div class="col-md-4">
									<div class="radio-list" id="judge" >
										<label class="radio-inline">
											<input type="radio" name="isShowScore" id="isShowScore1" value="1" checked="checked">是
										</label> 
										<label  class="radio-inline">
											<input type="radio" name="isShowScore" id="isShowScore0" value="0">否
										</label>
									</div>
								</div>
                                <div class="col-md-4">
                                  <span id="tip_score" for="score" class="help-block hidden" style="">必填</span>
                                </div>
							</div>
							<!-- 分割线 -->
							<div class="form-group" id="con_mark">
								<label class="col-md-4 control-label">考试描述</label>
								<div class="col-md-4">
									<textarea rows="3" class="form-control" name="mark" id="mark" onchange="v_mark()"></textarea>
								</div>
                                <div class="col-md-4">
                                  <span id="tip_mark" for="mark" class="help-block " style=""><span id="maxLength">255</span>字以内</span>
                                </div>
							</div>
						</div>
						<div class="btn_group_center">
                            <input type="hidden" name="paperId" id="paperId" >
                            <input type="hidden" id="paperType" name="paperType"/>
                            <button type="submit" class="btn btn-success" >提交</button>
                            <span class="btn default" onclick="cancelInsert()">取消</span>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 选择用户弹出层 开始 -->
	<div id="dialogBank" style="display: none;width:800px;height:700px;overflow: hidden;">
		<h4 class="easyDialog_title" id="easyDialogTitle">&nbsp;&nbsp;选择试卷
			<a href="javascript:void(0)" title="关闭窗口" class="close_btn"
				id="closeBtn">&times;&nbsp;&nbsp;</a>
		</h4>
		<div class="easyDialog_text" style="background-color: #fff;" id="easyDialogText">
            <table>
            	<tr>
            		<td>
            			<span>试卷名称:</span> <input type="text" name="paper_name" id="paper_name">&nbsp;&nbsp;
            		</td>
            		<td>
            			<span>组卷方式:</span><!--  <input type="text" name="paper_type" id="paper_type">  -->
                        <select class="" data-placeholder="选择" name="paper_type" id="paper_type" onchange="page(1)" >
                            <option value="">请选择</option>
                            <option value="1">自动组卷</option>
                            <option value="2">手动组卷</option>
                         </select>&nbsp;&nbsp;
            		</td>
            		<td>
            			<span>试卷描述:</span> <input type="text" name="paper_descript" id="paper_descript"> &nbsp;&nbsp;
            		</td>
            		<td>
            			<span class="btn yellow" onclick="page(1)" style="margin: 10px;"><i	class="icon-search"></i>检索</span>
            		</td>
            	</tr>
            </table>
            <!-- 表格 -->
            <div id="table_list" style="overflow: auto; width: 100%;"></div>
			
		  	<div class="easyDialog_footer">
		      <button class="btn default dialog-btn" onclick="easyDialog.close()">关闭</button>
		      <button class="btn btn-success dialog-btn" onclick="addPaper()">确定选择</button>
		    </div>
		</div>
	</div>
	<!-- 选择用户弹出层 结束 -->
</body>
</html>
<content tag="pageCore"> 
<!-- 引用核心js包 -->
<script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
<%-- <script type="text/javascript" src="${basepath }/static/public/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${basepath }/static/public/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script> --%>
<script src="${basepath}/static/public/metronic.bootstrap/assets/scripts/app.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript" src="${basepath }/static/public/My97DatePicker/WdatePicker.js"></script>
<script src="${basepath }/static/public/javascripts/testmanage.js"></script>
 
<%-- 输入验证 --%>
<script src='${basepath }/static/public/javascripts/commonValidate.js' type='text/javascript' ></script>
<script src="${basepath }/static/public/javascripts/addexamination.js" type="text/javascript"></script>  
</content>
<content tag="pageInit">
 <!-- 初始化窗口 -->
 <script type="text/javascript">
     /*  $(document).ready(function() {
         $('#datetimepicker_start').datetimepicker({language: 'zh-CN',pickerPosition:'bottom-right',autoclose:true});
         $('#datetimepicker_end').datetimepicker({language: 'zh-CN',pickerPosition:'bottom-right',autoclose:true});
      }); */
</script>
</content>
