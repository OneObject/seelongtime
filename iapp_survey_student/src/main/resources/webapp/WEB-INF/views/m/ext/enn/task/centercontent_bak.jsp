<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>

 <section class="wrapper-static margin-top-50" id="wrapper-static">
            <div class="task-center-header">
                <div class="image">
                    <img src="${basepath}/user/avatar/${user.id}.xhtml?style=80x80&color=gray" />
                </div>
                <ul>
                    <li>${user.name }</li>
                    <li>
                        <span class="grade">
                            ${userlevel.creditLevel.name }
                        </span>
                        <div class="box">
                            <div class="progress" id="progress-box">
                                <div class="percent" data-percent="${userlevel.percent gt 5 ? userlevel.percent : 5 }"></div>
                                <label>${userlevel.experience}/${userlevel.creditLevel.end}</label>
                            </div>
                        </div>
						<span class="why-link" onclick="window.location.href = '${basepath}/m/study/detail/8a2bb3814e7c19bb014e81630a960463.xhtml?fdomain=ennapp';">?</span>
                    </li>
                </ul>
            </div>
            <div class="task-center-content">
            
            <c:if test="${!isCoach && !isSuperMan }">
            <!-- three_ask_a_week -->
                <dl class="task-center-list">
                    <dt >每周任务</dt>
                    <dd>
                        <div class="line-header closed">
                            <span class="check lighter"><i class="icon-img icon-img-yldr"></i></span>
                            <span class="arrow"><i class="fa fa-angle-down"></i></span>
                            <span class="info">
                            <c:choose>
                            	<c:when test="${not empty map['three_ask_a_week']}">
                            		<c:if test="${map['three_ask_a_week'].finish == 1 }">
                            		<%--
                            			<c:if test="${map['three_ask_a_week'].isget == 1 }">已领取</c:if>
                            			<c:if test="${map['three_ask_a_week'].isget == 0 }"><span class="get" data-id="${map['three_ask_a_week'].recordid}">领取</span></c:if>
                            			
                            			 --%>
                            			 已达成
                            		</c:if>
                            		<c:if test="${map['three_ask_a_week'].finish == 0 }">
                            			${map['three_ask_a_week'].complatenum }/${map['three_ask_a_week'].num }
                            		</c:if>
                            		
                            	</c:when>
                            	<c:otherwise>
                            		0/${map['three_ask_a_week'].num }
                            	</c:otherwise>
                            </c:choose>
                           </span>
                            <div class="title">每周三问</div>
                        </div>
                        <div class="line-content" style="display: none;">
                            <label class="arrow"></label>
                            <ul class="task-intro">
                                <li>每周回答3个问题完成任务</li>
                            </ul>
                            <!--<div class="reward-image"></div>-->
                            <div class="task-info"></div>
                            <c:if test="${empty map['three_ask_a_week'] or map['three_ask_a_week'].finish == 0 }">
                            	<div class="task-btn" onclick="gotoUrl('/m/ext/enn/ask/tomiaoshu.xhtml')">去做任务</div>
                            </c:if>
                        </div>
                    </dd>
                </dl>
            </c:if>

                <dl class="task-center-list">
                    <dt >每日任务</dt>
                     <!-- 1 -->
                     
                   <c:if test="${not empty daySiginInfo }" >
                    <dd>
                        <div class="line-header closed">
                        	<!-- 
                            <span class="check yellow"><i class="fa fa-check"></i></span>
                        	 -->
                        	  <span class="check lightest"><i class="icon-img icon-img-mrqd"></i></span>
                            <span class="arrow"><i class="fa fa-angle-down"></i></span>
                            <span class="info">
                             <c:choose>
                            	<c:when test="${daySiginInfo.todaySigin}">
                            			已签到
                            	</c:when>
                            	<c:otherwise>
                            		<span class="doDaySign">签到</span>
                            	</c:otherwise>
                             </c:choose>
                            </span>
                            <div class="title">每日签到</div>
                        </div>
                        <div class="line-content" style="display: none;">
                            <label class="arrow"></label>
                            <ul class="task-intro">
                                <li>任务说明</li>
                                <li>1.每周回答三个问题完成任务</li>
                            </ul>
                             <c:if test="${!daySiginInfo.todaySigin}">
                            	
                            </c:if>
                        </div>
                    </dd>
                    </c:if>
                    
                    
					 <!-- 2 -->
                    <dd>
                        <div class="line-header closed">
                            <span class="check lightest"><i class="icon-img icon-img-wkjx"></i></span>
                            <span class="arrow"><i class="fa fa-angle-down"></i></span>
                            <span class="info">
                              <c:choose>
                            	<c:when test="${not empty map['course_study']}">
                            		<c:if test="${map['course_study'].finish == 1 }">
                            			<c:if test="${map['course_study'].isget == 1 }">已领取</c:if>
                            			<c:if test="${map['course_study'].isget == 0 }"><span class="get" data-id="${map['course_study'].recordid}">领取</span></c:if>
                            		</c:if>
                            		<c:if test="${map['course_study'].finish == 0 }">
                            			未达成
                            		</c:if>
                            		
                            	</c:when>
                            	<c:otherwise>
                            		未达成
                            	</c:otherwise>
                              </c:choose>
                            </span>
                            <div class="title">微课微学</div>
                        </div>
                        <div class="line-content" style="display: none;">
                            <label class="arrow"></label>
                            <ul class="task-intro">
                                <li>任务说明</li>
                                <li>1. 当天学习一门微课的累计时长超过10秒，即可完成任务</li>
                                <li>2. 每日0点任务重置，完成后记得及时领取奖励</li>
                            </ul>
                            <!--<div class="reward-image"></div>-->
                            <c:if test="${empty map['course_study'] or map['course_study'].finish == 0 }">
                            	<div class="task-btn" onclick="gotoUrl('/m/ext/enn/coach/course.xhtml')">去做任务</div>
                            </c:if>
                        </div>
                    </dd>
					 <!-- 3 -->
					 
