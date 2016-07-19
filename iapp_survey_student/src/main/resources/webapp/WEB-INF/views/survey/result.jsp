<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/WEB-INF/include/taglibs.jsp"%><%--需重再一次导入 --%>
<%@ taglib prefix="myel" uri="http://www.longtimeit.com/taglib-elfunctions"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title><fmt:message key="result.title" bundle="${bundle}"/></title>
	<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
	<meta name="format-detection" content="telephone=no" />
	<meta content="black" name="apple-mobile-web-app-status-bar-style" />
	<link rel="stylesheet" type="text/css" href="${basepath }/static/css/survey/style.css" />
	 <link rel="shortcut icon" type="image/ico" href="${basepath }/static/img/favicon.ico">
	<script type="text/javascript" src="${staticpath}/static/js/jquery-2.1.0.min.js"></script>
	<style type="text/css">
		.star li{
			float:left;
			width:50px;
			height:50px;
			text-indent:-9999px;
			background:url(${basepath}/static/img/survey/like.jpg) no-repeat;
			background-size:auto 29px;
			cursor:pointer;
		}  
		.star li.on{
			background:url(${basepath}/static/img/survey/like_active.jpg) no-repeat;
			background-size:auto 29px;
		}
	
	</style>
</head>
<body>
	<div class="paper">
		<div class="exam_top">
			<h2 style="display:inline-block;">${entity.title }</h2>
			<div class="go-exam fr" onclick="goBack();">
				<fmt:message key="result.back" bundle="${bundle}"/>
			</div>
		</div>
		<c:set var="sectionNum" value="1"></c:set>
		<c:forEach var="question" items="${surveyAndVoteQuestionVos }" varStatus="index">
		<c:if test="${index.index == 0 }">
		<div class="survuy">
			<c:if test="${question.type == 5 }">
			<h4>${question.title }</h4>
			</c:if>
			<div>
		</c:if>
		<c:if test="${question.type == 5 && index.index != 0}">
				</div>
			</div>
			<div class="survuy">
				<h4>${question.title }</h4>
					<div>
			<c:set var="sectionNum" value="1"></c:set>
		</c:if>
			<!-- 单选start -->
			<c:if test="${question.type == 1 }">
				<c:forEach items="${question.voteOptionEntities}" var="option" varStatus="os">
                  	<c:forEach items="${voteActionDetailEntities}" var="action" >
						 <c:if test="${action.questionid eq question.id}">
						 	<c:choose>
								<c:when test="${fn:contains(action.optionid,option.id)}">
              						<c:set var="selectNo" value="${option.fileId }"></c:set>
						 		</c:when>
						 	</c:choose>
						 </c:if>
					</c:forEach>
                </c:forEach>
				<ul>
					<li>
						<span>${sectionNum}<fmt:message key="symbol.stop" bundle="${bundle}"/>${question.title }</span><span>【<fmt:message key="result.single" bundle="${bundle}"/>】</span>
					</li>
					<li>
						<c:forEach var="voteoption" items="${question.voteOptionEntities }">
							<div class="clear">
								<div class="fl">
									${voteoption.fileId }:${voteoption.title }
								</div>
								<c:if test="${isShowResult && not empty selectNo }">
								<div class="fl answer-box">
									<div class="answer-val" style="width:${myel:numFormat(voteoption.voteNum/question.voteNum * 100)}%;"></div>
								</div>
								<div class="answer-text fl"><span>${myel:numFormat(voteoption.voteNum/question.voteNum * 100)}</span>%</div>
								</c:if>
							</div>
							<c:if test="${not empty voteoption.coverPath }">
							<div>
								<img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${voteoption.coverPath}-640x360" alt="">
							</div>
							</c:if>
						</c:forEach>
						<p>
							<fmt:message key="result.your_answer" bundle="${bundle}"/>：
							<c:if test="${not empty selectNo }">
								${selectNo }
							</c:if>
							<c:if test="${empty selectNo }">
								<fmt:message key="result.unanswer" bundle="${bundle}"/>
							</c:if>	
						</p>
					</li>
				</ul>
			</c:if>
			<!-- 单选end -->
			
			<!-- 多选start -->
			<c:if test="${question.type == 2 }">
				<c:forEach items="${question.voteOptionEntities}" var="option" varStatus="os">
                  	<c:forEach items="${voteActionDetailEntities}" var="action" >
						 <c:if test="${action.questionid eq question.id}">
						 	<c:choose>
								<c:when test="${fn:contains(action.optionid,option.id)}">
              							<c:if test="${not empty selectNo }">
              								<c:set var="selectNo" value="${selectNo}、${option.fileId}"></c:set>
              							</c:if>
              							<c:if test="${empty selectNo }">
              								<c:set var="selectNo" value="${option.fileId }"></c:set>
              							</c:if>
						 		</c:when>
						 	</c:choose>
						 </c:if>
					</c:forEach>
                </c:forEach>
				<ul>
					<li>
						<span>${sectionNum}<fmt:message key="symbol.stop" bundle="${bundle}"/>${question.title }</span><span>【<fmt:message key="result.multi" bundle="${bundle}"/>】</span>
					</li>
					<li>
						<c:forEach var="voteoption" items="${question.voteOptionEntities }">
							<div class="clear">
								<div class="fl">
									${voteoption.fileId }:${voteoption.title }
								</div>
								<c:if test="${isShowResult && not empty selectNo}">
								<div class="fl answer-box">
									<div class="answer-val" style="width:${myel:numFormat(voteoption.voteNum/question.voteNum * 100)}%;"></div>
								</div>
								<div class="answer-text fl"><span>${myel:numFormat(voteoption.voteNum/question.voteNum * 100)}</span>%</div>
								</c:if>
							</div>
							<c:if test="${not empty voteoption.coverPath }">
							<div>
								<img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${voteoption.coverPath}-640x360" alt="">
							</div>
							</c:if>
						</c:forEach>
						<p>
							<fmt:message key="result.your_answer" bundle="${bundle}"/>：
							<c:if test="${not empty selectNo }">
								${selectNo }
							</c:if>
							<c:if test="${empty selectNo }">
								<fmt:message key="result.unanswer" bundle="${bundle}"/>
							</c:if>	
						</p>
					</li>
				</ul>
			</c:if>
			<!-- 多选end -->
			
			<!-- 问答start -->
			<c:if test="${question.type == 3 }">
				<ul>
					<li>
						<span>${sectionNum}<fmt:message key="symbol.stop" bundle="${bundle}"/>${question.title }</span><span>【<fmt:message key="result.ask" bundle="${bundle}"/>】</span>
					</li>
					<c:set var="msg" value=''/>
                    <c:forEach items="${voteActionDetailEntities}" var="action" >
	                <c:if test="${action.questionid eq question.id}">
	                 <c:set var="msg" value="${action.optionid}"/>
	                </c:if>
	                </c:forEach>
					<li>
						<span class="answer ques_answer clear">
						<c:if test="${not empty msg }">
						<textarea class="fl search_text">${msg }</textarea>
						</c:if>
						<c:if test="${empty msg }">
						<textarea class="fl search_text"><fmt:message key="result.unfill" bundle="${bundle}"/></textarea>
						</c:if>
						</span>
					</li>
				</ul>
			</c:if>
			<!-- 问答end -->
			
			<!-- 打分start -->
			<c:if test="${question.type == 4 }">
	            <c:set var="totalScore" value="0"></c:set>
				<c:forEach var="voteoption" items="${question.voteOptionEntities}">
					<c:forEach items="${voteActionDetailEntities}" var="action" >
					 <c:if test="${action.questionid eq question.id}">
					 	<c:if test="${fn:contains(action.optionid,voteoption.id)}">
	             		 	<c:set var="yourScore" value="${voteoption.title}"></c:set>      
	                     	<c:set var="totalScore" value="${totalScore + voteoption.title}"></c:set>
	                     </c:if>
	                 </c:if>
                   </c:forEach>
                </c:forEach>
                 
                 <ul>
					<li>
						<span>${sectionNum}<fmt:message key="symbol.stop" bundle="${bundle}"/>${question.title }</span><span>【<fmt:message key="result.score" bundle="${bundle}"/>】</span>
					</li>
					<c:if test="${isShowResult && not empty yourScore}">
					<li>
						<p><fmt:message key="result.average" bundle="${bundle}"/>：${myel:numFormat(totalScore/question.voteNum )}</p>
					</li>
					</c:if>
					<li>
						<c:if test="${ not empty yourScore}">
						<p><fmt:message key="result.your_score" bundle="${bundle}"/>：${yourScore }</p>
						</c:if>
						<c:if test="${empty yourScore }">
						<p><fmt:message key="result.unanswer" bundle="${bundle}"/></p>
						</c:if>
					</li>
				</ul>
			</c:if>
			<!-- 打分end -->
			
			<!-- 填空start -->
			<c:if test="${question.type == 6 }">
					<ul class="star-title">
						<li>
							<span>${sectionNum}<fmt:message key="symbol.stop" bundle="${bundle}"/><fmt:message key="result.fillin" bundle="${bundle}"/></span>
						</li>
					</ul>
					<div>
						<c:forEach var="voteoption" items="${question.voteOptionEntities }">
							<span class="search-box">
								${voteoption.title }
								<input class="search-age" type="text" value="  ${voteoption.content }" style="width: ${voteoption.inputBoxSize*13+50}px;"/>
							</span>
							<br/>
							<br/>
						</c:forEach>
					</div>
			</c:if>
			<!-- 填空end -->
			<c:if test="${question.type != 5}">
				<c:set var="sectionNum" value="${sectionNum+1 }"></c:set>
			</c:if>
			<c:set var="selectNo" value=""></c:set>
		</c:forEach>
			</div>
		</div>
		<div class="go-exam" onclick="goBack();" style="margin-bottom:40px;">
			<fmt:message key="result.back" bundle="${bundle}"/>
		</div>
	</div>
	<script type="text/javascript">
		function goBack(){
			history.go(-1);
			window.close();
		}
	</script>
</body>
</html>     