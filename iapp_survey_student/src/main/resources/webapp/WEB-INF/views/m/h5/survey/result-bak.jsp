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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="format-detection" content="telephone=no" />
    
    <link rel="stylesheet"
	href="${basepath}/static/plugins/font-awesome-4.1.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="${basepath}/static/m_h5/css/common.css">
<link rel="stylesheet" href="${basepath}/static/m_h5/css/color.css">
<style type="text/css">
    	body{background:#f8f8f8;}
    	
    </style>
	<title>${surveyEntity.title}</title>
	<%-- 页面风格设置 --%>
<%@ include file="/WEB-INF/include/m_h5_setting.jsp"%>
</head>
<body>

	<c:set var ="showStaticSytle" value="${surveyEntity.domain eq 'syngenta'?'display:none;':''}"/>

	<%--<header class="ctl_header">--%>
	<header class="ctl_header">
    	<div class="back"><a href="javascript:history.go(-1);"><i class="fa fa-angle-left"></i></a></div>
     	<span class="addWrap" id="ptitle">${surveyEntity.title}</span>
	</header>
    <article class="survey ctl_cont">
    	<section class="infoBox">
        	<ul>
            	<li>${surveyEntity.title}</li>
                <li> <c:if test="${not empty surveyEntity.startTime && surveyEntity.startTime ne 0 }">
                        ${ltfun:dateLongToStringFormat(surveyEntity.startTime,"MM-dd HH:mm")}
                       		 <c:if test="${not empty surveyEntity.endTime && surveyEntity.endTime ne 0 }">
                       			 ~
                       			 ${ltfun:dateLongToStringFormat(surveyEntity.endTime,"MM-dd HH:mm")}
                        	</c:if>
                        </c:if>
  
                        <c:if test="${empty surveyEntity.startTime ||  surveyEntity.startTime eq 0 }">
                         ${ltfun:dateLongToStringFormat(surveyEntity.endTime,"MM-dd HH:mm")}
                        </c:if></li>
                <li>${surveyEntity.summary}</li>
            </ul>
        </section>
        <section class="resultBox">
        	<c:set var="index" value="0"/>
        	<c:forEach items="${surveyAndVoteQuestionVos}" var="question" varStatus="vs">
        		<c:set var="index" value="${index+1}"/><%-- 题目序号 --%>
        		
        		<%-- 单选 --%>
        		<c:if test="${question.type eq 1}">
            		<%--计算本题所有选项所有投票数 --%>
                   		<c:forEach items="${question.voteOptionEntities}" var="option" varStatus="os">
                   			<c:set var="optionAmountVoteNum"  value="${optionAmountVoteNum+ option.voteNum}"/>
                   		</c:forEach>
            		<dl class="result">
            		<dt>${index }.${question.title}<label>（单选）</label></dt>
            		<c:forEach var="voteoption" items="${question.voteOptionEntities}">
                		<dd>
                			<c:if test="${not empty voteoption.coverPath}">
                				<p><img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${voteoption.coverPath}-320x180"></p>
							</c:if>
                			<p>${voteoption.title}</p>
                			
                				<span class="per per1" style="text-align:left;${showStaticSytle}"><label class="a"></label><label class="b"> ${myel:numFormat(voteoption.voteNum/question.voteNum * 100)}%</label></span>
                			
                			
                			<c:forEach items="${voteActionDetailEntities}" var="action" >
								 <c:if test="${action.questionid eq question.id}">
								 	<c:choose>
										<c:when test="${fn:contains(action.optionid,voteoption.id)}">
                							<span><i class="fa fa-check"></i>已选择</span>
								 		</c:when>
								 	</c:choose>
								 </c:if>
							</c:forEach>
							
                		</dd>  
            		</c:forEach>
            		</dl>
        		</c:if>
        		<%-- 多选 --%>
        		<c:if test="${question.type eq 2}">
            		<dl class="result">
            			<dt>${index }.${question.title}<label>（多选）</label></dt>
               				<c:forEach var="voteoption" items="${question.voteOptionEntities}">
                				<dd>
                					<c:if test="${not empty voteoption.coverPath}">
                						<p><img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${voteoption.coverPath}-320x180"></p>
									</c:if>
                					<p>${voteoption.title}</p>
                					<span class="per per1" style="text-align:left;${showStaticSytle}"><label class="a"></label><label class="b"> ${myel:numFormat(voteoption.voteNum/question.voteNum * 100)}%</label></span>
                					<c:forEach items="${voteActionDetailEntities}" var="action" >
										 <c:if test="${action.questionid eq question.id}">
								 			<c:choose>
												<c:when test="${fn:contains(action.optionid,voteoption.id)}">
                									<span><i class="fa fa-check"></i>已选择</span>
								 				</c:when>
								 			</c:choose>
								 		</c:if>
									</c:forEach>
                				</dd>  
            				</c:forEach>
            		</dl>
        		</c:if>
        		<%-- 打分题目--%>
        		<c:if test="${question.type eq 4}">
            		<dl>
            			<dt>${index }.${question.title}[打分题]</dt>
            			<c:forEach var="voteoption" items="${question.voteOptionEntities}">
						<c:forEach items="${voteActionDetailEntities}" var="action" >
						 <c:if test="${action.questionid eq question.id}">
						 	<c:if test="${fn:contains(action.optionid,voteoption.id)}">
               		 			<dd>
                					你打的分数为：<label class="color">${voteoption.title}</label>
               		 			</dd>         
                        	</c:if>
                       	 </c:if>
                        </c:forEach>
                        </c:forEach>
            		</dl>
        		</c:if>
        		<%-- 问答题 --%>
        		<c:if test="${question.type eq 3}">
            		<dl>
            			<dt>${index }.${question.title }[问答题]</dt>
            			<c:set var="msg" value="没有填写"/>
	                    <c:forEach items="${voteActionDetailEntities}" var="action" >
		                <c:if test="${action.questionid eq question.id}">
		                 <c:set var="msg" value="${action.optionid}"/>
		                </c:if>
		                </c:forEach>
                		<dd>
                			<textarea disabled="true">${msg}</textarea>
               		 	</dd>       
            		</dl> 
        		</c:if>
        		<%--段落 --%>
        		<c:if test="${question.type eq 5 }"> 
        		<dl>
        			<dt class="label" ><label class="block"></label><span>${question.title}</span></dt>
        			<c:set var="index" value="${index-1}" /><%-- 题目序号 --%>
        		</dl> 
        		</c:if>
        	</c:forEach>	
            
          </section>          
    </article> 
    <footer class="ctl_footer"></footer>
 	<script type="text/javascript" src="${basepath}/static/m_h5/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript">
    	$(function(){						
			var orientationEvent;
			var supportsOrientationChange = "onorientationchange" in window;			
			//结果，控制宽度
			var wPer1=$(window).width()-116;
			var wPer=$(window).width()-168;
			
			
			$("dl .per").width(wPer);
			$("dl .per1").width(wPer1);	
			$("dl .per1 label.a").width(wPer1-43);	  
			orientationEvent = supportsOrientationChange ? "orientationchange" : "resize";   
			window.addEventListener(orientationEvent, function() {
				var wPer1=$(window).width()-116;
				var wPer=$(window).width()-168;
				//文本域自适应高度					
				$("dl textarea").css({"height":"auto"});
				
							
				$("dl .per").width(wPer);
				$("dl .per1").width(wPer1);
				$("dl .per1 label.a").width(wPer1-43);	
				showPer();

				var textH=$("dl textarea")[0].scrollHeight;	
				$("dl textarea").height(textH);		
			}, false); 
			//显示百分比
			function showPer(){
			//结果,控制宽度
			var wPer2=$(window).width()-159;
			var per=$("dl.result dd");
			var txt;
			var len;
			for(var i=0;i<per.length;i++){
				if($(per[i]).find(".per1").length){
					txt=$(per[i]).find(".per label.b").text();
					if(parseInt(txt)===0){
						$(per[i]).find("label.a").width(1);
						}else{
							len=(parseInt(txt)/100)*wPer2;
							$(per[i]).find("label.a").width(len);
							}				
					}else{
						txt=$(per[i]).find(".per+span").text();
						if(txt==="0%"){
							$(per[i]).find("label").css({width:"1px"});
							}else{
								$(per[i]).find("label").css({width:txt});
								}
						
						}			
				}
			}
			showPer();
			//文本域自适应高度		
			var textH=$("dl textarea")[0].scrollHeight;
			$("dl textarea").height(textH);
			
			
			});
    </script>
</body>
</html>