<c:if test="${map['course_commont'].isclose == 0 }">
                    <dd>
                        <div class="line-header closed">
                            <span class="check lightest"><i class="icon-img icon-img-yldr"></i></span>
                            <span class="arrow"><i class="fa fa-angle-down"></i></span>
                            <span class="info">
                              <c:choose>
                            	<c:when test="${not empty map['course_commont']}">
                            		<c:if test="${map['course_commont'].finish == 1 }">
                            			<c:if test="${map['course_commont'].isget == 1 }">已领取</c:if>
                            			<c:if test="${map['course_commont'].isget == 0 }"><span class="get" data-id="${map['course_commont'].recordid}">领取</span></c:if>
                            		</c:if>
                            		<c:if test="${map['course_commont'].finish == 0 }">
                            			未达成
                            		</c:if>
                            	</c:when>
                            	<c:otherwise>
                            		未达成
                            	</c:otherwise>
                              </c:choose>
                            </span>
                            <div class="title">微课点评</div>
                        </div>
                        <div class="line-content" style="display: none;">
                            <label class="arrow"></label>
                            <ul class="task-intro">
                                <li>任务说明</li>
                                <li>1. 当天成功对一门微课进行评论，即可完成任务</li>
                                <li>2. 每日0点任务重置，完成后记得及时领取奖励</li>
                            </ul>
                            <!--<div class="reward-image"></div>-->
                            <c:if test="${empty map['course_commont'] or map['course_commont'].finish == 0 }">
                            	<div class="task-btn" onclick="gotoUrl('/m/ext/enn/coach/course.xhtml')">去做任务</div>
                            </c:if>
                        </div>
                    </dd>
</c:if>                   
                    


					 <!-- 4 -->
<c:if test="${map['question_answer'].isclose == 0 }">
                    <dd>
                        <div class="line-header closed">
                            <span class="check lightest"><i class="icon-img icon-img-jdyl"></i></span>
                            <span class="arrow"><i class="fa fa-angle-down"></i></span>
                            <span class="info">
                            <c:choose>
                            	<c:when test="${not empty map['question_answer']}">
                            		<c:if test="${map['question_answer'].finish == 1 }">
                            			<c:if test="${map['question_answer'].isget == 1 }">已领取</c:if>
                            			<c:if test="${map['question_answer'].isget == 0 }"><span class="get" data-id="${map['question_answer'].recordid}">领取</span></c:if>
                            		</c:if>
                            		<c:if test="${map['question_answer'].finish == 0 }">
                            			${map['question_answer'].complatenum }/${map['question_answer'].num }
                            		</c:if>
                            		
                            	</c:when>
                            	<c:otherwise>
                            		0/${map['question_answer'].num }
                            	</c:otherwise>
                            </c:choose>
                            
                            </span>
                            <div class="title">解答有礼</div>
                        </div>
                        <div class="line-content" style="display: none;">
                            <label class="arrow"></label>
                            <ul class="task-intro">
                                <li>任务说明</li>
                                <li>1. 当天成功回答${map['question_answer'].num }个问题，即可完成任务</li>
                                <li>2. 每日0点任务重置，完成后记得及时领取奖励</li>
                            </ul>
                            <!--<div class="reward-image"></div>-->
                            <c:if test="${empty map['question_answer'] or map['question_answer'].finish == 0 }">
                            	<div class="task-btn" onclick="gotoUrl('/m/ext/enn/ask/index.xhtml');">去做任务</div>
                            </c:if>
                        </div>
                    </dd>
</c:if>
                    <!-- 5 -->
<c:if test="${!isSuperMan and map['question_add'].isclose == 0 }">
                    <dd>
                        <div class="line-header closed">
                            <span class="check lightest"><i class="icon-img icon-img-twyl"></i></span>
                            <span class="arrow"><i class="fa fa-angle-down"></i></span>
                            <span class="info">
                            	<c:choose>
                            	<c:when test="${not empty map['question_add']}">
                            		<c:if test="${map['question_add'].finish == 1 }">
                            			<c:if test="${map['question_add'].isget == 1 }">已领取</c:if>
                            			<c:if test="${map['question_add'].isget == 0 }"><span class="get" data-id="${map['question_add'].recordid}">领取</span></c:if>
                            		</c:if>
                            		<c:if test="${map['question_add'].finish == 0 }">
                            			${map['question_add'].complatenum }/${map['question_add'].num }
                            		</c:if>
                            		
                            	</c:when>
                            	<c:otherwise>
                            		0/${map['question_add'].num }
                            	</c:otherwise>
                            </c:choose>
                            </span>
                            <div class="title">提问有礼</div>
                        </div>
                        <div class="line-content" style="display: none;">
                            <label class="arrow"></label>
                            <ul class="task-intro">
                                <li>任务说明</li>
                                <li>1. 当天成功发布${map['question_add'].num }个问题，即可完成任务</li>
								<li>2. 每日0点任务重置，完成后记得及时领取奖励</li>
                            </ul>
                            <!--<div class="reward-image"></div>-->
                            <c:if test="${empty map['question_add'] or map['question_add'].finish == 0 }">
                            	<div class="task-btn" onclick="gotoUrl('/m/ext/enn/ask/tomiaoshu.xhtml')" >去做任务</div>
                            </c:if>
                        </div>
                    </dd>
</c:if>

                   
                    <!-- 6 -->
