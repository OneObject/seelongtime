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
<title>绑定试题</title>
<meta charset="utf-8">
<meta name="menu_path" content="test.paperManage" />
<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/testmanage.css">
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i> <a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                <li><a href="${basepath }/base/admin/itest/testpaper/testpaper.xhtml">试卷管理</a><i class="icon-angle-right"></i></li>
                <li><span>绑定试题</span></li>
			</ul>
		</div>
	</div>
	<!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-md-12">
			<div class="portlet box green">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>绑定试题
					</div>
				</div>
				<div class="portlet-body form" style="overflow: hidden;">
					<!-- <div class="row">
						<div class="col-md-12">
							<span class="shangyibu" onclick="cancelInsert()"><i class="glyphicon glyphicon-arrow-left"></i>上一步</span>
						</div>
					</div> -->
					<form id="addForm" onsubmit="return validateAddNext()" class="form-horizontal" role="form" action="${basepath }/base/admin/itest/testpaper/dorelatequestion.xhtml">
						<div class="form-body">
							<div class="form-group" id="con_generate_type">
								<label class="col-md-3 control-label">试卷总分</label>
                                <div class="col-md-5">
                                    <span style="margin-top: 10px; display: block;" id="total_socre_1">${entity.total_score}</span>
                                </div>
							</div>
							<div class="form-group" id="con_generate_type">
								<label class="col-md-3 control-label">组卷方式</label>
								<div class="col-md-5">
									<select class="form-control select2me" id="generate_type" name="generate_type" onchange="setTestpaper()">
									<c:if test="${entity.generate_type eq 2 }">
										<option selected="selected" value="2">手动组卷</option>
										<option value="1">自动组卷</option>
									</c:if>
									<c:if test="${entity.generate_type eq 1 }">
										<option selected="selected" value="1">自动组卷</option>
										<option value="2">手动组卷</option>
									</c:if>
									<c:if test="${entity.generate_type ne 1 && entity.generate_type ne 2 }">
										<option value="1">自动组卷</option>
										<option value="2">手动组卷</option>
									</c:if>
									</select>
								</div>
							</div>
						<div class="form-group" id="con_questionIds">
								<label class="col-md-3 control-label">选择试题</label>
								<div class="col-md-5">
									<span class="btn default" onclick="pageQuestion(1)"><i class="glyphicon glyphicon-search"></i>选择试题</span>
								</div>
                                <div class="col-md-5">
                                  <span id="tip_questionIds" for="questionIds" class="help-block hidden" style="">请选择试题</span>
                                </div>
						</div>
						<div class="form-group hidden" id="con_total_num_selected">
								<label class="col-md-3 control-label">指定组卷策略</label>
								<div class="col-md-5">
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
                                              <div class="panel panel-default">
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
                                                                <input type="text" name="${t.key }_question_num" id="${t.key }_question_num" onchange="checkNum(this);">
                                                                <span class="error_info" id="tip_${t.key }_question_num">请输入正整数</span>
                                                                <span class="error_info hidden" id="tip2_${t.key }_question_num">必须小于题库题目总数</span>
                                                            </td>
                                                        </tr>
                                                        <tr id="con_${t.key }_question_score" class="">
                                                            <td>
                                                                <span>每题分数</span>
                                                            </td>
                                                            <td>
                                                                <input type="text" name="${t.key }_question_score" id="${t.key }_question_score" onchange="checkScore(this);">
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
                                              <div class="panel panel-default">
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
                                                                <input type="text" name="${q.key.type }_question_num" id="${q.key.type }_question_num" onchange="checkNum(this);"
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
                                                                <input type="text" name="${q.key.type }_question_score" id="${q.key.type }_question_score" onchange="checkScore(this);"
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
                                <div class="col-md-5">
                                  <span id="tip_total_num_selected" for="total_num_selected" class="help-block hidden" style="">请指定组卷策略</span>
                                </div>
						</div>
						<div class="btn_group_center">
                            <input type="hidden" id="paperId" name="paperId" value="${entity.id }" />
                            <input type="hidden" id="questionIds" name="questionIds" value="${questionIds }" onchange="validateQuestions()" >
			                <input type="hidden" name="idsStr" id="idsStr" value="" />
			                <input type="hidden" name="namesStr" id="namesStr" value="" />
			                
                            <button type="button" class="btn btn-warning" onclick="previewPaper()" id="previewBtn" >预览试卷</button>
                            <button type="submit" class="btn btn-success" >提交</button>
                            <span class="btn default" onclick="cancelInsert()">取消</span>
						</div>
                    <div id="preview_con">
                         <%-- <c:if test="${entity.generate_type eq 2 }">
                              <jsp:include page="/WEB-INF/jsp/base/admin/itest/testpaper/updateQuestionList.jsp"></jsp:include>
                         </c:if> --%>
                    </div>
                        </div>
					</form>
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
            				<span class="btn yellow" onclick="pageQuestion(1)" style="margin-top: 0px;"><i class="icon-search"></i>检索</span>
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
</body>
</html>
<content tag="pageCore"> 
<!-- 引用核心js包 -->
<script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
<script src="${basepath}/static/public/metronic.bootstrap/assets/scripts/app.js" type="text/javascript"></script>
<script src="${basepath }/static/public/javascripts/addtestpaper.js" type="text/javascript"></script>  
<script src="${basepath }/static/public/javascripts/itemchoicelist.js" type="text/javascript"></script>  
</content>
<content tag="pageInit">
 <!-- 初始化窗口 -->
</content>
