<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%><%--需重再一次导入 --%>
<!DOCTYPE html>
<html>
<head>
    <title>答题结果</title>
    <link rel="stylesheet" href="${basepath }/static/css/easydialog.css">
    <link rel="stylesheet" href="${basepath }/static/m/new.css">
    
    
    <style type = "text/css">
    .default{
    display: block;
    line-height: 28px;
    padding: 10px;
    background-color: #eee;
    margin: 10px 0px;
    }
    .deright{border-left: 4px solid green;}
    .dewrong{border-left: 4px solid red;}
    </style>
    <script type="text/javascript" src="${basepath }/static/js/easydialog.min.js"></script>
    <script type="text/javascript">
	    function takeExam(){
	    	var uid = $("#uid").val();
	    	var tid = $("#tid").val();
			//window.location.href="${basepath}/student/itest/examination/m/takeexam.xhtml?tid="+tid+"&uid="+uid;
			var url = "${basepath}/m/exam/takeexam.xhtml?tid="+tid+"&uid="+uid;
			window.location.href= url ;
		}

		function toRank(){
			var uid = $("#uid").val();
			var tid = $("#tid").val();
			//window.location.href="${basepath}/student/itest/examination/m/rank.xhtml?tid="+tid+"&uid="+uid;
			var url = "${basepath}/m/exam/rank.xhtml?tid="+tid+"&uid="+uid;
			window.location.href = url;
		}
    </script>
</head>
<body>
    <div class="resultbox">
        <header>
            本次答题结果
        </header>
        <input type="hidden" id="uid" value='<c:out value="${uid }"></c:out>'/>
        <input type="hidden" id="tid" value="${exam.id }"/>
        <c:if test="${domain eq 'SMG' }">
        	<div style="padding: 8px;">
        	<span class="default deright">
                答对题数：${rightNum }
                </span>
                <span class="default dewrong">
                答错题数：${wrongNum }
            </span>
        	</div>
        </c:if>
        <c:if test="${domain ne 'SMG' }">
	        <c:choose>
	        	<c:when test="${hasMulti ne 1 }">
	        		<section>
	        		   <c:if test="${exam.isShowScore }">
				            <span class="default">
				                得分：
				            </span>
				            <span class="fenshu">
				               	<c:out value="${score_str }"></c:out>
				            </span>
				            <div class="bs-callout bs-callout-danger">
				                <h4>
				                	<c:if test="${score ge score_pass }">恭喜您通过了本次考试！</c:if>
				                	<c:if test="${score lt score_pass }">本次考试未通过，继续努力！</c:if>
				                </h4>
				            </div>
			            </c:if>
			            <c:if test="${!exam.isShowScore }">
			            	<div class="alert alert-info">
				                <span>
				                    请等待成绩公布。
				                </span>
				            </div>
			            </c:if>
	        		</section>
	        	</c:when>
	        	<c:otherwise>
	        		 <section>
			            <!--有问答题的情况-->
			            <c:if test="${exam.isShowScore }">
				            <span class="default">
				                您本次客观题得分：
				            </span>
				            <span class="fenshu">
				                <c:out value="${score }"></c:out>
				            </span>
			            </c:if>
			            <div class="alert alert-info">
			                <span>
			                    主观题目尚在阅卷中，具体结果请等待通知！
			                </span>
			            </div>
			        </section>
	        	</c:otherwise>
	        </c:choose>
        </c:if>
        <c:if test="${testee.total_times eq 0 || testee.total_times gt testee.test_times }">
	        <section style="width: 100%;padding: 20px;">
	            <span class="btn btn-block btn-success btn-lg" onclick="takeExam();">重新开始答题</span>
	            <!--  
	            <a href="javascript:toRank();" style="margin-top:20px;display:block;height:24px;line-height:24px;text-align: right;">查看排行榜</a>
	       		-->
	            <a href="javascript:window.history.go(-2);" style="margin-top:20px;display:block;height:24px;line-height:24px;text-align: right;">返回</a>
	       	</section>
       	</c:if>
    </div>
</body>
</html>
<%@include file="/WEB-INF/include/wx.jsp"%>
<%@include file="/WEB-INF/include/analysis.jsp"%>