<c:if test="${map['question_answer_best'].isclose == 0 }">
                    <dd>
                        <div class="line-header closed">
                            <span class="check lightest"><i class="icon-img icon-img-cnyl"></i></span>
                            <span class="arrow"><i class="fa fa-angle-down"></i></span>
                            <span class="info">
                            	 <c:choose>
                            	<c:when test="${not empty map['question_answer_best']}">
                            		<c:if test="${map['question_answer_best'].finish == 1 }">
                            			<c:if test="${map['question_answer_best'].isget == 1 }">已领取</c:if>
                            			<c:if test="${map['question_answer_best'].isget == 0 }"><span class="get" data-id="${map['question_answer_best'].recordid}">领取</span></c:if>
                            		</c:if>
                            		<c:if test="${map['question_answer_best'].finish == 0 }">
                            			${map['question_answer_best'].complatenum }/${map['question_answer_best'].num }
                            		</c:if>
                            		
                            	</c:when>
                            	<c:otherwise>
                            		0/${map['question_answer_best'].num }
                            	</c:otherwise>
                            </c:choose>
                            </span>
                            <div class="title">采纳有礼</div>
                        </div>
                        <div class="line-content" style="display: none;">
                            <label class="arrow"></label>
                            <ul class="task-intro">
                                <li>任务说明</li>
                                <li>1. 当天采纳${map['question_answer_best'].num }个最佳答案，即可完成任务 </li>
								<li>2. 每日0点任务重置，完成后记得及时领取奖励</li>
                            </ul>
                            <c:if test="${empty map['question_answer_best'] or map['6'].finish == 0 }">
                            	<!--<div class="task-btn" onclick="gotoUrl('/m/ext/enn/ask/index.xhtml');">去做任务</div>  -->
                            </c:if>
                        </div>
                    </dd>
</c:if>                    
 <c:if test="${map['question_answer_best_author'].isclose == 0 }">                   
                    <!-- 7 -->
                    <dd>
                        <div class="line-header closed">
                            <span class="check lightest"><i class="icon-img icon-img-bcyl"></i></span>
                            <span class="arrow"><i class="fa fa-angle-down"></i></span>
                            <span class="info">
                            	 <c:choose>
                            	<c:when test="${not empty map['question_answer_best_author']}">
                            		<c:if test="${map['question_answer_best_author'].finish == 1 }">
                            			<c:if test="${map['question_answer_best_author'].isget == 1 }">已领取</c:if>
                            			<c:if test="${map['question_answer_best_author'].isget == 0 }"><span class="get" data-id="${map['question_answer_best_author'].recordid}">领取</span></c:if>
                            		</c:if>
                            		<c:if test="${map['question_answer_best_author'].finish == 0 }">
                            			${map['question_answer_best_author'].complatenum }/${map['question_answer_best_author'].num }
                            		</c:if>
                            		
                            	</c:when>
                            	<c:otherwise>
                            		0/${map['question_answer_best_author'].num }
                            	</c:otherwise>
                            </c:choose>
                            </span>
                            <div class="title">被采有礼</div>
                        </div>
                        <div class="line-content" style="display: none;">
                            <label class="arrow"></label>
                            <ul class="task-intro">
                                <li>任务说明</li>
                               <li>1. 当天有${map['question_answer_best_author'].num }个解答被采纳，即可完成任务</li>
								</li>2. 每日0点任务重置，完成后记得及时领取奖励</li>
                                
                            </ul>
                        </div>
                    </dd>
</c:if>                    
<c:if test="${!isSuperMan and map['question_add_credit'].isclose == 0 }">                    
                    <!-- 8 -->
                    <dd>
                        <div class="line-header closed">
                            <span class="check lightest"><i class="icon-img icon-img-xstw"></i></span>
                            <span class="arrow"><i class="fa fa-angle-down"></i></span>
                            <span class="info">
                              <c:choose>
                            	<c:when test="${not empty map['question_add_credit']}">
                            		<c:if test="${map['question_add_credit'].finish == 1 }">
                            			<c:if test="${map['question_add_credit'].isget == 1 }">已领取</c:if>
                            			<c:if test="${map['question_add_credit'].isget == 0 }"><span class="get" data-id="${map['question_add_credit'].recordid}">领取</span></c:if>
                            		</c:if>
                            		<c:if test="${map['question_add_credit'].finish == 0 }">
                            			未达成
                            		</c:if>
                            	</c:when>
                            	<c:otherwise>
                            		未达成
                            	</c:otherwise>
                              </c:choose>
                            </span>
                            <div class="title">悬赏提问</div>
                        </div>
                        <div class="line-content" style="display: none;">
                            <label class="arrow"></label>
                            <ul class="task-intro">
                                <li>任务说明</li>
                                <li>1. 当天成功发布1个悬赏问题，即可完成任务</li>
								<li>2. 每日0点任务重置，完成后记得及时领取奖励</li>
                            </ul>
                            <c:if test="${empty map['question_add_credit'] or map['question_add_credit'].finish == 0 }">
                            	<div class="task-btn" onclick="gotoUrl('/m/ext/enn/ask/tomiaoshu.xhtml')">去做任务</div>
                            </c:if>
                        </div>
                    </dd>
</c:if>  
                  
                    <!-- 9 -->
