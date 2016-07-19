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
<title>修改试题</title>
<meta name="menu_path" content="test.questionManage" />
<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.css" />
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/testmanage.css">
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i> <a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
				<li><a href="${basepath }/base/admin/itest/testquestion/testquestion.xhtml">试题管理</a><i class="icon-angle-right"></i></li>
				<li><span>修改试题</span></li>
			</ul>
		</div>
	</div>
	<!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-md-12">
			<div class="col-md-12 portlet box yellow">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>修改试题
					</div>
				</div>
				<div class="portlet-body form" style="overflow: hidden;">      
					<form id="updateForm"  class="form-horizontal" role="form" action="${basepath }/base/admin/itest/testquestion/doupdate.xhtml" >
						<div class="form-body">
							<div class="form-group">
								<label class="col-md-4 control-label">题库名称</label>
								<div class="col-md-4">
									<select name="itemId" id="itemId"
										class="form-control select2me">
										<c:forEach items="${itemblanks }" var="item" varStatus="st">
											<c:if test="${itemblank.id eq item.id }">
												<option value="${item.id }" selected="selected">${item.name
													}</option>
											</c:if>
											<c:if test="${itemblank.id != item.id }">
												<option value="${item.id }">${item.name }</option>
											</c:if>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label">试题难度</label>
								<div class="col-md-4">
									<select id="difficulty" name="difficulty"
										class="form-control select2me">
										<c:if test="${im.difficulty eq '1' }">
											<option value="1" selected="selected">简单</option>
											<option value="2">一般</option>
											<option value="3">困难</option>
										</c:if>

										<c:if test="${im.difficulty eq '2' }">
											<option value="1">简单</option>
											<option value="2" selected="selected">一般</option>
											<option value="3">困难</option>
										</c:if>

										<c:if test="${im.difficulty eq '3' }">
											<option value="1">简单</option>
											<option value="2">一般</option>
											<option value="3" selected="selected">困难</option>
										</c:if>
									</select>
								</div>
							</div>
							<div class="form-group" id="con_score">
								<label class="col-md-4 control-label">试题分数<span
									class="required">*</span></label>
								<div class="col-md-4">
									<input name="score" id="score" type="text"
										value="${im.score }" onchange="validateScore()"
										class="form-control">
								</div>
								<div class="col-md-4">
									<span id="tip_score" for="score" class="help-block"
										style="">请填写大于0的一位小数</span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label">试题类型</label>
								<div class="col-md-4">
									<select class="form-control select2me" id="type" name="type">
										<c:forEach items="${questionTypeMap }" var="type">
											<c:if test="${type.value eq im.type}">
												<option value="${type.value }" selected="selected">${type.key}</option>
											</c:if>
											<c:if test="${type.value != im.type}">
												<option value="${type.value }">${type.key}</option>
											</c:if>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group" id="con_title">
								<label class="col-md-4 control-label">试题名称<span
									class="required">*</span></label>
								<div class="col-md-4">
									<textarea name="title" id="title" onchange="validateTitle();"
										rows="" cols="" class="form-control">${im.title }</textarea>
								</div>
								<div class="col-md-4">
									<span id="tip_title" for="title" class="help-block"
										style="">不能为空</span>
								</div>
							</div>

							<div class="form-group" id="con_replaceAll">
                                <label class="col-md-4 control-label">答案<span class="required">*</span></label>
								<div id="replaceAll" class="col-md-8">
									<c:if test="${im.type eq '1' }">
                                        <div class="radio-list" id="judge" >
                                            <c:forEach var="option" items="${im.options }" varStatus="state">
	                                            <label class="radio-inline">
	                                                 <c:if test="${im.answer eq option.no }">
		                                                 <input value="${option.no}" name="trueOrFalse" type="radio" checked="checked" />${option.content }
	                                                 </c:if>
	                                                 <c:if test="${im.answer ne option.no }">
		                                                 <input value="${option.no}" name="trueOrFalse" type="radio" />${option.content }
	                                                 </c:if>
	                                            </label>
                                            </c:forEach>
                                        </div>
									</c:if>

									<c:if test="${im.type eq '2' }">
										<div id="q_content">
											<table id="qs_001" class="col-md-8">
							                    <tr><td colspan="3" style="text-align: right;"><a class="btn btn-success right" href="javascript:void(0);" onclick="addOPT();"><i class="icon-plus"></i>添加</a></td></tr>
												<c:forEach var="option" items="${im.options }" varStatus="state">
													<tr>
														<c:if test="${im.answer eq option.no }">
		                                                    <td height="30" style="line-height: 20px"><label class="radio-inline"><input type="radio" value="${option.no}" name="qs_answer" checked="checked"/></label><input type="hidden" value="${option.no}" name="qs_answerHid"/></td>
														</c:if>
														<c:if test="${im.answer != option.no }">
                                                            <td height="30" style="line-height: 20px"><label class="radio-inline"><input type="radio" value="${option.no}" name="qs_answer" /></label><input type="hidden" value="${option.no}" name="qs_answerHid"/></td>
														</c:if>
	                                                        <td><textarea class="form-control" style="height:60px;resize:none;" name="option${option.no}" id="qs_option${option.no}" >${option.content }</textarea></td>
	                                                        <td style="padding-left:15px;"><a class="btn yellow" href="javascript:void(0);" onclick="delOPT(this);"><i class="icon-remove"></i>删除</a></td>
													</tr>
												</c:forEach>
											</table>
										</div>
									</c:if>

									<c:if test="${im.type eq '3' }">
										<div id="q_content">
											<table class="col-md-8" id="qm_002">
												<tr>
													<td colspan="3" style="text-align: right;"><a class="btn btn-success right" href="javascript:void(0);" onclick="addOPT2();"><i class="icon-plus"></i>添加</a></td>
												</tr>
												<c:forEach var="option" items="${im.options }" varStatus="state">
													<tr>
														<c:if test="${fn:contains(im.answer, option.no)}">
									                        <td height="30" style="line-height: 30px" class=""><input type="checkbox" value="${option.no}" name="qm_answer" checked="checked" /><input type="hidden" value="${option.no}" name="qs_answerHid"/></td>
														</c:if>
														<c:if test="${!fn:contains(im.answer, option.no)}">
                                                             <td height="30" style="line-height: 30px" class=""><input type="checkbox" value="${option.no}" name="qm_answer"/><input type="hidden" value="${option.no}" name="qs_answerHid"/></td>
														</c:if>
                                                             <td><textarea class="form-control" style="height:60px;resize:none;" name="option${option.no}" id="qs_option${option.no}" >${option.content }</textarea></td>
                                                             <td style="padding-left:15px;"><a class="btn yellow" href="javascript:void(0);" onclick="delOPT(this);"><i class="icon-remove"></i>删除</a></td>
													</tr>
												</c:forEach>

											</table>
										</div>
									</c:if>

									<c:if test="${im.type eq '4' }">
                                        <div id="q_content">
                                            <table class="col-md-6" id="tf_003">
                                               <tr><td><textarea class="form-control" name="ask_answer" id="ask_answer" style="height:100px;">${im.answer }</textarea></td></tr>
                                            </table>
                                        </div>
									</c:if>
								</div>
								<!-- <div class="col-md-4">
									<span id="tip_replaceAll" for="replaceAll"
										class="help-block" style="">不能为空</span>
								</div> -->
							</div>
								<div class="form-group" id="con_mark">
								<label class="col-md-4 control-label">试题备注</label>
								<div class="col-md-4">
									<textarea name="mark" id="mark" rows="3" class="form-control" onchange="v_mark()">${im.mark }</textarea>
								</div>
                                  <div class="col-md-4">
                                    <span id="tip_mark" class="help-block"><span id="maxLength">255</span>字以内！</span>
                                  </div>
							</div>
						</div>
						<div class="btn_group_center">
                            <input type="hidden" id="id" name="id" value="${im.id }">
							<button type="submit" class="btn btn-warning">提交</button>
							<span class="btn default" onclick="cancelAdd()">取消</span>
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
<%-- 输入验证 --%>
<script src='${basepath }/static/public/javascripts/commonValidate.js' type='text/javascript'></script>
<script src="${basepath }/static/public/javascripts/addquestion.js"></script>
</content>
<content tag="pageInit">
 <!-- 初始化窗口 -->
<script type="text/javascript"> 
var examNum = "${examNum}";
var answerFlag= ${im.type} ;
$(function(){
    var $html;
   if(examNum != null && examNum != "" && examNum != "0"){
       mySureDialog("该试题已被"+examNum+"个发布后的考试引用，修改该试题可能影响这些考试，请慎重操作！");
   }

   $('#type').change(function(){
       var num = $(this).val();
       $html = init(num);
       $('#replaceAll').html($html);
       App.initUniform();
       //validateAnswer();
   });
}); 
</script> </content>
