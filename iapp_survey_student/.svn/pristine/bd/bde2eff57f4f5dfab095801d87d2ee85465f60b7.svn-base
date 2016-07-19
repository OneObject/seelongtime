<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html >
<html>
<head>
<title>
我的课程
</title>
<style type="text/css">
	body{
		background:#eee;
	}
</style>
 
</head>
<body>
  <header>
            <span class="btn btn-left" id="btn-back">
                <i class="fa fa-angle-left"></i>
            </span>
            <div class="title title-2">
          	我的课程
            </div>
        </header>
		<section class="wrapper-static margin-top-50" id="wrapper-static">
            <div class="module-course-list">
            
            
			<div class="loading">正在加载……</div>
            </div>
        </section>
	<script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.2.0.js"></script>
        <script type="text/javascript">
            var page =1;
			$(function () {
                var $btnBack = $('#btn-back');
                var $loading;
				 getlist(1);
				 
                $btnBack.bind('click', function () {
                    window.history.go(-1);
                });

                swipeAjax.bindTapEvent(document, function () {//上滑回调
                	$loading = $('.module-course-list .loading');
                    if (!$loading.length) {
                        return;
                    }
					
                    if (coursetotal <= coursecurrent) {
						swipeAjax.setAjaxCount(0); //这一行必须加 
						return;
					}
                    page = page + 1;
                    getlist(page);
                	});
			});
			
			
			
			    function getlist(i){
            	var  $loading1 = $('.module-course-list .loading');
            	$loading1.html('<i class="fa fa-spinner fa-pulse"></i>正在加载.....');
            	$.ajax({
					type:"GET",
					url:"${basepath}/m/ext/enn/coach/courselist.list",
					data:{page : i,size : 20,uid : "${uid}",coachid:"${param.coachid}" ,category : "${category}"},
					success:function(html){
						
						$loading1.before(html);
					
						if(coursetotal>coursecurrent){
							$loading1.html('上滑加载更多');
						}else if(coursetotal!=1&&coursecurrent!=1){
							$loading1.html('已无更多');
						}else {
							$loading1.html("");
						}						
						swipeAjax.setAjaxCount(0);  //这一行必须加
					}
				});
            	}
        </script>
</body>
</html>