<c:if test="${map['question_add_anonymous'].isclose == 0 }"> 
                    <dd>
                        <div class="line-header closed">
                            <span class="check lightest"><i class="icon-img icon-img-nmtw"></i></span>
                            <span class="arrow"><i class="fa fa-angle-down"></i></span>
                            <span class="info">
                            	 <c:choose>
                            	<c:when test="${not empty map['question_add_anonymous']}">
                            		<c:if test="${map['question_add_anonymous'].finish == 1 }">
                            			<c:if test="${map['question_add_anonymous'].isget == 1 }">已领取</c:if>
                            			<c:if test="${map['question_add_anonymous'].isget == 0 }"><span class="get" data-id="${map['question_add_anonymous'].recordid}">领取</span></c:if>
                            		</c:if>
                            		<c:if test="${map['question_add_anonymous'].finish == 0 }">
                            			未达成
                            		</c:if>
                            	</c:when>
                            	<c:otherwise>
                            		未达成
                            	</c:otherwise>
                              </c:choose>
                            </span>
                            <div class="title">匿名问题</div>
                        </div>
                        <div class="line-content" style="display: none;">
                            <label class="arrow"></label>
                            <ul class="task-intro">
                                <li>任务说明</li>
                                <li>1. 当天成功发布${map['question_add_anonymous'].num}个匿名问题，即可完成任务</li>
								<li>2. 每日0点任务重置，完成后记得及时领取奖励</li>
                            </ul>
                            <c:if test="${empty map['question_add_anonymous'] or map['question_add_anonymous'].finish == 0 }">
                            	<div class="task-btn" onclick="gotoUrl('/m/ext/enn/ask/tomiaoshu.xhtml')">去做任务</div>
                            </c:if>
                        </div>
                    </dd>
 </c:if>                   
                    <!-- 10 -->
                    <%--
                    <dd>
                        <div class="line-header closed">
                            <span class="check lightest"><i class="fa fa-check"></i></span>
                            <span class="arrow"><i class="fa fa-angle-down"></i></span>
                            <span class="info">
                            	 <c:choose>
                            	<c:when test="${not empty map['10']}">
                            		<c:if test="${map['10'].finish == 1 }">
                            			<c:if test="${map['10'].isget == 1 }">已领取</c:if>
                            			<c:if test="${map['10'].isget == 0 }"><span class="get" data-id="${map['10'].recordid}">领取</span></c:if>
                            		</c:if>
                            		<c:if test="${map['10'].finish == 0 }">
                            			未达成
                            		</c:if>
                            		
                            	</c:when>
                            	<c:otherwise>
                            		未达成
                            	</c:otherwise>
                              </c:choose>
                            </span>
                            <div class="title">推荐达人给朋友任务</div>
                        </div>
                        <div class="line-content" style="display: none;">
                            <label class="arrow"></label>
                            <ul class="task-intro">
                                <li>任务说明</li>
                                <li>1、任务说明任务说明任务说明任务说明</li>
                                <li>2、任务说明任务说明任务说明任务说明</li>
                            </ul>
                            <!--<div class="reward-image"></div>-->
                            <div class="task-info">"最强新人"成就勋章</div>
                            <c:if test="${empty map['10'] or map['10'].finish == 0 }">
                            	<div class="task-btn">去做任务</div>
                            </c:if>
                        </div>
                    </dd>
                    
                     --%>
                     
                     
                    <!-- 11 -->
<c:if test="${map['user_tag_update'].isclose == 0 }">  
                    <dd>
                        <div class="line-header closed">
                            <span class="check lightest"><i class="icon-img icon-img-xgbq"></i></span>
                            <span class="arrow"><i class="fa fa-angle-down"></i></span>
                            <span class="info">
                            	 <c:choose>
                            	<c:when test="${not empty map['user_tag_update']}">
                            		<c:if test="${map['user_tag_update'].finish == 1 }">
                            			<c:if test="${map['user_tag_update'].isget == 1 }">已领取</c:if>
                            			<c:if test="${map['user_tag_update'].isget == 0 }"><span class="get" data-id="${map['user_tag_update'].recordid}">领取</span></c:if>
                            		</c:if>
                            		<c:if test="${map['user_tag_update'].finish == 0 }">
                            			未达成
                            		</c:if>
                            		
                            	</c:when>
                            	<c:otherwise>
                            		未达成
                            	</c:otherwise>
                              </c:choose>
                            </span>
                            <div class="title">修改标签</div>
                        </div>
                        <div class="line-content" style="display: none;">
                            <label class="arrow"></label>
                            <ul class="task-intro">
                                <li>任务说明</li>
								<li>1. 当天成功修订一次个人标签，即可完成任务</li>
								<li>2. 每日0点任务重置，完成后记得及时领取奖励</li>
                            </ul>
                            <c:if test="${empty map['user_tag_update'] or map['user_tag_update'].finish == 0 }">
                            	<div class="task-btn" onclick="gotoUrl('/m/ext/enn/ask/toaddtag.xhtml');">去做任务</div>
                            </c:if>
                        </div>
                    </dd>
</c:if>
                    <!-- 12 -->
                    
                    <c:if test="${!isCoach }">
<c:if test="${map['coach_practice'].isclose == 0 }">  
                    <dd>
                        <div class="line-header closed">
                            <span class="check lightest"><i class="icon-img icon-img-sxjl"></i></span>
                            <span class="arrow"><i class="fa fa-angle-down"></i></span>
                            <span class="info">
                           		 	 <c:choose>
                            	<c:when test="${not empty map['coach_practice']}">
                            		<c:if test="${map['coach_practice'].finish == 1 }">
                            			<c:if test="${map['coach_practice'].isget == 1 }">已领取</c:if>
                            			<c:if test="${map['coach_practice'].isget == 0 }"><span class="get" data-id="${map['coach_practice'].recordid}">领取</span></c:if>
                            		</c:if>
                            		<c:if test="${map['coach_practice'].finish == 0 }">
                            			未达成
                            		</c:if>
                            		
                            	</c:when>
                            	<c:otherwise>
                            		未达成
                            	</c:otherwise>
                              </c:choose>
                            </span>
                            <div class="title">实习记录</div>
                        </div>
                        <div class="line-content" style="display: none;">
                            <label class="arrow"></label>
                            <ul class="task-intro">
                                <li>任务说明</li>
								<li>1. 当天成功提交${map['coach_practice'].num}次实习记录，即可完成任务</li>
								<li>2. 每日0点任务重置，完成后记得及时领取奖励</li>
                            </ul>
                            <c:if test="${empty map['12'] or map['12'].finish == 0 }">
                            	<!-- <div class="task-btn">去做任务</div> -->
                            </c:if>
                        </div>
                    </dd>
</c:if>
					</c:if>
					                    
                    <!-- 13 -->
