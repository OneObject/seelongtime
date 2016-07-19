<%@page import="com.longtime.ajy.session.SessionHelper"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%><%--需重再一次导入 --%>
<%
	String uid= SessionHelper.getCurrentUid();
	pageContext.setAttribute("uid", uid);
	String domain = SessionHelper.getCurrentDomain();
	pageContext.setAttribute("domain", domain);
%>
<!DOCTYPE html>
<html>
	<head>
	<meta name="menu_path" content="exam">
 		<title>考试列表</title>
 		<style type="text/css">

 				ul,ol,dl{list-style:none;padding:0px;margin:0px;}
				#myBox{width:100%;min-width: 1050px;}
				#myBox .myRow{width:100%;margin-bottom:10px;box-sizing:border-box;padding:12px;border: 1px solid #eee; border-radius:5px;height:82px;background-color:rbga(249, 249, 249, 0.8);overflow: hidden;min-width: 1050px;}
				.myRow > div{height:56px;overflow: hidden;}
				.myRow .left{float:left;width:450px;}
				.myRow .center{float:left;position:relative;width:14%;min-width: 40px;}
				.myRow .right{width:390px;float:right;}
				.myRow .center span{display: inline-block;width:66px;height:26px;border-radius: 5px;font-size:14px;text-align: center;line-height: 26px;position:absolute;top:0px;left:50%;}
				.myRow .center span.will{background: #e0e0e0;color:#999;}
				.myRow .center span.doing{background: #76c51a;color:#fff;}
				.myRow .center span.done{background: #53575e;color:#fff;}
				.myRow .left div{float:left;}
				.myRow .left div.date{width:91px;height:56px;text-align: left;}
				.myRow .left div.date1{text-align: right;}
 				.myRow .left div.date div{width:44px;height:40px;font-size:40px;font-weight: bold;float:left;line-height: 44px;}
 				.myRow .left div.date ul{width:44px;height:40px;font-size:13px;float:left;margin-left: 3px;}
 				.myRow .left div.date ul li{height: 20px;line-height: 20px;text-align: right;}
 				.myRow .left div.date ul li:last-child{font-size:13px;text-align: right;}
 				.myRow .left div.date dd{font-size:13px;color:#999;text-align: right;height:16px;line-height: 16px;}
 				.myRow .left div.line{font-size:18px;font-weight: bold;height:56px;font-weight:bold;width:20px;text-align: center;line-height: 38px;}
 				.myRow .left div.info{padding-left:20px;/*width:248px;*/width:440px;}
 				.myRow .left div.info dt{height:40px;font-size:16px;overflow: hidden;line-height: 20px;}
 				.myRow .left div.info dd{height:16px;font-size:13px;}
 				.myRow .right ul{float:left;padding-right:10px;box-sizing: border-box;width:200px;font-size:13px;color:#666;}
 				.myRow .right .start{float:left;margin-left:70px;width:80px;}
 				.myRow .right .start span{display: block;border-radius:5px;width:80px;height:32px;cursor:pointer;line-height: 32px;font-size:13px;text-align: center;margin-top:12px;}
 				.myRow .right .start span.begin{background:#d9534e;color:#fff;}
 				.myRow .right .start span.had{background:#e0e0e0;color:#999;}
 				.myRow .right ul li:first-child{height:40px;}
 				.myRow .right ul li:last-child{height:16px;}
 				.myRow .right ul li label.a{display:inline-block;width:40px;color:#529bea;}
 				.myRow .right ul li label.b{display:inline-block;width:40px;color:#d9534e;}
 				.myRow .right ul li label.c{display:inline-block;width:40px;color:#666;}
 				.myRow .right ul li a{color:#529bea;display: inline-block;margin-left:8px;text-decoration:none;}
 				.btnBox{width:100%;min-width: 800px;text-align: center;}
 				.btnBox .pagination > .active > a,.btnBox .pagination > .active > a:hover {background-color:#D9534F;border-color:#D9534F;color:#fff;}
 				.btnBox .pagination > li > a{color:#D9534F;}
 				.btnBox .pagination > li > a:hover{color:#D9534F;}
 				#noData{width:330px;height:64px;margin:100px auto;}
 				#noData h1 small{width:330px;height:64px;display:block;}
 				.main-home{min-width: 1050px;}
 		</style>
	</head>
	<body>
		<section class="main-home" id="main-home"  <c:if test="${domain eq 'chtwm'}" >style="padding-top:16px;margin-top:-10px;background:url(${basepath}/static/chtwm/images/learn.png) left top repeat;" </c:if> >
		<input type="hidden" value="<%=Constant.ADMIN_ROOT %>" id="adminRoot">
		<input type="hidden" value="<%=SessionHelper.getCurrentUid()%>" id="uid">
			<ol class="breadcrumb">
			    <li><a href="${basepath}/">首页</a></li>
			    <li class="active">考试</li>
			</ol>
			<div id="myBox">
			<%--
			<c:if test="${empty attendList && empty canJoinList && empty canNotJoinList}">
			 --%>
			<c:if test="${empty list}">
				<div id="noData">
					<h1><small  style="font-size:36px;color:#999;font-weight:bold;">没有要参加的考试</small></h1>
				</div>
			</c:if>
			<%-- 
			<c:forEach items="${list }" var="item">
				<div class="myRow">
					<div class="left">
					<!--  
						<div class="date">
							<dl>
								<dt>
									<div>${ltfun:dateLongToStringFormat(item.startTime,'dd') }</div>
									<ul>
										<c:set var="monthstart" value="${ltfun:dateLongToStringFormat(item.startTime,'MM')}"> </c:set>
										<li>${monthMap[monthstart]}月</li>
										<li>${ltfun:dateLongToStringFormat(item.startTime,'yyyy') }</li>
									</ul>
								</dt>
								<dd>${ltfun:dateLongToStringFormat(item.startTime,'HH:mm') }</dd>
							</dl>
						</div>
						<div class="line">
							-
						</div>
						<div class="date">
							<dl>
								<dt>
									<div>${ltfun:dateLongToStringFormat(item.endTime,'dd') }</div>
									<ul>
										<c:set var="monthend" value="${ltfun:dateLongToStringFormat(item.endTime,'MM')}"> </c:set>
										<li>${monthMap[monthend]}月</li>
										<li>${ltfun:dateLongToStringFormat(item.endTime,'yyyy') }</li>
									</ul>
								</dt>
								<dd>${ltfun:dateLongToStringFormat(item.endTime,'HH:mm') }</dd>
							</dl>
						</div>
						-->
						<div class="info">
							<dl>
								<dt>${item.examName }</dt>
								<dd>
									考试满分： <fmt:formatNumber value="${item.totalScore }" pattern="#.#" type="number"/>分
								</dd>
							</dl>
						</div>
					</div>
					
					<div class="center">
							<c:if test="${item.endTime <= current}">
								<span class="done">已结束</span>
							</c:if>
							<c:if test="${item.startTime >= current}">
								<span class="will">未开始</span>
							</c:if>
							<c:if test="${item.startTime <= current && current <= item.endTime }">
								<span class="doing">进行中</span>
							</c:if>
					</div>
					<div class="right">
						<ul>
						<li>
						 
							最高得分：--
						
							</li>
							<li>
			
							参加时间：--
						
							</li>
						</ul>
						<div class="start">
							<span class="begin" onclick="javascript:takeExam('${item.id}')">开始考试</span>
						</div>
					</div>
				</div>
				</c:forEach>
				
				--%>
				<c:forEach items="${list }" var="item">
				<div class="myRow">
					<div class="left">
					 <!--  
						<div class="date">
							<dl>
								<dt>
									<div>${ltfun:dateLongToStringFormat(item.startTime,'dd') }</div>
									<ul>
										<c:set var="monthstart" value="${ltfun:dateLongToStringFormat(item.startTime,'MM')}"> </c:set>
										<li>${monthMap[monthstart]}月</li>
										<li>${ltfun:dateLongToStringFormat(item.startTime,'yyyy') }</li>
									</ul>
								</dt>
								<dd>${ltfun:dateLongToStringFormat(item.startTime,'HH:mm') }</dd>
							</dl>
						</div>
						<div class="line">
							-
						</div>
						<div class="date">
							<dl>
								<dt>
									<div>${ltfun:dateLongToStringFormat(item.endTime,'dd') }</div>
									<ul>
										<c:set var="monthend" value="${ltfun:dateLongToStringFormat(item.endTime,'MM')}"> </c:set>
										<li>${monthMap[monthend]}月</li>
										<li>${ltfun:dateLongToStringFormat(item.endTime,'yyyy') }</li>
									</ul>
								</dt>
								<dd>${ltfun:dateLongToStringFormat(item.endTime,'HH:mm') }</dd>
							</dl>
						</div>
						-->
						<div class="info">
							<dl>
								<dt>${item.examName }</dt>
								<dd>
									考试满分： <fmt:formatNumber value="${item.totalScore}" pattern="#.#" type="number"/>分
								</dd>
							</dl>
						</div>
					</div>
					<!--
					<div class="center">
							<c:if test="${item.endTime <= current}">
								<span class="done">已结束</span>
							</c:if>
							<c:if test="${item.startTime >= current}">
								<span class="will">未开始</span>
							</c:if>
							<c:if test="${item.startTime <= current && current <= item.endTime }">
								<span class="doing">进行中</span>
							</c:if>
					</div>
					-->
					<div class="right" style="float:left;margin-left:150px;">
						<ul>
							<li>
						
							最高得分：
							<c:choose>
							<c:when test="${empty item.score }">
								--
							</c:when>
							<c:otherwise>
							<label class="${item.testStatus eq 0 ?'b':item.testStatus eq 1?'a':'c'}">
								<fmt:formatNumber value="${item.score }" pattern="#.#" type="number"/>
							</label>
							</c:otherwise>
							</c:choose>
							<!-- 
							<c:if test="${(item.testStatus eq 0) || (item.testStatus eq 1)}">
							</c:if>
							 -->
							<c:if test="${not empty item.score }">
								<a href="javascript:showResult('${item.id}');">上次答卷</a>
							</c:if>
							
							</li>
							<li>
						
							参加时间：  
							<c:choose>
							<c:when test="${empty item.attendTime }">
								--
							</c:when>
							<c:otherwise>
							${ltfun:dateLongToStringFormat(item.attendTime,'yyyy-MM-dd HH:mm') }
							</c:otherwise>
							</c:choose>
		
						</li>
						</ul>
						<c:choose>
							<c:when test="${ajy:canTakeExam(user,item)}">
								<div class="start">
									<span class="begin" onclick="javascript:takeExam('${item.id}')">开始考试</span>
								</div>
							</c:when>
							<c:when test="${item.startTime >= current}">
								<div class="start">
									<span class="begin" style="background:#e0e0e0;color:#999;">考试未开始</span>
								</div>
							</c:when>
							<c:otherwise>
								<div class="start">
									<span class="begin" style="background:#e0e0e0;color:#999;">考试结束</span>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				
				
				
				
				</c:forEach>
				
				
				
				<%--
				<c:forEach items="${canNotJoinList }" var="item">
					<div class="myRow">
					<div class="left">
					<!--  
						<div class="date">
							<dl>
								<dt>
									<div>${ltfun:dateLongToStringFormat(item.startTime,'dd') }</div>
									<ul>
										<c:set var="monthstart" value="${ltfun:dateLongToStringFormat(item.startTime,'MM')}"> </c:set>
										<li>${monthMap[monthstart]}月</li>
										<li>${ltfun:dateLongToStringFormat(item.startTime,'yyyy') }</li>
									</ul>
								</dt>
								<dd>${ltfun:dateLongToStringFormat(item.startTime,'HH:mm') }</dd>
							</dl>
						</div>
						<div class="line">
							-
						</div>
						<div class="date">
							<dl>
								<dt>
									<div>${ltfun:dateLongToStringFormat(item.endTime,'dd') }</div>
									<ul>
										<c:set var="monthend" value="${ltfun:dateLongToStringFormat(item.endTime,'MM')}"> </c:set>
										<li>${monthMap[monthend]}月</li>
										<li>${ltfun:dateLongToStringFormat(item.endTime,'yyyy') }</li>
									</ul>
								</dt>
								<dd>${ltfun:dateLongToStringFormat(item.endTime,'HH:mm') }</dd>
							</dl>
						</div>
						-->
						<div class="info">
							<dl>
								<dt>${item.examName }</dt>
								<dd>
									考试满分： <fmt:formatNumber value="${item.totalScore }" pattern="#.#" type="number"/>分
								</dd>
							</dl>
						</div>
					</div>
					
					<div class="center">
							<c:if test="${item.endTime <= current}">
							<span class="done">已结束</span>
							</c:if>
							<c:if test="${item.startTime >= current}">
								<span class="will">未开始</span>
							</c:if>
					</div>
					<div class="right">
						<ul>
							<li>
						 
							最高得分：--
						
							</li>
							<li>
			
							参加时间：--
						
							</li>
						</ul>
						<div class="start">
							<span class="begin" onclick="javascript:takeExam('${item.id}')">开始考试</span>
						</div>
					</div>
				</div>
				
				</c:forEach>
			--%>
			</div>
			<div class="btnBox">
				<nav id="pageid">
				<%--
				  <ul class="pagination pagination-lg" >
				    <li class="disabled"><a href="#">&laquo;</a></li>
				    <li class="active"><a href="#">1</a></li>
				    <li><a href="#">2</a></li>
				    <li><a href="#">3</a></li>
				    <li><a href="#">&raquo;</a></li>
				  </ul>
				  --%>
				</nav>
			</div>
		</section>
		
		
        
        
	<script type="text/javascript">
		function takeExam(tid) {
			var uid = $("#uid").val();
			var name = $("#uname").val();
			var adminRoot = $("#adminRoot").val();
			var url = null;
			$.ajax({
				url:"${basepath}/exam/gotoexam",
				type:"POST",
				async: false,
		        data:{tid:tid},
		        dataType:'json',
		        success:function(data){
		        	url = data.url;
					//window.open(data.url,"new");
		        }
		    });	
			window.open(url,"exam");
		}
		

		
		function showResult(tid) {
			var uid = $("#uid").val();
			var adminRoot = $("#adminRoot").val();
			window.open(adminRoot
					+ "/student/itest/examination/showResult.xhtml?tid=" + tid
					+ "&uid=" + uid ,"new1");
		}
		var windowH = window.innerHeight;
		$(function () {
			var $box = $('#main-home');
			if ($box.height() < (windowH - 62)) {
				$box.height(windowH - 62);
			}
			
		});
	</script>
</body>
</html>
