<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="format-detection" content="telephone=no" />
    
	<title>${practice.name }</title>
    <style type="text/css">
    	body{background:#f8f8f8;}
    </style>
</head>
<body>
	<header class="ctl_header">
    	<div class="back"><a href="javascript:history.go(-1);" class="app_back"><i class="fa fa-angle-left"></i></a></div>
     	<span class="addWrap" id="ptitle">${practice.name }</span>
	</header>
    <article class="kaoshi ctl_cont">	
      <section class="infoBox"> <span>练习共<label class="total"></label>题</span><span>当前第<label class="change">1</label>题</span> </section>
      <section class="questionBox">
        <c:forEach items="${questions }" var="question" varStatus="vs">
       	  <c:if test="${ question.type eq 2}">
            <dl class="sel_dan">
            	<dt><label class="num"></label>.${question.title }<label>（单选）</label></dt>
                <c:forEach items="${question.options }" var="option" varStatus="ovs">
                	<dd class="${question.answer eq option.no ?'right':''}"><span class="select"><input type="radio" /></span><span>${option.content }</span></dd>
                </c:forEach>
            </dl>
          </c:if>
          <c:if test="${ question.type eq 3}">
            <dl class="sel_duo">
            	<dt><label class="num"></label>.${question.title }<label>（多选）</label></dt>
            	<c:forEach items="${question.options }" var="option" varStatus="ovs">
                	<dd class="${fn:contains(question.answer,option.no)==true?'right':''}"><span class="select select2"><input type="checkbox" /></span><span>${option.content }</span></dd>
                </c:forEach>
            </dl>
          </c:if>
        </c:forEach>
            
          
           
            
            
      </section>
      <section class="guideBox">
          <span class="pre"><i class="fa fa-angle-left"></i>上一题</span><span class="dialogBtn" >查看结果</span><span class="next">下一题<i class="fa fa-angle-right"></i></span>
      </section>
    </article>
    <footer class="ctl_footer"></footer>
    
       <script type="text/javascript" src="${basepath}/static/m_h5/js/myDialog.js"></script>

    <script type="text/javascript">
    	$(function(){
			//通用页面初始化模块						
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
    </script>
    <script type="text/javascript"> 		
 		var total=0;
 		var corr=0;
 		var checked = 0;    //统计判断了几次
        var curNum = 0; //当前题号
        var had = false;    //是否已答完全部题目
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
		//显示交卷选项
		function showDialogBtn() {
		    $("article.kaoshi .guideBox span.dialogBtn").show();
		}
        //隐藏交卷选项
		function hideDialogBtn() {
		    $("article.kaoshi .guideBox span.dialogBtn").hide();

		}
		//给正确的选项描边
		function showCorrect(_this){
			$(_this).find("dd.right").addClass("correct");
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
				$(".guideBox span.next").html('下一题<i class="fa fa-angle-right"></i>');
		        //用于考试模块
				//hideNext();				
		    }
		}
        //判断该题正误
		function checkRight(_this) {
		    var rightLen = $(_this).find("dd.right").length;
		    var selectLen;
			var allSelect;
		    var judge1 = $(_this).find(":radio").length;
		    var judge2 = $(_this).find(":checkbox").length;
		    var htmla = '<span class="i a"><i class="fa fa-times"></i></span>';
		    var htmlb = '<span class="i b"><i class="fa fa-check"></i></span>';
		    checked++;
		    if (!!judge1) {
		        selectLen = $(_this).find("dd.right span.dan").length;
				allSelect = $(_this).find("dd span.dan").length;
		    }
		    if (!!judge2) {
		        selectLen = $(_this).find("dd.right span.duo").length;
				allSelect = $(_this).find("dd span.duo").length;
		    }
		    if (rightLen === 0) {
		        return true;
		    }
		    if (rightLen === selectLen && rightLen===allSelect ) {
		        $(_this).find("dt").append(htmlb);
		        showCorrect(_this);
		        corr++;
		        return true;
		    } else {
		        showMyDialog("该题回答有误！", "ok");
		        $(_this).find("dt").append(htmla);
		        showCorrect(_this);
		       	return false;
		        
		    }
		}					
    </script>    
    <script type="text/javascript">
		//练习逻辑模块
		//遍历所有题目
		$(function(){
			var qArr=[];
			var len;
			var first;
			qArr=$(".questionBox dl");
			len=qArr.length;
			total = len;
			hideDialogBtn();
			$(".kaoshi .infoBox label.total").text(len);
			mapQuestionBox(qArr);
			$(".questionBox dl:first").css({ "display": "block" }).siblings("dl").css({ "display": "none" });
			$(".kaoshi .infoBox label.change").text($(".questionBox dl[style*='block'] dt label.num").text());
			first = $(".questionBox dl[style*='block']");
			checkBtnShow(first)
			//点击下一题
			$(".guideBox span.next").click(function(){
				var num;
				var len=$(".questionBox dl").length;
				var judge = $(".questionBox dl[style*='block']").next("dl[style*='none']").length;
				var cur = $(".questionBox dl[style*='block']");
				var that;
				var isRight;
				var checkedLen=$(".questionBox dl[style*='block'] span.dan").length || $(".questionBox dl[style*='block'] span.duo").length;
				
				if(!checkedLen){
					showMyDialog("请选择答案！","ok");	
					return;
					}
			    //友好模式
				if (cur.find("dd.correct").length) {
				    isRight = true;
				} else {
				    isRight = checkRight(cur);
				}				
                //严厉模式
			    //isRight=checkRight(cur);
			    if (!!judge & isRight) {
					that=$(".questionBox dl[style*='block']").next("dl[style*='none']");
					checkBtnShow(that);
					$(".questionBox dl[style*='block']").next("dl[style*='none']").css({"display":"block","padding-top":"0px"}).end().css({"display":"none"});
					num=$(".questionBox dl[style*='block'] dt label.num").text();
					$(".kaoshi .infoBox label.change").text(num);
					
					}
			    if (checked === len && !had) {
			        showDialogBtn();
			        hideNext();
			        had = true;
			    }
			    if (had) {
			        curNum = $(".questionBox dl[style*='block'] dt label.num").text();
			        if (parseInt(curNum) !== len) {
			            showNext();
			        } else {
			            hideNext();
			        }
			    }								
				});
			//点击上一题
			$(".guideBox span.pre").click(function(){
				var num;
				var judge=$(".questionBox dl[style*='block']").prev("dl[style*='none']").length;
				var that;
				$(".guideBox span.next").html('下一题<i class="fa fa-angle-right"></i>');				
				if(!!judge){
					that=$(".questionBox dl[style*='block']").prev("dl[style*='none']");
					checkBtnShow(that);
					$(".questionBox dl[style*='block']").prev("dl[style*='none']").css({"display":"block","padding-top":"0px"}).end().css({"display":"none"});
					num=$(".questionBox dl[style*='block'] dt label.num").text();
					$(".kaoshi .infoBox label.change").text(num);
					}							
				});
			//点击提交
			$(".guideBox span.dialogBtn").click(function(){				
				//showMyDialog();
				result();				
				});
			});	

		function result(){
			window.location.href="${basepath}/m/h5/practice/result.xhtml?pid=${practiceid}&courseid=${courseid}&total="+total+"&corr="+corr;	
		}	
	</script>
</body>
</html>