<c:if test="${map['question_invite'].isclose == 0 }">  
                    <dd>
                        <div class="line-header closed">
                            <span class="check lightest"><i class="icon-img icon-img-yqhd"></i></span>
                            <span class="arrow"><i class="fa fa-angle-down"></i></span>
                            <span class="info">
                            	 <c:choose>
                            	<c:when test="${not empty map['question_invite']}">
                            		<c:if test="${map['question_invite'].finish == 1 }">
                            			<c:if test="${map['question_invite'].isget == 1 }">已领取</c:if>
                            			<c:if test="${map['question_invite'].isget == 0 }"><span class="get" data-id="${map['question_invite'].recordid}">领取</span></c:if>
                            		</c:if>
                            		<c:if test="${map['question_invite'].finish == 0 }">
                            			${map['question_invite'].complatenum }/${map['question_invite'].num }
                            		</c:if>
                            		
                            	</c:when>
                            	<c:otherwise>
                            		0/${map['question_invite'].num }
                            	</c:otherwise>
                            </c:choose>
                            </span>
                            <div class="title">邀请回答</div>
                        </div>
                        <div class="line-content" style="display: none;">
                            <label class="arrow"></label>
                            <ul class="task-intro">
                                <li>任务说明</li>
								<li>1. 当天成功邀请*位好友进行解答，即可完成任务</li>
								<li>2. 每日0点任务重置，完成后记得及时领取奖励</li>
                            </ul>
                            <c:if test="${empty map['question_invite'] or map['question_invite'].finish == 0 }">
                            	<!-- <div class="task-btn" onclick="gotoUrl('/m/ext/enn/ask/index.xhtml');">去做任务</div> -->
                            </c:if>
                        </div>
                    </dd>
</c:if>                    
                    <!-- 14 -->
<c:if test="${map['praise'].isclose == 0 }">
                    <dd>
                        <div class="line-header closed">
                            <span class="check lightest"><i class="icon-img icon-img-dzyl"></i></span>
                            <span class="arrow"><i class="fa fa-angle-down"></i></span>
                            <span class="info">
                            	 <c:choose>
                            	<c:when test="${not empty map['praise']}">
                            		<c:if test="${map['praise'].finish == 1 }">
                            			<c:if test="${map['praise'].isget == 1 }">已领取</c:if>
                            			<c:if test="${map['praise'].isget == 0 }"><span class="get" data-id="${map['praise'].recordid}">领取</span></c:if>
                            		</c:if>
                            		<c:if test="${map['praise'].finish == 0 }">
                            			${map['praise'].complatenum }/${map['praise'].num }
                            		</c:if>
                            		
                            	</c:when>
                            	<c:otherwise>
                            		0/${map['praise'].num }
                            	</c:otherwise>
                            </c:choose>
                            </span>
                            <div class="title">点赞有礼</div>
                        </div>
                        <div class="line-content" style="display: none;">
                            <label class="arrow"></label>
                            <ul class="task-intro">
                                <li>任务说明</li>
<li>1. 当天成功完成${map['praise'].num }次点赞，即可完成任务</li>
<li>2. 每日0点任务重置，完成后记得及时领取奖励</li>
                            </ul>
                            <c:if test="${empty map['praise'] or map['praise'].finish == 0 }">
                            	<!-- <div class="task-btn" >去做任务</div> -->
                            </c:if>
                        </div>
                    </dd>
</c:if>
                   
                    <!-- 15 -->
<c:if test="${map['day_active'].isclose == 0 }">                    
                    <dd>
                        <div class="line-header closed">
                            <span class="check lightest"><i class="icon-img icon-img-hyyl"></i></span>
                            <span class="arrow"><i class="fa fa-angle-down"></i></span>
                            <span class="info">
                           		 	 <c:choose>
                            	<c:when test="${not empty map['day_active']}">
                            		<c:if test="${map['day_active'].finish == 1 }">
                            			<c:if test="${map['day_active'].isget == 1 }">已领取</c:if>
                            			<c:if test="${map['day_active'].isget == 0 }"><span class="get" data-id="${map['day_active'].recordid}">领取</span></c:if>
                            		</c:if>
                            		<c:if test="${map['day_active'].finish == 0 }">
                            			未达成
                            		</c:if>
                            		
                            	</c:when>
                            	<c:otherwise>
                            		未达成
                            	</c:otherwise>
                              </c:choose>
                            </span>
                            <div class="title">活跃有礼</div>
                        </div>
                        <div class="line-content" style="display: none;">
                            <label class="arrow"></label>
                            <ul class="task-intro">
                                <li>任务说明</li>
<li>1. 当天累计获得${map['day_active'].num}经验值，即可完成任务</li>
<li>2. 每日0点任务重置，完成后记得及时领取奖励</li>
                            </ul>
                            <c:if test="${empty map['day_active'] or map['day_active'].finish == 0 }">
                            	<!-- <div class="task-btn">去做任务</div> -->
                            </c:if>
                        </div>
                    </dd>
</c:if>
                </dl>

                <dl class="task-center-list">
                    <dt>成就任务</dt>
                    
                    
                    
                    <!-- 110 -->
                    <c:if test="${!isCoach }">
<c:if test="${!isSuperMan and map['yldr'].isclose == 0 }"> 
                    <dd>
                        <div class="line-header closed">
                            <span class="check lightest"><i class="icon-img icon-img-yldr"></i></span>
                            <span class="arrow"><i class="fa fa-angle-down"></i></span>
                            <span class="info">
                            	 	 <c:choose>
                            	<c:when test="${not empty map['yldr']}">
                            		<c:if test="${map['yldr'].finish == 1 }">
                            			<c:if test="${map['yldr'].isget == 1 }">已领取</c:if>
                            			<c:if test="${map['yldr'].isget == 0 }"><span class="get" data-id="${map['yldr'].recordid}">领取</span></c:if>
                            		</c:if>
                            		<c:if test="${map['yldr'].finish == 0 }">
                            			${map['yldr'].complatenum }/${map['yldr'].num }
                            		</c:if>
                            		
                            	</c:when>
                            	<c:otherwise>
                            		未达成
                            	</c:otherwise>
                              </c:choose>
                            		
                            </span>
                            <div class="title">毅力达人：连续${map['yldr'].num }周完成每周三问</div>
                        </div>
                        <div class="line-content" style="display: none;">
                            <label class="arrow"></label>
                            <ul class="task-intro">
                                <li>任务说明</li>
