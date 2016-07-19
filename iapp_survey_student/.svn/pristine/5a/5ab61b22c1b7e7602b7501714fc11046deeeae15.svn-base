<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
	<meta name="format-detection" content="telephone=no" />
	<meta content="black" name="apple-mobile-web-app-status-bar-style" />
	<title>用户绑定</title>
	<link rel="stylesheet" href="${basepath }/static/m_h5/ceyuan/css/login.css" type="text/css" />
</head>
<body>
	<div class="bg">
		<img src="${basepath }/static/m_h5/ceyuan/img/background.jpg" alt="">
		<div class="content">
			<div class="logo">
				<a style="height:auto;line-height:0;margin:2rem 0" href="#">
					<img src="${basepath }/static/m_h5/ceyuan/img/logo.png" alt="">
				</a>
			</div>
			<div class="search_box">
				<form action="${basepath}/m/h5/login.xhtml" id="loginForm" method="post">
				<input type="hidden"  name="custom"   value="username"/>
				<input type="hidden"  name="custom" value="name"/>
				
					<input type="text" class="search_text" name ="c_name" id ="c_name" placeholder="姓名" />
					<input type="text" class="search_psw" name="c_username" id ="c_username" placeholder="工号" />

					<c:if test="${not empty loginForm and loginForm.code !='success'}">
	                    	<c:choose>
	                    		<c:when test="${loginForm.code=='empty'}"><p id="nullinputerror">请输入工号和姓名</p></c:when>
	                			<c:when test="${loginForm.code=='pwdfial'}"><p id="nullinputerror">工号或姓名错误</p></c:when>
	                			<c:when test="${loginForm.code=='disable'}"><p id="nullinputerror">账号被禁用</p></c:when>
	                			<c:when test="${loginForm.code=='expire'}"><p id="nullinputerror">账号已过期</p></c:when>
	                			<c:when test="${loginForm.code=='ineffective'}"><p id="nullinputerror">账号未生效</p></c:when>
	                			<c:when test="${loginForm.code=='already_bind'}"><p id="nullinputerror">账号已被绑定</p></c:when>
	                			<c:when test="${loginForm.code=='fail'}"><p id="nullinputerror">工号或姓名错误</p></c:when>
	                		</c:choose>
        				 </c:if>
        				 <c:if test="${ empty loginForm}">
        				 	<p id="nullinputerror">&nbsp;</p>
        				 </c:if>
        				 
        				 
					<a href="#" class="search_sub">
						<img src="${basepath }/static/m_h5/ceyuan/img/bind_in_button.png" alt="" onclick="doSubmit();">
						
					</a>
					
					
					<input type="hidden"  name="domain" value="${domain}"/>
                	<input type="hidden" name="callback" value="${callback}"/>
                	<input type="hidden" name="openid" value="${openid}"/>
                 	<input type="hidden" name="d_openid" value="${d_openid}"/>
                 	<input type="hidden" name="action" value="bind"/>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="${basepath }/static/m_h5/js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript">
	function doSubmit(){
          if($("#c_username").val() == "" ||$("#c_name").val() == ""){
              $("#nullinputerror").html('请填写工号和姓名 ');
              
          }else{
              /*提交操作*/
              $("#loginForm").submit();
          }
      }
	
	
	</script>
</body>
</html>