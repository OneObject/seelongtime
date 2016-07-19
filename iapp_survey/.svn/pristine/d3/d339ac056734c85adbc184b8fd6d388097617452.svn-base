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
<title>修改考试</title>
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
				<li><span>修改考试</span></li>
			</ul>
		</div>
	</div>
	<!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-md-12">
			<div class="portlet box yellow">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>修改考试
					</div>
				</div>
				<div class="portlet-body form" style="overflow: hidden;">
					<form id="updateForm" onsubmit="return validateUpdate()" class="form-horizontal" role="form" action="${basepath }/base/admin/itest/examination/doupdate.xhtml">
						<div class="form-body">
							<div class="form-group" id="con_examName">
								<label class="col-md-4 control-label">考试名称<span class="required">*</span></label>
								<div class="col-md-4">
									<input type="text" class="form-control" name="examName" id="examName" onchange="validateexamName()" value="${entity.examName }">
								</div>
                                <div class="col-md-4">
                                  <span id="tip_examName" for="examName" class="help-block " style="">必填</span>
                                </div>
							</div>
							<div class="form-group" id="con_examNo">
								<label class="col-md-4 control-label">考试编号<span class="required">*</span></label>
								<div class="col-md-4">
									<input type="text" class="form-control" name="examNo" id="examNo" onchange="validateexamNo()" placeholder="" value="${entity.examNo }">
								</div>
                                <div class="col-md-4">
                                  <span id="tip_examNo" for="examNo" class="help-block " style="">必填，数字</span>
                                </div>
							</div>
							<div class="form-group" id="con_keyword">
								<label class="col-md-4 control-label">关键字<span class="required">*</span></label>
								<div class="col-md-4">
									<input type="text" class="form-control" name="keyword" id="keyword" onchange="validatekeyword()" value="${entity.keyword }">
								</div>
                                <div class="col-md-4">
                                  <span id="tip_keyword" for="keyword" class="help-block " style="">必填</span>
                                </div>
							</div>
                            <div class="form-group" id="con_examDate">
                                <label class="col-md-4 control-label">考试时长<span class="required">*</span></label>
                                <div class="col-md-4">
                                    <input type="text" class="form-control" name="examDate" id="examDate" onchange="validateexamDate()" placeholder="" value="${entity.examDate }">
                                </div>
                                <div class="col-md-4">
                                  <span id="tip_examDate" for="examDate" class="help-block " style="">必填，正整数，单位：分钟</span>
                                </div>
                            </div>
                            <div class="form-group" id="con_manager">
                                <label class="col-md-4 control-label">考试负责人<span class="required">*</span></label>
                                <div class="col-md-4">
                                    <input type="text" class="form-control" name="manager" id="manager" onchange="validatemanager()" value="${entity.manager }">
                                </div>
                                <div class="col-md-4">
                                  <span id="tip_manager" for="manager" class="help-block " style="">必填</span>
                                </div>
                            </div>
                            <div class="form-group" id="con_examTimes">
                                <label class="col-md-4 control-label">重考次数<span class="required">*</span></label>
                                <div class="col-md-4">
                                    <input type="text" class="form-control" disabled="disabled" onchange="validateexamTimes()" placeholder="" value="${entity.examTimes }">
                                    <input type="hidden" name="examTimes" id="examTimes"  value="1"/>
                                </div>
                                <div class="col-md-4">
                                  <span id="tip_examTimes" for="examTimes" class="help-block " style="">必填，范围：0~10，0表示不限次数</span>
                                </div>
                            </div>
							<div class="form-group" id="con_domain">
								<label class="col-md-4 control-label">域</label>
								<div class="col-md-4">
									<select class="form-control select2me" name="domain" id="domain" onchange="">
									   <c:if test="${entity.domain eq 'all' }">
						                    <option value="all" selected="selected">所有</option>
						                    <option value="ksf" >康师傅</option>
						                    <option value="longtimeit" >龙泰</option>
									   </c:if>
									   <c:if test="${entity.domain eq 'ksf' }">
						                    <option value="ksf"  selected="selected">康师傅</option>
						                    <option value="all" >所有</option>
						                    <option value="longtimeit" >龙泰</option>
									   </c:if>
									   <c:if test="${entity.domain eq 'longtimeit' }">
						                    <option value="longtimeit"  selected="selected">龙泰</option>
						                    <option value="all" >所有</option>
						                    <option value="ksf" >康师傅</option>
									   </c:if>
									</select>
								</div>
                                <div class="col-md-4">
                                  <span id="tip_domain" for="domain" class="help-block hidden" style="">必填</span>
                                </div>
							</div>
							<div class="form-group" id="con_time">
								<label class="col-md-4 control-label">开始结束时间<span class="required">*</span></label>
								<div class="col-md-4">
									<div class="col-md-5">
	                                    <input type="text" id="startTime" name="startTime" value="${ltfun:dateLongToStringFormat(entity.startTime, 'yyyy-MM-dd HH:mm')  }" 
	                                     onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm', maxDate:'#F{$dp.$D(\'endTime\')}'})" class="form-control Wdate" readonly="readonly"/>
									</div>
									<div class="col-md-1">
										<span class="time_zhi">至</span>
									</div>
									<div class="col-md-5">
	                                    <input type="text" id="endTime" name="endTime" value="${ltfun:dateLongToStringFormat(entity.endTime, 'yyyy-MM-dd HH:mm')  }" 
	                                     onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm', minDate:'#F{$dp.$D(\'startTime\')}'})" class="form-control Wdate" readonly="readonly"/>
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
											<input type="text" class="form-control" onclick="page(1)" placeholder="请选择试卷" readonly="readonly" name="paperName" id="paperName" value="${paper.name }">
												<span class="input-group-addon choose_btn" onclick="page(1)">
												<i class="icon-zoom-in"></i>&nbsp;&nbsp;点击选择</span>
										</div>
									</div>
                                <div class="col-md-4">
                                  <span id="tip_paperId" for="paperId" class="help-block " style="">必填</span>
                                </div>
								</div>
							<div class="form-group <c:out value='${paper.generate_type eq 2? "hidden":"" }' />" id="con_paperNum">
								<label class="col-md-4 control-label">生成试卷数<span class="required">*</span></label>
								<div class="col-md-4">
									<input type="text" class="form-control" name="paperNum" id="paperNum" onchange="validatepaperNum()" placeholder="范围为：1~20" value="${entity.paperNum }">
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
											<input type="radio" name="isShowScore" id="isShowScore1" value="1" <c:out value="${entity.isShowScore?'checked=checked':''}" />>是
										</label> 
										<label  class="radio-inline">
											<input type="radio" name="isShowScore" id="isShowScore0" value="0" <c:out value="${!entity.isShowScore?'checked=checked':''}" />>否
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
									<textarea rows="3" class="form-control" name="mark" id="mark" onchange="v_mark()" >${entity.mark }</textarea>
								</div>
                                <div class="col-md-4">
                                  <span id="tip_mark" for="mark" class="help-block " style=""><span id="maxLength">255</span>字以内</span>
                                </div>
							</div>
						</div>
						<div class="btn_group_center">
                            <input type="hidden" name="paperId" id="paperId" value="${paper.id }">
                            <input type="hidden" id="paperType" name="paperType" value="${paper.generate_type }"/>
                            <input type="hidden" id="examId" name="examId" value="${entity.id }"/>
                            <button type="submit" class="btn btn-warning" >提交</button>
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
		<div class="easyDialog_text" id="easyDialogText" style="background-color: #fff;">
            <table>
                <tr>
                    <td>
                        <span>试卷名称:</span> <input type="text" name="paper_name" id="paper_name"><br>
                    </td>
                    <td>
                        <span>试卷描述:</span> <input type="text" name="paper_descript" id="paper_descript"> 
                    </td>
                    <td>
                        <span class="btn yellow" onclick="page(1)" style="margin: 10px;"><i class="icon-search"></i>检索</span>
                    </td>
                </tr>
            </table>
            <!-- 表格 -->
            <div id="table_list" style="overflow: auto;"></div>
			
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
<script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script><%-- 
<script type="text/javascript" src="${basepath }/static/public/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${basepath }/static/public/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script> --%>
<script src="${basepath}/static/public/metronic.bootstrap/assets/scripts/app.js" type="text/javascript"></script>
<script src="${basepath }/static/public/javascripts/testmanage.js"></script>  
<%-- 输入验证 --%>
<script src='${basepath }/static/public/javascripts/commonValidate.js' type='text/javascript' ></script>
<script src="${basepath }/static/public/javascripts/addexamination.js" type="text/javascript"></script>  
<script language="javascript" type="text/javascript" src="${basepath }/static/public/My97DatePicker/WdatePicker.js"></script>
</content>
<content tag="pageInit">
 <!-- 初始化窗口 -->
 <script type="text/javascript">
      $(document).ready(function() {
        /*  $('#datetimepicker_start').datetimepicker({language: 'zh-CN',pickerPosition:'bottom-right',autoclose:true});
         $('#datetimepicker_end').datetimepicker({language: 'zh-CN',pickerPosition:'bottom-right',autoclose:true}); */
         
         $("#domain").val("${entity.domain}");
      });
</script>
</content>
