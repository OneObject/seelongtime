<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%><%--需重再一次导入 --%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="format-detection" content="telephone=no" />
    
	<title>答题结果</title>
    
</head>
<body>
	<header class="ctl_header">
    	<div class="back"><a href="javascript:history.go(-2);"><i class="fa fa-angle-left"></i></a></div>
     	<span class="addWrap" id="ptitle">答题结果</span>
	</header>
	<input type="hidden" id="uid" value='<c:out value="${uid }"></c:out>'/>
    <input type="hidden" id="tid" value="${exam.id }"/>
    <article class="kaoshi ctl_cont" style="overflow:hidden;">
      <section class="infoBox infoBox1">本次答题结果</section>
      <section class="questionBox" style="padding-bottom:40px;">
			<ul class="score">
			    <c:if test="${domain eq 'SMG' }">
			    	<li>您本次客观题得分</li>
                	<li><c:out value="${score }"></c:out></li>
                	<li class="a">回答正确：<label>${rightNum }</label>题</li>
                	<li class="b">回答错误：<label>${wrongNum }</label>题</li>
       			 </c:if>
       			 
       			 <c:if test="${domain ne 'SMG' }">
	        		<c:choose>
	        			<c:when test="${hasMulti ne 1 }">
	        				<c:if test="${exam.isShowScore }">
	        					<li>考试得分</li>
                				<li><c:out value="${score_str }"></c:out></li>
	        					<c:if test="${score ge score_pass }"><li>恭喜您通过了本次考试！</li></c:if>
				                <c:if test="${score lt score_pass }"><li>本次考试未通过，继续努力！</li></c:if>
	        				</c:if>
	        				 <c:if test="${!exam.isShowScore }">
				                  <li>请等待成绩公布。</li>
			            	 </c:if>
			            </c:when>
	        		    <c:otherwise>
	        		    	<c:if test="${exam.isShowScore }">
            					<li>您本次客观题得分</li>
                				<li><c:out value="${score }"></c:out></li>
               					<li>主观题目尚在阅卷当中，具体结果请等待通知！</li>
	        		    	</c:if>
                		</c:otherwise>
            	   </c:choose>
       			</c:if>
            </ul>
            <c:if test="${testee.total_times eq 0 || testee.total_times gt testee.test_times }">
            	<div class="retry1" >
            		<span  onclick="goback();"><i class="fa fa-reply"></i>返回</span><span onclick="takeExam();">重新开始答题</span>
            	</div>
            </c:if>
      </section>
    </article>
    <footer class="ctl_footer"></footer>
    
    <script type="text/javascript" src="${basepath}/static/m_h5/js/myDialog.js"></script>
    <script type="text/javascript">
    function takeExam(){
    	var uid = $("#uid").val();
    	var tid = $("#tid").val();
		//window.location.href="${basepath}/student/itest/examination/m/takeexam.xhtml?tid="+tid+"&uid="+uid;
		var url = "${basepath}/m/h5/exam/takeexam.xhtml?tid="+tid+"&uid="+uid;
		window.location.href= url ;
	}
   	function goback(){
   		window.history.go(-2);
    }
    </script>
   	<style type="text/css">
    	html,body{width:100%;height:auto;background:#f8f8f8;overflow:hidden;}
    </style>
</body>
</html>
