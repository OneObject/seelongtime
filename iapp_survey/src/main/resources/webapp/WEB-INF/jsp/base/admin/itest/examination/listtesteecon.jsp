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
<title>考试情况</title>
<meta name="menu_path" content="test.testManage" />
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/testmanage.css">
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i> <a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
				<li><a href="${basepath }/base/admin/itest/examination/examination.xhtml">考试管理</a><i class="icon-angle-right"></i></li>
				<li><span href="#">考试情况</span></li>
			</ul>
		</div>
	</div>
	<!-- END PAGE HEADER-->
	<!-- 全局搜索组建开始 -->
	<div class="row">
		<div class="col-md-12">
			<!--search box-->
			<div class="col-md-12 search_box">
				<div class="col-md-12">
					<!--全局搜索框-->
					<div class="col-md-6 search_container">
						<div class="input-group">
                            <input type="hidden" id="tid" name="tid" value="${tid}" >
                            <input type="hidden" id="orderField" name="orderField" value="${orderField }" >
                            <input type="hidden" id="orderDirection" name="orderDirection" value="${orderDirection }" >
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
	<!-- 关于这场考试的报表 start -->
	<!-- <div class="row">
		<div class="col-md-12">
			<div class="note note-info">
				<table class="baobiao">
					<tr>
						<td class="bb_name">考试状态：</td>
						<td class="bb_canshu">考试中</td>
						<td>&nbsp;</td>
						<td class="bb_name">报名人数：</td>
						<td class="bb_canshu">35人</td>
						<td>&nbsp;</td>
						<td class="bb_name">参考人数：</td>
						<td class="bb_canshu">20</td>
					</tr>
					<tr>
						<td class="bb_name">总分：</td>
						<td class="bb_canshu">100分</td>
						<td>&nbsp;</td>
						<td class="bb_name">最高分数：</td>
						<td class="bb_canshu">85分</td>
						<td>&nbsp;</td>
						<td class="bb_name">合格分数：</td>
						<td class="bb_canshu">60</td>
					</tr>
					<tr>
						<td class="bb_name">通过人数：</td>
						<td class="bb_canshu">10人</td>
						<td>&nbsp;</td>
						<td class="bb_name">未通过人数：</td>
						<td class="bb_canshu">10人</td>
						<td>&nbsp;</td>
						<td class="bb_name">通过率：</td>
						<td class="bb_canshu">50%</td>
					</tr>
				</table>
			</div>
		</div>
	</div> -->
	<!-- 关于这场考试的报表 end -->
	<div class="row">
		<div class="col-md-12">
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>考试情况
					</div>
				</div>
				<div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
                    
                    <!-- 表格内容 -->
                    <div id="table_list" ></div>
					
				</div>
			</div>
		</div>
	</div>
	   <!-- 弹出下载界面 -->
		<div class="easyDialog_wrapper" id="easyDialogWrapperww">
			<div class="easyDialog_content">
				<h4 class="easyDialog_title" id="easyDialogTitle">
					<a href="javascript:void(0)" title="关闭窗口" class="close_btn"
						 onclick="easyDialog.close()">&times;</a><span id="content">下载</span>
				</h4>
				<div class="easyDialog_text" style="width:360px;height:120px;display:block;overflow-x:hidden;overflow-y:scroll;">
					<!-- Tab panes -->
					<div class="tab-content" id="errorMsg">
						<p style="margin-left: 88px">考试结果已导出，请下载</p>
					  	 <a href="" class="btn btn-success table_add" id="exportUrl" style="width: 128px;margin-right: 100px; margin-top: 15px;" onclick="easyDialog.close()" >
                              <i class="glyphicon glyphicon-plus"></i>点击下载
                         </a>
					</div>
				</div>
			</div>
		</div>
</body>
</html>
<content tag="pageCore"> 
<!-- 引用核心js包 -->
</content>
<content tag="pageInit"> <!-- 初始化窗口 --> 
<script src="${basepath}/static/public/easydialog-v2.0/easydialog.js"></script>
<script type="text/javascript">
$(function (){
    page(1);
});

/* 分页+搜索 */
function page(i, fieldId) {
    var divId = "table_list";
    
    var order = getOrder(divId, fieldId);
    var max = $("#"+divId+" #page_max").val()
    
    loading(divId);
    var data = {"page":i, "max":max, "r":Math.random(), "searchContent":$("#searchContent").val(),
            "tid":$("#tid").val(),
            "orderField":order.orderField, "orderDirection":order.orderDirection };
    var url = basepath+"/base/admin/itest/examination/listtestee.list";
    $("#"+divId).load(encodeURI(url), data, function(){
        App.initUniform();//加载复选框样式
    });
}

function exportExamResult(){
	easyDialog.open({
		  container :'loading_img',
		  fixed : false,
		  overlay:true
		});
	$.ajax({
		type:"POST",
		url:basepath+"/base/admin/itest/examination/exporteaxmtestee.json",
		data:{"tid":$("#tid").val()},
		success:function(data){
			if(data.flag)
			{	
				$("#exportUrl").attr("href",basepath+"/"+data.relativepath);
				$("#content").html("提示");
				easyDialog.open({
			    	container :"easyDialogWrapperww"
			    });
			}
			else
			{
				showMsgDialog(data.message);
			}	
		},
		error:function(data){
			showMsgDialog("系统异常，请刷新后重新尝试。");
		}
	});
}

function showMsgDialog(content){
	easyDialog.open({
        container : {
            header : '提示',
            content : '<div style="background-color: #ffffff;width:320px;height:60px;text-align:center;">'+content+'</div>'
        },
        autoClose:2000
    });
}


</script>
</content>
