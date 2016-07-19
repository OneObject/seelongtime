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
	<title>考试答案</title>
    <style type="text/css">
    	body{background:#f8f8f8;}
    </style>
    <style type="text/css">    
    	.kaoshi section.infoBox{padding:0px 12px;height:40px;line-height:40px;}
    	.kaoshi section.infoBox .change{color:#529bea;font-size:16px;}
    	.kaoshi section.infoBox span:last-child{color:#529bea;font-size:16px;cursor:pointer;}
    	.kaoshi section.questionBox{padding:0 0 54px 0;}
    	.kaoshi section.questionBox dl{padding:0 0 20px !important}
    	.kaoshi section.questionBox dt{padding:14px 8px!important;margin-bottom: 10px!important;}
    	.kaoshi section.questionBox .true dt{background:#e7f5e2;}
    	.kaoshi section.questionBox .false dt{background:#f5e9e2;}
    	.kaoshi section.questionBox .white-bg dt{background:#fff!important;}
    	.kaoshi section.questionBox dd{padding:0 8px!important; border:none !important;background: none !important;}
    	.kaoshi section.questionBox .dd-wrapper{padding:10px;-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;width: 100%;  border: 1px solid #f2f2f2;padding:10px;background:#fff;}
		.kaoshi section.questionBox .text-show{border:none;width:100%;font-size:16px;overflow:hidden;min-height:44px;word-wrap:break-word;color:#999;}
		.item-wrapper{width:100%;padding:0 8px;}
		.answer-box{width:100%;padding:8px;border-top:1px solid #e0e0e0;margin-top:30px;-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;}
		.answer-box div{color:#999;font-size:14px;line-height:22px;-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;width: 100%; }
    	.answer-box .answer{color:#529bea;}
    </style>
</head>
<body>
	
	<header class="ctl_header">
    	<div class="back"><a href="javascript:history.go(-1);" class="app_back"><i class="fa fa-angle-left"></i></a></div>
     	<span class="addWrap" id="ptitle">${exam.examName }</span>
	</header>
    <article class="kaoshi ctl_cont">
      <section class="infoBox"> 
      	<span><label class="change" id="curNum">1</label>/<label class="total" id="totalNum"></label></span>
      	<span id="model-btn" style="display:none;" onclick="changeModel(this);">只看错题</span> 
      </section>
      <section class="questionBox">
      <c:forEach items="${list }" var="testQuestion" varStatus="vs">

		  <c:set value="${testQuestion.score > 0}" var="showQScore"/>
      		
      <div class="dl-wrapper <c:out value="${ testQuestion.type eq 4? 'white-bg' :( testQuestion.answer eq testQuestion.user_answer ? 'true':'false' )}" /> ">
		
		<!-- 判断题 -->
      	<c:if test="${testQuestion.type eq 1 }">
      		<dl class="sel_dan">
	            	<dt><label class="num"></label>.${testQuestion.title }<label>（判断<c:if test="${ showQScore}"> <fmt:formatNumber type="number" pattern="###.##" value="${testQuestion.score }"/>分</c:if>）</label>
	            	</dt>
	            	<c:forEach items="${testQuestion.options }" var="option">
	            		<dd><div class="dd-wrapper"><span class="select <c:if test="${testQuestion.user_answer eq option.no }">dan</c:if>"><input type="radio" /></span><span>${option.content }</span></div></dd>
	            	</c:forEach>
	       </dl>
      	</c:if>		
      	
      	<!-- 单选题 -->
      	<c:if test="${testQuestion.type eq 2 }">
      		<dl class="sel_dan">
	            	<dt><label class="num"></label>.${testQuestion.title }<label>（单选  <c:if test="${ showQScore}"><fmt:formatNumber type="number" pattern="###.##" value="${testQuestion.score }"/>分</c:if>）</label>
	            	</dt>
	            	<c:forEach items="${testQuestion.options }" var="option">
	            		<dd><div class="dd-wrapper"><span class="select <c:if test="${testQuestion.user_answer eq option.no }">dan</c:if>"><input type="radio" /></span><span>${option.content }</span></div></dd>
	            	</c:forEach>
	        </dl>
      	</c:if>
      	
      	<!-- 多选题 -->
      	<c:if test="${testQuestion.type eq 3}">
      		<dl class="sel_duo">
	            	<dt><label class="num"></label>.${testQuestion.title }<label>（多选  <c:if test="${ showQScore}"><fmt:formatNumber type="number" pattern="###.##" value="${testQuestion.score }"/>分</c:if>）</label></dt>
	            	<c:forEach items="${testQuestion.options }" var="option">
	            		<dd>
		                	<div class="dd-wrapper">
		                		<span class="select select2 <c:if test="${fn:contains(testQuestion.user_answer, option.no)}">duo</c:if>"><input type="checkbox" /></span><span>${option.content }</span>
		                	</div>
		                </dd>
	            	</c:forEach>
	       </dl>
      	</c:if>
				
		<!-- 问答题 -->
      	<c:if test="${testQuestion.type eq 4}">
      		<!--问答题-->
	        <dl>
	            <dt><label class="num"></label>.${testQuestion.title }<label>（问答  <c:if test="${showQScore }"><fmt:formatNumber type="number" pattern="###.##" value="${testQuestion.score }"/>分</c:if>）</label></dt>
	            <dd><div class="dd-wrapper"><div class="text-show">${testQuestion.user_answer }</div></div></dd>
	        </dl>
      	</c:if>		
				
		
		<c:if test="${exam.isShowAnswer }">
			<c:choose>
				<c:when test="${testQuestion.type eq 1  }">
					<div class="answer-box">
			            	<div class="answer">正确答案：<c:out value="${testQuestion.answer eq '1' or testQuestion.answer eq 'A'  ? '正确':'错误' }" /></div>
			            	<div></div>
			        </div>
	           </c:when>
	           <c:when test="${testQuestion.type eq 4  }">
	           		<div class="answer-box">
	            		<div class="answer">您的得分：<fmt:formatNumber type="number" pattern="###.##" value="${testQuestion.user_score }"/></div>	
	                </div>	 
	           </c:when>
	           <c:otherwise>
	           		<div class="answer-box">
	            		<div class="answer">正确答案：${testQuestion.answer }</div>
	            		<div></div>
	            	</div>	
	           </c:otherwise>
	        
	        </c:choose>
		
		</c:if>
					
	 </div>
			
			     
      
      </c:forEach>
      </section>
      <section class="guideBox" id="guideBox">
          <span class="pre" id="prevBtn" onclick="prev();"><i class="fa fa-angle-left"></i>上一题</span><span class="dialogBtn"></span><span class="next" id="nextBtn" onclick="next();">下一题<i class="fa fa-angle-right"></i></span>
      </section>
    </article>
    <footer class="ctl_footer"></footer>
    <script type="text/javascript">
		var totalList;
		var trueList;
		var falseList;
		var totalListLen;
		var trueListLen;
		var falseListLen;
		var $curNum; 
		var $totalNum;
		var $prevBtn;
		var $nextBtn;
		var $guideBox;
		var curModel = 'total';  //分两种显示模式：total（显示全部），false（显示错误）  默认模式显示全部
		var curIndex = 0;  //题目索引值
		
    	$(function () {
    		totalList = $(".dl-wrapper");
    		trueList = $(".true");
    		falseList = $(".false");
    		$totalNum = $("#totalNum");
    		$curNum = $("#curNum");
    		$prevBtn = $("#prevBtn");
    		$nextBtn = $("#nextBtn");
    		$guideBox = $('#guideBox');
    		totalListLen = $(".dl-wrapper").length;
    		trueListLen = $(".true").length;
    		falseListLen = $(".false").length;
    		
    		$totalNum.text(totalListLen);
    		
			for (var i = 0; i < totalListLen; i++) {
				if (i === 0) {
					totalList[i].style.display = 'block';
				} else {
					totalList[i].style.display = 'none';
				}
			}
			mapQuestionBox(totalList);
			hidePrevBtn();  //初始隐藏上一题按钮
			if (totalListLen === 1) {
				$guideBox.hide(); 
			}
			if(falseListLen > 0 ){
				$("#model-btn").show();
			}
    	});
    	
		function changeModel(_this) {//切换查看模式
			if (_this.innerHTML === '只看错题') {
				curModel = 'false';
				showFalse();
				_this.innerHTML = '查看全部';
			} else if (_this.innerHTML === '查看全部') {
				curModel = 'total';
				showTotal();
				_this.innerHTML = '只看错题';
			}
		}
		
		function showFalse() {//显示所有的错题
			totalList.hide();  //先隐藏所有题目
			
			for (var i = 0; i < falseListLen; i++) {//显示所有错题
				if (i === 0) {
					falseList[i].style.display = 'block';
				} else {
					falseList[i].style.display = 'none';
				}				
			}
			reset();  //重置页面所有编号
		}
		
		function showTotal() {//显示所有的题目
			falseList.hide();  //先隐藏错题
			for (var i = 0; i < totalListLen; i++) {//显示所有题目
				if (i === 0) {
					totalList[i].style.display = 'block';
				} else {
					totalList[i].style.display = 'none';
				}				
			}
			reset();  //重置页面所有编号
		}
		
		function reset() {//切换模式时，重置页面所有编号
			curIndex = 0;
			if (curModel === 'false') {//只看错题模式				
				$curNum.text('1');
				$totalNum.text(falseListLen);
				mapQuestionBox(falseList);
				hidePrevBtn();
				showNextBtn();
				if (falseListLen == 1) {
					$curNum.text('1');
					hideNextBtn();
				}
			} else if (curModel === 'total') {//显示全部模式
				$curNum.text('1');
				$totalNum.text(totalListLen);
				mapQuestionBox(totalList);
				hidePrevBtn();
				showNextBtn();
				if (totalListLen === 1) {
					hideNextBtn();
				}
			}

		}
		
		function mapQuestionBox(arr){//遍历当前模式下，应该展现的题目，更改其题目编号
			var i;
			var j;
			for(i=0;i<arr.length;i++){
				j=i+1;
				$(arr[i]).find("label.num").text(j);		
			}	
		}		
		
		function prev() {//显示上一题
			var i;
			if (curModel === 'total') {//显示全部模式
				curIndex--;
				if (curIndex === 0) {
					hidePrevBtn();
				} else {
					showPrevBtn();
				}
				if (curIndex < (totalListLen - 1)) {
					showNextBtn();
				}
				$curNum.text(curIndex + 1);
				for (i = 0; i < totalListLen; i++) {
					if (i === curIndex) {
						totalList[i].style.display = 'block';
					} else {
						totalList[i].style.display = 'none';
					}
					
				}
			} else if (curModel = 'false') {//只看错题模式
				curIndex--;
				if (curIndex === 0) {
					hidePrevBtn();
				} else {
					showPrevBtn();
				}
				if (curIndex < (falseListLen - 1)) {
					showNextBtn();
				}
				$curNum.text(curIndex + 1);
				for (i = 0; i < falseListLen; i++) {
					if (i === curIndex) {
						falseList[i].style.display = 'block';
					} else {
						falseList[i].style.display = 'none';
					}
					
				}
			}
		}
		
		function next() {//显示下一题
			var i;
			if (curModel === 'total') {//显示全部模式
				curIndex++;
				if (curIndex === (totalListLen - 1)) {
					hideNextBtn();
				} else {
					showNextBtn();
				}
				if (curIndex !== 0) {
					showPrevBtn();
				}
				$curNum.text(curIndex + 1);
				for (i = 0; i < totalListLen; i++) {
					if (i === curIndex) {
						totalList[i].style.display = 'block';
					} else {
						totalList[i].style.display = 'none';
					}
					
				}
			} else if (curModel = 'false') {//只看错题模式
				curIndex++;
				if (curIndex === (falseListLen - 1)) {
					hideNextBtn();
				} else {
					showNextBtn();
				}
				if (curIndex !== 0) {
					showPrevBtn();
				}
				$curNum.text(curIndex + 1);
				for (i = 0; i < falseListLen; i++) {
					if (i === curIndex) {
						falseList[i].style.display = 'block';
					} else {
						falseList[i].style.display = 'none';
					}
				}
			}
		}
		
		function showPrevBtn(){//显示上一题按钮
			$prevBtn.show();
		}
		
		function hidePrevBtn(){//隐藏上一题按钮
			$prevBtn.hide();
		}
		
		function showNextBtn(){//显示下一题按钮
			$nextBtn.show();
		}
		
		function hideNextBtn(){//隐藏下一题按钮
			$nextBtn.hide();
		}
		
    </script>
</body>
</html>

