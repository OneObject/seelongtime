<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<title>我的回答</title>
	</head>
	<body>
        <header>
            <div class="title">我的回答</div>
            <span class="btn btn-back" id="btn-back"><i class="fa fa-angle-left"></i></span>
        </header>
        <section class="wrapper-static">
            <div class="module-ask-list" id="content">
                <div class="holder-loading">
                   <i class="fa fa-spinner fa-pulse"></i>正在加载...
            	</div>
            </div>
        </section>
        <script type="text/javascript" src="${basepath}/static/m_h5/nask/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/m_h5/nask/js/ask_answer_base.js"></script>
        <script type="text/javascript">
        var page = 0 ;
            $(function () {
            	var btnBack = document.getElementById('btn-back');
            	var $loading;
            	
                if (!browserUtil.isWeChat()) {
                    $('header').addClass('not-wechat');
                }
                btnBack.onclick = function () {//回到首页
                	window.history.go(-1);
                }; 
                
                swipeAjax.bindTapEvent(document, function () {//模拟上滑加载
                	$loading = $('.module-ask-list .loading');
                	if (!$loading.length) {
    					swipeAjax.setAjaxCount(0);
    					return;
    				}

    				if(total<= current ){
            			swipeAjax.setAjaxCount(0);  //这一行必须加 
    					return;
                	}	
                    $loading.html('<i class="fa fa-spinner fa-pulse"></i>正在加载...');
                    
 					page = page + 1;
    				
    				list(page);
                    
                });
            });


			$(function() {
    			
    			list(1);

    		});


            function list(i) {

    			var tLoading  = $('#content').find('.loading');	
    					
    			page = i ;
    			
    			var url = "${basepath}/m/h5/nask/myanswerlist.list";
    			
    			$.ajax({
    				type : "GET",
    				url : url,
    				cache : false,
    				data : {
    					page : i ,
    					size : 10
    				},
    				success : function(response) {
    					if(i == 1){
    						$("#content").html(response);
    						if(total > current ){
    							$("#content").append('<div class="loading">上滑加载更多</div>');
    						}else{
    							
    						}
    						swipeAjax.setAjaxCount(0); 
    					}else{
    						tLoading.before(response);
    						if(total > current ){
    							tLoading.html('上滑加载更多');
    						}else{
    							tLoading.html('已无更多');
    						}
    						swipeAjax.setAjaxCount(0); 
    					}
    				},
    				error : function() {
    				}
    			});
    		}
        </script>
	</body>
</html>
