<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>答卷情况</title>
<meta name="menu_path" content="test.testManage" />
<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/testmanage.css">
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i> <a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                <li><a href="${basepath }/base/admin/itest/examination/examination.xhtml">考试管理</a><i class="icon-angle-right"></i></li>
                <li><a href="${basepath }/base/admin/itest/examination/listtesteecon.xhtml?tid=${exam.id}">考试情况</a><i class="icon-angle-right"></i></li>
                <li><a href="${basepath }/base/admin/itest/examination/testeepapercon.xhtml?tid=${exam.id}&uid=${testeePaper.uid}">考试详情</a><i class="icon-angle-right"></i></li>
				<li><span href="#">答卷情况</span></li>
			</ul>
		</div>
	</div>
	<!-- END PAGE HEADER-->
    <div class="row">
        <div class="col-md-12">
            <div class="note note-success">
                <table>
                    <tr>
                        <td style="width:100px;">考试名称：</td>
                        <td>${exam.examName}</td>
                    </tr>
                    <tr>
                        <td>通过状态：</td>
                        <td>
		                     <c:if test="${testeePaper.status==0 }">未通过</c:if>
		                     <c:if test="${testeePaper.status==1 }">通过</c:if>
		                     <c:if test="${testeePaper.status==2 }">阅卷中</c:if>
                        </td>
                    </tr>
                    <tr>
                        <td>考试总分：</td>
                        <td>${testPaper.total_score}</td>
                    </tr>
                    <tr>
                        <td>及格分：</td>
                        <td>${testPaper.pass_mark}</td>
                    </tr>
                    <tr>
                        <td>考试得分：</td>
                        <td>${testeePaper.score}</td>
                    </tr>
                    <tr>
                        <td>参加考试时间：</td>
                        <td>
                            ${ltfun:dateLongToStringFormat(testeePaper.start_time,'yyyy-MM-dd HH:mm:ss') }
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
	<div class="row">
		<div class="col-md-12">
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>答卷情况
					</div>
				</div>
				<div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
                    <!-- 表格内容 -->
                    <div id="table_list" >
                    	<!-- 表格我只放基本的样式， -->
                        <c:forEach items="${list }" var="entity" varStatus="st">
                        <!-- 判断 -->
                            <c:if test="${entity.type eq '1' }">
                        <table class="table table-striped table-bordered table-hover table-full-width datatable yulan <c:out value="${entity.user_score eq 0.0?'error-table':'right-table' }"/> ">
                            <thead>
                                <tr>
                                    <th class="num">
                                        <span>${st.count }</span>
                                    </th>
                                    <th colspan="2">
                                        <span>
                                           ${entity.title }
                                        </span>
                                        <span class="item_score">【${entity.score }】</span>
                                    </th>
                                </tr>
                                <c:forEach var="option" items="${entity.options }" varStatus="state">
                                    <tr>
	                                    <td>&nbsp;</td>
	                                    	<!-- 当用户的选择与答案一样的情况下 -->
	                                    	<c:if test="${entity.user_answer == entity.answer }">
		                                    	<c:if test="${entity.user_answer eq option.no }">
	                                            	<td><input type="radio" checked="checked" onclick="return false" disabled="disabled" />${option.content }</td>
		                                        </c:if>
		                                        <c:if test="${entity.user_answer ne option.no }">
		                                            <td><input type="radio" onclick="return false" disabled="disabled"/>${option.content }</td>
		                                        </c:if>
	                                    	</c:if>
	                              	        <c:if test="${entity.user_answer != entity.answer }">
		                                    		<c:if test="${entity.user_answer eq option.no }">
		                                    			<c:if test="${entity.answer == option.no }">
	                                            			<td><input type="radio" checked="checked" onclick="return false" disabled="disabled" /><span style="color:#72C02C;">${option.content }</span></td>
	                                            		</c:if>
	                                            		<c:if test="${entity.answer != option.no }">
	                                            			<td><input type="radio" checked="checked" onclick="return false" disabled="disabled" />${option.content }</td>
	                                            		</c:if>
		                                        	</c:if>
		                                        <c:if test="${entity.user_answer ne option.no }">
		                                        	<c:if test="${entity.answer == option.no }">
		                                        		<td><input type="radio" onclick="return false" disabled="disabled" style="color:#72C02C;"/><span style="color:#72C02C;">${option.content }</span></td>
		                                        	</c:if>
		                                        	<c:if test="${entity.answer != option.no }">
		                                        		<td><input type="radio" onclick="return false" disabled="disabled"/>${option.content }</td>
		                                        	</c:if>
		                                        </c:if>
	                                    	</c:if>
                                    </tr>
                                </c:forEach>
                            </thead>
                        </table>
                            </c:if>
                            
                            
                    	<!-- 单选 -->
                    	<c:if test="${entity.type eq '2' }">
                    	<table class="table table-striped table-bordered table-hover table-full-width datatable yulan  <c:out value="${entity.user_score eq 0.0?'error-table':'right-table' }"/> ">
                    		<thead>
                    			<tr>
                    				<th class="num">
                    					<span>${st.count }</span>
                    				</th>
                    				<th colspan="2">
                    					<span>
                    						${entity.title }
                    					</span>
                    					<span class="item_score">【${entity.score }】</span>
                    				</th>
                    			</tr>
                                <c:forEach var="option" items="${entity.options }" varStatus="state">
                                    <tr>
	                                    <td>&nbsp;</td>
	                                    <!-- 当用户的选择与答案一样的情况下 -->
	                                   	<c:if test="${entity.user_answer == entity.answer }">
	                                           <c:if test="${entity.user_answer eq option.no }">
	                                               <td><input type="radio" checked="checked" onclick="return false" disabled="disabled" />${option.content }</td>
	                                           </c:if>
	                                           <c:if test="${entity.user_answer ne option.no }">
	                                               <td><input type="radio" onclick="return false" disabled="disabled" />${option.content }</td>
	                                           </c:if>
	                                    </c:if>
	                                    <c:if test="${entity.user_answer != entity.answer }">
	                                    	   <c:if test="${entity.user_answer eq option.no }">
	                                    	  	   <c:if test="${entity.answer == option.no }">
	                                               		<td><input type="radio" checked="checked" onclick="return false" disabled="disabled" /><span style="color:#72C02C;">${option.content }</span></td>
	                                               </c:if>
	                                               <c:if test="${entity.answer != option.no }">
	                                               		<td><input type="radio" checked="checked" onclick="return false" disabled="disabled" />${option.content }</td>
	                                               </c:if>
	                                           </c:if>
	                                           <c:if test="${entity.user_answer ne option.no }">
	                                           		<c:if test="${entity.answer == option.no }">
	                                           			<td><input type="radio" onclick="return false" disabled="disabled" /><span style="color:#72C02C;">${option.content }</span></td>
	                                           		</c:if>
	                                               	<c:if test="${entity.answer != option.no }">
	                                           			<td><input type="radio" onclick="return false" disabled="disabled" />${option.content }</td>
	                                           		</c:if>
	                                           </c:if>
	                                    </c:if>
                                    </tr>
                                </c:forEach>
                    		</thead>
                    	</table>
                    	</c:if>
                    	
                    	<!-- 多选 -->
                            <c:if test="${entity.type eq '3' }">
                    	<table class="table table-striped table-bordered table-hover table-full-width datatable yulan  <c:out value="${entity.user_score eq 0.0?'error-table':'right-table' }"/> ">
                    		<thead>
                    			<tr>
                    				<th class="num">
                    					<span>${st.count }</span>
                    				</th>
                    				<th colspan="2">
                    					<span>
                    						${entity.title }
                    					</span>
                    					<span class="item_score">【${entity.score }】</span>
                    				</th>
                    			</tr>
                                <c:forEach var="option" items="${entity.options }" varStatus="state">
                                    <tr>
	                                    <td>&nbsp;</td>
	                                    <c:if test="${entity.user_answer == entity.answer }">
	                                    	<c:if test="${fn:contains(entity.user_answer, option.no)}">
	                                            <td><input type="checkbox" checked="checked" disabled="disabled"/>${option.content }</td>
	                                        </c:if>
	                                        <c:if test="${!fn:contains(entity.user_answer, option.no)}">
	                                            <td><input type="checkbox" disabled="disabled"/>${option.content }</td>
	                                        </c:if>
	                                    </c:if>
	                                    <c:if test="${entity.user_answer != entity.answer }">
	                                    	<c:if test="${fn:contains(entity.user_answer, option.no)}">
	                                    		<c:if test="${fn:contains(entity.answer,option.no) }">
	                                    			<td><input type="checkbox" checked="checked" disabled="disabled"/><span style="color:#72C02C;">${option.content }</span></td>
	                                    		</c:if>
	                                            <c:if test="${!fn:contains(entity.answer,option.no) }">
	                                    			<td><input type="checkbox" checked="checked" disabled="disabled"/>${option.content }</td>
	                                    		</c:if>
	                                        </c:if>
	                                        <c:if test="${!fn:contains(entity.user_answer, option.no)}">
		                                        <c:if test="${fn:contains(entity.answer,option.no) }">
		                                        	<td><input type="checkbox" disabled="disabled"/><span style="color:#72C02C;">${option.content }</span></td>
		                                        </c:if>
		                                        <c:if test="${!fn:contains(entity.answer,option.no) }">
		                                        	<td><input type="checkbox" disabled="disabled"/>${option.content }</td>
		                                        </c:if>
	                                        </c:if>
	                                    </c:if>
                                    </tr>
                                </c:forEach>
                    		</thead>
                    	</table>
                    	</c:if>
                    	
                    	<!-- 问答 -->
                            <c:if test="${entity.type eq '4' }">
                    	<table class="table table-striped table-bordered table-hover table-full-width datatable yulan  <c:out value="${entity.user_score eq 0.0?'error-table':'right-table' }"/> ">
                    		<thead>
                    			<tr>
                    				<th class="num">
                    					<span>${st.count }</span>
                    				</th>
                    				<th colspan="2">
                    					<span>
                    						${entity.title }
                    					</span>
                    					<span class="item_score">【${entity.score }】</span>
                    				</th>
                    			</tr>
                    			<tr>
                    				<td colspan="2" class="cankao">
                    					<span class="btn default btn-xs green-stripe">考生答案</span>
                    					</td>
                    				<td>
                    					${entity.user_answer }
                    				</td>
                    			</tr>
                    			<tr>
                    				<td colspan="3"><strong>【参考答案】</strong>${entity.answer }</td>
                    			</tr>
                    			<tr>
                    				<td colspan="3">得分：${entity.user_score }</td>
                    			</tr>
                    		</thead>
                    	</table>
                    	</c:if>
                    	</c:forEach>
                    </div>
					
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
<content tag="pageCore"> 
<script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
<!-- 引用核心js包 -->
</script>
  
</content>
<content tag="pageInit"> <!-- 初始化窗口 --> 
</content>
