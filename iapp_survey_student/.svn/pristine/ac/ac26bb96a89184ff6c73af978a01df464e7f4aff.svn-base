<%@page import="com.longtime.ajy.session.SessionHelper"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%><%--需重再一次导入 --%>
<!DOCTYPE html>
<html>
<head>
<title>我的考试</title>
<meta name="menu_path" content="exam"><%--当前菜单选中设置 --%>
<script type="text/javascript">
	function takeExam(tid){
		var uid = $("#uid").val();
		var name = $("#uname").val();
		var adminRoot = $("#adminRoot").val();
		window.open(adminRoot+"/student/itest/examination/takeexam.xhtml?tid="+tid+"&uid="+uid);
	}
	
	function showResult(tid){
		var uid = $("#uid").val();
		var adminRoot = $("#adminRoot").val();
		window.open(adminRoot+"/student/itest/examination/showResult.xhtml?tid="+tid+"&uid="+uid);
	}
</script>
</head>
<body>
<section class="main-home">
<ol class="breadcrumb">
    <li><a href="${basepath}/">首页</a></li>
    <li class="active">考试</li>
</ol>
	<input type="hidden" value="<%=Constant.ADMIN_ROOT %>" id="adminRoot">
	<input type="hidden" value="<%=SessionHelper.getCurrentUid()%>" id="uid">
	<c:if test="${empty canJoinList }">
		<div class="ifone choose-course">
	        <h1>目前暂无待考科目</h1>
	    </div>
	</c:if>
    <c:forEach items="${canJoinList }" var="item">
    	<div class="ifone">
	        	<c:if test="${empty item.cover  }">
	        	<div class="img">
	            	<h2>${item.examName }</h2>
	            	<span> ${ltfun:dateLongToStringFormat(item.startTime,'yyyy-MM-dd HH:mm') }</span>
	           		<span>至</span>
	            	<span>${ltfun:dateLongToStringFormat(item.endTime,'yyyy-MM-dd HH:mm') }</span>
	       		 </div>
	        	</c:if>
	        	<c:if test="${not empty item.cover  }">
	        	<div class="img">
	        		<img style="width:100%;height:100%;" src="<%=Constant.IMG_SERVER_DOWNLOAD%>${item.cover}" onerror="${basepath }/static/m/img/exam.png">
	        	</div>
	        	</c:if>
	        <div class="zi">
	            <span class="course-title"  style="display:inline-block;overflow: hidden;text-overflow:ellipsis;white-space:nowrap;">${item.examName }</span>
	            <div class="study-progress">
	                <label>考试满分：</label><span class="jindu">
	                <fmt:formatNumber value="${item.totalScore }" pattern="#.#" type="number"/>
	                </span>&nbsp;&nbsp;<span>分</span><br>
		            <label>考试时间：</label><span> ${ltfun:dateLongToStringFormat(item.startTime,'yyyy-MM-dd HH:mm') }</span>
	            	<span>至</span>
	            	<span>${ltfun:dateLongToStringFormat(item.endTime,'yyyy-MM-dd HH:mm') }</span>
	            </div>
	             <div class="study-into"  onclick="javascript:takeExam('${item.id}')">
		            <span class="mybtn-red">开始考试</span>
		        </div>
	            <div class="jianjie">
	            <c:if test="${not empty item.content }">
	                <span>考试简介：</span>
	                <p>
	                   ${item.content }
	                </p>
	             </c:if>
	            </div>
	        </div>
	    </div>
    </c:forEach>
    <!--已经考过的 start-->
    <div class="table-box">
        <div class="table-header">
            <span class="table-title"><i class="fa fa-clipboard"></i> &nbsp;&nbsp;考试列表</span>
        </div>
        <div class="table-body">
            <table class="test-list">
                <thead>
                    <tr>
                        <th>考试名称</th>
                        <th>开始日期</th>
                        <th>结束日期</th>
                        <th>参加日期</th>
                        <th>科目总分</th>
                        <th>我的得分</th>
                        <th>考试结果</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                	<c:if test="${empty attendList && empty canNotJoinList}">
                		<tr>
                			<td colspan="8">你还未参加过考试。</td>
                		</tr>
                	</c:if>
                	<c:forEach items="${canNotJoinList }" var="item">
	                    <tr>
	                        <td>
	                            ${item.examName }
	                        </td>
	                        <td>
	                           ${ltfun:dateLongToStringFormat(item.startTime,'yyyy-MM-dd') }
	                        </td>
	                        <td>
	                           ${ltfun:dateLongToStringFormat(item.endTime,'yyyy-MM-dd') }
	                        </td>
	                        <td>
	                           --
	                        </td>
	                        <td>
	                            <fmt:formatNumber value="${item.totalScore }" pattern="#.#" type="number"/>
	                        </td>
	                        <td>
	                           --
	                        </td>
	                        <td>
	                           --
	                        </td>
	                        <td>
	                               －－
	                        </td>
	                    </tr>
                    </c:forEach>
                	<c:forEach items="${attendList }" var="item">
	                    <tr>
	                        <td>
	                            ${item.examName }
	                        </td>
	                        <td>
	                           ${ltfun:dateLongToStringFormat(item.startTime,'yyyy-MM-dd') }
	                        </td>
	                        <td>
	                           ${ltfun:dateLongToStringFormat(item.endTime,'yyyy-MM-dd') }
	                        </td>
	                        <td>
	                           ${ltfun:dateLongToStringFormat(item.attendTime,'yyyy-MM-dd') }
	                        </td>
	                        <td>
	                            <fmt:formatNumber value="${item.totalScore }" pattern="#.#" type="number"/>
	                        </td>
	                        <td>
	                            <fmt:formatNumber value="${item.score }" pattern="#.#" type="number"/>
	                        </td>
	                        <td>
	                        	<c:choose>
	                        		<c:when test="${item.testStatus eq 0 }">未通过</c:when>
	                        		<c:when test="${item.testStatus eq 1 }">通过</c:when>
	                        		<c:when test="${item.testStatus eq 2 }">阅卷中</c:when>
	                        		<c:otherwise>--</c:otherwise>
	                        	</c:choose>
	                        </td>
	                        <td>
	                        	<c:choose>
	                        		<c:when test="${(item.testStatus eq 0) || (item.testStatus eq 1)}">
	                        			<span class="redsmallbtn" onclick="javascript:showResult('${item.id}');">
			                               		 详情
			                            </span>
			                            <c:if test="${item.endTime ge current}">
			                            &nbsp;&nbsp;
			                            <span class="redsmallbtn" onclick="javascript:takeExam('${item.id}');">
			                              		  考试
			                            </span>
			                            </c:if>
	                        		</c:when>
	                        		<c:otherwise>--</c:otherwise>
	                        	</c:choose>
	                        </td>
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <!-- <div class="fenye">
        <ul class="pagination">
            <li><a href="#">«&nbsp;首页</a></li>
            <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li><a href="#">首页&nbsp;»</a></li>
        </ul>
    </div> -->
    <!--已经考过的 end-->
</section>
<script type="text/javascript">
	$(function(){
		var my_w=$("div.ifone").width();
		$("div.ifone .course-title").width(my_w-600);
		});
</script>
</body>
</html>
<%-- sitemesh自定义的内容 --%>
<content tag="extra_js">  
</content> 