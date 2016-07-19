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
<title>试卷详情</title>
<meta name="menu_path" content="test.paperManage" />
<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.css" />
<link rel="stylesheet" media="screen" href="${basepath }/static/public/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/testmanage.css">
</head>
<body>
    <div class="row">
        <div class="col-md-12">
            <ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i> <a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                <li><a href="${basepath }/base/admin/itest/testpaper/testpaper.xhtml">试卷管理</a><i class="icon-angle-right"></i></li>
                <li><span>试卷详情</span></li>
            </ul>
        </div>
    </div>
    <!-- END PAGE HEADER-->
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box purple">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="icon-globe"></i>试卷详情
                    </div>
                </div>
                <div class="portlet-body form" style="overflow: hidden;">
                    <form id="addForm" onsubmit="return validateAdd()" class="form-horizontal" role="form" action="${basepath }/base/admin/itest/testpaper/doupdate.xhtml">
                        <div class="form-body">
                            <div class="form-group" id="con_name">
                                <label class="col-md-4 control-label">试卷名称<span class="required">*</span></label>
                                <div class="col-md-4">
                                    <span style="margin-top: 10px; display: block;">${entity.name}</span>
                                </div>
                                  <div class="col-md-4">
                                    <span id="tip_name" for="name" class="help-block hidden" style="">不能为空</span>
                                  </div>
                            </div>
                            <div class="form-group" id="con_difficulty_level">
                                <label class="col-md-4 control-label">试卷难易程度</label>
                                <div class="col-md-4">
                                    <span style="margin-top: 10px; display: block;">
                                    <c:if test="${entity.difficulty_level eq '1' }">
                                        <span>简单</span>
                                    </c:if>
                                    <c:if test="${entity.difficulty_level eq '2' }">
                                        <span>一般</span>
                                    </c:if>
                                    <c:if test="${entity.difficulty_level eq '3' }">
                                        <span>困难</span>
                                    </c:if>
                                    </span>
                                </div>
                            </div>
                            <div class="form-group" id="con_total_score">
                                <label class="col-md-4 control-label">试卷总分<span class="required">*</span></label>
                                <div class="col-md-4">
                                    <span style="margin-top: 10px; display: block;">${entity.total_score }</span>
                                </div>
                                  <div class="col-md-4">
                                    <span id="tip_total_score" for="total_score" class="help-block hidden" style="">请输入正整数</span>
                                  </div>
                            </div>
                            <div class="form-group" id="con_pass_mark">
                                <label class="col-md-4 control-label">及格分数<span class="required">*</span></label>
                                <div class="col-md-4">
                                    <span style="margin-top: 10px; display: block;">${entity.pass_mark}</span>
                                </div>
                                  <div class="col-md-4">
                                    <span id="tip_pass_mark" for="pass_mark" class="help-block hidden" style="">请输入正整数</span>
                                  </div>
                                  <div class="col-md-4">
                                    <span id="tip2_pass_mark" for="pass_mark" class="help-block hidden" style="">及格分不能大于总分</span>
                                  </div>
                            </div>
                            <div class="form-group" id="con_descript">
                                <label class="col-md-4 control-label">试卷描述</label>
                                <div class="col-md-4">
                                    <textarea rows="" cols="" class="form-control" readonly="readonly">${entity.descript}</textarea>
                                </div>
                                  <div class="col-md-4">
                                    <span id="tip_descript" for="descript" class="help-block hidden" style="">不能为空</span>
                                  </div>
                            </div>
                        
                        <div class="btn_group_center">
                             <button type="button" class="btn btn-warning" onclick="updateEntity('${entity.id }')">修改</button>
                             <button type="button" class="btn btn-danger" onclick="deleteSingleInDetail('${entity.id }')">删除</button>  
                             <button type="button" class="btn default" onclick="backToList();">返回</button> 
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
<script type="text/javascript" src="${basepath }/static/public/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${basepath }/static/public/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script src="${basepath}/static/public/metronic.bootstrap/assets/scripts/app.js" type="text/javascript"></script>
<script src="${basepath }/static/public/javascripts/testpaper.js" type="text/javascript"></script>  
</content>
<content tag="pageInit">
 <!-- 初始化窗口 -->
 <script type="text/javascript">
      $(document).ready(function() {
         $('#datetimepicker_start').datetimepicker({language: 'zh-CN',pickerPosition:'bottom-right',autoclose:true,minView:2});
         $('#datetimepicker_end').datetimepicker({language: 'zh-CN',pickerPosition:'bottom-right',autoclose:true,minView:2});
      });
</script>
</content>
