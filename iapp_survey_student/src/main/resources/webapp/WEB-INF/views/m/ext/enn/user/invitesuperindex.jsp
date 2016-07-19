<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html >
<html>
<head>
		<meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
        <meta name="format-detection" content="telephone=no" />
		<title>我邀请的邀请专业达人</title>
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="css/guidance.2.0.css?v=33" />
		<style type="text/css">
			body{
				background: #eee;
			}
			
		</style>
	</head>
<body >
   <header>
            <span class="btn btn-left" id="btn-back">
                <i class="fa fa-angle-left"></i>
            </span>
            <div class="title">
                我邀请的专业达人
            </div>
        </header>
        <section class="wrapper-static margin-top-50 margin-bottom-45" id="wrapper-static">
            <div class="invite-red-title">
                神器已开启召唤功能，快邀请你身边的专业达人<span class="why-link" onclick="javascript:window.location.href='${basepath}/m/study/detail/8a2bb3814f0731d1014f0b03c9310371.xhtml';">?</span>
            </div>
            
			<div class="rank-list-3" id="rank-list-3">
          
		<div class="loading"></div> 
            </div>
        </section>
        <div class="block-answer" >
                <span class="btn-answer" id="invite-btn">
                    邀请专业达人
                </span>
        </div>
        <div class="invite-show-wrapper" id="invite-show-wrapper" style="display: none;">
            <div class="invite-show-box">
                <span class="close-btn" id="close-btn"></span>
                <label class="num">${inviteCode} </label>
            </div>
        </div>
	<script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.2.0.js"></script>
        <script type="text/javascript">
		 var page =1;
		$(function () {
			
			 getlist(1);
            var $btnBack = $('#btn-back');
            $btnBack.bind('click', function () {
                window.history.go(-1);
            });

            $('#invite-btn').bind('click', function (e) {
                $('#invite-show-wrapper').show();
                e.stopPropagation();
            });
            $('#invite-show-wrapper').bind('click', function (e) {
                e.stopPropagation();
            });
            $('#invite-show-wrapper')[0].ontouchmove = function () {
                return false;
            };
            $('#close-btn').bind('click', function (e) {
                $('#invite-show-wrapper').hide();
                e.stopPropagation();
            });
            
            swipeAjax.bindTapEvent(document, function () {//上滑回调
            	$loading = $('.rank-list-3 .loading');
                if (!$loading.length) {
                    return;
                }
				
                if (invitetotal <= invitecurrent) {
					swipeAjax.setAjaxCount(0); //这一行必须加 
					return;
				}
                page = page + 1;
                getlist(page);
            	});
        });
		  function getlist(i){
			  
            	var  $loading1 = $('.rank-list-3 .loading');
            	$loading1.html('<i class="fa fa-spinner fa-pulse"></i>正在加载.....');
            	$.ajax({
					type:"GET",
					url:"${basepath}/m/ext/enn/user/invitesuperlist.list",
					data:{page:i , size:50 },
					success:function(html){
						var hasData = html.indexOf("no-invited")===-1;
						if(hasData){
							$loading1.before(html);
						}else{
							$('#rank-list-3').before(html);
						}
						//
						
						if(invitetotal>invitecurrent){
							$loading1.html('上滑加载更多');
						}else if(invitetotal!=1&&invitecurrent!=1){
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