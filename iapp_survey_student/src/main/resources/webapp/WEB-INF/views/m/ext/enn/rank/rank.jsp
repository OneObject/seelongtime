<%@ page import="org.apache.commons.lang.math.RandomUtils"%>
<%@ page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>

<!DOCTYPE html>
<html>
	<head>
		<title>
			<c:if test="${model eq 'ctotal' }">产业内指导人财富榜</c:if>
          	<c:if test="${model eq 'coachtotal' }">指导人财富总榜</c:if>
          	<c:if test="${model eq 'smonthtotal' }">学员经验排行月榜</c:if>
          	<c:if test="${model eq 'stotal' }">学员经验排行总榜</c:if>
          	<c:if test="${model eq 'daren' }">达人财富总榜</c:if>
		</title>
		<style type="text/css">
			body {
				background: #eee;
			}
		</style>
	</head>
	<body class="bg-color-gray">
        <header id="header">
            <span class="btn btn-left" id="btn-back">
                <i class="fa fa-angle-left"></i>
            </span>
            <div class="title title-2">
	            <c:if test="${model eq 'ctotal' }">产业内指导人财富榜</c:if>
	            <c:if test="${model eq 'coachtotal' }">指导人财富总榜</c:if>
	            <c:if test="${model eq 'smonthtotal' }">学员经验排行月榜</c:if>
	            <c:if test="${model eq 'stotal' }">学员经验排行总榜</c:if>
	          	<c:if test="${model eq 'daren' }">达人财富总榜</c:if>
            </div>
        </header>
            <div class="holder-loading" id="holder-loading-1" style="margin-top:100px;">
                <i class="fa fa-spinner fa-pulse"></i>正在加载...
            </div>
        
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.2.0.js"></script>
        <script type="text/javascript">
        	
            $(function () {
            	getRank();
            });
            
            function getRank(){
                	var  $load = $('#holder-loading-1');
                	
                	$.ajax({
    					type:"GET",
    					url:"${basepath}/m/ext/enn/rank/ranklist.list",
    					data:{model:"${param.model}",id:'${id}'},
    					success:function(html){
    						$load.replaceWith(html);
    		                var $tempPercent = $('#progress-box .percent');
    		                var tempPercentWidth;
    		                var $btnBack = $('#btn-back');
    		                $btnBack.bind('click', function () {
    		                    window.history.go(-1);
    		                });

    		                tempPercentWidth = $tempPercent.data('percent');
    		                +(function ($tempPercent, tempPercentWidth) {
    		                    setTimeout(function () {
    		                        $tempPercent.css('width', tempPercentWidth + '%');
    		                    }, 300);
    		                }($tempPercent, tempPercentWidth));
    					}
    				});
            	
            }
        </script>
	</body>
</html>
