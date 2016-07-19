<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet" type="text/css"
	href="${basepath}/static/css/active.css">
<link rel="stylesheet"
	href="${basepath}/static/public/easydialog-v2.0/easydialog.css">
<script
	src="${basepath}/static/public/easydialog-v2.0/easydialog.min.js"></script>
<link rel="stylesheet" media="screen"
	href="${basepath }/static/public/stylesheets/role.css">
<script type="text/javascript"
	src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
	<script src="${basepath }/static/public/javascripts/addacl.js" type="text/javascript"></script>

<table class="table table-striped table-bordered table-advance table-hover">
	<thead>
		<tr>
			<th style="width:85px;">题目类型</th>
			<th style="width:45px;">序号</th>
			<th class="hidden-xs">题目名称</th>
			<th style="min-width:256px;">操作</th>
		</tr>
	</thead>
	<tbody>
	<c:set var="no" value="1"></c:set>
	<c:forEach items="${list }" var="question" varStatus="vs">
		<tr data-id="${question.id}" id="q_${question.id}" data-weight="${question.weight }">
			<td class="highlight">
				<c:if test="${question.type==1 }">
					<div class="success"></div> <a href="#">单选题</a>
				</c:if>
				<c:if test="${question.type==2 }">
					<div class="info"></div> <a href="#">多选题</a>
				</c:if>
				<c:if test="${question.type==3 }">
				    <div class="info"></div> <a href="#">问答题</a>
				</c:if>
				<c:if test="${question.type==4 }">
					<div class="info"></div> <a href="#">打分题</a>
				</c:if>
				<c:if test="${question.type==5 }">
				    <div class="info"></div> <a href="#">段落说明</a>
				</c:if>
				<c:if test="${question.type==6 }">
				    <div class="info"></div> <a href="#">填空题</a>
				</c:if>
			</td>
			<td>
				<c:if test="${question.type != 5 }">
					${no }
					<c:set var="no" value="${no+1 }"></c:set>
				</c:if>
			</td>
			
			<td class="hidden-xs">${question.title }</td>
			<td>
				<a href="javascript:void(0);" onclick="updateVoteQuestion('${question.id}')" class="btn default btn-xs purple">
					<i class="fa fa-edit"></i> 编辑
				</a>&nbsp; 
				<a href="javascript:void(0);" onclick="deleteVoteQuestion('${question.id}')" class="btn default btn-xs black">
					<i class="fa fa-trash-o"></i>删除
				</a>
				&nbsp; &nbsp; 
				<a href="javascript:void(0);" <c:if test="${!vs.first}">onclick="doUp('${question.id}','${question.weight}')"</c:if> ><i class="fa fa-long-arrow-up"></i></a>
				&nbsp; 
				<a href="javascript:void(0);" <c:if test="${!vs.last}">onclick="doDown('${question.id}','${question.weight}')"</c:if> ><i class="fa fa-long-arrow-down"></i></a>
				<c:if test="${question.type == 1 || question.type == 2 || question.type == 4}">
					&nbsp;
					<a href="javascript:void(0);" onclick="toSetJumpto('${question.id}');" class="btn default btn-xs gray">
						<c:if test="${question.hasjump == 1 }">编辑逻辑跳转</c:if>
						<c:if test="${question.hasjump != 1 }">设置逻辑跳转</c:if>
					</a> 
				</c:if>
			</td>
		</tr>
	</c:forEach>	
	</tbody>
</table>

<!-- 选择用户弹出层 开始 -->
	<div id="add_member_dialog"
		style="display: none; width: 700px; height: 600px; overflow-x: hidden; overflow-y: auto;">
		<h4 class="easyDialog_title" id="easyDialogTitle">
			&nbsp;&nbsp;设置逻辑跳转 <a href="javascript:void(0)"
				onclick="easyDialog.close();" title="关闭窗口" class="close_btn"
				id="closeBtn">&times;&nbsp;&nbsp;</a>
		</h4>
		<div class="easyDialog_text">
			<!-- 表格 -->
			<div id="table_list2" style="overflow: auto; width: 100%;"></div>

			<div class="easyDialog_footer">
				<button class="btn default dialog-btn" onclick="easyDialog.close()">关闭</button>
				<button class="btn btn-success dialog-btn" onclick="setJumpto()">确定添加</button>
			</div>
		</div>
	</div>
<script>
function doUp(qid,weight){
	var upid = $('#q_'+qid).prev('tr').data('id'); //获取前面的id
	var upweight = $('#q_'+qid).prev('tr').data('weight'); //获取前面的id 的权重
	changeWeight(qid,weight,upid,upweight);
	
}
function doDown(qid,weight){
	
	var downid = $('#q_'+qid).next('tr').data('id'); //获取后面的id
	
	var downweight = $('#q_'+qid).next('tr').data('weight'); //获取前面的id 的权重
	
	changeWeight(downid,downweight,qid,weight);
}

function changeWeight(qid,weight,toqid,toweight){
	$.ajax({
		type: "POST",
		url:  basepath+"/mgr/vote/changeweight.xhtml",
		data: {"qid":qid,"weight":weight,"toqid":toqid,"toweight":toweight},
		//contentType: "application/json; charset=utf-8",
		success:function(data){
			$('#voteQuestionList').load(basepath+"/mgr/include/votequestionlist.xhtml?voteId="+voteId);
		}
		
	});
	
}

/**
 * 设置跳转
 */
function toSetJumpto(qid){
	getRelationInfo(qid);
	easyDialog.open({
		  container : 'add_member_dialog',
		  fixed : false
		});
}

/**
 * 加载跳转信息
 */
function getRelationInfo(qid){
	var divId = "table_list2";
	var data = {"id":qid};
	var url = basepath+"/mgr/vote/getrelationinfo.list";
	$("#"+divId).load(encodeURI(url), data, function(){
	});
}

var rflag = false;
function setJumpto(){
	var size = $(".optionRelations").length;
	var relations = "";
	for(var i=0;i<size;i++){
		var item = $(".optionRelations")[i];
		var optionId = $(item).attr("name");
		var relationQuestionId = $(item).val();
		relations += optionId+":"+relationQuestionId;
		if(i!=size-1){
			relations += ";";
		}
	}
	var rqid = $("#relationQuestionId").val();
	var voteId = $("#voteId").val();
	if(rflag){
		return;
	}
	rflag = true;
	$.ajax({
		type: "POST",
		url:  basepath+"/mgr/vote/setrelations.json",
		data: {"relations":relations,"questionId":rqid},
		async: false,
		//contentType: "application/json; charset=utf-8",
		success:function(data){
			easyDialog.close();
			rflag = false;
			$('#voteQuestionList').load(basepath+"/mgr/include/votequestionlist.xhtml?voteId="+voteId);
		},
		error: function(data){
			easyDialog.close();
			rflag = false;
			easyDialog.open({
		        container : {
		            header : '提示',
		            content : '<div style="background-color: #ffffff;width:260px;height:20px;text-align:center;">保存失败！</div>'
		        },
		        autoClose:1200
		    });
		}
	});
}

</script>
