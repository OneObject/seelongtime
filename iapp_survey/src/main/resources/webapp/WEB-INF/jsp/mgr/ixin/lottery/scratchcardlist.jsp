<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]>
<html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]>
<html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>抽奖管理</title>
<meta name="menu_path" content="ixin.menu_ggk" />
<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/ixin.css" type="text/css">
</head>
<body>

	<!-- 页面顶部-->
	<div class="row">
		<div class="col-md-12">
			<ul class="page-breadcrumb breadcrumb">
                  <li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                  <li><span href="javascript:void(0);">抽奖管理</span></li>
               </ul>
			<!-- END PAGE TITLE & BREADCRUMB-->
		</div>
	</div>
	<!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-lg-12">
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
						<i class="glyphicon glyphicon-gift"></i><span>抽奖列表</span>
					</div>
				</div>
				<div class="portlet-body main_bd box">
					<!--  =====================strart======================== -->
					<div class="row">
						<div class="btngroup">
							<a href="${basepath}/mgr/scratchcard/createscratchcard.xhtml"><span class = "btn btn-success">添加新的活动</span></a>
						</div>
					</div>
					<div class="table-responsive">
								<table class="table table-bordered table-hover">
								<thead>
								<tr>
									<th>
										活动名称
									</th>
									<th>
										开始时间
									</th>
									<th>
										结束时间
									</th>
									<th>
										活动状态
									</th>
									<th>
										操作
									</th>
								</tr>
								</thead>
								<tbody>
								<c:if test="${empty rewards }">
									<tr>
										<td colspan="5">还没有创建抽奖活动</td>
									</tr>
								</c:if>
								<c:forEach items="${rewards }" var="reward">
								<tr>
									<td>
										${reward.explain2.title }
									</td>
									<td>
										<d:formatDate currentTime="${reward.startDate }" format="yyyy-MM-dd HH:mm"/>
									</td>
									<td>
										<d:formatDate currentTime="${reward.endDate }" format="yyyy-MM-dd HH:mm"/>
									</td>
									<td>
									<c:if test="${reward.status == 0}">
										<span class="label label-sm label-warning">
											未开始
										</span>
									</c:if>
									<c:if test="${reward.status == 1}">
										<span class="label label-sm label-success">
											进行中
										</span>
									</c:if>
									<c:if test="${reward.status == 2}">
										<span class="label label-sm label-danger">
											已结束
										</span>
									</c:if>
									</td>
									<td>
									<c:if test="${reward.status != 2 }">
									<a href="javascript:void(0);" onclick="stopReward('${reward.id}')"><i class="glyphicon glyphicon-off"></i>&nbsp;终止活动</a>&nbsp;
									</c:if>
										
										<a href="${basepath}/mgr/scratchcard/recordindex.xhtml?id=${reward.id }" target="1"><i class="glyphicon glyphicon-eye-open"></i>&nbsp;查看详情</a>&nbsp;
									<!--  	<a href="#"><i class="glyphicon glyphicon-inbox"></i>&nbsp;指定获奖人</a>&nbsp;-->
										<a href="${basepath}/protal/activity/cardreward.xhtml?rewardId=${reward.id }&openId=longtai" target="1"><i class="glyphicon glyphicon-text-height"></i>&nbsp;测试</a>&nbsp;
										<a href="javascript:void(0);" onclick="delReward('${reward.id}')"><i class=""></i>&nbsp;删除</a>&nbsp;
									</td>
								</tr>
								</c:forEach>
								</tbody>
								</table>
							</div>
					<!--  =====================end========================= -->
				</div>
			</div>
		</div>

	</div>
</body>
</html>
<content tag="pageCore"> 
</content>
<content tag="pageInit"> <!-- 初始化窗口 --> 
<script type="text/javascript">
var m = "";
var btnFn = function(){
	$.ajax({
		type: "POST",
		url:  basepath+"/mgr/scratchcard/deletereward.xhtml",
		data: {"id":m},
		success:function(data){
			location = basepath + "/mgr/scratchcard/listscratchcard.xhtml";
			return true;
		},
		error: function(data){
			alert('删除失败');
		}
	});
	
};
function delReward(id){
	m = id;
	var html = '<div style="width:350px;height:70px;text-align:center;"><h3>您确定要删除该抽奖么？</h3></div>';
	easyDialog.open({
	    container : {
	    	header : 'ajy温馨提示',
	    	content : html,
	    	yesFn : btnFn,
	    	noFn : true
	    }
	});
}

var btnFn2 = function(){
	$.ajax({
		type: "POST",
		url:  basepath+"/mgr/scratchcard/stoprewardactive.xhtml",
		data: {"rewardId":m},
		success:function(data){
			location = basepath + "/mgr/scratchcard/listscratchcard.xhtml";
			return true;
		},
		error: function(data){
			alert('终止抽奖失败');
		}
	});
	
};
function stopReward(id){
	m = id;
	var html = '<div style="width:350px;height:70px;text-align:center;"><h3>您确定要终止该抽奖么？</h3></div>';
	easyDialog.open({
	    container : {
	    	header : 'ajy温馨提示',
	    	content : html,
	    	yesFn : btnFn2,
	    	noFn : true
	    }
	});
}
</script>
</content>

