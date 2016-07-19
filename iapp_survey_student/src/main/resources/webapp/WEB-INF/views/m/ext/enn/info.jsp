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
          	提示
            </div>
        </header>
	
		<section class="wrapper-static margin-top-50 ">
		<ul class="no-answer-img-ul" style="padding-top:50px;">
		    <li>
		    	${empty msg?'内容不存在':msg }
		    </li>
		    <li></li>
		</ul>
		</section>
    
    
     	<script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>

        <script type="text/javascript">
            $(function () {
                var $btnBack = $('#btn-back');

                $btnBack.bind('click', function () {
                	window.history.go(-1);
                });

            });
            
        </script>
    </body>
</html>