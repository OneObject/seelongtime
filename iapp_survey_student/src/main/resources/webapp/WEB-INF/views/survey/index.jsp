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
	<meta name="menu_path" content="survey">
 		<title><fmt:message key="survey.index.title" bundle="${bundle}"/></title>
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
 		 <script type="text/javascript" src="${basepath}/static/js/page.js"></script>
	</head>
	<body>
		<section class="main-home" id="main-home"  <c:if test="${domain eq 'chtwm'}" >style="padding-top:16px;margin-top:-10px;background:url(${basepath}/static/chtwm/images/learn.png) left top repeat;" </c:if> >
		<input type="hidden" value="<%=Constant.ADMIN_ROOT %>" id="adminRoot">
		<input type="hidden" value="<%=SessionHelper.getCurrentUid()%>" id="uid">
			<ol class="breadcrumb">
			    <li class="active"><fmt:message key="survey.index.survey" bundle="${bundle}"/></li>
			</ol>
			<div id="myBox">
			<c:if test="${empty rs.data}">
				<div id="noData">
					<h1><small  style="font-size:36px;color:#999;font-weight:bold;"><fmt:message key="survey.index.nodata" bundle="${bundle}"/></small></h1>
				</div>
			</c:if>
			<c:forEach items="${rs.data }" var="item">
				<div class="myRow">
					<div class="left">
						<div class="info">
							<dl>
								<dt>${item.title }</dt>
								<dd>
									<fmt:message key="survey.index.starttime" bundle="${bundle}"/>：
									<c:choose>
									<c:when test="${empty item.startTime || item.startTime == 0}">
										--
									</c:when>
									<c:otherwise>
										${ltfun:dateLongToStringFormat(item.startTime,'yyyy-MM-dd HH:mm') }
									</c:otherwise>
									</c:choose>
								</dd>
							</dl>
						</div>
					</div>
					<div class="right" style="float:left;margin-left:100px;width: 490px;">
						<ul style="width: 260px;">
							<li>
								<c:set var="hasAttend" value="0"></c:set>
								<c:forEach var="userVote" items="${userVotes }">
									<c:if test="${userVote.activityId eq item.id }">
										<c:set var="hasAttend" value="1"></c:set>
										<fmt:message key="survey.index.attended" bundle="${bundle}"/>(${ltfun:dateLongToStringFormat(userVote.timestamp,'yyyy-MM-dd HH:mm') })
									</c:if>
								</c:forEach>
							</li>
							<li>
						
							<fmt:message key="survey.index.endtime" bundle="${bundle}"/>： 
							<c:choose>
							<c:when test="${empty item.endTime || item.endTime == 0}">
								--
							</c:when>
							<c:otherwise>
								${ltfun:dateLongToStringFormat(item.endTime,'yyyy-MM-dd HH:mm') }
							</c:otherwise>
							</c:choose>
						</li>
						</ul>
						<c:choose>
							<c:when test="${item.startTime != 0 &&  item.startTime > current}">
								<div class="start">
									<span class="begin" style="background:#e0e0e0;color:#999;"><fmt:message key="survey.index.unstart" bundle="${bundle}"/></span>
								</div>
							</c:when>
							<c:when test="${(item.startTime == 0 ||  item.startTime <= current) && (item.endTime == 0 ||  item.endTime > current)}">
								<div class="start">
									<c:if test="${hasAttend == 1 }">
									<span class="begin"  onclick="showResult('${item.id}');"><fmt:message key="survey.index.see" bundle="${bundle}"/></span>
									</c:if>
									
									<c:if test="${hasAttend == 0 }">
									<span class="begin"  onclick="attendSurvey('${item.id}');"><fmt:message key="survey.index.attend" bundle="${bundle}"/></span>
									</c:if>
								</div>
							</c:when>
							<c:otherwise>
								<div class="start">
									<c:if test="${hasAttend == 1 }">
										<span  onclick="showResult('${item.id}');" class="begin" style="background:#e0e0e0;color:#999;">
											<fmt:message key="survey.index.see" bundle="${bundle}"/>
										</span>
									</c:if>
									<c:if test="${hasAttend == 0 }">
										<span class="begin" style="background:#e0e0e0;color:#999;">
											<fmt:message key="survey.index.over" bundle="${bundle}"/>
										</span>
									</c:if>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				</c:forEach>
				<div id="pageinfo1" class="fenye"></div>
			</div>
			<div class="btnBox">
				<nav id="pageid">
				</nav>
			</div>
		</section>
	<script type="text/javascript">
		var coursepageNumber = '${rs.pageable.pageNumber}';
		var coursetotalPage = '${rs.pageable.totalPages}';
		var coursepageSize = '${rs.pageable.pageSize}';
		var coursetotal = '${rs.pageable.total}';
		function gotoPage1(num,size){
			window.location.href = basepath + "/survey/index.xhtml?page="+num;
		}   
		
 		showPage(coursepageNumber,coursetotalPage,coursepageSize,coursetotal,"gotoPage1","pageinfo1");
	
		function courseData(i){
			$.ajax({
                type: "POST",
                url:"${basepath}/survey/mysurvey.list",
                data:{'page':i,"size":page_size},
                error: function(rs) {
	                	$("#courseloading").show();
	                	$("#courserecord").hide();
                },
                success: function(data) {
	                	$("#courseloading").hide();
	                	$("#coursedata").html(data);
	                	$("#courserecord").show();
                }
            });
		}  
 		
		function attendSurvey(id) {
			//window.location.href = basepath+"/survey/attend.xhtml?id="+id;
			window.open(basepath+"/survey/attend.xhtml?id="+id);
		}
		
		function showResult(id){
			window.open(basepath+"/survey/result.xhtml?id="+id);
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