<li>1.该任务共有三个级别，相应任务内容和奖励如下：</li>
<li>初级：连续4周完成每周三问，奖励1000经验值</li>
<li>中级：连续9周完成每周三问，奖励3000经验值</li>
<li>高级：连续15周完成每周三问，奖励5000经验值</li>
<li>2.每周完成三个提问，并连续完成相对应 “周”数，即可任务完成</li>
<li>3.完成后记得及时领取奖励</li>
                            </ul>
                            <c:if test="${empty map['yldr'] or map['yldr'].finish == 0 }">
                            	<!-- <div class="task-btn" onclick="gotoUrl('/m/ext/enn/ask/tomiaoshu.xhtml')">去做任务</div> -->
                            </c:if>
                        </div>
                    </dd>
</c:if>
                    </c:if>
                    
<c:if test="${map['sjwx'].isclose == 0 }">                    
                    <!-- 111 -->
                    <input type="hidden" value="${map['sjwx'].complatenum}" id="level">
                    <dd>
                        <div class="line-header closed">
                            <span class="check lightest"><i class="icon-img icon-img-sjwx"></i></span>
                            <span class="arrow"><i class="fa fa-angle-down"></i></span>
                            <span class="info">
                              <c:choose>
                            	<c:when test="${not empty map['sjwx']}">
                            		<c:if test="${userlevel.creditLevel.level > map['sjwx'].complatenum }"><span class="getLevel" data-id="${map['sjwx'].id}">领取</span></c:if>
                            		<c:if test="${userlevel.creditLevel.level <= map['sjwx'].complatenum }">
                            			${userlevel.creditLevel.level}->${userlevel.creditLevel.level+1}
                            		</c:if>
                            		
                            	</c:when>
                            	<c:otherwise>
                            	  <c:if test="${userlevel.creditLevel.level >= 2}"><span class="getLevel" data-id="sjwx">领取</span></c:if>
                            	</c:otherwise>
                              </c:choose>
                            </span>
                            <div class="title">升级无限：账号每升一级</div>
                        </div>
                        <div class="line-content" style="display: none;">
                            <label class="arrow"></label>
                            <ul class="task-intro">
                                <li>任务说明</li>
<li>1. 账号升到2级，奖励5财富值，账号每升一级，奖励增加1财富值（2级—5财富值；3级—6财富值；4级—7财富值……），升级任务无上限</li>
<li>2.成功完成账号升级，即可任务完成</li>
<li>3.完成后记得及时领取奖励</li>
                            </ul>
                             <c:if test="${empty map['sjwx'] or map['sjwx'].finish == 0 }">
                            	<!-- <div class="task-btn">去做任务</div> -->
                            </c:if>
                        </div>
                    </dd>
</c:if>                    
                    <!-- 112 -->
 <c:if test="${map['sdql'].isclose == 0 }">                     
                    <dd>
                        <div class="line-header closed">
                            <span class="check lightest"><i class="icon-img icon-img-sdql"></i></span>
                            <span class="arrow"><i class="fa fa-angle-down"></i></span>
                            <span class="info">
                              <c:choose>
                            	<c:when test="${not empty map['sdql']}">
                            		<c:if test="${map['sdql'].finish == 1 }">
                            			<c:if test="${map['sdql'].isget == 1 }">已领取</c:if>
                            			<c:if test="${map['sdql'].isget == 0 }"><span class="get" data-id="${map['sdql'].recordid}">领取</span></c:if>
                            		</c:if>
                            		<c:if test="${map['sdql'].finish == 0 }">
                            			${map['sdql'].complatenum }/${map['sdql'].num }
                            		</c:if>
                            		
                            	</c:when>
                            	<c:otherwise>
                            		未达成
                            	</c:otherwise>
                              </c:choose>
                            </span>
                            <div class="title">手到擒来：累计被采纳数达${map['sdql'].num}个</div>
                        </div>
                        <div class="line-content" style="display: none;">
                            <label class="arrow"></label>
                            <ul class="task-intro">
                                <li>任务说明</li>
                               <li> 1. 该任务共有三个级别，相应任务内容和奖励如下：</li>
<li>累计被采纳数达10个，奖励财富值30和经验值300</li>
<li>累计被采纳数达30个，奖励财富值60和经验值600</li>
<li>累计被采纳数达80个，奖励财富值100和经验值1000</li>
<li>2.解答被采纳为最佳答案，并完成相应数量要求，即可任务完成</li>
<li>3.完成后记得及时领取奖励</li>
                            </ul>
                            <!-- <div class="reward-image"></div> -->
                            <c:if test="${empty map['sdql'] or map['sdql'].finish == 0 }">
                            	<!-- <div class="task-btn">去做任务</div> -->
                            </c:if>
                        </div>
                    </dd>
 </c:if>                   
                    
                    <!-- 113 -->
 <c:if test="${!isSuperMan and map['twdr'].isclose == 0 }">  
                    <dd>
                        <div class="line-header closed">
                            <span class="check lightest"><i class="icon-img icon-img-twdr"></i></i></span>
                            <span class="arrow"><i class="fa fa-angle-down"></i></span>
                            <span class="info">
                              <c:choose>
                            	<c:when test="${not empty map['twdr']}">
                            		<c:if test="${map['twdr'].finish == 1 }">
                            			<c:if test="${map['twdr'].isget == 1 }">已领取</c:if>
                            			<c:if test="${map['twdr'].isget == 0 }"><span class="get" data-id="${map['twdr'].recordid}">领取</span></c:if>
                            		</c:if>
                            		<c:if test="${map['twdr'].finish == 0 }">
                            			${map['twdr'].complatenum }/${map['twdr'].num }
                            		</c:if>
                            		
                            	</c:when>
                            	<c:otherwise>
                            		未达成
                            	</c:otherwise>
                              </c:choose>
                            </span>
                            <div class="title">提问达人：发布问题数量达${map['twdr'].num}个</div>
                        </div>
                        <div class="line-content" style="display: none;">
                            <label class="arrow"></label>
                            <ul class="task-intro">
                                <li>任务说明</li>
