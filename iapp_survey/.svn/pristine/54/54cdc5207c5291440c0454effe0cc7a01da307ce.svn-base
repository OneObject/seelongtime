<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<link rel="stylesheet" media="screen" href="${basepath}/static/ixin/css/ixin.css" type="text/css">
<div class="form-body">
	<input type="hidden" id="relationQuestionId" value="${question.id }">
	<input type="hidden" id="voteId" value="${question.voteId }">
	<c:forEach items="${question.options }" var="option" varStatus="index">
		<div class="form-group" id="con_minScore">
			<label>选项${index.count }、${option.title }</label>
			<select class="form-control optionRelations"  name="${option.id }" data-optionId="${option.id }">
				<option value="">--请选择--</option>
				<c:forEach items="${list }"	var="item">
					<option value="${item.id }" ${option.jumpto eq item.id ? 'selected="selected"' : '' }>${item.title }</option>
				</c:forEach>
			</select>
		</div>
	</c:forEach>
	
</div>
