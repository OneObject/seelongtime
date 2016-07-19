<%@page import="com.longtime.ajy.ext.enn.support.UserSessionAttributeListener"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>

<!DOCTYPE html>
<html>
	<head>
		<title>提示</title>
		<style type="text/css">
			body{
				background: #eee;
			}
			
		</style>
	</head>
	<body class="bg-color-gray">
	  <header>
            <span class="btn btn-left" id="btn-back">
                <i class="fa fa-angle-left"></i>
            </span>
            <div class="title title-2">
          	在线人数
            </div>
        </header>
	
		<section class="wrapper-static margin-top-50 ">
		<ul class="no-answer-img-ul" style="padding-top:100px;">
		    <li style="font-size:50px">
		    	<%=UserSessionAttributeListener.count.get() %>
		    </li>
		</ul>
		</section>
    </body>
</html>