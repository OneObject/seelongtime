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
<title>考试详情</title>
<meta name="menu_path" content="test.testManage" />
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/testmanage.css">
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i> <a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                <li><a href="${basepath }/base/admin/itest/examination/examination.xhtml">考试管理</a><i class="icon-angle-right"></i></li>
				<li><a href="${basepath }/base/admin/itest/examination/listtesteecon.xhtml?tid=${tid}">考试情况</a><i class="icon-angle-right"></i></li>
				<li><span href="#">考试详情</span></li>
			</ul>
		</div>
	</div>
	<!-- END PAGE HEADER-->
    <c:if test="${empty user }">
		<!-- 全局搜索组建开始 -->
		<div class="row">
			<div class="col-md-12">
				<!--search box-->
				<div class="col-md-12 search_box">
					<div class="col-md-12">
						<!--全局搜索框-->
						<div class="col-md-6 search_container">
	                        <div class="input-group">
	                            <input type="text" class="form-control" id="searchContent" name="searchContent" placeholder="输入用户名/真实姓名进行搜索"> <span
	                                class="input-group-btn" onclick="page(1)">
	                                <button class="btn btn-danger" type="button">
	                                    <i class="icon-search"></i>
	                                </button>
	                            </span>
	                        </div>
							<!-- /input-group -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 全局搜索组建结束-->
	    <!-- 条件选择开始 -->
	    <div class="row">
	        <div class="col-md-12">
	            <div class="search_condition">
	                <div class="row mt10">
	                    <div class="left_lable">
	                        <span class="condition_title">考试时间</span>
	                    </div>
	                    <div class="left_condition">
	                        <div class="col-md-4">
                                 <input type="text" id="startTime" name="startTime" value="${startTime }" 
                                  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm', maxDate:'#F{$dp.$D(\'endTime\')}'})" class="form-control Wdate"/>
	                        </div>
                            <div class="col-md-1">
	                           <span class="time_zhi">&nbsp;&nbsp;至&nbsp;&nbsp;</span>
	                        </div>
                            <div class="col-md-4">
                                 <input type="text" id="endTime" name="endTime" value="${endTime }" 
                                  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm', minDate:'#F{$dp.$D(\'startTime\')}'})" class="form-control Wdate"/>
	                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	    <!-- 条件选择结束 -->
    </c:if>
    <c:if test="${not empty user }">
            <input type="hidden" id="uid" name="uid" value="${user.id}" />
    </c:if>
	<input type="hidden" id="tid" name="tid" value="${tid }" >
	<div class="row">
		<div class="col-md-12">
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>考试详情
					<%-- 	<c:if test="${not empty user}" >
						      ：${user.username }
						</c:if> --%>
					</div>
				</div>
				<div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
					<div class="row">
					</div>
                    
                    <!-- 表格内容 -->
                    <div id="table_list" ></div>
					
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
<content tag="pageCore"> 
<script language="javascript" type="text/javascript" src="${basepath }/static/public/My97DatePicker/WdatePicker.js"></script>
</content>
<content tag="pageInit"> <!-- 初始化窗口 --> 
<script type="text/javascript">
$(function (){
    page(1);
});

/* 分页+搜索 */
function page(i, fieldId) {
    var divId = "table_list";
    
    var order = getOrder(divId, fieldId);
    var max = $("#"+divId+" #page_max").val()
    
    //AJAX提示
    loading(divId);
    var data = {"page":i, "max":max, "r":Math.random(), "searchContent":$("#searchContent").val(),
            "startTime":$("#startTime").val(), "endTime":$("#endTime").val(), "tid":$("#tid").val(), "uid":$("#uid").val(), 
            "orderField":order.orderField, "orderDirection":order.orderDirection };
    var url = basepath+"/base/admin/itest/examination/testeepaperlist.list";
    $("#"+divId).load(encodeURI(url), data, function(){
        App.initUniform();//加载复选框样式
    });
}
function deleterecord(tid,pid)
{
var r=confirm("确认删除该条记录吗？")
if (r==true)
  {
  window.location.href=basepath+"/base/admin/itest/examination/del_testeepaper.xhtml?tid="+tid+"&testee_paper_id="+pid;
  }
else
  {
 
  }
}
/* function page(i) {
    loading("table_list");
    var data = {"asdf":"adsf"};
    var url = basepath+"/base/admin/itest/examination/showtesteepaper.list";
    $("#table_list").load(encodeURI(url), data, function(){
    });
} */
</script>
</content>
