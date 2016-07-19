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

<c:forEach var="answer" items="${rs.data }">

	<div class="answer-box ${answer.is_best_answer eq 1 ? 'checked':'' }" >
		<span class="image"  onclick="toUserDetail('${answer.author_id}');"> <c:choose>
				<c:when test="${answer.anonymous eq 0}">

					<img
						src="${basepath}/user/avatar/${answer.author_id}.xhtml?style=80x80&color=gray&r=${random}" />

				</c:when>

				<c:otherwise>

					<img src="${basepath}/static/m_h5/nask/img/niming.png" />

				</c:otherwise>

			</c:choose>
		
		</span>
		<c:if test="${answer.is_best_answer ne 1 and answer.status eq 1}">
		<label class="recommend"></label>
		</c:if>
		<label class="accepted"></label>
		<ul>
			<li class="line-people">
			<span class="grade">${answer.anonymous
					eq 0 ? answer.author_name :'匿名' }${not empty mapUserCreditLevelInfo[answer.id] ? ' | ':''  }<label>${not empty mapUserCreditLevelInfo[answer.id] ? mapUserCreditLevelInfo[answer.id]:''  }</label> 
			</span>
			<c:if test="${answer.askuserInfoVo.category eq 1}">
				  <span class="add-icon">
                        <span class="icon-zdr"></span>
                        <span class="text">指导人</span>
                   </span>
			</c:if>
			<c:if test="${answer.askuserInfoVo.category eq 0}">
				  <span class="add-icon">
                         <span class="icon-xs"></span>
                         <span class="text">学生</span>
                  </span>
			</c:if>
			<c:if test="${answer.askuserInfoVo.category eq 3}">
				  <span class="add-icon">
                        <span class="icon-dr"></span>
                        <span class="text">达人</span>
                  </span>
			</c:if>
			<c:if test="${answer.askuserInfoVo.authority eq 1}">
				  <span class="add-icon">
                        <span class="icon-rz"></span>
                        <span class="text">认证</span>
                  </span>
			</c:if>

			<span class="agree ${map[answer.id] eq 0 ? 'checked':'' }" data-type="3" onclick="zan(this,'${answer.id}');"><i class="fa ${map[answer.id] eq 0 ? 'fa-thumbs-up':'fa-thumbs-o-up' }"></i><label>${ajy:praiseTotal(answer.id,3)}</label></span>
			</li>
			
			<a href="${basepath }/m/ext/enn/ask/toanswer.xhtml?aid=${answer.id}&qid=${entity.id}">
			<li class="line-text">
			<c:choose>
				<c:when test="${answer.contenttype eq 1}">
					[图片]
				</c:when>
				<c:otherwise>
				<c:out value="${answer.content }"/>
				</c:otherwise>
			</c:choose>
			<c:if test="${answer.comment_num>0}">
			<i class="fa fa-angle-right add-arrow"></i>
			</c:if>
			</li>
			</a>
					
			<li class="line-time"><span class="ask-time">${ltfun:dateLongToStringFormat(answer.dateCreated,'yyyy-MM-dd HH:mm')}</span> 
				<c:if test="${entity.is_set_best_answer eq 0 and entity.author_id eq uid }">
					<span class="accept" onclick="accept('${answer.id}');">采纳</span>
				</c:if>
			</li>
		</ul>
	</div>

</c:forEach>



<script type="text/javascript">
	var answertotal = parseInt('${rs.pageable.totalPages}');
	var answercurrent = parseInt('${rs.pageable.pageNumber}');
</script>