<li>1. 该任务共有三个级别，相应任务内容和奖励如下：</li>
<li>发布问题数量达30个，奖励经验值100</li>
<li>发布问题数量达80个，奖励经验值300</li>
<li>发布问题数量达150个，奖励经验值500</li>
<li>2.成功发布问题，并完成相应问题数量要求，即可任务完成</li>
<li>3.完成后记得及时领取奖励</li>
                                
                            </ul>
                           <c:if test="${empty map['twdr'] or map['twdr'].finish == 0 }">
                            	<div class="task-btn"  onclick="gotoUrl('/m/ext/enn/ask/tomiaoshu.xhtml')">去做任务</div>
                            </c:if>
                        </div>
                    </dd>
</c:if>
                    <!-- 114 -->
 <c:if test="${map['jddr'].isclose == 0 }">  
                    <dd>
                        <div class="line-header closed">
                            <span class="check lightest"><i class="icon-img icon-img-jddr"></i></span>
                            <span class="arrow"><i class="fa fa-angle-down"></i></span>
                            <span class="info">
                              <c:choose>
                            	<c:when test="${not empty map['jddr']}">
                            		<c:if test="${map['jddr'].finish == 1 }">
                            			<c:if test="${map['jddr'].isget == 1 }">已领取</c:if>
                            			<c:if test="${map['jddr'].isget == 0 }"><span class="get" data-id="${map['jddr'].recordid}">领取</span></c:if>
                            		</c:if>
                            		<c:if test="${map['jddr'].finish == 0 }">
                            			${map['jddr'].complatenum }/${map['jddr'].num }
                            		</c:if>
                            		
                            	</c:when>
                            	<c:otherwise>
                            		未达成
                            	</c:otherwise>
                              </c:choose>
                            </span>
                            <div class="title">解答达人：解答问题数量达${map['jddr'].num }个</div>
                        </div>
                        <div class="line-content" style="display: none;">
                            <label class="arrow"></label>
                            <ul class="task-intro">
                                <li>任务说明</li>
                               <li> 1. 该任务共有三个级别，相应任务内容和奖励如下：</li>
<li>解答问题数量达50个，奖励财富值30和经验值100</li>
<li>解答问题数量达150个，奖励财富值60和经验值300</li>
<li>解答问题数量达300个，奖励财富值100和经验值500</li>
<li>2.成功解答问题，并完成相应数量要求，即可任务完成</li>
<li>3.完成后记得及时领取奖励</li>
                            </ul>
                            <c:if test="${empty map['jddr'] or map['jddr'].finish == 0 }">
                            	<!-- <div class="task-btn" onclick="gotoUrl('/m/ext/enn/ask/index.xhtml')">去做任务</div> -->
                            </c:if>
                        </div>
                    </dd>
</c:if>
                    <!-- 115 -->

 <c:if test="${map['wmcx'].isclose == 0 }">  
                    <dd>
                        <div class="line-header closed">
                            <span class="check lightest"><i class="icon-img icon-img-wmcx"></i></span>
                            <span class="arrow"><i class="fa fa-angle-down"></i></span>
                            <span class="info">
                               <c:choose>
                            	<c:when test="${not empty map['wmcx']}">
                            		<c:if test="${map['wmcx'].finish == 1 }">
                            			<c:if test="${map['wmcx'].isget == 1 }">已领取</c:if>
                            			<c:if test="${map['wmcx'].isget == 0 }"><span class="get" data-id="${map['wmcx'].recordid}">领取</span></c:if>
                            		</c:if>
                            		<c:if test="${map['wmcx'].finish == 0 }">
                            			未达成
                            		</c:if>
                            		
                            	</c:when>
                            	<c:otherwise>
                            		未达成
                            	</c:otherwise>
                              </c:choose>
                            </span>
                            <div class="title">完美呈现：上传头像、修改密码、选择标签</div>
                        </div>
                        <div class="line-content" style="display: none;">
                            <label class="arrow"></label>
                            <ul class="task-intro">
                                <li>任务说明</li>
                                <li>1. 完成头像上传、修改登录密码、标签选择，即可任务完成</li>
<li>2. 完成后记得及时领取奖励</li>
                            </ul>
                            <!-- <div class="reward-image"></div> -->
                            <c:if test="${empty map['wmcx'] or map['wmcx'].finish == 0 }">
                            	<!-- <div class="task-btn">去做任务</div> -->
                            </c:if>
                        </div>
                    </dd>
</c:if>                   
                   
                    <!-- 116 -->
                   <c:if test="${!isCoach }">
 <c:if test="${map['jldr'].isclose == 0 }">                    
                    <dd>
                        <div class="line-header closed">
                            <span class="check lightest"><i class="icon-img icon-img-jldr"></i></span>
                            <span class="arrow"><i class="fa fa-angle-down"></i></span>
                            <span class="info">
                               <c:choose>
                            	<c:when test="${not empty map['jldr']}">
                            		<c:if test="${map['jldr'].finish == 1 }">
                            			<c:if test="${map['jldr'].isget == 1 }">已领取</c:if>
                            			<c:if test="${map['jldr'].isget == 0 }"><span class="get" data-id="${map['jldr'].recordid}">领取</span></c:if>
                            		</c:if>
                            		<c:if test="${map['jldr'].finish == 0 }">
                            			${map['jldr'].complatenum }/${map['jldr'].num }
                            		</c:if>
                            		
                            	</c:when>
                            	<c:otherwise>
                            		未达成
                            	</c:otherwise>
                              </c:choose>
                            
                            </span>
                            <div class="title">记录达人：提交${map['jldr'].num}篇实习记录</div>
                        </div>
                        <div class="line-content" style="display: none;">
                            <label class="arrow"></label>
                            <ul class="task-intro">
                                <li>任务说明</li>
