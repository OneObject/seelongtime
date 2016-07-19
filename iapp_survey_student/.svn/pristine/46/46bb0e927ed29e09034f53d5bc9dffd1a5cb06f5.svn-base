<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="org.apache.commons.lang.math.RandomUtils"%>

<c:if test="${rs.pageable.totalPages eq 0 and empty groupNotices}">
	<div class="no-data-img"></div>
</c:if>
<c:if test="${status eq '1' }">
<c:forEach var="item" items="${rs.data }">
	    		 <a href="javascript:todetail('${item.id}');">
                    <ul>
                        <li>${item.supplementNoHtml }</li>
                        <li>${ltfun:dateLongToStringFormat(item.last_answer_time,'yyyy-MM-dd HH:mm')}
                        <span>回答${item.answer_num}</span>
                        </li>
                    </ul>
                </a>
</c:forEach>
<script type="text/javascript">
	var total = parseInt('${rs.pageable.totalPages}');
	var current = parseInt('${rs.pageable.pageNumber}');
</script>
</c:if>


<c:if test="${status eq '2' }">
<c:forEach var="item" items="${rs.data }">
  		    <a href="javascript:todetail('${item.id}','${item.inviteid}');">
                    <ul class="block-ask-answer">
                        <li class="line-user">
                            <span class="image">
                            <c:choose>
	                            <c:when test="${item.anonymous eq '1' }">
	                            <img src="${basepath}/static/m_h5/nask/img/nm.png" />
	                            </c:when><c:otherwise>
	                            <img src="${basepath}/user/avatar/${item.author_id}.xhtml?style=80x80&color=gray" />
	                            </c:otherwise>
                            </c:choose>
                            </span>
                            <c:if test="${item.is_set_best_answer eq 1 }">
                            	<label class="status">已解决</label>
                            </c:if>
                            <c:if test="${item.invitemodel eq 'q_invite' }">
                            	<label class="invite-at">邀请</label>
                            </c:if>
                            <c:if test="${item.invitemodel eq 'q_at' }">
                            	<label class="invite-at">@我</label>
                            </c:if>
                            <div>
                                <label>${item.anonymous eq '1' ?  '匿名' : item.author_name }</label>问：
                            </div>
                        </li>
                        <li class="line-question" onclick="todetail('${item.id}','${item.inviteid}');">
                            <a href="javascript:void(0);">
                            	<c:if test="${item.credit ne 0 }">
									<label class="coin">${item.credit }分</label>
								</c:if>
									${item.supplementNoHtml }
                            </a>
                        </li>
                       	<c:if test="${item.is_set_best_answer eq 1 }">
							<li class="line-answer" onclick="todetail('${item.id}','${item.inviteid}');">
								 <a href="javascript:void(0);">
								<div class="answer-user">
									<label>${item.uname }</label>答：
								</div>
								<div class="answer">
								<c:choose>
								<c:when test="${item.answertype eq 1}">
										[图片]
								</c:when>
								<c:otherwise>
									${item.answer }
								</c:otherwise>
								</c:choose>
								</div>
								</a>
							</li>
						</c:if>
						<li class="line-tags">
							<c:if test="${not empty item.tags }">
								<label class="tags"></label> 
							</c:if>
							<span class="answer-num">${item.answer_num }人回答</span>
							<div>
								<c:forEach varStatus="v" items="${item.tags }" var="tag">
										<span>${tag.name }</span> 
								</c:forEach>
							</div>
						</li>
                    </ul>
                </a>
</c:forEach>
<script type="text/javascript">
	var invitetotal = parseInt('${rs.pageable.totalPages}');
	var invitecurrent = parseInt('${rs.pageable.pageNumber}');
</script>
</c:if>

<c:if test="${status eq '3' }">

<c:forEach var="groupNotice" items="${groupNotices }">
	<a href="javascript:readNotice('${groupNotice.id}');">
                    <div class="block-group">
                        <div class="img-box one">
                        <c:if test="${not empty groupNotice.cover}">
                            <img src="${basepath}/user/avatar/${groupNotice.id}.xhtml?style=80x80&color=gray" />
						</c:if>
						<c:if test="${ empty groupNotice.cover}">
                            <img src="${basepath}/static/m/ext/enn/img/default_group.png" />
						</c:if>	
                        </div>
                        <ul>
                            <li>${groupNotice.ext }</li>
                            <li><c:out value="${groupNotice.title }"/></li>
                            <li>${ltfun:dateLongToStringFormat(groupNotice.timestamp,'yyyy-MM-dd HH:mm')}</li>
                        </ul>
                    </div>
     </a>


</c:forEach>


