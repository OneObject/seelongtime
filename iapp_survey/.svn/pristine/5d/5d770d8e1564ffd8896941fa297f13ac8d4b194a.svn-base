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
<title>试题详情</title>
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
				<li><span>试题详情</span></li>
			</ul>
		</div>
	</div>
	<!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-md-12">
			<div class="portlet box purple">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>试题详情
					</div>
				</div>
				<div class="portlet-body form" style="overflow: hidden;">
					<form class="form-horizontal" role="form">
						<div class="form-body">
							<div class="form-group">
								<label class="col-md-4 control-label">题库名称</label>
								<div class="col-md-4">
									<span style="margin-top: 10px; display: block;">${itemblank.name }</span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label">试题难度</label>
                                <div class="col-md-4">
                                    <span style="margin-top: 10px; display: block;">
						                <c:if test="${im.difficulty eq '1' }">简单</c:if>
						                <c:if test="${im.difficulty eq '2' }">一般</c:if>
						                <c:if test="${im.difficulty eq '3' }">困难</c:if>
					                </span>
                                </div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label">试题分数</label>
								<div class="col-md-4">
									<span style="margin-top: 10px; display: block;">${im.score }</span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label">试题类型</label>
								<div class="col-md-4">
								    <span style="margin-top: 10px; display: block;">${typeStr }</span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label">试题名称</label>
								<div class="col-md-4">
									<textarea rows="" cols="" class="form-control" readonly="readonly" style="resize:none;">${im.title }</textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label">答案</label>
								<div class="col-md-4">
								
								<c:if test="${im.type eq '1' }">
                                     <div class="radio-list" id="judge" >
								         <label class="radio-inline">
									        <c:forEach var="option" items="${im.options }" varStatus="state">
							                     <input value="${option.no}" name="trueOrFalse" type="radio" <c:out value="${im.answer eq option.no?'checked=checked':''  }" /> onclick="return false;" disabled="disabled"/>${option.content }
									        </c:forEach>
								         </label>
							         </div>
							    </c:if>
        
							    <c:if test="${im.type eq '2' }">
								    <div id="q_content">  
									    <table id="qs_001" class="col-md-12">
									        <c:forEach var="option" items="${im.options }" varStatus="state">
									            <tr height="40">
                                                    <td></td>
								                    <c:if test="${im.answer eq option.no }">
								                        <td>
								                            <input type="radio" name="qs_answer" value="${option.no}" checked="checked" readonly="readonly" onclick="return false;" disabled="disabled"/><input type="hidden" value="${option.no}" name="qs_answerHid"/><%-- <input type="text" value="${option.content }"/> --%>
								                        </td>
								                        <td>
								                            <textarea class="form-control" name="option${option.no}" id="q_option" readonly="readonly" style="resize:none;">${option.content }</textarea>
								                        </td>
								                    </c:if>
								                    <c:if test="${im.answer != option.no }">
								                        <td>
								                            <input type="radio" name="qs_answer" value="${option.no}" readonly="readonly" onclick="return false;" disabled="disabled"/><input type="hidden" value="${option.no}" name="qs_answerHid"/><%-- <input type="text" value="${option.content }"/> --%>
								                        </td>
								                        <td>
								                            <textarea class="form-control" name="option${option.no}" id="q_option" readonly="readonly"  style="resize:none;" >${option.content }</textarea>
								                        </td>
								                    </c:if>
									            </tr>
									        </c:forEach>
									    </table>
								    </div>
							    </c:if>
    
							    <c:if test="${im.type eq '3' }">
								    <div id="q_content">  
									    <table id="qm_002" class="col-md-12">
									        <c:forEach var="option" items="${im.options }" varStatus="state">
									            <tr height="40">
									                <td></td>
									                    <c:if test="${fn:contains(im.answer, option.no)}">
									                        <td>
									                            <input type="checkbox" name="qm_answer" value="${option.no}" checked="checked" disabled="disabled"/><input type="hidden" value="${option.no}" name="qs_answerHid"/>
									                        </td>
									                        <td>
									                            <textarea class="form-control" name="option${option.no}" id="q_option"  readonly="readonly" style="resize:none;">${option.content }</textarea>
									                        </td>
									                    </c:if>
									                    <c:if test="${!fn:contains(im.answer, option.no)}">
									                        <td>
									                            <input type="checkbox" name="qm_answer" value="${option.no}" disabled="disabled"/><input type="hidden" value="${option.no}" name="qs_answerHid"/>
									                        </td>
									                        <td>
									                            <textarea class="form-control" name="option${option.no}" id="q_option"  readonly="readonly" style="resize:none;">${option.content }</textarea>
									                        </td>
									                    </c:if>
									            </tr>
									        </c:forEach>
								        </table>
								    </div>
							    </c:if>

							    <c:if test="${im.type eq '4' }">
							        <textarea class="form-control" name="ask_answer" id="ask_answer" style="height:100px;resize:none;" readonly="readonly">${im.answer }</textarea>
							    </c:if>
							    
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label">备注</label>
								<div class="col-md-4">
									<textarea rows="3" class="form-control" readonly="readonly" style="resize:none;">${im.mark }</textarea>
								</div>
							</div>
						</div>
						<div class="btn_group_center">
                             <button type="button" class="btn btn-warning" onclick="updateEntity('${im.id }')">修改</button>
                             <button type="button" class="btn btn-danger" onclick="deleteSingleInDetail('${im.id }')">删除</button>  
                             <button type="button" class="btn default" onclick="backToList();">返回</button> 
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
<script src="${basepath }/static/public/javascripts/testquestion.js"></script>  
</content>
<content tag="pageInit"> <!-- 初始化窗口 --> </content>
