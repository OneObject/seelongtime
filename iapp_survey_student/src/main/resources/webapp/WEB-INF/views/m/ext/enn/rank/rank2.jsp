<%@page import="org.apache.commons.lang.math.RandomUtils"%>
<%@page import="com.longtime.ajy.model.User"%>
<%@ page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%
User user = MwebHelper.getCurrentUser(request);
pageContext.setAttribute("user", user);
%>

<!DOCTYPE html>
<html>
	<head>
		<title>
		<c:if test="${model eq 'cfirst' }">
       	产业财富值比拼
       </c:if>
      	 <c:if test="${model eq 'sfirst' }">
      	 产业经验值比拼
      	 </c:if>
        </title>
		<style type="text/css">
			body {
				background: #eee;
			}
		</style>
	</head>
	<body class="bg-color-gray">
        <header>
            <span class="btn btn-left" id="btn-back">
                <i class="fa fa-angle-left"></i>
            </span>
             <ul class="title title-3">
	             <c:if test="${model eq 'cfirst' }">
	             	<li>产业财富值比拼</li>
	                <li>（指导人人均财富值）</li>
	             </c:if>
             	 <c:if test="${model eq 'sfirst' }">
             	 	<li>产业经验值比拼</li>
	                <li>（大学生人均经验值）</li>
             	 </c:if>
                
            </ul>
        </header>
        <section class="wrapper-static margin-top-50" id="wrapper-static">
            <div class="new-rank-list">
                <div class="holder-loading" id="holder-loading-1" style="margin-top:100px;">
                <i class="fa fa-spinner fa-pulse"></i>正在加载...
            </div>

            </div>
        </section>

        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.2.0.js"></script>
        
        <script type="text/javascript">
            $(function () {
                var $btnBack = $('#btn-back');
                $btnBack.bind('click', function () {
                    window.history.go(-1);
                });
                getRank();
            });
            
            
            function getRank(){
                	var  $load = $('#holder-loading-1');
                	
                	$.ajax({
    					type:"GET",
    					url:"${basepath}/m/ext/enn/rank/ranklist.list",
    					data:{model:"${param.model}"},
    					success:function(html){
    						$load.replaceWith(html);
    					}
    				});
            	
            }
            
            
            
        </script>
	</body>
</html>
