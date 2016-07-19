<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<%@page language="java" import="com.longtime.app.config.Constants"%>
<!DOCTYPE html>
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title><c:if test="${isAddOrUpdate eq 'add' }">新建考试</c:if><c:if test="${isAddOrUpdate eq 'update' }">修改考试</c:if></title>
<meta name="menu_path" content="test.testManage" />
	<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
  	<link rel="stylesheet" href="${basepath}/static/public/easydialog-v2.0/easydialog.css">
  	<link rel="stylesheet" href="${basepath}/static/css/active.css">
  	<script src="${basepath}/static/public/easydialog-v2.0/easydialog.min.js"></script>
 	<script src="${basepath}/static/itest/admin/exam.js"></script>
  	<script language="javascript" type="text/javascript" src="${basepath }/static/public/My97DatePicker/WdatePicker.js"></script>
  	<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/testmanage.css">
  	<link rel="stylesheet" type="text/css" href="${basepath }/static/ixin/css/uploadify.css">
  	<link href="${basepath }/static/plugins/bootstrap-switch-master/docs/bootstrap-switch.css" rel="stylesheet">
	<script src="${basepath }/static/plugins/bootstrap-switch-master/docs/bootstrap-switch.js"></script>
	<script src="${basepath }/static/itest/admin/releasequestion.js" type="text/javascript"></script>  
	<script src="${basepath }/static/itest/admin/itemchoicelist.js" type="text/javascript"></script>  
	<script src="${basepath }/static/ixin/js/jquery.uploadify.min.js" type="text/javascript"></script>
	<style type="text/css">
		div.checker, div.checker span, div.checker input {
			width: auto;height: auto;
		}
		.form-horizontal .control-label, .form-horizontal .radio, .form-horizontal .checkbox, .form-horizontal .radio-inline, .form-horizontal .checkbox-inline{
		padding:0px;
		}
		.uploadify{
		width:120px;
		float:left;
		}
		.uploadify-queue{
		display:none;}
		.you-error-border{
		border-color: #B94A48;}

	</style>
  	<script type="text/javascript">
		function resizeheightforedite(o){
		    $(".edite-img").height($(o).height());
		    $(".edite-img").attr("style","margin-top:-"+$(o).height()+"px;height:"+$(o).height()+"px;line-height:"+$(o).height()+"px;");
		}
		function showother(){
		    $(".othermsg").slideToggle("fast");
		    $(".moremsg").slideToggle("fast");
		    $(".moremsg-up").slideToggle("fast");
		}	
		
		$(function (){
			var type = $("input[name='generate_type']").val();
			if(type != 1 && type != 2){
				type = 2;
			}
			setTestpaper(type);
			getTotalNumScore();
			detailUpdateItemblanks();
			var gtype = "${entity.generate_type}";
			if(gtype == 2){
				previewPaper(); 
			}
			
			$("#myswitch").bootstrapSwitch({
				onText:"是",
				offText:"否",
				onColor: "success",
		        offColor: "default"
			});
			
			$("#file_upload").uploadify({
				'formData' :{
					'tid':"${tid}",
				},
				'fileObjName' : 'file',
				'buttonText' : '<span class="btn default" onclick="importQuestion()" style="margin-top: 0;"><i class="glyphicon glyphicon-log-in"></i>导入试题</span>',
				'buttonClass' : 'upload_access',
				'swf'      : basepath+'/static/ixin/css/uploadify.swf',
				'uploader' : basepath+'/testquestion/importexamination.xhtml',
				'onSelect':function(file){
					 easyDialog.open({
			    		  container :'loading_img',
			    		  fixed : false,
			    		  overlay:true
			    		});
					},
				'onUploadSuccess' : function(file,data,response){
					var result = $.parseJSON(data);
					easyDialog.close();
					if(result.rs == 'fail'){
						var html = "";
						for(var i=0;i<result.msg.length;i++){
							  var msg = result.msg[i];
							  html=html+'<p>'+msg+'</p>';
						}
						$("#errorMsg").html(html);
						easyDialog.open({
				        	container :"easyDialogWrapperww"
					    });
					} else {
						var questionIds = $("#questionIds").val();
						questionIds = questionIds+result.ids;
						$("#questionIds").val(questionIds);
						previewPaper(); 
					}
				},
				'onUploadComplete':function(file){
					 
				},
				'onUploadError' : function(file, errorCode, errorMsg, errorString){
					easyDialog.close();
					alert("导入试题失败");
				}
			});
			
		});
		
		//导入试题
		function importQuestion(examNo){
			$('#file_upload').click();
		}
		
		/** 下载试题模板 */
		function downloadTemplate(){
			window.location.href = basepath+"/modelfile/试题导入模板.xls";
		}
	</script>
</head>
<body>

       <!-- BEGIN PAGE HEADER-->
         <div class="row" >
            <div class="col-md-12">
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
               <ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i> <a href="${basepath }/base/admin/itest/examination/examination.xhtml">考试管理</a><i class="icon-angle-right"></i></li>
				<li><span href="#"><c:if test="${isAddOrUpdate eq 'add' }">新建考试</c:if><c:if test="${isAddOrUpdate eq 'update' }">修改考试</c:if></span></li>
				</ul>
               <!-- END PAGE TITLE & BREADCRUMB-->
            </div>
         </div>
         <!-- END PAGE HEADER-->
		<div class="col-md-12">
			<!-- BEGIN VALIDATION STATES-->
			<div class="portlet box green">
				<div class="portlet-title">
					<div class="caption">
						<i class="fa fa-bookmark-o"></i><span>选择试题</span>
					</div>
				</div>
				<div class="portlet-body form box_box">
					<div class="col-md-12" id="course_info">
					      <ul class="stemp-box" style="width: 590px;">
			                <li class="tep-left">
			                    <img src="${basepath}/static/img/step-left.png">
			                </li>
			                <li class="over-step" onclick="next1('${tid}','${isAddOrUpdate }');">
			                    1
			                </li>
			                <li class="step-xian-lv"></li>
			                <li class="current-step" onclick="next2('${tid}','${isAddOrUpdate }');">
			                    2
			                </li>
			                <li class="step-xian${stepStatus['3'] ?'-lv':'' }"></li>
			                <li class="${stepStatus['3'] ?'over':'nor' }-step" onclick="next3('${tid}','${isAddOrUpdate }');">
			                    3
			                </li>
			                <li class="step-xian${stepStatus['4'] ?'-lv':'' }"></li>
			                <li class="${stepStatus['4'] ?'over':'nor' }-step" onclick="next4('${tid}','${isAddOrUpdate }');">
			                    4
			                </li>
			                <li class="tep-right">
			                    <img src="${basepath}/static/img/step-right${stepStatus['all'] ?'-over':'' }.png">
			                </li>
			            </ul>
			            <div class="preview-style">
			                <div class="portlet-body form" style="overflow: hidden;">
								<form id="addForm" onsubmit="return validateAddNext()" method="post" class="form-horizontal" role="form" action="${basepath }/mgr/itest/exam/dorelatequestion.xhtml">
									 <div class="form-body">
										<div class="form-group" id="con_total_socre">
											<label class="col-md-2 control-label">试卷总分</label>
			                                <div class="col-md-10">
			                                    <span id="total_socre">${entity.total_score}</span>
			                                </div>
									  </div>
										<div class="form-group" id="con_pass_mark">
											<label class="col-md-2 control-label">通过分数</label>
			                                <div class="col-md-10">
			                                    <span id="pass_mark">${entity.pass_mark}</span>
			                                </div>
									  </div>
									  <div class="form-group">
											<label class="col-md-2 control-label">组卷方式</label>
											<div class="col-md-10">
												<input type="hidden" name="generate_type" id="generate_type" value="${entity.generate_type}" >
												<div class="radio-list" id="judge" >
													<label class="radio-inline" onclick="setTestpaper(2)">
														<div class="radio" id="uniform-handle"><span id="check-a1" class="checked">
														<input type="radio" name="type" id="handle" value="2"  ${entity.generate_type ==2 ?'checked="checked"' : ''}></span></div>手动组卷
													</label> 
													<label  class="radio-inline" onclick="setTestpaper(1)">
														<div class="radio" id="uniform-auto"><span id="check-a2" class="">
														<input type="radio" name="type" id="auto" value="1" ${entity.generate_type ==1 ?'checked="checked"' : ''}></span></div>自动组卷
													</label>
												</div>
											</div>
										</div>
										<div class="form-group" id="con_questionIds">
												<label class="col-md-2 control-label">选择试题</label>
												<div class="col-md-10">
													<span class="btn default" onclick="pageQuestion(1)" style="float:left;margin-right:20px;"><i class="glyphicon glyphicon-search"></i>选择试题</span>
													<!-- <span class="btn default" onclick="importQuestion()" style="margin-top: 0;"><i class="glyphicon glyphicon-log-in"></i>导入试题</span> -->
													<input id="file_upload" class="form-control" name="file_upload"  type="file" >
													<span class="btn default" onclick="downloadTemplate()" style="float:left;"><i class="glyphicon glyphicon-download-alt"></i>&nbsp;下载导入模板</span>
												</div>
										</div>
						                
						                <div class="form-group hidden" id="con_total_num_selected">
												<label class="col-md-2 control-label">指定组卷策略</label>
												<div class="col-md-10">
													<!-- <span class="btn default" onclick="chooseStructure()"><i class="glyphicon glyphicon-search"></i>设定试卷组成</span> -->
													 <div class="timu-info">
										            	<table class="table table-striped table-bordered table-hover table-full-width datatable">
										            		<tr>
										            			<td><span>题库中试题总数：</span></td>
										            			<td id="total_num_max">0</td>
										            			<td><span>已选题目总数：</span></td>
										            			<td id="total_num_selected" onchange="validateQuestions()">0</td>
										            			<td><span>分数总计</span></td>
										            			<td id="total_score_selected">0</td>
										            		</tr>
										            	</table>
										            </div>
										            <div class="panel-group" id="accordion">
										                 <c:if test="${autoflag eq 'add' }">
				                                         <c:forEach var="t" items="${typeNumMap }" varStatus="i">
				                                              <div class="panel panel-default" id="eachType_${t.key}">
				                                                <div class="panel-heading">
				                                                  <h4 class="panel-title">
				                                                    <a style = "text-decoration: none;" data-toggle="collapse" data-toggle="collapse" data-parent="#accordion" href="#collapse${t.key }" onclick="updateTriangle('triangle_${t.key }');">
				                                                         <c:if test="${t.key eq 1}">判断题</c:if>
				                                                         <c:if test="${t.key eq 2}">单选题</c:if>
				                                                         <c:if test="${t.key eq 3}">多选题</c:if>
				                                                         <c:if test="${t.key eq 4}">问答题</c:if>
				                                                         <i class="glyphicon <c:out value='${t.key eq 1? "glyphicon-chevron-down":"glyphicon-chevron-left" }' /> triangle" id="triangle_${t.key }" style="color:#999"></i>
				                                                    </a>
				                                                  </h4>
				                                                </div>
				                                                <div id="collapse${t.key }" class="panel-collapse collapse <c:out value='${i.count eq 1? "in":"" }' /> ">
				                                                  <div class="panel-body">
				                                                    <table class="table table-striped table-bordered table-hover table-full-width">
				                                                        <tr>
				                                                            <td>
				                                                                <span>已选择的题库：</span>    
				                                                            </td>
				                                                            <td id="con_itemblank_${t.key }">
				                                                                <!-- <span class="tiku_name">
				                                                                    java课程
				                                                                    <i class="glyphicon glyphicon-remove" onclick="removeItemblank('id')"></i>
				                                                                </span> -->
				                                                                <span class="btn btn-info btn-xs" onclick="pageItemblank(1)"><i class="glyphicon glyphicon-screenshot"></i>&nbsp;选择题库</span>
				                                                                <input id="${t.key }_itemblank_ids_str" name="${t.key }_itemblank_ids_str" type="hidden" />
				                                                                <input id="${t.key }_itemblank_names_str" name="${t.key }_itemblank_names_str" type="hidden" />
				                                                                 <input id="${t.key }_question_type" name="question_type" value="${t.key }" type="hidden" />
				                                                            </td>
				                                                        </tr>
				                                                        <tr>
				                                                            <td>
				                                                                <span>题库题目总数：</span>
				                                                            </td>
				                                                            <td>
				                                                                <span id="${t.key }_num_max" title="${t.value }">${t.value }</span>
				                                                            </td>
				                                                        </tr>
				                                                        <tr id="con_${t.key }_question_num">
				                                                            <td>
				                                                                <span>题目数：</span>
				                                                            </td>
				                                                            <td>
				                                                                <input type="text" name="${t.key }_question_num" id="${t.key }_question_num" onchange="checkEachTypeNum()">
				                                                                <span class="error_info" id="tip_${t.key }_question_num">请输入正整数</span>
				                                                                <span class="error_info hidden" id="tip2_${t.key }_question_num">必须小于题库题目总数</span>
				                                                            </td>
				                                                        </tr>
				                                                        <tr id="con_${t.key }_question_score" class="">
				                                                            <td>
				                                                                <span>每题分数</span>
				                                                            </td>
				                                                            <td>
				                                                                <input class="autoTypeScore" type="text" name="${t.key }_question_score" id="${t.key }_question_score" onchange="checkScore(this);">
				                                                                <span class="error_info" id="tip_${t.key }_question_score">正整数或一位小数</span>
				                                                            </td>
				                                                        </tr>
				                                                    </table>
				                                                  </div>
				                                                </div>
				                                              </div>
				                                         </c:forEach>
				                                         </c:if>
										                 <c:if test="${autoflag eq 'update' }">
				                                         <c:forEach var="q" items="${typevoNumMap }" varStatus="i">
				                                              <div class="panel panel-default"  id="eachType_${q.key.type}">
				                                                <div class="panel-heading">
				                                                  <h4 class="panel-title">
				                                                    <a data-toggle="collapse" data-toggle="collapse" data-parent="#accordion" href="#collapse${q.key.type }" onclick="updateTriangle('triangle_${q.key.type }');">
								                                         <c:if test="${q.key.type eq 1}">判断题</c:if>
								                                         <c:if test="${q.key.type eq 2}">单选题</c:if>
								                                         <c:if test="${q.key.type eq 3}">多选题</c:if>
								                                         <c:if test="${q.key.type eq 4}">问答题</c:if>
				                                                         <i class="glyphicon <c:out value='${q.key.type eq 1? "glyphicon-chevron-down":"glyphicon-chevron-left" }' /> triangle" id="triangle_${q.key.type }" style="color:#999"></i>
				                                                    </a>
				                                                  </h4>
				                                                </div>
				                                                <div id="collapse${q.key.type }" class="panel-collapse collapse <c:out value='${i.count eq 1? "in":"" }' /> ">
				                                                  <div class="panel-body">
				                                                    <table class="table table-striped table-bordered table-hover table-full-width">
				                                                        <tr>
				                                                            <td>
				                                                                <span>已选择的题库：</span>    
				                                                            </td>
				                                                            <td id="con_itemblank_${q.key.type }">
				                                                                <span class="btn btn-info btn-xs" onclick="pageItemblank(1)"><i class="glyphicon glyphicon-screenshot"></i>&nbsp;选择题库</span>
				                                                                <input id="${q.key.type }_itemblank_ids_str" name="${q.key.type }_itemblank_ids_str" type="hidden" value="${idsStrMap[q.key.type] }"/>
				                                                                <input id="${q.key.type }_itemblank_names_str" name="${q.key.type }_itemblank_names_str" type="hidden" value="${namesStrMap[q.key.type] }" />
				                                                                 <input id="${q.key.type }_question_type" name="question_type" value="${q.key.type }" type="hidden" value="${q.key.type }" />
				                                                            </td>
				                                                        </tr>
				                                                        <tr>
				                                                            <td>
				                                                                <span>题库题目总数：</span>
				                                                            </td>
				                                                            <td>
				                                                                <span id="${q.key.type }_num_max" >${q.value}</span>
				                                                            </td>
				                                                        </tr>
				                                                        <tr id="con_${q.key.type }_question_num">
				                                                            <td>
				                                                                <span>题目数：</span>
				                                                            </td>
				                                                            <td>
				                                                                <input type="text" name="${q.key.type }_question_num" id="${q.key.type }_question_num" onchange="checkEachTypeNum()"
				                                                                 value="${q.key.num>0? q.key.num:'' }">
				                                                                <span class="error_info" id="tip_${q.key.type }_question_num">请输入正整数</span>
				                                                                <span class="error_info hidden" id="tip2_${q.key.type }_question_num">必须小于题库题目总数</span>
				                                                            </td>
				                                                        </tr>
				                                                        <tr id="con_${q.key.type }_question_score" class="">
				                                                            <td>
				                                                                <span>每题分数</span>
				                                                            </td>
				                                                            <td>
				                                                                <input class="autoTypeScore" type="text" rel="${q.key.type }" name="${q.key.type }_question_score" id="${q.key.type }_question_score" onchange="checkScore(this);"
				                                                                 value="${q.key.score>0? q.key.score:'' }">
				                                                                <span class="error_info" id="tip_${q.key.type }_question_score">正整数或一位小数</span>
				                                                            </td>
				                                                        </tr>
				                                                    </table>
				                                                  </div>
				                                                </div>
				                                              </div>
				                                         </c:forEach>
				                                         </c:if>
													</div>
										            <div class="timu_xuanze">
										            	<div id="panduan"></div>
										            	<div id="danxuan"></div>
										            	<div id="duoxuan"></div>
										            	<div id="wenda"></div>
										            </div>
												</div>
										 </div>
										  <div class="form-group" style="text-align: right">
										  		<input type="hidden" id="paperId" name="paperId" value="${entity.id }" />
										  		<input type="hidden" id="tid" name="tid" value="${tid }" />
										  		<input type="hidden" id="paperNum" name="paperNum" value="1" />
					                            <input type="hidden" id="questionIds" name="questionIds" value="${questionIds }" onchange="validateQuestions()" >
								                <input type="hidden" name="idsStr" id="idsStr" value="" />
								                <input type="hidden" name="namesStr" id="namesStr" value="" />
								                <input type="hidden" name="isAddOrUpdate" value="${isAddOrUpdate }" />
							              </div>
							              <div class="form-group"  style="text-align: right;">
							              			<span class="btn btn-success" onclick="next1('${tid}')"><i class="glyphicon glyphicon-arrow-left"></i>&nbsp;&nbsp;上一步</span>
								                    <span class="btn btn-success" onclick="saveStep2();"><i class="glyphicon glyphicon-floppy-save"></i>&nbsp;&nbsp;下一步</span>
								                    <span style="margin-right: 30px;float: right; text-decoration: underline; color:#15A0F5;cursor: pointer;margin-left: 20px;margin-top: 20px;" onclick="next3('${tid}')">跳过</span>
							              		</div>
							               <div id="preview_con">
						                         
						                    </div>
									</div>
								</form>
							</div>
			            </div>
					</div>
				</div>
			</div>
		</div>
	
	<!-- 选择用户弹出层 开始 -->
	<div id="chooseQuestion" style="width:800px;height: 700px;display: none;">
		<h4 class="easyDialog_title" id="easyDialogTitle">&nbsp;&nbsp;<span id="edTitle">选择试题</span>
			<a href="javascript:void(0)" title="关闭窗口" class="close_btn" onclick="easyDialog.close()" id="closeBtn">&times;&nbsp;&nbsp;</a>
		</h4>
    
    <!-- 手动组卷 -->
        <div class="easyDialog_text hidden form-horizontal" id="testQuestion" style="">
            <div class="row">
            	<table style="margin-left:20px;">
            		<tr>
            			<td>试题名称:</td>
            			<td><input type="text" id="searchContent" name="searchContent" style="width: 100px;">&nbsp;&nbsp;</td>
            			<td>
            				题库:
            			</td>
            			<td>
            				<select class="" data-placeholder="选择" id="itemId" name="itemId" onchange="pageQuestion(1)">
			            		<option value="">请选择</option>
			                	<c:forEach var="item" items="${itemblanks }">
			                	    <option id="item_${item.id }" value="${item.id }" >${item.name }</option>
			                	</c:forEach>
			            	</select>&nbsp;&nbsp;
            			</td>
            			<td>
            				试题类型:
            			</td>
            			<td>
            				<select class="" data-placeholder="选择" name="type" id="type" onchange="pageQuestion(1)" >
		                    	<option value="">请选择</option>
		                        <c:forEach items="${questionTypeMap }" var="qt" varStatus="st">
		                        <option value="${qt.value }" id="type_${qt.value }" >${qt.key }</option>
		                        </c:forEach>
		                     </select>&nbsp;&nbsp;
            			</td>
            			<td>
            				<span class="btn yellow" onclick="pageQuestion(1)" style="margin-top: 0px;margin-right: 12px;"><i class="icon-search"></i>检索</span>
            			</td>
            		</tr>
            	</table>
            </div>
            <!-- 表格 -->
            <div id="table_list" style="overflow:auto;"></div>
            
            <!-- <div class="easyDialog_footer">
              <button class="btn default dialog-btn" onclick="easyDialog.close()" style="margin-top:0px;">关闭</button>
              <button class="btn btn-success dialog-btn" onclick="saveChoice()" style="margin-top:0px;">确定选择</button>
            </div> -->
        </div>
    <!-- 自动组卷 -->
        <div class="easyDialog_text hidden" id="itemblankList" style="">
            <div class="row">
          		<table style="margin-left:20px;">
          			<tr>
          				<td><label class="control-label">题库名称:</label></td>
          				<td><input type="text" id="itemblank_name" name="itemblank_name"><br></td>
          				<td><span class="btn yellow" onclick="pageItemblank(1)" style="margin-top: 0px;"><i class="icon-search"></i>检索</span></td>
          			</tr>
          		</table>
            </div>
            
            <!-- 表格 -->
            <div id="itemblank_list" style="overflow:auto;"></div>
            
	        <!-- <div class="easyDialog_footer">
	          <button class="btn default dialog-btn" onclick="easyDialog.close()" style="margin-top:0px;">关闭</button>
	          <button class="btn btn-success dialog-btn" onclick="saveChoice()" style="margin-top:0px;">确定选择</button>
	        </div> -->
        </div>
	        <div class="easyDialog_footer">
	          <button class="btn default dialog-btn" onclick="easyDialog.close()" style="margin-top:0px;">关闭</button>
	          <button class="btn btn-success dialog-btn" onclick="saveChoice()" style="margin-top:0px;">确定选择</button>
	        </div>
        
        
	</div>
	<!-- 选择用户弹出层 结束 -->
	
	
	
	<!-- 弹出错误提示的界面 -->
		<div class="easyDialog_wrapper" id="easyDialogWrapperww">
			<div class="easyDialog_content">
				<h4 class="easyDialog_title" id="easyDialogTitle">
					<a href="javascript:void(0)" title="关闭窗口" class="close_btn"
						 onclick="easyDialog.close()">&times;</a>错误信息
				</h4>
				<div class="easyDialog_text" style="width:500px;height:300px;display:block;overflow-x:hidden;overflow-y:scroll;">
					<!-- Tab panes -->
					<div class="tab-content" id="errorMsg">
					  	
					</div>
				</div>
				<div class="easyDialog_footer">
					<button class="btn_normal" onclick="easyDialog.close()">关闭</button>
				</div>
			</div>
		</div>
</body>
</html>