<li>1. 成功成功提交${map['jldr'].num}篇实习记录，即可任务完成</li>
<li>2. 完成后记得及时领取奖励</li>
                            </ul>
                            <c:if test="${empty map['jldr'] or map['jldr'].finish == 0 }">
                            	<!-- <div class="task-btn">去做任务</div> -->
                            </c:if>
                        </div>
                    </dd>
 </c:if>
                   </c:if> 
                    
                    <!-- 117 -->
 <c:if test="${!isSuperMan and map['xsdr'].isclose == 0 }"> 
                    <dd>
                        <div class="line-header closed" id = "task_xsdr">
                            <span class="check lightest"><i class="icon-img icon-img-xsdr"></i></span>
                            <span class="arrow"><i class="fa fa-angle-down"></i></span>
                            <span class="info">
                            	  <c:choose>
                            	<c:when test="${not empty map['xsdr']}">
                            		<c:if test="${map['xsdr'].finish == 1 }">
                            			<c:if test="${map['xsdr'].isget == 1 }">已领取</c:if>
                            			<c:if test="${map['xsdr'].isget == 0 }"><span class="get" data-id="${map['xsdr'].recordid}">领取</span></c:if>
                            		</c:if>
                            		<c:if test="${map['xsdr'].finish == 0 }">
                            			${map['xsdr'].complatenum }/${map['xsdr'].num }
                            		</c:if>
                            		
                            	</c:when>
                            	<c:otherwise>
                            		未达成
                            	</c:otherwise>
                              </c:choose>
                            </span>
                            <div class="title">悬赏达人：累计悬赏${ map['xsdr'].num}财富值</div>
                        </div>
                        <div class="line-content" style="display: none;">
                            <label class="arrow"></label>
                            <ul class="task-intro">
                                <li>任务说明</li>
								<li>1. 发布问题时使用悬赏功能，且悬赏财富值累计达${ map['xsdr'].num}，即可任务完成</li>
								<li>2. 完成后记得及时领取奖励</li>
                            </ul>
                            <c:if test="${empty map['xsdr'] or map['xsdr'].finish == 0 }">
                            	<!-- <div class="task-btn" onclick="gotoUrl('/m/ext/enn/ask/tomiaoshu.xhtml')">去做任务</div> -->
                            </c:if>
                        </div>
                    </dd>
</c:if>
                </dl>

            </div>

        </section>
        
<script type="text/javascript">

var $tempPercent = $('#progress-box .percent');
var tempPercentWidth;
var $btnBack = $('#btn-back');
var $taskHeadList = $('.line-header');

$btnBack.bind('click', function () {
    window.history.go(-1);
});

tempPercentWidth = $tempPercent.data('percent');
+(function ($tempPercent, tempPercentWidth) {
    setTimeout(function () {
        $tempPercent.css('width', tempPercentWidth + '%');
    }, 300);
}($tempPercent, tempPercentWidth));

$taskHeadList.bind('click', function () {
    var temp = $(this);
    if (temp.is('.closed')){
        temp.prop('class', 'line-header opened');
        temp.find('.arrow i').prop('class', 'fa fa-angle-up');
        temp.next('.line-content').slideDown(300, function () {
            if (temp.is('#task_xsdr')) {
                var gap = document.body.scrollHeight - window.innerWidth;
                if (gap > 0) {
                    $('html,body').animate({
						scrollTop: gap
					}, 500);
                }
            }
        });
    } else {
        temp.prop('class', 'line-header closed');
        temp.find('.arrow i').prop('class', 'fa fa-angle-down');
        temp.next('.line-content').slideUp(300);
    }
});
var flag1 = false;
$('.get').bind('click', function (e) {
	if(flag1){
		return;
    }
	flag1 = true;
		e.stopPropagation();
    	var _thi = $(this);
    	var recordid = _thi.data("id");
    	$.ajax({
        	type:"POST",
        	url:"${basepath}/m/ext/enn/task/get.json",
        	data:{
        		recordid:recordid
            },
            success:function(map){
            	flag1 = false;
				if(map.flag == 'error'){
					lightBlock.show("领取失败！");
				}else{
    				_thi.replaceWith('已领取');
					showMessage(map.credit,map.experience);
				}
    			
            },
            error:function(){
            	flag1 = false;
            }

       	});
    });

	var flag_sign = false;
	 $('.doDaySign').bind('click', function (e) {
			var _thi = $(this);
			if(flag_sign){
			return;
			
			}
			flag_sign = true;
			$.ajax({
				type: "POST",
				url:  "${basepath}/m/ext/enn/ask/dosigin.json",
				success:function(data){
					falg_sign = false;
					var num = data;
					showMessage(2,num);

					_thi.replaceWith('已签到');

		
				}
			});
			e.stopPropagation();

	 });

	 function getDaysigininfo(){
						$.ajax({
			type: "GET",
			cache : false,
			url:  "${basepath}/m/ext/enn/task/daysigininfo.json",
			success:function(data){
					if(null!=data){
						if(data.todaySigin ==true){
							$('.doDaySign').replaceWith('已签到');
							flag_sign = true;
						}
						
					}
					
				},
		});
		
	}
	getDaysigininfo();




var flag = false;
$('.getLevel').bind('click', function (e) {
    	if(flag){
			return;
        }
    	flag = true;
		e.stopPropagation();
    	var _thi = $(this);
    	var id = _thi.data("id");
    	var clevel = parseInt('${userlevel.creditLevel.level}');
    	
    	var level = 0;
    	if($('#level').val() == null || $('#level').val() == ""){
    		level = 2;
        }else{
        	level = parseInt($('#level').val())+1;
        }
        	
    	$.ajax({
        	type:"POST",
        	url:"${basepath}/m/ext/enn/task/getlevel.json",
        	data:{
        		tid:id,
        		level:level
            },
            success:function(map){
            	flag = false;
				if(map.flag == 'error'){
					lightBlock.show("领取失败！");
				}else{
					$('#level').val(level+1);
					
					if(clevel<=(level+1)){
						
    					_thi.replaceWith('已领取');
					}
					showMessage1(map.credit);
				}
    			
            },
            error:function(){
				flag = false;
            }

       	});
    });
    

</script>
