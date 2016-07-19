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
<title>添加试题</title>
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
				<li><span>添加试题</span></li>
			</ul>
		</div>
	</div>
	<!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-md-12">
			<div class="portlet box green">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>添加试题
					</div>
				</div>
				<div class="portlet-body form" style="overflow: hidden;">
					<form id="addForm" class="form-horizontal" role="form" action="${basepath }/base/admin/itest/testquestion/doadd.xhtml">
						<div class="form-body">
							<div class="form-group" id="con_itemId">
								<label class="col-md-4 control-label">题库名称<span class="required">*</span></label>
								<div class="col-md-4">
					                <select name="itemId" id="itemId" class="form-control select2me" >
					                    <c:forEach items="${itemblanks }" var="item" varStatus="st">
					                        <c:if test="${itemId eq item.id }">
					                            <option value="${item.id }" selected="selected">${item.name }</option>
					                        </c:if>
					                        <c:if test="${itemId != item.id }">
					                            <option value="${item.id }">${item.name }</option>
					                        </c:if>
					                    </c:forEach>
					                </select>
								</div>
								<div class="col-md-4">
                                    <span id="tip_title" for="title" class="help-block" style="">不能为空</span>
                                  </div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label">试题难度</label>
								<div class="col-md-4">
					                <select id="difficulty" name="difficulty" class="form-control select2me" >
					                    <option value="1">简单</option>
					                    <option value="2" selected="selected">一般</option>
					                    <option value="3">困难</option>
					                </select>
								</div>
							</div>
							<div class="form-group" id="con_score">
								<label class="col-md-4 control-label">试题分数<span class="required">*</span></label>
								<div class="col-md-4">
									<input name="score" id="score" type="text" onchange="validateScore()" class="form-control">
								</div>
	                              <div class="col-md-4">
	                                <span id="tip_score" for="score" class="help-block" style="">大于0，一位小数</span>
	                              </div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label">试题类型</label>
								<div class="col-md-4">
									<select class="form-control select2me" id="type" name="type">
									   <c:forEach var="item" items="${questionTypeMap }">
											<option value="${item.value }">${item.key }</option>
									   </c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group" id="con_title">
								<label class="col-md-4 control-label">试题名称<span class="required">*</span></label>
								<div class="col-md-4">
									<textarea name="title" id="title" onchange="validateTitle();" rows="" cols="" class="form-control"></textarea>
								</div>
                                  <div class="col-md-4">
                                    <span id="tip_title" for="title" class="help-block" style="">不能为空</span>
                                  </div>
							</div>
							<div class="form-group" id="con_replaceAll">
                                <label class="col-md-4 control-label">答案<span class="required">*</span></label>
								<div class="col-md-8">
									<div id="replaceAll" class="">
									</div>
								</div>
								<!-- <div class="col-md-4">
                                    <span id="tip_replaceAll" for="replaceAll" class="help-block" style="">不能为空</span>
                                  </div> -->
							</div>
							<div class="form-group" id="con_mark">
								<label class="col-md-4 control-label">试题备注</label>
								<div class="col-md-4">
									<textarea name="mark" id="mark" rows="3" class="form-control" onchange="v_mark()"></textarea>
								</div>
                                  <div class="col-md-4">
                                    <span id="tip_mark" class="help-block"><span id="maxLength">255</span>字以内！</span>
                                  </div>
							</div>
						</div>
						<div class="btn_group_center">
							<!-- <button type="button" onclick="validateAdd()" class="btn btn-success" >提交</button> -->
							<button type="submit" class="btn btn-success" >提交</button>
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
     <script src='${basepath }/static/public/javascripts/commonValidate.js' type='text/javascript' ></script>
<script src="${basepath }/static/public/javascripts/addquestion.js"></script>  
</content>
<content tag="pageInit"> <!-- 初始化窗口 -->
<script type="text/javascript">
var answerFlag= 0;
$(function(){
    var $html = init(1);
    
    $('#replaceAll').html($html);
    App.initUniform();
    
    $('#type').change(function(){
        var num = $(this).val();
        $html = init(num);
        $('#replaceAll').html($html);
        App.initUniform();
    });
});
</script>
 </content>
