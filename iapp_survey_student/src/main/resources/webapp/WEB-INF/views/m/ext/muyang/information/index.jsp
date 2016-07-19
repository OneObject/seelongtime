<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html >
<html>
<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
		<title>研发资讯</title>
        <link type="text/css" rel="stylesheet" href="${basepath}/static/m/ext/muyang/css/reset.css" />
        <link type="text/css" rel="stylesheet" href="${basepath}/static/m/ext/muyang/css/add_list.css" />
	</head>
<body>
   <header>
            <span class="btn-back" id="btn-back"></span>
            <div class="text">研发资讯</div>
   </header>
		<section class="list-box">
		 
 
			 <div class="btn-more-box">
                <span onclick="getmore()">点击加载更多</span>
            </div>
           

        </section>
	<script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.2.0.js"></script>
        <script type="text/javascript">
            var page =1;
			$(function () {
                var $btnBack = $('#btn-back');
				 getlist(1);
				 
                $btnBack.bind('click', function () {
                    window.history.go(-1);
                });

			});
			
			    function getlist(i){
            	var  $loading1 = $('.btn-more-box');
            	$loading1.html('<span><i class="fa fa-spinner fa-pulse"></i>正在加载.....</span>');
            	$.ajax({
					type:"GET",
					url:"${basepath}/m/ext/muyang/information/infomationlist.list",
					data:{page : i,size : 10},
					success:function(html){
						
						$loading1.before(html);
					
						if(total>current){
							$loading1.html(' <span onclick="getmore()">点击加载更多</span>');
						}else if(total!=1&&current!=1){
							$loading1.html('<span>已无更多</span>');
						}else {
							$loading1.html("");
						}						
					//	swipeAjax.setAjaxCount(0);  //这一行必须加
					}
				});
            	}
				
				function getmore(){
				 page = page + 1;
                 getlist(page);
				}
        </script>
</body>
</html>