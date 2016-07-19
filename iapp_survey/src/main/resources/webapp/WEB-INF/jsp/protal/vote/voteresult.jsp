<%@page import="com.longtime.app.ixin.protal.WXOauthFilter.Util"%>
<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<%@ taglib prefix="myel" uri="http://www.longtimeit.com/taglib-elfunctions"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>${vo.title }</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport">
        <meta content="yes" name="apple-mobile-web-app-capable">
        <meta content="black" name="apple-mobile-web-app-status-bar-style">
        <meta content="telephone=no" name="format-detection">
         <link href="${basepath }/static/public/easydialog-v2.0/easydialog.css" rel="stylesheet" type="text/css">
        <link href="${basepath}/static/ixin/css/Site.css" rel="stylesheet" type="text/css">
        <link href="${basepath}/static/ixin/css/style.css" rel="stylesheet" type="text/css">
        <link href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
        <style type="text/css">
            .button2 {
                font-size: 16px;
                padding: 8px 0;
                border: 1px solid #adadab;
                color: #000000;
                background-color: #e8e8e8;
                background-image: linear-gradient(to top, #dbdbdb, #f4f4f4);
                box-shadow: 0 1px 1px rgba(0, 0, 0, 0.45), inset 0 1px 1px #efefef;
                text-shadow: 0.5px 0.5px 1px #fff;
                width: 100%;
            }
            .tpcon {
                font-size: 14px;
                margin-bottom: 10px;
            }
            .tpcon img {
                max-width: 100%;
                text-align: center;
            }
            .tpcon p {
                padding: 3px 0;
            }
            .tpcon ol, .tpcon ul {
                padding: 5px 0;
            }
            .tpcon ol li {
                list-style: decimal inside;
                padding-left: 10px;
            }
            .tpcon ul li {
                list-style: disc inside;
                padding-left: 10px;
            }
            .q-title {
			    color: #000000;
			    font-size: 18px;
			}
        </style>
    </head>
    <body>
        <div class="wrap" id="wrap" style="">
            <div class="tip" id="tip">
                感谢您的参与!
            </div>
            <article class="post">
                <h1 class="post-title" id="title">${vo.title }</h1>
                <div class="post-desc" id="votedate">
                <c:if test="${not empty vo.startTimeStr  or not empty  vo.endTimeStr }">
                    参与时间：${vo.startTimeStr }~${vo.endTimeStr }
                </c:if>
                </div>
                <c:if test="${not empty vo.summary }">
                <div class="post-desc" id="votedate">
                    ${vo.summary }
                </div>
                </c:if>
            </article>
            <div id="inner">
                <h3 class="tpicon">
                <span><c:out value="${vo.surveyOrvote==1?'调研评估':'投票' }"/></span>
                <span class="tpnum fn-right" id="count">${vo.voteNum }人参与</span></h3>
                <div id="result" class="tpcon" style="margin-bottom:10px;">
                <c:set var="index" value="0"/>
                <c:forEach items="${vo.questions }" var="question" varStatus="vs">
                	<c:set var="index" value="${index+1}"/><%-- 题目序号 --%>
                	
                
                    <dl <c:if test="${question.type!=5}">class="quslist"</c:if> id="timu1">
                        <dt class="qus-problem">
                        	<c:if test="${question.type!=5 }"><span class="q-title">${index}.${question.title }</span></c:if>
                        	<c:if test="${question.type==5 }"><span class="qus-title">${question.title }</span></c:if>
                            <span class="qus-des">
                            	<c:if test="${question.type == 1 }">（单选）</c:if>
                            	<c:if test="${question.type == 2 }">（多选）</c:if>
                            	<c:if test="${question.type==3 }">（问答）</c:if>
                            	<c:if test="${question.type==4 }">（打分）</c:if>
                            </span>
                        </dt>
                        
                 
           <c:if test="${vo.domain=='guoyao' }">   
                 
                        <c:choose>
	                     	<c:when test="${question.type eq 1 || question.type eq 2  }"> <%--单选 --%> <%--多选 --%>
	                     		<c:forEach items="${question.options }" var="option" varStatus="os">
		                        	<dd class="qus-item">
			                        	<c:if test="${not empty option.coverPath }">
			                          	<div>
			                          		<img src="${coverBasePath }${option.coverPath}${suffix}" alt="xx">
			                            </div>
			                            </c:if>
			                            <span class="qus-option">
			                            ${option.title }
			                             <c:forEach items="${actionlist}" var="action" >
		                         			<c:if test="${action.questionid eq question.id}">
		                         				<c:if test="${fn:contains(action.optionid,option.id) }"><i class="fa fa-check-circle " style="color:green;font-size:20px"></i></c:if>
				                          	</c:if>
				                         </c:forEach>
			                            </span>
			                            <%--
			                            <div>
			                                <c:if test="${question.voteNum == 0 }">
				                            	<span class="progress-bar bar1" data-width="1" style="width: 1%;"></span>
				                                <span class="progress-num">
				                                	暂无人参与</span>
			                            	</c:if>
			                            	<c:if test="${question.voteNum !=0 }">
				                            	<span class="progress-bar bar1" data-width="${option.voteNum/question.voteNum * 100}" style="width: ${option.voteNum/question.voteNum * 100}%;"></span>
				                                <span class="progress-num">
				                                ${myel:numFormat(option.voteNum/question.voteNum * 100) }%</span>
			                            	</c:if>
			                            </div>
			                             --%>
			                        </dd>
			                        
                        		</c:forEach>
	                     	</c:when>
	                     	<c:when test="${question.type eq 3 }"> <%--问答 --%>
	                     		<c:set var="msg" value="<span class='qus-des'>没有填写</span>"/>
	                     		 <c:forEach items="${actionlist}" var="action" >
		                         <c:if test="${action.questionid eq question.id}">
		                         <c:set var="msg" value="<span class='qus-option'>${action.optionid}</span>"/>
		                         
		                          </c:if>
		                          </c:forEach>
		                          <dd class="qus-item">
		                          ${msg}
		                          </dd>
	                     	</c:when>
	                     	<c:when test="${question.type eq 4 }"> <%--打分 --%>
	                     		<c:forEach items="${question.options }" var="option" varStatus="os">
			                            <c:forEach items="${actionlist}" var="action" >
		                         			<c:if test="${action.questionid eq question.id}">
		                         				<c:if test="${fn:contains(action.optionid,option.id) }">打分:&nbsp;<strong style="color: green;font-size: 18px">${option.title } 分</strong></c:if>
				                          	</c:if>
				                         </c:forEach>
                        		</c:forEach>
	                     	
	                     	</c:when>
	                     	<c:when test="${question.type eq 5 }"> <%--段落 --%>
	                     		<c:set var="index" value="0"/>
	                     	</c:when>
	                     	
	                    </c:choose> 	
                        
                 </c:if>       
                
                <c:if test="${vo.domain!='guoyao' }">
            		
            		<c:choose>
	                     	<c:when test="${question.type eq 1 || question.type eq 2 || question.type eq 4 }"> <%--单选 --%> <%--多选 --%><%--打分 --%>
	                     		<c:set var="optionAmountVoteNum"  value="0"/>
	                     		<%--计算本题所有选项所有投票数 --%>
	                     		<c:forEach items="${question.options }" var="option" varStatus="os">
	                     			<c:set var="optionAmountVoteNum"  value="${optionAmountVoteNum+ option.voteNum}"/>
	                     		</c:forEach>
	                     	
	                     		<c:forEach items="${question.options }" var="option" varStatus="os">
		                        	<dd class="qus-item">
			                        	<c:if test="${not empty option.coverPath }">
			                          	<div>
			                          		<img src="${coverBasePath }${option.coverPath}${suffix}" alt="xx">
			                            </div>
			                            </c:if>
			                            <span class="qus-option">${option.title }</span>
			                            <div>
			                                <c:if test="${optionAmountVoteNum == 0 }">
				                            	<span class="progress-bar bar1" data-width="1" style="width: 1%;"></span>
				                                <span class="progress-num">
				                                	暂无人参与</span>
			                            	</c:if>
			                            	<c:if test="${optionAmountVoteNum !=0 }">
				                            	<span class="progress-bar bar1" data-width="${option.voteNum/optionAmountVoteNum * 100}" style="width: ${option.voteNum/question.voteNum * 100}%;"></span>
				                                <span class="progress-num">
				                                ${myel:numFormat(option.voteNum/optionAmountVoteNum * 100) }%</span>
			                            	</c:if>
			                            </div>
			                        </dd>
			                        
                        		</c:forEach>
	                     	</c:when>
	                     	<c:when test="${question.type eq 3 }"> <%--问答 --%>
	                     		 <c:forEach items="${actionlist}" var="action" >
		                         <c:if test="${action.questionid eq question.id}">
		                         <dd class="qus-item">
		                          <span class="qus-option">[我的回答]${action.optionid}</span>
		                          </dd>
		                          </c:if>
		                          </c:forEach>
	                     	</c:when>
	                     	<c:when test="${question.type eq 4 }"> <%--打分 --%>
	                     	</c:when>
	                     	<c:when test="${question.type eq 5 }"> <%--段落 --%>
	                     		<c:set var="index" value="0"/>
	                     	</c:when>
	                     	
	                    </c:choose> 	
            		
            		</c:if>
            		
            		
            		
                       
                       
                    </dl>   
                       
                        
                        
                        
                    
                    
                    </c:forEach>
                </div>
                <div id="J_load" style="display: none;" class="tc">
                    <img src="${basepath}/static/ixin/img/load.gif" width="27px">
                </div>
            </div>
        </div>
         <script type="text/javascript" src="../js/jquery-1.10.2.min.js"></script>
         <script type="text/javascript" charset="utf-8">
         $(document).ready(function(){
             var ca=getQueryString("anw");
             var canshu = ca.split(",");
             for (var i=0; i < canshu.length; i++) {
                 if(canshu[i]!=""){
                   $("#result").find("#"+canshu[i]).addClass("selected");  
                 }
               
             };
         });    
         function getQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
         }

         </script>
    </body>
</html>
<%@include file="/WEB-INF/jsp/include/student/wx.jsp"%>
<%@include file="/WEB-INF/jsp/include/analysis.jsp"%>