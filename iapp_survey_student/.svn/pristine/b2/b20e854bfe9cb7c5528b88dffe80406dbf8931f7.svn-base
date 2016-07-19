<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="org.apache.commons.lang.math.RandomUtils"%>
<%
String  random = String.valueOf(System.currentTimeMillis());
pageContext.setAttribute("random", random);
%>
<c:if test="${empty rs  or  rs.pageable.totalPages eq 0  }">
	<div class="no-data-img"></div>
</c:if>

<c:forEach var="item" items="${rs.data }">


<c:if test="${item.anonymous eq 0  or (item.anonymous eq 1 and  hiddenAnonymous!=true ) }">

	<ul class="block-ask-answer" >
		<li class="line-user" >
		
		
<span class="image"
<c:if test="${item.anonymous eq 0}">
 onclick="toUserDetail('${not empty item.invite_fromuid?item.invite_fromuid:item.author_id }');"
</c:if> 
 > 
		
<c:choose >
<c:when test="${ (item.invitemodel eq 'q_at' or item.invitemodel eq 'q_invite')  and not empty item.invite_fromuid }">
	<img src="${basepath}/user/avatar/${item.invite_fromuid}.xhtml?style=80x80&color=gray&r=${random}" />
</c:when>
<c:otherwise>		
		<c:choose>
			<c:when test="${item.anonymous eq 0}">
				<img src="${basepath}/user/avatar/${item.author_id}.xhtml?style=80x80&color=gray&r=${random}" />
			</c:when>
			<c:otherwise>
				<img src="${basepath}/static/m_h5/nask/img/nm.png" />
			</c:otherwise>
						
		</c:choose>
</c:otherwise>
</c:choose>
	
		
		</span> 
		<c:if test="${item.is_set_best_answer eq 1 }">
			<label class="status">已解决</label>
		</c:if>
		<label class="add-time">${ltfun:dateLongToStringFormat(item.dateCreated,'yyyy-MM-dd')}</label>
		<div>
		<c:choose >
		<c:when test="${ (item.invitemodel eq 'q_at' or item.invitemodel eq 'q_invite')  and not empty item.invite_fromuid }">
				<c:if test="${model eq 'meInvite'}">
				<label class="add-intro">你邀请了:</label>
				<span class="add-name">${item.invite_uname}</span>
				</c:if>
				<c:if test="${model ne 'meInvite'}">
				<label>${item.invite_fromuname}</label>&nbsp;${ item.invitemodel eq 'q_at'? '@了你:':'邀请你回答:' }
				</c:if>
			</div>
		</c:when>
		<c:otherwise>		
				<label>${item.anonymous eq 0 ? item.author_name :'匿名' }</label><span>${item.anonymous eq 0 ? item.askuserInfoVo.oname :''}</span> 
		</c:otherwise>
		</c:choose>
		
		</div>
		
		
		</li>
		<li class="line-question" onclick="todetail('${item.id}','${item.inviteid}');">
			<c:if test="${item.credit ne 0 }">
				<label class="coin">${item.credit }分</label>
			</c:if>
			${item.supplementNoHtml }
		</li>
		<c:if test="${item.is_set_best_answer eq 1 }">
			<li class="line-answer" onclick="todetail('${item.id}','${item.inviteid}');">
				<div class="answer-user">
					<label>${item.uname }</label>答：
				</div>
				<div class="answer">
					<c:choose>
				<c:when test="${item.answertype eq 1}">
					[图片]
				</c:when>
				<c:otherwise>
					<c:out value="${item.answer }"/>
				</c:otherwise>
			</c:choose>

				</div>
			</li>
		</c:if>
		<li class="line-tags">
		<c:if test="${not empty item.tags }">
			<label class="tags"></label> 
		</c:if>
		<span class="answer-num">${item.answer_num }人回答</span>
		<span class="add-view-num">${item.visitnum}次</span>
			<div>
			<c:forEach varStatus="v" items="${item.tags }" var="tag">
				<span onclick="toTagQuesetionList('${tag.id}')">${tag.name }</span> 
			</c:forEach>
			</div>
		</li>
	</ul>
	
</c:if>	
	
</c:forEach>


<c:if test="${model eq 'me' }">
	 <script type="text/javascript">
		var metotal = parseInt('${rs.pageable.totalPages}');
		var mecurrent = parseInt('${rs.pageable.pageNumber}');
	</script>
</c:if>

<c:if test="${model eq 'meAnswer' }">
	 <script type="text/javascript">
		var meAnswertotal = parseInt('${rs.pageable.totalPages}');
		var meAnswercurrent = parseInt('${rs.pageable.pageNumber}');
	</script>
</c:if>

 <script type="text/javascript">
	var total = parseInt('${rs.pageable.totalPages}');
	var current = parseInt('${rs.pageable.pageNumber}');
</script>
