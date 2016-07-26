<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<%@ taglib prefix="myel" uri="http://www.longtimeit.com/taglib-elfunctions"%>
<!DOCTYPE HTML>

<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>调研统计</title>
<meta name="menu_path" content="active.menu_survey_activity" />
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
               <%--  <li><i class="icon-home"></i> <a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                 --%><li><a href="${basepath}/mgr/voteactivity/index.xhtml">调研活动</a><i class="icon-angle-right"></i></li>
				<li><span >调研统计</span></li>
			</ul>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>${entity.title}
						<input type="hidden" name="id" id="id" value="${entity.id }" >
					</div>
				</div>
				<div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
					<div class="row">
                            <span class="btn btn-success table_add"  onclick="exportDetail();">
                               <i class="glyphicon glyphicon-plus"></i>导出调研明细
                            </span>
                            <span class="btn btn-success table_add"  onclick="exportSurveyResult();">
                               <i class="glyphicon glyphicon-plus"></i>导出调研结果(EXCEL)
                            </span>
                            <span class="btn btn-success table_add" onclick="exportSurveyResultPDF();">
                               <i class="glyphicon glyphicon-plus"></i>导出调研结果(PDF)
                            </span>
                            <!-- <span class="btn btn-success table_add"  onclick="exportSurveyDetail();">
                               <i class="glyphicon glyphicon-plus"></i>导出调研明细（个人）
                            </span> -->
                      </div>
                      
                    <!-- 表格内容 -->
                    <div id="table_list" >
  <c:if test="${empty questions}">
     <div>没有题目</div>
  </c:if>              
  <% int i=1; %>                
  <c:forEach var="question" items="${questions}" varStatus="state">
  <div>
<c:if test="${question.type == 1 || question.type == 2 || question.type == 4}">
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
            <td width="30%"> 
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
              ${option.voteNum} (${myel:numFormat(voteoption.voteNum/question.voteNum * 100)}%)</span>
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
<c:if test="${question.type == 3 }">
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
         <c:if test="${empty question.askAnswers}">
         <tr >
            <td colspan="3"> 暂无回答</td>
         </tr>
         </c:if>
         <c:forEach var="answer" items="${question.askAnswers}" varStatus="state" >
		     <tr>
				<td colspan="3">
				${answer}
				</td>
		    </tr>
    		</c:forEach>
	</thead>
</table>
<%i++; %>
</c:if>

<!-- 填空 -->
<c:if test="${question.type == 6 }">
<table class="table table-striped table-bordered table-hover table-full-width datatable yulan" style="margin-top:10px;">
	<thead>
		 <c:forEach var="option" items="${question.options }" varStatus="optionsstate">
		 	<c:if test="${optionsstate.index == 0 }">
           	<tr>
            <th class="num" rowspan="${fn:length(question.options)+1}"  style=" vertical-align:middle;">
                   <span><%=i%></span>
            </th>
            <th colspan="2">
                <span>
                    【填空题】
                 </span>
             </th>
         	</tr>
         	</c:if>
         	<tr>
            <th colspan="2">
                <span>
                    ${option.title }<input style="border:0px;border-bottom: 1px solid #7f9db9;width:50px;"/>
                 </span>
             </th>
         	</tr>
         </c:forEach>
         <c:if test="${empty question.fillInAnswers}">
         <tr >
            <td colspan="3"> 暂无回答</td>
         </tr>
         </c:if>
         <c:forEach var="fillInAnswers" items="${question.fillInAnswers}" varStatus="state" >
		     <tr>
				<td colspan="3">
				<c:forEach var="answer" items="${fillInAnswers}">
					<span style="text-decoration: underline;">${answer }</span>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</c:forEach>
				</td>
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
					  	 <a href="" class="btn btn-success table_add" id="exportUrl" style="width: 128px;margin-right: 100px; margin-top: 15px;" download >
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
		url:basepath+"/mgr/voteactivity/exportsurveydetail.json",
		data:{"id":$("#id").val()},
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
		url:basepath+"/mgr/voteactivity/exportsurveyresult.json",
		data:{"id":$("#id").val()},
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
function exportSurveyResultPDF(){
	easyDialog.open({
		  container :'loading_img',
		  fixed : false,
		  overlay:true
	});
	$.ajax({
		type:"POST",
		url:basepath+"/mgr/voteactivity/exportsurveyresult.json",
		data:{"id":$("#id").val(), "pdf":"true"},
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
		url:basepath+"/mgr/voteactivity/exportdetail.json",
		data:{"id":$("#id").val()},
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
