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
        <style type="text/css">
        html,body{
        background-color: #E9EEF1;}
        .essayQuestion{
        width: 100%;
        height: 50px;
        resize:none;
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
                    参与时间：${vo.startTimeStr }~${vo.endTimeStr }
                </div>
            </article>
            <div id="inner">
                <h3 class="tpicon">
                  <span><c:out value="${vo.surveyOrvote==1?'调研':'投票' }"/></span>
                <span class="tpnum fn-right" id="count">${vo.voteNum }人参与</span></h3>
               
              <div id="setnull"> 
              
                <div id="item">
                <c:forEach items="${vo.questions }" var="question" varStatus="vs">
                <c:if test="${question.type eq 1 }">
                	<dl class="askmodel askModelSingle" id="${vs.index+1 }">
                        <dt class="ask-problem">
                            <span class="ask-title">${vs.index+1 }.${question.title }</span>
                            <input type="hidden" id="singleQuestion_${vs.index+1 }" name="singleQuestion" value="${question.id }"/>
                            <span class="ask-des">（单选）</span>
                        </dt>
                        <c:forEach items="${question.options }" var="singleoption" varStatus="singleovs">
                        <dd class="ask-item singleVote singleVote_${vs.index+1 } " lt="${singleoption.id }" lk="${vs.index+1}" k="${question.id}">
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
                    </dl>
                </c:if>
                <c:if test="${question.type eq 2 }">
                	<dl class="askmodel askModelMulti" id="${vs.index+1 }">
                        <dt class="ask-problem">
                            <span class="ask-title">${vs.index+1 }.${question.title }</span>
                            <input type="hidden" id="multiQuestion_${vs.index+1 }" name="multiQuestion" value="${question.id }"/>
                            <span class="ask-des">（多选）</span>
                        </dt>
                        <c:forEach items="${question.options }" var="option" varStatus="ovs">
                        <dd class="ask-item multiVote" lt="${option.id }" lk="${ovs.index+1}" k="${question.id}">
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
                    </dl>
                </c:if>
                
                <c:if test="${question.type eq 3}">
                    <dl class="askmodel askModelMulti" id="${vs.index+1 }">
                     <dt class="ask-problem">
                            <span class="ask-title">${vs.index+1 }.${question.title}</span>
                            <input type="hidden" id="essayQuestion_${vs.index+1}" value="${question.id }"/>
                            <span class="ask-des">（问答）</span>
                      </dt>
                      <dd>
                            <textarea id="essayQuestion_${vs.index+1}" k="${question.id}" name="essayQuestion" class="essayQuestion"></textarea>                      
                      </dd>
                    </dl>
                </c:if>
                </c:forEach>    
                </div>
                
                
             
                
                <div id="J_load" style="display: none;" class="tc">
                    <img src="${basepath}/static/ixin/img/load.gif" width="27px">
                </div>
                <div class="tc" style="margin-top: 20px;">
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
        <script type="text/javascript" charset="utf-8">
            $(function(){
            	$('.singleVote').click(function(){
            		var parentId = $(this).parent().attr("id");
            		$('.singleVote_'+parentId).removeClass('active');
            		$(this).addClass('active');
            	});
            	$('.multiVote').click(function(){
            		if($(this).hasClass('active')){
            			$(this).removeClass('active');
            		}else{
            			$(this).addClass('active');
            		}
            	});
            	$('#submitButton').click(function(){
            		//alert("${param.voteId}");
					var singleReqObjs = $('.askModelSingle').find('.active');
                    var flag=false;
                    $("textarea").each(function(){
                            if($.trim($(this).val())==null || $.trim($(this).val())==""){
                                alert('你有未填写的问答题');
                                flag=true;
                                }
                        });
                    if(flag==true){
                        return;
                        }
					if(singleReqObjs.length < "${singleNumber}"){
						alert('你有未选中的选项');
						return;
					}
					if($('.askModelMulti').find('.active').length<'${multiNumber}'){
						alert('你有未选中的选项');
						return;
					}
					var askItems = $('.ask-item');
            		var requestStr = "";
            		for(i=0;i<askItems.length;i++){
            			if($(askItems.get(i)).hasClass('active')){
            				requestStr += $(askItems.get(i)).attr('lt')+":"+$(askItems.get(i)).attr('lk')+":"+$(askItems.get(i)).attr("k")+',';
            			}
            		}
            		var oData = new Object();
            		oData.openId="${openId}";
            		oData.voteId = "${param.voteId}";
                    var content="";
                    $("textarea").each(function(){
                            content=content+$(this).val()+":"+$(this).attr("k")+",";
                        });
                    if(content!=""){
                      oData.content=content;
                        }
            		oData.requestStr = requestStr;
            		jsSubmit("${basepath}/protal/uservote/save.xhtml",oData);
            	});
            });
            
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