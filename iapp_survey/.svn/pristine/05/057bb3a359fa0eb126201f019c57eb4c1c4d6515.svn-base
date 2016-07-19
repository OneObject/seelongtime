<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<!-- <h2 class="contentTitle">受影响考试列表</h2> -->
<div class="pageHeader"style="height: 50px;display:none;">
	<form id="pagerForm" onsubmit="return navTabSearch(this);" action="${basepath }/testquestion/freshlist.xhtml" method="post">
		<!-- 查询条件    pageNum 必须要写，设置为1 -->
		<input type="hidden" name="pageNum" value="1" />
		<input type="hidden" name="qid" value="1" />
	</form>
</div>

<div class="pageContent" style="height:90%;">
	<table class="table" width="100%">
		<thead>
			<tr>
				<th width="60"></th>
				<th>考试名称</th>
				<th>考试编号</th>
				<th>关键字</th>
				<th>考试状态</th>
				<th>考试开始时间</th>
				<th>考试结束时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody style="text-align: center;">
			<c:forEach items="${list }" var="entity" varStatus="st">
				<tr target="sid_user" rel="${entity.id }">
					<td>${st.index+1 }</td>
					<td style="text-align: left;" title="${entity.examName }">${entity.examName }</td>
					<td style="text-align: left;">${entity.examNo }</td>
					<td style="text-align: left;" title="${entity.keyword }">${entity.keyword }</td>
					<td style="text-align: left;">
						<c:forEach items="${examinationStatusMap }" var="status">
							<c:if test="${status.value eq entity.status}">${status.key }</c:if>
						</c:forEach>
					</td>
					<td style="text-align: left;">
						${ltfun:dateLongToStringFormat(entity.startTime,'yyyy-MM-dd HH:mm') }
					</td>
					<td style="text-align: left;">${ltfun:dateLongToStringFormat(entity.endTime,'yyyy-MM-dd HH:mm') }</td>
					<td style="text-align:left;">
						<c:if test="${entity.status eq '2' }">
							<a href="${basepath }/examination/refreshtestpaper.xhtml?id=${entity.id}" target="ajaxTodo" title="确定要刷新试卷吗?">刷新试卷</a>
						</c:if>
					</td>
				</tr>
			</c:forEach>	
		</tbody>
	</table>
</div>
<div class="formBar" id="btnSubmit">
	 	<ul>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul> 
	</div>