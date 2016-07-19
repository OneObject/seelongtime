<%@page import="com.longtime.common.dao.IdGenerator"%>
<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%><%--需重再一次导入 --%>
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

	<title>${examination.examName }</title>
    <style type="text/css">
    	body{background:#f8f8f8;}
    	.kaoshi section.infoBox{padding:0px 12px;height:32px;line-height:32px;}
    	.kaoshi section.infoBox .change{color:#529bea;font-size:16px;}
    	.kaoshi section.infoBox span:last-child{color:#529bea;font-size:16px;}
    </style>
    <script type="text/javascript">
	    var uid = '${uid}';
		var test_id = '${tid }';
    	var uuidNo = '${uuidNo}';
    	var flag = true;
    </script>
</head>
<body>
	<%--<header class="ctl_header">--%>
	<header class="ctl_header">
    	<div class="back"><a href="javascript:history.go(-1);" class="app_back"><i class="fa fa-angle-left"></i></a></div>
     	<span class="addWrap" id="ptitle">${examination.examName }</span>
	</header>
    <article class="kaoshi ctl_cont">
      <section class="infoBox"> <span><label class="change">1</label>/<label class="total"></label></span><!-- <span onclick="post_answer_cache();">保存答案</span> --><span id="formatTime">00:00:00</span> </section>
       <form action="${basepath }/m/h5/exam/savetestinfo.xhtml" id="form" method="post">
       <input type="hidden" name="sbt_token" value="<%=IdGenerator.uuid32()%>"/><%--用于解决重复提交， 如果有session中有，则认为重复提交 --%>
      <section class="questionBox">
      <c:forEach items="${quesetions }" var="item" varStatus="st">
      
      <!-- 判断题 或者 单选题 -->
      	<c:if test="${item['type'] eq 1 or item['type'] eq 2}">
            <dl class="sel_dan questiones">
            	<dt><label class="num"></label>.${item['title'] }<label>
            	<c:if test="${item['type'] eq 1}">
            		(判断题)
			    </c:if>
			    <c:if test="${item['type'] eq 2}">
			        (单选题)
			     </c:if></label></dt>
			     <c:forEach items="${item['options'] }" var="option">
                	<dd><span class="select"><input type="radio" name="${item['id'] }"  id="${item['id'] }_${option['no'] }" value="${option['no'] }" /></span><span>${option['content'] }</span></dd>
            	 </c:forEach>
            </dl>
      	</c:if>
        <!--多选题-->
        <c:if test="${item['type'] eq 3}">
            <dl class="sel_duo questiones" id="${item['id'] }">
            	<dt><label class="num"></label>.${item['title'] }&nbsp;&nbsp;[${item['score'] }分]<label>（多选）</label></dt>
                <c:forEach items="${item['options'] }" var="option">
                <dd><span class="select select2"><input type="checkbox" name="${item['id'] }" id="${item['id'] }_${option['no'] }"  value="${option['no'] }"/></span><span>${option['content'] }</span></dd>
                </c:forEach>             
            </dl>
        </c:if>
         <!--问答题-->
        <c:if test="${item['type'] eq 4}">
        	<c:set value="1" var="hasMulti"></c:set>
            <dl class="questiones">
            	<dt><label class="num"></label>.${item['title'] }&nbsp;&nbsp;[${item['score'] }分]</dt>
                <dd><textarea name="${item['id'] }" id="${item['id'] }"></textarea></dd>             
            </dl>
        </c:if>
      </c:forEach>
            
            
            
      </section>
        <input type="hidden" id="preview" value='<c:out value="${preview }"></c:out>'>
	    <input type="hidden" name="tid" value="${exam['id'] }">
	    <input type="hidden" name="ids" value="${ids}">
	    <input type="hidden" name="uid" value="${uid}">
	    <input type="hidden" name="start_time" value="${start_time }" id="start_time">
	    <input type="hidden" name="score_total" value="${exam['score_total'] }">
	    <input type="hidden" name="score_pass" value="${exam['score_pass'] }">
	    <input type="hidden" name="hasMulti" value="${hasMulti}">
	    <input type="hidden" id="end_time" value="${examination.endTime}">
	    <input type="hidden" id="exam_time" value=${examination.examDate }>
	    <input type="hidden" id="use_time" value=${use_time }>
      </form>
      <section class="guideBox">
          <span class="pre"><i class="fa fa-angle-left"></i>上一题</span><span class="dialogBtn">交卷</span><span class="next">下一题<i class="fa fa-angle-right"></i></span>
      </section>
    </article>
    <footer class="ctl_footer"></footer>

	<input type="hidden" id="url" value="${basepath}/m/h5/exam/detail.xhtml?tid=${tid}&fdomain=${examination.domain}">

    <script type="text/javascript" src="${basepath}/static/m_h5/js/myDialog.js?v=1"></script>
    <script type="text/javascript">
    	var answers = new Array();//答案
    	$(function(){
			//通用页面初始化模块						
			var orientationEvent;
			var supportsOrientationChange = "onorientationchange" in window;			
			//打分题，控制宽度		
			var windowW=$(window).width()-86;
			var w=Math.floor(windowW/5);
			var arr=$("dl.grade dd label");	
			var totalTime = parseInt($('#exam_time').val()) * 60-parseInt($("#use_time").val())/1000;
			if(totalTime<0){
				totalTime = 0;
			}
			var $formatTime = $('#formatTime');
			var interId = setInterval(function () {
				if (totalTime > 0) {
					totalTime--;
					$formatTime.html(hms(totalTime));
				} else {
					clearInterval(interId);
					showMyDialog("考试时间已到，提交试卷。","ok");
				}
			}, 1000);
			$formatTime.html(hms(totalTime));
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
			
				/*获取用户已经保存在cache中的答案*/
				$.ajax({
					type:"POST",
					async:false,
					url:basepath+"/m/h5/exam/getcacheuseranswer.json",
					data:{"uuidNo":uuidNo},
					success:function(data){
						if(data != null && data != ""){
							get_answered_questions(data);
						}
					}
				});
				
				//开始考试倒计时  到时间就提交试卷移动端暂时没开放    放开注释就OK了 
				//startExcuteTime();
				
				/*
				设置定时器，会定时提交答案
				*/
				var do_time = 100000;
				setInterval(function(){
					post_answer_cache();
				},do_time);
				
				/*第三个定时器，保存答卷已经使用掉的时间*/
				var while_time = 1000*60;
				setInterval(function(){
					sava_lost_time(while_time);
				},while_time);
				
				//窗口关闭事件
				window.onbeforeunload = function (){	 
					sava_lost_time(1000 * 60); //1分钟
				};
				
				
				//------
				var qArr=[];
				var len;
				var first;
				qArr=$(".questionBox dl");
				len=qArr.length;
				$(".kaoshi .infoBox label.total").text(len);
				mapQuestionBox(qArr);
				$(".questionBox dl:first").css({ "display": "block" }).siblings("dl").css({ "display": "none" });
				$(".kaoshi .infoBox label.change").text($(".questionBox dl[style*='block'] dt label.num").text());
				first = $(".questionBox dl[style*='block']");
				checkBtnShow(first)
				//点击下一题
				$(".guideBox span.next").click(function(){
					var num;
					var judge=$(".questionBox dl[style*='block']").next("dl[style*='none']").length;
					var that;
					if(judge){
						that=$(".questionBox dl[style*='block']").next("dl[style*='none']");
						checkBtnShow(that);
						$(".questionBox dl[style*='block']").next("dl[style*='none']").css({"display":"block","padding-top":"0px"}).end().css({"display":"none"});
						num=$(".questionBox dl[style*='block'] dt label.num").text();
						$(".kaoshi .infoBox label.change").text(num);
						}						
					});
				//点击上一题
				$(".guideBox span.pre").click(function(){
					var num;
					var judge=$(".questionBox dl[style*='block']").prev("dl[style*='none']").length;
					var that;
					if(judge){
						that=$(".questionBox dl[style*='block']").prev("dl[style*='none']");
						checkBtnShow(that);
						$(".questionBox dl[style*='block']").prev("dl[style*='none']").css({"display":"block","padding-top":"0px"}).end().css({"display":"none"});
						num=$(".questionBox dl[style*='block'] dt label.num").text();
						$(".kaoshi .infoBox label.change").text(num);
						}							
					});
				//点击提交
				$(".guideBox span.dialogBtn").click(function(){				
					showMyDialog("你确定交卷吗？","yes");	
					});
			});
			
		function isWeiXin(){
			var ua = window.navigator.userAgent.toLowerCase();
			if(ua.match(/MicroMessenger/i) == 'micromessenger'){
				return true;
			}else{
				return false;
			}
		}

		function startExcuteTime(){
			var start_time = parseInt($("#start_time").val());//开始时间（ms）
			var end_time = parseInt($("#end_time").val());//结束时间 （ms）
			var exam_time =  parseInt($("#exam_time").val())*60*1000;//考试时长 （ms）
			var preview = $("#preview").val();
			if(preview!="1"){
				setInterval(function(){
					var current_time = get_end_time();//每一分钟不停的获取当前时间
						//alert(start_time+"  "+end_time + "   "+exam_time);
						console.log(current_time+"当前时间,考试结束时间"+end_time);
						if(current_time >= end_time){
							//提交答案
							//showMyDialog('考试结束时间已到，是否提交试卷？', 'autoSubmit');
						}
						if((current_time - start_time)>=exam_time){
							//提交答案
							showMyDialog("考试时长已经超过要求时间，将提交试卷。","ok");
							$("#form").submit();
							clearInterval();
						}
					},60000);
				}
			}
		
		function get_end_time(){
			var myDate = new Date();   
			//myDate.getTime();       //获取当前时间(从1970.1.1开始的毫秒数)    
			//var end_time = myDate.getTime();
			return myDate.getTime();
		}
		
		function hms(num) {//格式化时间
			var h = parseInt(num % (24 * 60 * 60) / (60 * 60));
			var m = parseInt(num % (24 * 60 * 60) % (60 * 60) / 60);
			var s = parseInt(num % (24 * 60 * 60) % (60 * 60) % 60);
			if (h < 10) {
				h = "0"  + h;
			}
			if (m < 10) {
				m = "0"  + m;
			}
			if (s < 10) {
				s = "0"  + s;
			}
			return h + ":" + m + ":" + s;
		}
		
		/**
		 * 获取已经答过的题目并恢复答案
		 * 这项工作是在页面加载的时候完成的
		 * 分三种情况来搞
		 * 第一种就是单选和判断，一个是题目id另外一个是value
		 * 第二种是多选题，题目的答案是数组，但是拿到的是题目id，还有value的数组
		 * 第三种就是问答题题目的id，还有value
		 */
		function get_answered_questions(obj){
			for(var i= 0;i<obj.length;i++){
				if(obj[i].type == 2){
					replay_checkbox(obj[i].id,obj[i].answer);
				}else if(obj[i].type == 1){
					replay_radio(obj[i].id,obj[i].answer);
				}else if(obj[i].type == 3){
					replay_textarea(obj[i].id,obj[i].answer);
				}
			}
		}
		function replay_radio(id,answer){
			var item = $("#"+id+"_"+answer);
			$(item).click();
		}
		function replay_checkbox(id,answer){
			var aws = answer.split(",");
			for(var i= 0;i<aws.length;i++){
				var item = $("#"+id+"_"+aws[i]);
				$(item).click();
			}
		}
		function replay_textarea(id,answer){
			var item = $("#"+id);
			$(item).html(answer);
		}
		
		/**
		 * 缓存已答题答案
		 */
		function post_answer_cache(){
			answers = [];
			get_radio_answer();
			get_checkbox_answer();
			get_textarea_answer();
			$.ajax({
				type:"POST",
				url:basepath+"/m/h5/exam/cacheuseranswer.json",
				data:{"uuidNo":uuidNo,"answers":JSON.stringify(answers)},
				success:function(data){
					
				}
			});
		}

		/**
		 * 数据库保存已经使用掉的时间
		 */
		function sava_lost_time(data_time){
			var lost_time=data_time;
			$.ajax({
				type:"POST",
				url:basepath+"/m/h5/exam/saveanswertime.json",
				data:{"test_id":test_id,"uid":uid,"time":lost_time},
				success:function(data){
					
				}
			});
		}
		
		//获取radio答案
		function get_radio_answer(){
			var timu = $(".questiones").find("input[type='radio']:checked");
			for(var i = 0;i<timu.length;i++){
				var pram = new Object();
				pram.id=$(timu[i]).attr("name");
				pram.type = 1;
				pram.answer = $(timu[i]).val();
				answers.push(pram);
			}
		}
		//获取checkbox答案
		function get_checkbox_answer(){
			var timu = $(".questiones").find("input[type='checkbox']:checked");
			var ids = "";
			/*去掉重复id*/
			for(var i = 0 ; i < timu.length ; i++){
				var id = $(timu[i]).attr("name");
				if(ids.indexOf(id)<0){
					ids += id+",";
				}
			}
			/*通过id遍历选框*/
			var idss= ids.split(",");
			for(var i = 0 ; i <idss.length; i++){
				if(idss[i]!="" && idss[i] !=null){
					var pram = new Object();
					pram.id = "";
					pram.answer = "";
					pram.id = idss[i];
					pram.type = 2;
					var anw = $("#"+idss[i]).find("input[type='checkbox']:checked");
					
					for(var j=0;j<anw.length;j++){
						pram.answer = pram.answer + $(anw[j]).val()+","; 
					}
					answers.push(pram);
				}
			}
			return true;
		}
		//获取textarea的答案
		function get_textarea_answer(){
			var timu = $(".questiones").find("textarea");
			for(var i = 0;i<timu.length;i++){
				var pram = new Object();
				pram.id=$(timu[i]).attr("name");
				pram.type = 3;
				pram.answer = $(timu[i]).val();
				answers.push(pram);
			}
		}

    </script>
    <script type="text/javascript">
 		//函数集合
		//显示上一题按钮
		function showPre(){
			$(".guideBox span.pre").show();
			}
		//显示下一题按钮
		function showNext(){
			$(".guideBox span.next").show();
			}
		//隐藏上一题按钮
		function hidePre(){
			$(".guideBox span.pre").hide();
			}
		//隐藏下一题按钮
		function hideNext(){
			$(".guideBox span.next").hide();
			}
		//显示错误提示框
		function showErrorMsg(){
			var html='<div class="errorMsg">回答错误</div>';
			$("article.kaoshi section.questionBox").append(html);
			}
		//隐藏错误提示框
		function hideErrorMsg(){
			$("article.kaoshi section.questionBox div.errorMsg").remove();
			}
		//遍历所有题目，排序所有题目	
		function mapQuestionBox(_arr){
			var arr=_arr;
			var i;
			var j;
			for(i=0;i<arr.length;i++){
				j=i+1;
				$(arr[i]).find("dt label.num").text(j);		
				}	
			}		
		//控制按钮的显示	
		function checkBtnShow(_this){
		    var prev = $(_this).prev("dl").length;
		    var next = $(_this).next("dl").length;
		    if(!!prev){
		        showPre();
		    } else {
		        hidePre();
		    }
		    if (!!next) {
		        showNext();
		    } else {
		        hideNext();
		    }
		}   
    </script>    
    <script type="text/javascript">
		//练习逻辑模块
		//遍历所有题目
			var fsubmit = 0;
	        function handleSub(){
                if(fsubmit == 1){
                        alert("提交中...");
                        return;
                }
                fsubmit = 1;
                var preview = $("#preview").val();
                if(preview == "1"){
                    showMyDialog("预览时不允许提交。","ok");
                }else{
                    $("#form").submit();
                }
                fsubmit = 0;
	        }  
	        
	        function clickOk(){
                if(fsubmit == 1){
                      alert("提交中...");
                      return;
                }
                fsubmit = 1;
                $("#form").submit();
                $("body .dialogBg").remove();
                $("body .dialogBox").remove();
                fsubmit = 0;
	        }
	</script>
</body>
</html>
