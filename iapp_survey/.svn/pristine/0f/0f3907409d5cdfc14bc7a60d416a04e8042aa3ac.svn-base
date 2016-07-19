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
        </style>
    </head>
    <body>
        <div class="wrap" id="wrap" style="">
            <article class="post">
                <h1 class="post-title" id="title">${vo.title }</h1>
                <div class="post-desc" id="votedate">
                   ${surveyOrvote }时间：${vo.startTimeStr }~${vo.endTimeStr }
                </div>
            </article>
            <div id="inner">
                <h3 class="tpicon"><span>${surveyOrvote }</span><span class="tpnum fn-right" id="count">${vo.voteNum }人参与投票</span></h3>
                <div id="result" class="tpcon" style="margin-bottom:10px;">
                <c:forEach items="${vo.questions }" var="question" varStatus="vs">
                    <dl class="quslist" id="timu1">
                        <dt class="qus-problem">
                            <span class="qus-title">${vs.index+1 }.${question.title }</span>
                            <span class="qus-des">
                            	<c:if test="${question.type == 1 }">（单选）</c:if>
                            	<c:if test="${question.type == 2 }">（多选）</c:if>
                            	<c:if test="${question.type==3 }">（问答）</c:if>
                            </span>
                        </dt>
                        <c:if test="${question.type eq 3 }">
                        <c:forEach items="${question.options}" var="option">
                        <dd class="qus-item">
                        <span class="qus-option" style="display:block;overflow:hidden;border-bottom:1px dashed #eaeaea; height:30px;line-height:30px;font-size:12px;">${option.content}</span>
                        </dd>
                        </c:forEach>
                        </c:if>
                        
                        <c:if test="${question.type ne 3 }">
                        <c:forEach items="${question.options }" var="option" varStatus="os">
                        <dd class="qus-item">
                        	<c:if test="${not empty option.coverPath }">
                          	<div>
                          		<img src="${coverBasePath }${option.coverPath}${suffix}" alt="xx">
                            </div>
                            </c:if>
                            <span class="qus-option">0${os.index+1 }.${option.title }</span>
                            <div>
                                <c:if test="${question.voteNum == 0 }">
	                            	<span class="progress-bar bar1" data-width="1" style="width: 1%;"></span>
	                                <span class="progress-num">
	                                	暂无人参与</span>
                            	</c:if>
                            	<c:if test="${question.voteNum !=0 }">
	                            	<span class="progress-bar bar1" data-width="${option.voteNum/question.voteNum * 100}" style="width: ${option.voteNum/question.voteNum * 100 +5 }%;"></span>
	                                <span class="progress-num">
	                                ${myel:numFormat(option.voteNum/question.voteNum * 100) }%</span>
                            	</c:if>
                            </div>
                        </dd>
                        </c:forEach>
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