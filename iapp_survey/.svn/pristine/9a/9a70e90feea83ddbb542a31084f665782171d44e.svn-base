<%@page contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="com.longtime.common.utils.Page" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
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
			创建人
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
			${reward.creatorName }
		</td>
		<td>
		<ltacl:datactl creatoruid="${reward.creator }">
		<c:if test="${reward.status != 2 }">
		<a href="javascript:void(0);" onclick="stopReward('${reward.id}')"><i class="glyphicon glyphicon-off"></i>&nbsp;终止活动</a>&nbsp;
		</c:if>
		<!--  	<a href="#"><i class="glyphicon glyphicon-inbox"></i>&nbsp;指定获奖人</a>&nbsp;-->
			<!--<a href="${basepath}/protal/activity/cardreward.xhtml?rewardId=${reward.id }&openId=longtai" target="1"><i class="glyphicon glyphicon-text-height"></i>&nbsp;测试</a>&nbsp;-->
			<a href="${basepath}/mgr/scratchcard/modifyrewardpage.xhtml?id=${reward.id }"><i class=""></i>&nbsp;修改</a>&nbsp;
			<a href="javascript:void(0);" onclick="delReward('${reward.id}')"><i class=""></i>&nbsp;删除</a>&nbsp;
		</ltacl:datactl>
			
			<a href="${basepath}/mgr/scratchcard/recordindex.xhtml?id=${reward.id }" target="1"><i class="glyphicon glyphicon-eye-open"></i>&nbsp;中奖名单</a>&nbsp;
		</td>
	</tr>
	</c:forEach>
	</tbody>
	</table>
<jsp:include page="/WEB-INF/jsp/mgr/ixin/include/pager.jsp" />
