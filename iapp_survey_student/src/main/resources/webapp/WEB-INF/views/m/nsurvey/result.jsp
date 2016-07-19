<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@ taglib prefix="myel" uri="http://www.longtimeit.com/taglib-elfunctions"%>
<%
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","No-cache"); 
response.setDateHeader("Expires", -1); 
response.setHeader("Cache-Control", "No-store");
%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>${surveyEntity.title}</title>
    <meta   http-equiv="Pragma"   content="no-cache">
    <meta   http-equiv="Cache-Control"   content="no-cache">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="format-detection" content="telephone=no" />
    <link type="text/css" rel="stylesheet" href="${basepath }/static/m/new/plugins/fonticon/css/font-awesome.min.css">
    <link type="text/css" rel="stylesheet" href="${basepath }/static/m/nui/css/frame.css">
    <link type="text/css" rel="stylesheet" href="${basepath }/static/m/nui/css/popup.css">
    <link type="text/css" rel="stylesheet" href="${basepath }/static/m/nui/css/ichecker/blue.css">
    <link type="text/css" rel="stylesheet" href="${basepath }/static/m/nui/css/diaoyan.css">
	<style type="text/css">
    header {width:100%;height:50px;line-height:50px;text-align:center;color:#fff;font-size:20px;position:relative;}
    header span.h_back{display:inline-block;height:50px;width:40px;line-height:50px;position:absolute;left:0px;top:0px;text-align:center;}
    header span.h_back i{font-size:22px;color:#fff;}
    </style>
</head>
<body>
<!--  
<header >
	<a href="javascript:window.history.back();"><span class="h_back"><i class="fa fa-angle-left"></i></span></a>
	${ltfun:html2Text(surveyEntity.title, 4)}
</header>
-->
<section data-scroll="false">
    <article class="container" style=" padding-bottom: 100px;">
            <div class="QN-top">
                <!--调查问卷的头部-->
                <img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${surveyEntity.coverPath}-180x180" onerror="javascript:this.src='${basepath}/static/img/study/cover_c.png'">
                 <input type="hidden" id="hid_id" value="${surveyEntity.id}">
                <div class="QN-top-left">
                    <h1>${ltfun:html2Text(surveyEntity.title, 4)} <span class="done-flag">√已参与</span></h1>
                    <span>  <c:if test="${not empty surveyEntity.startTime}">
                        ${ltfun:dateLongToStringFormat(surveyEntity.startTime,"MM-dd HH:mm")}
                        <c:if test="${not empty surveyEntity.endTime}">
                        ~
                        ${ltfun:dateLongToStringFormat(surveyEntity.endTime,"MM-dd HH:mm")}
                        </c:if>
                        </c:if>
                        
                        <c:if test="${empty surveyEntity.startTime}">
                         ${ltfun:dateLongToStringFormat(surveyEntity.endTime,"MM-dd HH:mm")}
                        </c:if>
                    </span>
                </div>
                <p>
                   ${surveyEntity.summary}
                </p>
            </div>
            
            <div class="questions-box">
            
             <c:set var="index" value="0"/>
               <c:forEach items="${surveyAndVoteQuestionVos}" var="question" varStatus="vs">
               <c:set var="index" value="${index+1}"/><%-- 题目序号 --%>
                <c:choose>
                <c:when test="${question.type eq 1 || question.type eq 2  }"> <%--单选 --%> <%--多选 --%>
                
                <div class="question-item" >
                        <h2 class="question-title">${index }.${question.title}[<c:out value="${question.type eq 1 ?'单选题':'多选题'}" />]</h2>
                        <%--计算本题所有选项所有投票数 --%>
                   		<c:forEach items="${question.voteOptionEntities}" var="option" varStatus="os">
                   			<c:set var="optionAmountVoteNum"  value="${optionAmountVoteNum+ option.voteNum}"/>
                   		</c:forEach>
                        <c:forEach var="voteoption" items="${question.voteOptionEntities}">
							<label for="${question.type}_${voteoption.id}" class="question-check-item " >
								<c:if test="${not empty voteoption.coverPath}">
									<img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${voteoption.coverPath}-180x180">
								</c:if>
								<%-- <h1>${voteoption.title}</h1><span class="done-flag">√已选择</span>--%>
								<h1>${voteoption.title}</h1>
								 <c:forEach items="${voteActionDetailEntities}" var="action" >
								 <c:if test="${action.questionid eq question.id}">
								 <c:choose>
								 <c:when test="${fn:contains(action.optionid,voteoption.id)}">
                                      <span class="done-flag">√已选择</span>								 
								 </c:when>
								 </c:choose>
								 </c:if>
								 </c:forEach>
								
								<c:if test="${optionAmountVoteNum eq 0 }">
                               <span class="progress">
                                  <span class="progress-bar" style="width: 1%;"></span><span class="progress-count">暂无人参与</span>
                               </span>
								</c:if>
								
								<c:if test="${optionAmountVoteNum ne 0 }">
								  <c:forEach items="${voteActionDetailEntities}" var="action" >
								 <c:if test="${action.questionid eq question.id}">
								 <c:choose>
								 <c:when test="${fn:contains(action.optionid,voteoption.id)}">
								 <span class="progress">
                                  <span class="progress-bar done" style="width: ${voteoption.voteNum/question.voteNum * 100}%;"></span><span class="progress-count"> ${myel:numFormat(voteoption.voteNum/question.voteNum * 100)}%</span>
                               </span>
                               </c:when>
                               <c:otherwise>
                                <span class="progress">
                                  <span class="progress-bar" style="width: ${voteoption.voteNum/question.voteNum * 100}%;"></span><span class="progress-count">${myel:numFormat(voteoption.voteNum/question.voteNum * 100)}%</span>
                               </span>
                               </c:otherwise>
                               </c:choose>
                               </c:if>
                               </c:forEach>
								</c:if>
							   
							</label>
						</c:forEach>
                </div>
                
                </c:when>
                
            <c:when test="${question.type eq 3}">
			<%--问答 --%>
			<div class="question-item">
                        <h2 class="question-title">${index }.${question.title }[问答题]</h2>
                        <c:set var="msg" value="没有填写"/>
	                    <c:forEach items="${voteActionDetailEntities}" var="action" >
		                <c:if test="${action.questionid eq question.id}">
		                 <c:set var="msg" value="${action.optionid}"/>
		                </c:if>
		                </c:forEach>
                         <label class="question-check-item" >
                          <h1>${msg}</h1>
                        </label>
              </div>
		    </c:when>
		    
		    
		    <c:when test="${question.type eq 4}">
			<%--打分 --%>
					<div class="question-item">
						<h2 class="question-title">${index }.${question.title}[打分题]</h2>
						 <c:forEach var="voteoption" items="${question.voteOptionEntities}">
						 <c:forEach items="${voteActionDetailEntities}" var="action" >
						 <c:if test="${action.questionid eq question.id}">
						 <c:if test="${fn:contains(action.optionid,voteoption.id)}">
						 <label class="question-check-item" >
                              <h1>您打的分数为：<span class="score">${voteoption.title}</span></h1>
                        </label>
                        </c:if>
                        </c:if>
                        </c:forEach>
                         </c:forEach>
					</div>
		     </c:when>

		    <c:when test="${question.type eq 5 }"> <%--段落 --%>
	             <c:set var="index" value="0"/>
	             <div class="question-item">
			      <h1 class="question-type ">${question.title}[段落]</h1>
			     </div>
	        </c:when>
                </c:choose>
               </c:forEach>
            </div>
    </article>
</section>
<script type="text/javascript" src="${basepath }/static/m/nui/js/zepto.js"></script>
<script type="text/javascript" src="${basepath }/static/m/nui/js/template.min.js"></script>
<script type="text/javascript" src="${basepath }/static/m/nui/js/frame.js"></script>
<script type="text/javascript">
    $(function(){
        initprogressbar();
    })
    function initprogressbar(){
      //  var w = $(".question-check-item").find(".progress-bar").find(".progress-count").html();
        $(".questions-box").find(".question-item").each(function(){
            $(this).find(".progress-count").each(function(){
                var c=$(this).html().split("%");
                if(parseInt(c[0])>90){
                    $(this).css({
                        left:parseInt(c[0])-10+"%",
                        color:"#fff"
                    });
                }else{
                    $(this).css({
                        left:parseInt(c[0])+5+"%"
                    });
                }
            });
        });

    }
</script>
</body>
</html>