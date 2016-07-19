<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<%@ taglib prefix="myel" uri="http://www.longtimeit.com/taglib-elfunctions"%>
<!DOCTYPE HTML>

<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>调研统计</title>
<meta name="menu_path" content="active.menu_survey" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/testmanage.css">
<link href="${basepath}/static/ixin/css/Site.css" rel="stylesheet" type="text/css">
<link href="${basepath}/static/ixin/css/style.css" rel="stylesheet" type="text/css">
 <script type="text/javascript" src="${basepath }/static/public/Highcharts-3.0.6/js/highcharts.js"></script>
 

</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i> <a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                <li><a href="${basepath}/mgr/vote/voteStatistics.xhtml?voteid=${vo.id}">培训活动</a><i class="icon-angle-right"></i></li>
				<li><span >调研统计</span></li>
			</ul>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>${vo.title}
						<input type="hidden" name="id" id="id" value="${vo.id }" >
					</div>
				</div>
				<div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
					<div class="row">
					       <span class="btn btn-info table_add"  onclick="queryStudentInfo();">
                               <a href="${basepath }/mgr/vote/alluserinfo.xhtml?voteid=${vo.id}&type=1" target="_blank" style="color: white;"><i class="glyphicon glyphicon-link"></i>参与学员情况</a>
                           </span>
                           <%--
                           <span class="btn btn-success table_add"  onclick="exportSurveyDetail();">
                               <i class="glyphicon glyphicon-plus"></i>导出调研详情
                            </span>
                            --%>
                            <span class="btn btn-success table_add"  onclick="exportDetail();">
                               <i class="glyphicon glyphicon-plus"></i>导出调研明细
                            </span>
                            <span class="btn btn-success table_add"  onclick="exportSurveyResult();">
                               <i class="glyphicon glyphicon-plus"></i>导出调研结果
                            </span>
                      </div>
                      
                    <!-- 表格内容 -->
                    <div id="table_list" >
  <c:if test="${empty vo.questions}">
     <div>没有题目</div>
  </c:if>              
  <% int i=1; %>                
  <c:forEach var="question" items="${vo.questions}" varStatus="state">
  <div>
<c:if test="${question.type eq '1' || question.type eq '2' || question.type eq '4'}">
<!-- 单选 or 多选-->
<table class="table table-striped table-bordered table-hover table-full-width datatable yulan">
    <thead>
        <tr>
            <th class="num">
                <span><%=i%></span>
            </th>
            <th colspan="3">
                <span>
                    ${question.title }【<c:out value="${ question.type eq '1'?'单选':''}"/><c:out value="${ question.type eq '2'?'多选':''}"/><c:out value="${ question.type eq '4'?'打分':''}"/>】
                </span>
            </th>
        </tr>
     <c:forEach var="option" items="${question.options }" varStatus="optionsstate">
        <tr>
            <td width="3%"></td>
            <td width="10%"> 
             ${option.title}
             </td>
             <td width="80%">
             <div>
              <c:if test="${question.voteNum == 0 }">
           	<span class="progress-bar bar1" data-width="1" style="width: 1%;"></span>
               <span class="progress-num">
               	暂无人参与</span>
          	</c:if>
          	<c:if test="${question.voteNum !=0 }">
           	<span class="progress-bar bar1" data-width="${option.voteNum/question.voteNum * 100}" style="width: ${option.voteNum/question.voteNum * 100-5}%;"></span>
               <span class="progress-num">
              ${option.voteNum}</span>
          	</c:if>
          </div>
             </td>
        </tr>
     </c:forEach>
    </thead>
</table>
    <%i++; %>
</c:if>


<!-- 问答 -->
<c:if test="${question.type eq '3' }">
<table class="table table-striped table-bordered table-hover table-full-width datatable yulan" style="margin-top:10px;">
	<thead>
           <tr>
               <th class="num">
                   <span><%=i%></span>
            </th>
            <th colspan="2">
                <span>
                    ${question.title }【问答】
                 </span>
             </th>
         </tr>
         <c:if test="${empty actionlist}">
         <tr >
            <td colspan="3"> 暂无回答</td>
         
         </tr>
         </c:if>
           <c:forEach var="wenda" items="${actionlist}" varStatus="state" >
     <tr>
     <c:if test="${wenda.questionid eq question.id}">
	<td colspan="3">
	${wenda.optionid}
	</td>
			</c:if>
    </tr>

    </c:forEach>
	</thead>
</table>
<%i++; %>
</c:if>
</div>
</c:forEach>
                     
                    </div>
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
					  	 <a href="" class="btn btn-success table_add" id="exportUrl" style="width: 128px;margin-right: 100px; margin-top: 15px;" >
                              <i class="glyphicon glyphicon-plus"></i>下载
                         </a>
					</div>
				</div>
			</div>
		</div>
	
</body>
</html>
<content tag="pageCore"> 
<script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
<script type="text/javascript">
function exportSurveyDetail(){
	easyDialog.open({
		  container :'loading_img',
		  fixed : false,
		  overlay:true
	});
	$.ajax({
		type:"POST",
		url:basepath+"/mgr/vote/exportsurveydetail.json",
		data:{"voteid":$("#id").val()},
		success:function(data){
			if(data == "fail"){
				showMsgDialog("系统异常，请刷新后重新尝试。");
			}else if(data == "empty"){
				showMsgDialog("还没有人参与调研，请确认后再操作。");
			}else if(data == "illegal"){
				showMsgDialog("调研没有试题或已被删除，请确认后操作。");
			}else {
				$("#exportUrl").attr("href",basepath+"/"+data);
				$("#content").html("调研详情");
				easyDialog.open({
			    	container :"easyDialogWrapperww"
			    });
			}
		},
		error:function(data){
			showMsgDialog("系统异常，请刷新后重新尝试。");
		}
	});
}

function exportSurveyResult(){
	easyDialog.open({
		  container :'loading_img',
		  fixed : false,
		  overlay:true
	});
	$.ajax({
		type:"POST",
		url:basepath+"/mgr/vote/exportsurveyresult.json",
		data:{"voteid":$("#id").val()},
		success:function(data){
			if(data == "fail"){
				showMsgDialog("系统异常，请刷新后重新尝试。");
			}else if(data == "empty"){
				showMsgDialog("还没有人参与调研，请确认后再操作。");
			}else if(data == "illegal"){
				showMsgDialog("调研没有试题或已被删除，请确认后操作。");
			}else {
				$("#exportUrl").attr("href",basepath+"/"+data);
				$("#content").html("调研结果");
				easyDialog.open({
			    	container :"easyDialogWrapperww"
			    });
			}
		},
		error:function(data){
			showMsgDialog("系统异常，请刷新后重新尝试。");
		}
	});
}
function exportDetail(){
	easyDialog.open({
		  container :'loading_img',
		  fixed : false,
		  overlay:true
	});
	$.ajax({
		type:"POST",
		url:basepath+"/mgr/vote/exportdetail.json",
		data:{"voteid":$("#id").val()},
		success:function(data){
			if(data == "fail"){
				showMsgDialog("系统异常，请刷新后重新尝试。");
			}else if(data == "empty"){
				showMsgDialog("还没有人参与调研，请确认后再操作。");
			}else if(data == "illegal"){
				showMsgDialog("调研没有试题或已被删除，请确认后操作。");
			}else {
				$("#exportUrl").attr("href",basepath+"/"+data);
				$("#content").html("调研结果");
				easyDialog.open({
			    	container :"easyDialogWrapperww"
			    });
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

<!-- 引用核心js包 -->
</content>
<content tag="pageInit"> <!-- 初始化窗口 --> 
</content>
