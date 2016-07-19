<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<% 
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","No-cache"); 
response.setDateHeader("Expires", -1); 
response.setHeader("Cache-Control", "No-store");

long currentTime = System.currentTimeMillis();
pageContext.setAttribute("currentTime", currentTime);

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
<link rel="stylesheet" href="${basepath}/static/m_h5/css/common.css?v=20141114">
<link rel="stylesheet" href="${basepath}/static/m_h5/css/color.css">
<style type="text/css">
    	body{background:#f8f8f8;}
    </style>
    <style type="text/css">
		.subing{color:#999;border-color:#999;}
    </style>
<title>${surveyEntity.title}</title>
<%-- 页面风格设置 --%>
<%@ include file="/WEB-INF/include/m_h5_setting.jsp"%>
</head>
<body>
	<%--<header class="ctl_header">--%>
	<header class="ctl_header">
    	<div class="back"><a href="javascript:history.go(-1);"><i class="fa fa-angle-left"></i></a></div>
     	<span class="addWrap" id="ptitle">${surveyEntity.title}</span>
	</header>
    <article class="survey ctl_cont" >
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
        <section class="questionBox">
        	<div class="qHead">
            	<span>调研</span>
                <span>${surveyEntity.voteNum}人参与</span>
            </div>
             <%--list列表 --%>
         	<c:if test="${(currentTime > surveyEntity.startTime || surveyEntity.startTime ==0) && (currentTime < surveyEntity.endTime || surveyEntity.endTime ==0) }">
            <c:set var="index" value="0" />
            <c:forEach var="question" items="${list}" varStatus="vs">
            <c:set var="index" value="${index+1}" /><%-- 题目序号 --%>
            <!--单选题，无图片-->
            	<c:if test="${question.type eq 1 }">
					<dl class="sel_dan questions"  data-id="${question.id}"  data-type="${question.type }"  data-must="${question.must }">
						<dt>
							${index}.${question.title }<label>（单选）</label>
						</dt>
						<c:forEach var="voteoption" items="${question.voteOptionEntities}">
							<dd class="q_${question.id}"  data-optionid="${voteoption.id}">
								<c:if test="${not empty voteoption.coverPath}">
									<p><img
										src="<%=Constant.IMG_SERVER_DOWNLOAD%>${voteoption.coverPath}-320x180">
									</p>
								</c:if>
								<span class="select"><input type="radio" /></span><span>${voteoption.title}</span>
							</dd>
						</c:forEach>
					</dl>
				 </c:if>
				 
				 <!-- 多选题 -->
            	<c:if test="${question.type eq 2 }">
					<dl class="sel_duo questions" data-index="${index}" data-max="${question.maxChooseNum }" data-min="${question.minChooseNum }" data-id="${question.id}"  data-type="${question.type }"  data-must="${question.must }">
						<dt>
							${index}.${question.title }<label>（多选）
							<c:if test="${question.maxChooseNum!=0&& question.minChooseNum != question.maxChooseNum}">
								最多选择${question.maxChooseNum}项
							</c:if>
							<c:if test="${question.minChooseNum!=0 && question.minChooseNum != question.maxChooseNum}">
								,至少选择${question.minChooseNum}项
							</c:if>
							<c:if test="${question.minChooseNum!=0 && question.maxChooseNum!=0 && question.minChooseNum == question.maxChooseNum}">
								必须且只能选择${question.minChooseNum}项
							</c:if>
							</label>
						</dt>
						<c:forEach var="voteoption" items="${question.voteOptionEntities}">
							<dd class="q_${question.id}"  data-optionid="${voteoption.id}">
								<c:if test="${not empty voteoption.coverPath}">
									<p><img
										src="<%=Constant.IMG_SERVER_DOWNLOAD%>${voteoption.coverPath}-320x180">
									</p>
								</c:if>
								<span class="select select2"><input type="checkbox" /></span><span>${voteoption.title}</span>
							</dd>
						</c:forEach>
					</dl>
				 </c:if>
            	<!--打分题-->
           		<c:if test="${question.type eq 4}">
            		<dl class="grade questions"  data-id="${question.id}"  data-type="${question.type }"  data-must="${question.must }">
            		<dt>${index}.${question.title }<label>（打分）</label></dt>
                	<dd class="q_${question.id}">
                		<c:forEach var="voteoption" items="${question.voteOptionEntities}">
								<label  data-optionid="${voteoption.id}">${voteoption.title}</label>
						</c:forEach>
                	</dd>                             
            		</dl>  
            	</c:if> 
            	<!--问答题-->
           		<c:if test="${question.type eq 3}">
            		<dl class="questions"  data-id="${question.id}"  data-type="${question.type }"  data-must="${question.must }">
            		<dt>${index}.${question.title }</dt>
                	<dd >
                		<textarea class="q_${question.id}"></textarea>
                	</dd>                             
            		</dl>  
            	</c:if> 
            	
            	<!--段落-->
           		<c:if test="${question.type eq 5}">
            		<dl class="questions" style="height:auto;line-height:18px;padding-bottom:0px;"  data-id="${question.id}"  data-type="${question.type }"  data-must="${question.must }">
            		<dt class="label"><label class="block"></label><span>${question.title }</span></dt>
            		</dl>
            		<c:set var="index" value="${index-1}" /><%-- 题目序号 --%>
            	</c:if> 
            </c:forEach>
          </c:if>  
        </section>
           <c:if test="${not empty done }">
	          	  <section class="msgBox">
        			<p>您已经参加过了</p>        	
        			</section>
            </c:if>
            <c:if test="${empty done }">
            	<c:if test="${empty list }">
	          		<section class="msgBox">
        			<p>没有题目</p>        	
        			</section>
            	</c:if>
            	<c:if test="${ currentTime < surveyEntity.startTime && surveyEntity.startTime != 0 }">
	          		<section class="msgBox">
        			<p>调研未开始</p>        	
        			</section>
            	</c:if>
            	<c:if test="${ currentTime > surveyEntity.endTime && surveyEntity.endTime != 0 }">
	          		<section class="msgBox">
        			<p>调研已结束</p>        	
        			</section>
            	</c:if>
            	
            </c:if>
           <c:if test="${not empty done }">
            	<section class="submit">
            	
                <span onclick="toDetail();">查看详情</span>
		    			
	          	</section>	
            </c:if>
            
            <c:if test="${(currentTime > surveyEntity.startTime || surveyEntity.startTime ==0) && (currentTime < surveyEntity.endTime || surveyEntity.endTime ==0) }">
        		<c:if test="${empty done }">
        			<section class="submit">
        				<span class="submit_btn">提交</span>    
        			</section>
            	</c:if>
            </c:if>
    </article> 
    <footer class="ctl_footer"></footer>
 	<script type="text/javascript" src="${basepath}/static/m_h5/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript">
    	$(function(){						
			var orientationEvent;
			var supportsOrientationChange = "onorientationchange" in window;			
			//打分题，控制宽度		
			var windowW=$(window).width()-86;
			var w=Math.floor(windowW/5);
			var arr=$("dl.grade dd label");		
			for(var i=0;i<arr.length;i++){
				$(arr[i]).height(w).width(w).css({"line-height":w+"px"});
				if((i+1)%5==0){
					$(arr[i]).css({"margin-right":"0px"});
					}
				}
			//结果，控制宽度
			var wPer=$(window).width()-168;
			$("dl .per").width(wPer);		  
			orientationEvent = supportsOrientationChange ? "orientationchange" : "resize";   
			window.addEventListener(orientationEvent, function() {
				//打分题，控制宽度
				var windowW=$(window).width()-86;
				var w=Math.floor(windowW/5);
				var arr=$("dl.grade dd label");
				for(var i=0;i<arr.length;i++){
				$(arr[i]).height(w).width(w).css({"line-height":w+"px"});
				if((i+1)%5==0){
					$(arr[i]).css({"margin-right":"0px"});
					}
				}
				//结果,控制宽度
				var wPer=$(window).width()-168;
				$("dl .per").width(wPer);
				showPer();		
			}, false); 
			//显示百分比
			function showPer(){
			var per=$("dl.result dd");
			var txt;
			for(var i=0;i<per.length;i++){
				txt=$(per[i]).find(".per+span").text();
				$(per[i]).find("label").css({width:txt});
				}
			}
			showPer();
			//打分题	
			$("dl.grade dd label").click(function(event){
				var $la=$(this);
				if($la.is(".cur")){
					$la.removeClass("cur");
					}else{
						$la.addClass("cur").siblings("label").removeClass("cur");
						}
						event.stopPropagation();
				});
				
			//单选题
			$("dl.sel_dan dd").click(function(event){
				var $op=$("span.select",this);
				if($op.is(".dan")){
					$op.removeClass("dan");	
					$op.find(":radio").attr("checked",false);		
					}else{
						$op.addClass("dan").closest("dd").siblings("dd").find("span.select").removeClass("dan").find(":radio").attr("checked",false);	
						$op.find(":radio").attr("checked",true);
						}
						event.stopPropagation();		
				});
			//多选题
			$("dl.sel_duo dd").click(function(event){
				var $op=$("span.select",this);
				if($op.is(".duo")){
					$op.removeClass("duo");	
					$op.find(":checkbox").attr("checked",false);		
					}else{
						$op.addClass("duo").find(":checkbox").attr("checked",true);	
						}
						event.stopPropagation();		
				});
			//文本域自适应高度		
			$("dl textarea").bind("propertychange input",function(){
					this.style.height=this.scrollHeight+'px';
				});
			//ios文本框获得焦点时，fixed bug
			if (/ipad|iphone/i.test(navigator.userAgent)){
				$("dd textarea").focus(function(){
					$("header").css({"position":"absolute"});			
					});
				$("dd textarea").blur(function(){
					$("header").css({"position":"fixed"});			
					});
			}
			//文本域获得焦点时，安卓手机页面重新定位				
			if (/android/i.test(navigator.userAgent)){
				var judge=isWeiXin();	
				if(!judge){
					$("html,body").css({"width":"100%","height":"100%","overflow":"scroll"});
					$("article.survey section.submit").css({"padding-bottom":"60px"});
					$("textarea").bind("focus",function(event){
					var h=$(this).offset().top-80;
					$("html,body").animate({scrollTop:h},1000);
					event.stopPropagation();
					});	
					}else{
						//微信，重定位 未测试
						$("textarea").bind("focus",function(event){
						var h=$(this).offset().top-60;
						$("html,body").animate({scrollTop:h},1000);
						event.stopPropagation();	
						});	
						}	
				}							
			});
    	function isWeiXin(){
			var ua = window.navigator.userAgent.toLowerCase();
			if(ua.match(/MicroMessenger/i) == 'micromessenger'){
				return true;
			}else{
				return false;
			}
		}

    	$(".submit_btn").click(function(event){
    		showSubing();
    		inform();	
			});
    </script>
    
   <script type="text/javascript">
function inform(){
	// 获取所有试题
		var questions = $(".questions");

		
		if ( questions.length<1 ){
			alert('没有题目');
			showSubmit();
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

			var chooseNum = 0;
			
			//获取值
			switch(type){
				case 1:
						var answers ="" ;
						for(i=0;i<optionObj.length;i++){
	          			if($(optionObj.get(i)).find(".select").hasClass("dan")){
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
          			if($(optionObj.get(i)).find(".select").hasClass("duo")){
          				answers =answers + $(optionObj.get(i)).data("optionid") + ",";
          				chooseNum++; 
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
					var answers = $(optionObj).find(".cur").data("optionid");
					if(answers){
						data[key] = answers
					}
					break;
			} 
			if(type==2){
				var index1 = qObj.data("index");
				var max = qObj.data("max");
				var min = qObj.data("min");
				if(min!=0 && chooseNum < min){
					alert("第"+index1+"题最少要选择"+min+"个选项");
					showSubmit();
					return;
				}
					//alert(index+":"+max);
					//alert(index+":"+chooseNum);
				if(max!=0 && chooseNum > max){
					alert("第"+index1+"题最多只能选择"+max+"个选项");
					showSubmit();
					return;
				}
			
			}
			if(type!=5 && must && must==1){ //必答
				if(!data[key] ){
					alert('你有未填写的问题');
					window.location.hash = key;
					showSubmit();
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
	            	showSubmit();
	            	location.href="${basepath}/m/ixin/nsurvey/index.xhtml?voteId=${surveyEntity.id}"
		            return;
	            }
	            if(code==-3){
	            	alert("答案不能为空");
	            	showSubmit();
	            	location.href="${basepath}/m/ixin/nsurvey/index.xhtml?voteId=${surveyEntity.id}"
	            	return;
	            }
	            
	            alert("提交失败");
	            showSubmit();
	            location.href="${basepath}/m/ixin/nsurvey/index.xhtml?voteId=${surveyEntity.id}"
	        },
	        error:function(){
		        alert("提交失败[请检查网络]");
		        showSubmit();
		        }
	    });
}   

function toDetail(){
	location.href="${basepath}/m/ixin/nsurvey/result.xhtml?voteId=${surveyEntity.id}";
}

//提交中...	
function showSubing(){
	$(".submit_btn").html('提交中...<i class="fa fa-spinner fa-spin" style="margin-left:10px;font-size:18px;"></i>');
	$(".submit_btn").addClass("subing");			
	}
//提交按钮
function showSubmit(){			
	$(".submit_btn").html('提交');
	$(".submit_btn").removeClass("subing");	
	}
</script>
</body>
</html>