<c:forEach var="item" items="${rs.data }">
	<c:if test="${item.model eq 'q_accept' }">
	<a href="javascript:readNotice('${item.id}');">
	    <ul class="no-image">
	        <li>您的解答已被${item.from_name}采纳</li>
	        <li>${ltfun:dateLongToStringFormat(item.timestamp,'yyyy-MM-dd HH:mm')}</li>
	        <li><span>${item.title}</span></li>
	        <li>查看详情 <label class="arrow"></label></li>
	    </ul>
	</a>
	</c:if>
	
	<%--
	<c:if test="${item.model eq 'q_accept_invite' }">
	<a href="javascript:readNotice('${item.id}');">
	    <ul class="has-image">
	        <li><span class="image"><img src="img/tx/tx1.jpg" /> </span>你的回答被采纳</li>
	        <li>${ltfun:dateLongToStringFormat(item.timestamp,'yyyy-MM-dd HH:mm')}</li>
	        <li>${item.title }</li>
	        <li>查看详情 <label class="arrow"></label></li>
	    </ul>
	</a>
	</c:if>
	--%>
	
	<c:if test="${item.model eq 'q_accept_invite' }">
	<a href="javascript:readNotice('${item.id}');">
	    <ul class="no-image">
	        <li>${ item.from_name} 邀请你采纳他的答案</li>
	        <li>${ltfun:dateLongToStringFormat(item.timestamp,'yyyy-MM-dd HH:mm')}</li>
	        <li>${item.title}</li>
	        <li>查看详情 <label class="arrow"></label></li>
	    </ul>
	</a>
	</c:if>
	
	<c:if test="${item.model eq 'q_answer_comment_answor' }">
	<a href="javascript:readNotice('${item.id}');">
	    <ul class="no-image">
	        <li>您的回答被提问者回复了</li>
	        <li>${ltfun:dateLongToStringFormat(item.timestamp,'yyyy-MM-dd HH:mm')}</li>
	        <li><span>${item.title}</span></li>
	        <li>查看详情 <label class="arrow"></label></li>
	    </ul>
	</a>
	</c:if>
	
	<c:if test="${item.model eq 'q_accept_invtie_from' }">
	<a href="javascript:readNotice('${item.id}');">
	    <ul class="no-image">
	        <li>您邀请${item.from_name}进行的解答已被采纳</li>
	        <li>${ltfun:dateLongToStringFormat(item.timestamp,'yyyy-MM-dd HH:mm')}</li>
	        <li><span>${item.title}</span></li>
	        <li>查看详情 <label class="arrow"></label></li>
	    </ul>
	</a>
	</c:if>
	
	
	<c:if test="${item.model eq 'coach_practice' }"><%--提交了实习记录 to 指导人 --%>
	<a href="javascript:readNotice('${item.id}');">
	    <ul class="no-image">
	        <li>您的学生 ${item.from_name} 提交了实习记录，速去查阅</li>
	    </ul>
	</a>
	</c:if>
	
	<c:if test="${item.model eq 'coach_record' }"><%--辅导 to 学员 --%>
	<a href="javascript:readNotice('${item.id}');">
	    <ul class="no-image">
	        <li>指导人 ${ item.from_name} 提交了辅导记录，速去查看</li>
	    </ul>
	</a>
	</c:if>
	
	<c:if test="${item.model eq 'coach_practice_recode' }"><%--实习记录反馈  to 学员--%>
	<a href="javascript:readNotice('${item.id}');">
	    <ul class="no-image">
	        <li>指导人 ${ item.from_name} 对你的实习记录进行了反馈，速去查看</li>
	    </ul>
	</a>
	</c:if>
	
	<c:if test="${item.model eq 'coach_teacher_user_survey' }"><%--指导人到学员评估 to学员--%>
	<a href="javascript:readNotice('${item.id}');">
	    <ul class="no-image">
	        <li>指导人 ${ item.from_name} 对你进行了评估，速去查看</li>
	    </ul>
	</a>
	</c:if>
	
	<c:if test="${item.model eq 'sns_chat_persion' }"><%--私聊--%>
	<a href="javascript:readNotice('${item.id}');">
                    <div class="block-group">
                        <div class="img-box one">
                            <img src="${basepath}/user/avatar/${item.from_id}.xhtml?style=80x80&color=gray" />
                        </div>
                        <ul>
                            <li>${item.from_name }</li>
                            <li><c:out value="${item.title }"/></li>
                            <li>${ltfun:dateLongToStringFormat(item.timestamp,'yyyy-MM-dd HH:mm')}</li>
                        </ul>
                    </div>
     </a>
	</c:if>
	
	<c:if test="${item.model eq 'coach_plan' }"><%--指导人提交辅导计划--%>
	<a href="javascript:readNotice('${item.id}');">
	    <ul class="no-image">
	        <li>指导人 ${ item.from_name} 更新了辅导计划，速去查看</li>
	    </ul>
	</a>
	</c:if>
	
	<c:if test="${item.model eq 'findPWD' }"><%--帮助密码找回--%>
	 <a href="javascript:void(0);">
                    <ul class="ensure-code" id="${item.id}">
                        <li><span class="image"><img src="${basepath}/user/avatar/${item.from_id}.xhtml?style=80x80&color=gray" /> </span>${ item.from_name}</li>
                        <li>好友${ item.from_name}请您帮他找回密码，请输入他提供的确认码帮他确认身份。</li>
                        <li>请确认是好友本人操作，以免发生信息泄露，或恶意盗取账号。</li>
                        <li>确认码:<input type="text" id="code" ></li>
                        <li>
                            <div onclick='agreefindpwd("${item.rid}","${item.id}");'>
                                确认身份
                            </div>
                        </li>
                    </ul>
                </a>
</c:if>
	
</c:forEach>
<script type="text/javascript">
	var messagetotal = parseInt('${rs.pageable.totalPages}');
	var messagecurrent = parseInt('${rs.pageable.pageNumber}');
	
</script>
</c:if>