<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<% 
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","No-cache"); 
response.setDateHeader("Expires", -1); 
response.setHeader("Cache-Control", "No-store");
%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>${vo.title }</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=0;" name="viewport">
        <meta content="yes" name="apple-mobile-web-app-capable">
        <meta content="black" name="apple-mobile-web-app-status-bar-style">
        <meta content="telephone=no" name="format-detection">
        <link href="${basepath }/static/public/easydialog-v2.0/easydialog.css" rel="stylesheet" type="text/css">
        <link href="${basepath}/static/ixin/css/Site.css" rel="stylesheet" type="text/css">
        <link href="${basepath}/static/ixin/css/style.css" rel="stylesheet" type="text/css">
        <link href="${basepath}/static/ixin/css/easydropdown.css" rel="stylesheet" type="text/css">
        <style type="text/css">
        html,body{
        background-color: #E9EEF1;}
        .essayQuestion{
        width: 100%;
        height: 50px;
        resize:none;
        }
        .q-title {
			    color: #000000;
			    font-size: 16px;
			}
        </style>
    </head>
    <body>
        <div class="wrap" id="wrap" style="">
            <div id="head">
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
                <span class="tpnum fn-right" id="count">${vo.voteNum }人参与</span>
                <%--
                 <a class="" href="${basepath}/protal/uservote/tomyvote.xhtml?questionId=${questionId}"><c:out value="${vo.surveyOrvote==1?'':'编辑投票' }"/></a>
                --%>
             
                </h3>
               
              <div id="setnull"> 
              
                <div id="item">
                <c:set var="index" value="0"/>
                <c:forEach items="${vo.questions }" var="question" varStatus="vs">
                	<c:set var="index" value="${index+1}"/><%-- 题目序号 --%>
                	<a name="${question.id}_${question.type }"></a><%--锚点 --%>
                	<dl class="askmodel questions" data-id="${question.id}"  data-type="${question.type }"  data-must="${question.must }">
                		<dt class="ask-problem">
                		
                				<c:if test="${question.type!=5 }"><span class="q-title">${index}.${question.title }</span></c:if>
                        		<c:if test="${question.type==5 }"><span class="ask-title">${question.title }</span></c:if>
	                            <span class="ask-des"><c:if test="${question.type==1 }">（单选）</c:if><c:if test="${question.type==2 }">（多选）</c:if><c:if test="${question.type==4 }">（打分）</c:if></span>
	                     </dt>
	                     
	                 <c:choose>
	                     	<c:when test="${question.type eq 1 }"> <%--单选 --%>
	                     	<c:forEach items="${question.options }" var="singleoption" varStatus="singleovs">
		                        <dd class="ask-item single q_${question.id} " data-optionid="${singleoption.id }" >
		                        	<c:if test="${not empty singleoption.coverPath }">
		                            <div class="ask-img">
		                                <img src="${coverBasePath }${singleoption.coverPath}${suffix}" alt="xx">
		                            </div>
		                            </c:if>
		                            <div>
		                                <label class="ask-checkbox">
		                                </label>
		                                <span class="ask-option">${singleoption.title }</span>
		                            </div>
		                        </dd>
	                        </c:forEach>
	                     	</c:when>
	                     <c:when test="${question.type eq 2 }"><%--多选 --%>
	                       <c:forEach items="${question.options }" var="option" varStatus="ovs">
	                        <dd class="ask-item multi q_${question.id}" data-optionid="${option.id }"  >
	                        	<c:if test="${not empty option.coverPath }">
	                            <div class="ask-img">
	                                <img src="${coverBasePath }${option.coverPath}${suffix}" alt="xx">
	                            </div>
	                            </c:if>
	                            <div>
	                                <label class="ask-checkbox">
	                                </label>
	                                <span class="ask-option">${option.title }</span>
	                            </div>
	                        </dd>
	                       </c:forEach> 
	                     </c:when>
	                     <c:when test="${question.type eq 3}"><%--问答 --%>
	                     	<dd>
		                            <textarea class="essayQuestion q_${question.id }" style="height: 85px"></textarea>                      
		                    </dd>
	                     
	                     </c:when>
	                     <c:when test="${question.type eq 4}"><%--打分 --%>
		                      <dd>
		                      <select class="dropdown q_${question.id }"  style="width:100%;">
		                       <c:forEach items="${question.options }" var="option" varStatus="ovs">
									  <option <c:if test="${ovs.last}" > selected="selected" </c:if>	value="${option.id }">${option.title }</option>
									  <c:set var="remark" value="${option.content}"/>
	                       		</c:forEach> 
	                       	  </select>
	                       	  ${remark}
	                       	  </dd>
	                     </c:when>
	                     <c:when test="${question.type eq 5}"><%--段落 --%>
	                		<c:set var="index" value="0"/>
                		 </c:when>
                	
	                     
	                 </c:choose>
	                     
                	</dl>
                	
                </c:forEach>    
               
               
                </div>
                
                
             
                
                <div id="J_load" style="display: none;" class="tc">
                    <img src="${basepath}/static/ixin/img/load.gif" width="27px">
                </div>
                <div id="btn" class="tc" style="margin-top: 20px;">
                    <a style="" href="javascript:;" id="submitButton" class="btnGreen">提交</a>
                </div>
                
       		</div>
               
             <div class="tip" id="showpart" style="display: none;">提交成功！</div>  
                
            </div>
        </div>
         <script type="text/javascript" src="${basepath}/static/ixin/js/jquery-1.10.2.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/ixin/js/zepto.min.js"></script>
        <script src="${basepath}/static/ixin/js/selector.js" type="text/javascript"></script>
        <script type="text/javascript" src="${basepath }/static/public/easydialog-v2.0/easydialog.min.js"></script>
        <script type="text/javascript" src="${basepath }/static/ixin/js/jquery.easydropdown.js"></script>
        <script type="text/javascript" charset="utf-8">
            $(function(){
            	$('.single').click(function(){
            		var qid = $(this).parent().data("id");
            		$('.q_'+qid).removeClass('active');
            		$(this).addClass('active');
            	});
            	$('.multi').click(function(){
            		if($(this).hasClass('active')){
            			$(this).removeClass('active');
            		}else{
            			$(this).addClass('active');
            		}
            	});
            	$('#submitButton').click(function(){
            		
            		// 获取所有试题
            		var questions = $(".questions");
            		
            		if ( questions.length<1 ){
            			alert("没有题目");
            			return;
            		}
            		
            		var qObj ;
            		var data = new Object();
            		for(index=0;index<questions.length;index++){
            			qObj = $(questions.get(index));
            			
            			var qid = qObj.data("id");
            			var type = qObj.data("type");
            			var must = qObj.data("must");
            			//console.log(qid + " " + type + " " +must);
            			var opsObj = $('.q_'+qid);
            			
            			var key = qid+"_" + type;
            			//获取值
            			switch(type){
            				case 1:
            				case 2:
            					var answers ="" ;
            					for(i=0;i<opsObj.length;i++){
                        			if($(opsObj.get(i)).hasClass('active')){
                        				answers =answers + $(opsObj.get(i)).data("optionid") + ","; 
                        			}
                        		}
            					if(answers){
            						data[key] = answers;
            					}
            					break;
            				case 3:
            					if(opsObj.length>0){
            						data[key] = $(opsObj).val();
            					}
            					break;
            				case 4:
            					var answers = opsObj.val();
            					if(answers){
            						data[key] = answers
            					}
            					break;
            			} 
            			
            			if(type!=5 && must && must==1){ //必答
            				if(!data[key] ){
            					alert('你有未填写的问题');
            					window.location.hash = key;
            					return;
            				}
            				
            				
            			}
            			
            			
            		}
            		
            		var oData = {"openId":"${openId}","uid":"${uid}","voteId":"${vo.id}","domain":"${vo.domain}","answers":JSON.stringify(data)};
            		console.log(oData);
            		submitAnswer(oData);
            	});
            });
            
function submitAnswer(data){
	
	$("#btn").hide();
	$("tc").show();
	 $.ajax({
	        type: "POST",
	        url:"${basepath}/protal/uservote/saveanswer.xhtml",
	        data:data,// 要提交的表单 
	        success: function(code) {
	            //alert(msg);
	            $("tc").hide();
	            if(code==1){
	            	
		            location.href="${basepath}/protal/uservote/index.xhtml?voteId=${vo.id}&uid=${uid}";
		            
		            return;
	            }
	            if(code==-2){
	            	alert("您已经提交过");
	            	location.href="${basepath}/protal/uservote/index.xhtml?voteId=${vo.id}&uid=${uid}";
	            	return;
	            }
	            
	            alert("提交失败");
	            location.href="${basepath}/protal/uservote/index.xhtml?voteId=${vo.id}&uid=${uid}";
	        }
	    });
	
	
}            


            /**
 * 用javascript动态创建form表单，并提交数据到某个网址的示例函数
 * url: 提交数据到这个网址
 * oData: 可选，需要提交的数据对象，格式如：{a: '1', b: '2'}
 */
function jsSubmit(url, oData) {
   // var $ = function(id){return document.getElementById(id);};
   /*
    var sFormId = 'jsSubmitter',
        dForm = $(sFormId);

    if (!dForm) {  //create form
        dForm = document.createElement('form');
        dForm.id = sFormId;
        dForm.method = 'POST';
        //dForm.target = '_blank';
        dForm.style.display = 'none';
        document.body.appendChild(dForm);
    }

    dForm.innerHTML = '';   //clean
    if (typeof(oData) == 'object') {    //append data
        var dInput;
        for (key in oData) {
            dInput = document.createElement('input');
            dInput.type = 'hidden';
            dInput.name = key;
            dInput.value = oData[key];
            dForm.appendChild(dInput);
        }
    }

    dForm.action = url;
    */
   // dForm.submit();

    $.ajax({
        type: "GET",
        url:url,
        data:oData,// 要提交的表单 
        success: function(msg) {
            //alert(msg);
            $("tc").hide();
            location.href="${basepath}/protal/uservote/index.xhtml?voteId=${param.voteId}";
        }
    });
	//$("#setnull").hide();
	//$("#showpart").show();
		
}
        </script>
    </body>
</html>
<%@include file="/WEB-INF/jsp/include/student/wx.jsp"%>
<%@include file="/WEB-INF/jsp/include/analysis.jsp"%>