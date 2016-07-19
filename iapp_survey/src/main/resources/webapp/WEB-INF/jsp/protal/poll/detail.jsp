<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<!DOCTYPE HTML>
<html style="background-color:#e9eef1;">
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
    </head>
    <body >
        <div class="wrap" id="wrap" style="">
            <div class="tip" id="tip" style="display:none;">
                感谢您的参与!
            </div>
            <article class="post">
                <h1 class="post-title" id="title">${vo.title }</h1>
                <input type="hidden" id="voteId" value="${vo.voteId }"/>
                <div class="post-desc" id="votedate">
                    投票时间：<d:formatDate currentTime="${vo.startTime }" format="yyyy/MM/dd"/>~<d:formatDate currentTime="${vo.endTime }" format="yyyy/MM/dd"/>
                </div>
            </article>
            <div id="inner">
                <h3 class="tpicon"><span>投票</span><span class="tpnum fn-right" id="count"><span id="reshu">${vo.voteNum }</span>人参与投票</span></h3>
                <c:forEach items="${vo.questions }" var="q">
                <div id="item">
                    <dl class="askmodel" style="" id="timu">
                        <dt class="ask-problem">
                        	<input type="hidden" value="${q.qid }" id="questionId"/>
                            <span class="ask-title">${q.qtitle }</span><span class="ask-des">（单选）</span>
                        </dt>
                        <c:forEach items="${q.options }" var="o" varStatus="vs">
                        <dd class="ask-item" id="${o.oid }">
                            <div>
                                <label class="ask-checkbox"></label><span class="ask-option">${vs.index+1 }.${o.otitle }</span>
                            </div>
                        </dd>
                        </c:forEach>
                    </dl>
                </div>
                <div id="J_load" style="display: none;" class="tc">
                    <img src="${basepath}/static/ixin/img/load.gif" width="27px">
                </div>
                
                </c:forEach>
                <div id="result" class="tpcon" style="margin-bottom:10px;display:none;">
                    <dl class="quslist">
                        <dt class="qus-problem">
                            <span class="qus-title">请问您对本次的培训是否满意</span><span class="qus-des">(单选)</span>
                        </dt>
                        <dd class="qus-item" id="rq1">
                            <span class="qus-option">01.非常满意</span>
                            <div>
                                <span class="progress-bar bar1" data-width="36.4" style="width: 51px;"></span>
                                <span class="progress-num">36.4%</span>
                            </div>
                        </dd>
                        <dd class="qus-item" id="rq2">
                            <span class="qus-option">02.满意</span>
                            <div>
                                <span class="progress-bar bar2" data-width="36.4" style="width: 51px;"></span>
                                <span class="progress-num">36.4%</span>
                            </div>
                        </dd>
                        <dd class="qus-item" id="rq3">
                            <span class="qus-option">03.一般</span>
                            <div>
                                <span class="progress-bar bar3" data-width="25" style="width: 40px;"></span>
                                <span class="progress-num">25%</span>
                            </div>
                        </dd>
                        <dd class="qus-item" id="rq4">
                            <span class="qus-option">04.不太满意</span>
                            <div>
                                <span class="progress-bar bar4" data-width="2.3" style="width: 17px;"></span>
                                <span class="progress-num">2.3%</span>
                            </div>
                        </dd>
                    </dl>
                </div>
                <div class="tc" id="tc">
                    <a style="" href="javascript:;" id="submit" class="btnGreen">提交</a>
                </div>
            </div>
        </div>
        
         <script type="text/javascript" src="${basepath}/static/ixin/js/jquery-1.10.2.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/ixin/js/zepto.min.js"></script>
        <script src="${basepath}/static/ixin/js/selector.js" type="text/javascript"></script>
        <script type="text/javascript" src="${basepath }/static/public/easydialog-v2.0/easydialog.min.js"></script>
        <script type="text/javascript" charset="utf-8">
        
       $('.ask-item').click(function(){
    	   var objs = $('.ask-item');
    	   for(var i=0;i<objs.length;i++){
    		   $(objs.get(i)).removeClass("active");
    	   }
    	   $(this).addClass("active");
       })
       $('#submit').click(function(){
    	   var objs = $('#timu').find(".active");
    	   if(objs.length == 0){
    		   easyDialog.open({
    			   container : {
    			     content : '请选择一个选项'
    			   },
    			   autoClose : 1000
    			 });
    		   return ;
    	   }
    	   var selectOptId = $('.active').attr("id");
    	   var currentQuestionId = $('#questionId').val();
    	   var voteId = $('#voteId').val();
    	   var openId = "${param.openId}";
    	   
    	   if($.trim(openId) == ""){
    		   openId = "ajy";
    	   }
    	  // $("#submit").hide();
    	   $.ajax({
    			type: "POST",
    			url:  basepath+"/protal/poll/save.xhtml",
    			data: {"selectOptId":selectOptId,"currentQuestionId":currentQuestionId,"voteId":voteId,"openId":openId},
    			success:function(data){
    				if(data == "success"){
    					location = basepath+"/protal/poll/result.xhtml?voteId="+voteId;
    				}
    			},
    			error: function(data){
    				alert('保存失败');
    			}
    		}); 
       }) 
        </script>
    </body>
</html>
<%@include file="/WEB-INF/jsp/include/student/wx.jsp"%>
<%@include file="/WEB-INF/jsp/include/analysis.jsp"%>