<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>

<%
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","No-cache"); 
response.setDateHeader("Expires", -1); 
response.setHeader("Cache-Control", "No-store");
%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="format-detection" content="telephone=no" />
    <title>${chose.title }</title>
    <link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/unicom/css/liantong.css" />
    <style type="text/css">
     .addfeed{
	    display: block;
	    width: 100%;
	    border: 1px solid rgba(0, 0, 0, 0.36);
	    color: rgba(0, 0, 0, 0.87);
	    font-size: 14px;
	    padding: 8px;
	    line-height: 20px;
	    border-radius: 4px;
	    min-height: 96px;
     }
    
    </style>
</head>
<body>
    <header>
        <div class="title">
            ${item.title }
        </div>
        <span class="btn-left btn-back" onclick="backIndex('${chose.id}');"></span>
    </header>
    <section class="wrapper-static margin-top-45">
    	<input type="hidden" id="choseid" value="${chose.id }"/>
    	<input type="hidden" id="id" value="${item.id }"/>
    	<input type="hidden" id="start" value="${chose.starttime }"/>
    	<input type="hidden" id="end" value="${chose.endtime}"/>
    	<c:if test="${not empty item.cover }">
	        <div class="detail-banner">
	            <img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${item.cover}<%=Constant.QINIU_COURSE_IMG_STYLE_320_180%>" />
	        </div>
        </c:if>
        <div class="break-title break-title1">
        	<label></label><strong>成果标题:</strong>${item.title }
        </div>
		<!--
        <div class="break-title">
        	<label></label>
        	成果概述
        </div>
        -->
        <div class="detail-info-box">
            <dl>
                <dt>
                    ${item.remark }
                </dt>
                <dd>
                	<c:if test="${fn:contains(itemIds,item.id)}">
	                    <div id="box-zan" class="box-zan active">
	                        <span class="image"></span>
				        	<label class="text" id="text">已赞</label>
                        	<label id="num" class="num">${item.praisenum }</label>
	                    </div>
                    </c:if>
                    <c:if test="${!fn:contains(itemIds,item.id)}">
                    	<div id="box-zan" class="box-zan">
	                        <span class="image"></span>
				        	<label class="text" id="text">赞</label>
                        	<label id="num" class="num">${item.praisenum }</label>
	                    </div>
                    </c:if>
                    <ul>
                        <li>作者：${item.author }</li>
						<!--
                        <li>提交时间：${ltfun:dateLongToStringFormat(item.subtime,'yyyy-MM-dd') }</li>
                        -->
                        <li>部门：${item.org }</li>
                    </ul>
                </dd>
            </dl>
        </div>

        <div class="artical">
			<!--
            <div class="break-title break-title2" >
        	<label></label>
        	成果说明
        	</div>
        	-->

        	${item.content }
        </div>
        <c:if test="${user.category == 1 }">
      	    <div class="submit-box-head">
        		专家打分及评价
        	</div>
	        <div class="submit-box">

	            <ul>
	                <li>
	                    <span>成果价值（1~40）</span>
	                    <div><input type="number" id="value" value="${expertScoreLog.value }"/> </div>
	                </li>
	                <li>
	                    <span>可推广性（1~20）</span>
	                    <div><input type="number" id="generalize"  value="${expertScoreLog.generalize }"/> </div>
	                </li>
	                <li>
	                    <span>落地实施（1~20）</span>
	                    <div><input type="number" id="implement"  value="${expertScoreLog.implement }"/> </div>
	                </li>
	                <li>
	                    <span>变革创新（1~10）</span>
	                    <div><input type="number" id="innovation"  value="${expertScoreLog.innovation }"/> </div>
	                </li>
	                <li>
	                    <span>逻辑描述（1~10）</span>
	                    <div><input type="number" id="logic"  value="${expertScoreLog.logic }"/> </div>
	                </li>
	                <li>
	                    <textarea placeholder="综合评价（不少于30字）" id="comment">${expertScoreLog.comment }</textarea>
	                </li>
	            </ul>
	        </div>
        </c:if>
        <div class="submit-box-head">
       		意见反馈
       	</div>
       	<div class="submit-box">
       		<input type="hidden" id="category" value="${user.category}" />
            <textarea class="addfeed" placeholder="意见反馈" id="feedback">${expertScoreLog.feedback }</textarea>
            <ul  style="padding-top:8px;" >
       			<li>
                	<span id="btn-submit" class="btn-submit">提交</span>
                </li>
            </ul>
        </div>
    </section>
    <script type="text/javascript" src="${basepath}/static/m_h5/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="${basepath}/static/m/ext/unicom/js/module.js"></script>
    <script type="text/javascript" src="${basepath}/static/m/ext/unicom/js/chose/detail.js?v=3"></script>
</body>
</html>