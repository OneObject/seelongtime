<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
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
    <meta charset="UTF-8">
    <title>${surveyEntity.title}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="format-detection" content="telephone=no" />
    <link type="text/css" rel="stylesheet" href="${basepath }/static/m/new/plugins/fonticon/css/font-awesome.min.css">
    <link type="text/css" rel="stylesheet" href="${basepath }/static/m/nui/css/frame.css">
    <link type="text/css" rel="stylesheet" href="${basepath }/static/m/nui/css/popup.css">
    <link type="text/css" rel="stylesheet" href="${basepath }/static/m/nui/css/ichecker/blue.css">
    <link type="text/css" rel="stylesheet" href="${basepath }/static/m/nui/css/diaoyan.css">
    <link rel="stylesheet" href="${basepath }/static/m_h5/css/common.css" >
    <link rel="stylesheet" href="${basepath }/static/m_h5/css/color.css" >
    <style type="text/css">
    header {width:100%;height:50px;line-height:50px;text-align:center;color:#fff;font-size:20px;position:relative;}
    header span.h_back{display:inline-block;height:50px;width:40px;line-height:50px;position:absolute;left:0px;top:0px;text-align:center;}
    header span.h_back i{font-size:22px;color:#fff;}
    </style>
</head>
<body>
<!--  
<header >
	<a href="javascript:goBack();"><span class="h_back"><i class="fa fa-angle-left"></i></span></a>
	${ltfun:html2Text(surveyEntity.title, 4)}
</header>
-->
<section data-scroll="true" >
	
    <article class="container">
            <div class="QN-top">
                <!--调查问卷的头部-->
                <img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${surveyEntity.coverPath}-180x180" onerror="javascript:this.src='${basepath}/static/img/study/cover_c.png'">
                 <input type="hidden" id="hid_id" value="${surveyEntity.id}">
                <div class="QN-top-left">
                    <h1>${ltfun:html2Text(surveyEntity.title, 4)}</h1>
                        <span>
                       <c:if test="${not empty surveyEntity.startTime && surveyEntity.startTime ne 0 }">
                        ${ltfun:dateLongToStringFormat(surveyEntity.startTime,"MM-dd HH:mm")}
                       		 <c:if test="${not empty surveyEntity.endTime && surveyEntity.endTime ne 0 }">
                       			 ~
                       			 ${ltfun:dateLongToStringFormat(surveyEntity.endTime,"MM-dd HH:mm")}
                        	</c:if>
                        </c:if>
  
                        <c:if test="${empty surveyEntity.startTime ||  surveyEntity.startTime eq 0 }">
                         ${ltfun:dateLongToStringFormat(surveyEntity.endTime,"MM-dd HH:mm")}
                        </c:if>
                        </span>
                </div>
                <p>
                     ${surveyEntity.summary}
                </p>
            </div>
            <%--list列表 --%>
            <c:if test="${not empty done }">
            	<div id="nothing">
		    			<h1 class="nothing">您已经参加过了</h1>
	          		</div>
            </c:if>
            <c:if test="${empty done }">
            	<c:if test="${empty list }">
	        		<div id="nothing">
		    			<h1 class="nothing">没有题目</h1>
	          		</div>
            	</c:if>
            </c:if>
            <c:set var="index" value="0" />
            <div class="questions-box">
             <c:forEach var="question" items="${list}">
            <c:set var="index" value="${index+1}" /><%-- 题目序号 --%>
            <c:choose>
            
            <c:when test="${question.type eq 1 or  question.type eq 2}">
			<%--单选 --%><%--多选 --%>
			<div class="question-item" data-id="${question.id}"  data-type="${question.type }"  data-must="${question.must }">
                        <h2 class="question-title">${index }.${question.title }</h2>
                        
                        
                        <c:forEach var="voteoption" items="${question.voteOptionEntities}">
							<label for="${question.type}_${voteoption.id}" class="question-check-item q_${question.id}" data-optionid="${voteoption.id}">
								<c:if test="${not empty voteoption.coverPath}">
									<img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${voteoption.coverPath}-180x180">
								</c:if>
								<input type="${question.type==1 ? 'radio':'checkbox'}" 
								 		id="${question.type}_${voteoption.id}" name="ok">
								<span>${voteoption.title}</span>
							</label>
						</c:forEach>
             </div>
		</c:when>
               <c:when test="${question.type eq 3}">
			<%--问答 --%>
			<div class="question-item" data-id="${question.id}"  data-type="${question.type }"  data-must="${question.must }">
                        <h2 class="question-title">${index }.${question.title }</h2>
                        <input type="text" class="q_${question.id}" placeholder="输入内容" style="width: 100%;height: 50px;" id="ceshi">
             </div>
		</c:when>
		<c:when test="${question.type eq 4}">
			<%--打分 --%>
					<div class="question-item" data-id="${question.id}"  data-type="${question.type }"  data-must="${question.must }">
						<h2 class="question-title">${index }.${question.title}</h2>
						<div class="scoreCard q_${question.id}" data-id="${question.id}">
							<c:forEach var="voteoption"
								items="${question.voteOptionEntities}">
								<div class="tapCard qe_${question.id}" data-optionid="${voteoption.id}">${voteoption.title}</div>
							</c:forEach>
						</div>
					</div>
		</c:when>
		<c:when test="${question.type eq 5}">
			<%--段落 --%>
			<c:set var="index" value="0" />
			<div class="question-item" data-id="${question.id}"  data-type="${question.type }"  data-must="${question.must }">
			<h1 class="question-type ">${question.title }</h1>
			</div>
		</c:when>
                 </c:choose>
            </c:forEach>
            </div>
           
             <c:if test="${not empty done }">
            	<div id="nothing">
                <span class="button light block" style="margin-bottom:65px;" onclick="toDetail();">查看详情</span>
		    			
	          		</div>
            </c:if>
            <div class="refresh-box">
            <c:if test="${empty done }">
            	
                <span class="button light block" style="margin-bottom:65px;">提交</span>
            </c:if>
            </div>
    </article>
</section>
<script type="text/javascript" src="${basepath }/static/m/nui/js/zepto.js"></script>
<script type="text/javascript" src="${basepath }/static/m/nui/js/template.min.js"></script>
<script type="text/javascript" src="${basepath }/static/m/nui/js/frame.js"></script>

<script type="text/javascript">
    $(function(){
        $('input[type="radio"]').attr("style","opacity: 0;").wrap('<div class="iradio_square-blue" style="margin-right: 10px;margin-top: -6px;"></div>');
        $('input[type="checkbox"]').attr("style","opacity: 0;").wrap('<div class="icheckbox_square-blue" style="margin-right: 10px;margin-top: -6px;"></div>');
        settapCards();
        $("label").tap(function(){
            switch ($(this).find("input").attr("type")){
                case  "radio" :
                    toggleRadio($(this).find("input"));
                    break;
                case  "checkbox" :
                    toggleCheckbox($(this).find("input"));
                    break;

            }
        });
    })
    function toggleRadio(_this){
        if($(_this).attr("checked")){
            var names =  $(_this).attr("name");
            $(_this).parents(".question-item").find("input[name='"+names+"']").each(function(){
                $(this).removeAttr("checked");
                $(this).parent().removeClass("checked");
            });
            $(_this).attr("checked",true);
            $(_this).parent().addClass("checked");
        }
    }
    function toggleCheckbox(_this){
        if(!$(_this).attr("checked")){
            setTimeout(function(){
                $(_this).attr("checked",true);
                $(_this).parent().addClass("checked");
            },100);

        }else{
            setTimeout(function(){
                $(_this).removeAttr("checked");
                $(_this).parent().removeClass("checked");
            },100)

        }
    }
    function settapCards(){
        var w=$(document).width();
        $(".tapCard").css("width",(w-53)/5+"px");
        $(".tapCard").css("height",(w-53)/5+"px");
        $(".tapCard").css("line-height",(w-53)/5+"px");
        $(".scoreCard").each(function(){
        	var cards = $(this).find(".tapCard");
        	if(cards.length <=5){
                for(var i =1;i<=5;i++){
                    if(i==5){
                        $(cards[i]).css("margin-left","0px");
                    }else{
                        $(cards[i]).css("margin-left","5px;");
                    }
                }
            }else if(cards.length>5){
                for(var i =1;i<=10;i++){
                    if(i==5 || i == 10){
                        $(cards[i]).css("margin-left","0px");
                        $(cards[i]).css("margin-bottom","5px");
                    }else{
                        $(cards[i]).css("margin-left","5px;");
                        $(cards[i]).css("margin-bottom","5px");
                    }
                }
            }
        });
        
        
    }
    $(".tapCard").tap(function(){
       var id=$(this).parent().data("id");
        $(".scoreCard").find(".qe_"+id).each(function(){
            $(this).removeClass("selectednew");
        });
        $(this).addClass("selectednew");
    });

    $(".refresh-box").on("tap",function(){
    	inform();
        });
</script>
<script type="text/javascript">
function inform(){
	// 获取所有试题
		var questions = $(".question-item");

		
		if ( questions.length<1 ){
			alert('没有题目','info');
			return;
		}
		
		var qObj ;
		var data = new Object();
		for(index=0;index<questions.length;index++){
			qObj = $(questions.get(index));
			
			var qid = qObj.data("id");
			var type = qObj.data("type");
			var must = qObj.data("must");

            var optionObj=$(".q_"+qid);
			
			var key = qid+"_" + type;

			//获取值
			switch(type){
				case 1:
						var answers ="" ;
						for(i=0;i<optionObj.length;i++){
	          			if($(optionObj.get(i)).find(".iradio_square-blue").hasClass("checked")){
	          				answers =answers + $(optionObj.get(i)).data("optionid") + ","; 
	          			}
	          		  }
						if(answers){
							data[key] = answers;
						}
						break;
				case 2:
					var answers ="" ;
					for(i=0;i<optionObj.length;i++){
          			if($(optionObj.get(i)).find(".icheckbox_square-blue").hasClass("checked")){
          				answers =answers + $(optionObj.get(i)).data("optionid") + ","; 
          			}
          		}
					if(answers){
						data[key] = answers;
					}
					break;
				case 3:
					if(optionObj.length>0){
						data[key] = $(optionObj).val();
					}
					break;
				case 4:
					var answers = $(optionObj).find(".selectednew").data("optionid");
					if(answers){
						data[key] = answers
					}
					break;
			} 
			
			if(type!=5 && must && must==1){ //必答
				if(!data[key] ){
					alert('你有未填写的问题','info');
					window.location.hash = key;
					return;
				}
				
				
			}
			
			
		}
		var oData = {"uid":"${uid}","voteId":"${surveyEntity.id}","domain":"${surveyEntity.domain}","answers":JSON.stringify(data)};
		submitAnswer(oData);
	}

function submitAnswer(data){
	 $.ajax({
	        type: "POST",
	        url:"${basepath}/m/ixin/nsurvey/saveanswer.json",
	        data:data,// 要提交的表单 
	        success: function(code) {
	            if(code==1){
		            location.href="${basepath}/m/ixin/nsurvey/result.xhtml?voteId=${surveyEntity.id}";
		            return;
	            }
	            if(code==-2){
	            	alert("您已经提交过");
	            	location.href="${basepath}/m/ixin/nsurvey/index.xhtml?voteId=${surveyEntity.id}"
	            	return;
	            }
	            if(code==-3){
	            	alert("答案不能为空");
	            	location.href="${basepath}/m/ixin/nsurvey/index.xhtml?voteId=${surveyEntity.id}"
	            	return;
	            }
	            
	            alert("提交失败");
	            location.href="${basepath}/m/ixin/nsurvey/index.xhtml?voteId=${surveyEntity.id}"
	        },
	        error:function(){
		        alert("error");
		        }
	    });
}   

function toDetail(){
	location.href="${basepath}/m/ixin/nsurvey/result.xhtml?voteId=${surveyEntity.id}";
}

function goBack(){
	var type = getUrlParam("location");
	var url = "";
	var activityId = getUrlParam("activityId");
	//投票列表页
	if(type=="vote" && activityId==""){
		url = url+"${basepath}/m/ixin/vote/votelist.xhtml";
		window.location.href = url;
	//调研列表页
	}else if(type=="survey" && activityId==""){
		url = url+"${basepath}/m/ixin/vote/surveylist.xhtml";
		window.location.href = url;
	//series列表页
	}else if(activityId!=null&&activityId!=""&&type!="activity"){
		var t = getUrlParam("type");
		 <%-- url = url+"${basepath}/m/ixin/vote/serieslist.xhtml?location=series&type="+t+"&activityId="+activityId; --%>
		url = url+ "${basepath}/m/h5/vote/index?location=series&type="+t+"&activityId="+activityId;
		window.location.href = url;
	//活动关联内容页
	}else if(type=="activity"){
		url = url +"${basepath}/m/ixin/activity/detaildispatch.xhtml?id="+activityId;
		window.location.href = url;
	//栏目关联内容页
	}else {
		window.history.back();
	}
	
}

function getUrlParam(name){
	var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
	var r = window.location.search.substr(1).match(reg);  //匹配目标参数
	if (r!=null) return unescape(r[2]); return null; //返回参数值
} 
</script>
</body>
</html>