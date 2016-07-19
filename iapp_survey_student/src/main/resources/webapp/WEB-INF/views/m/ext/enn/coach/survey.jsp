<%@ page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>观察评估表</title>
	</head>
	<body class="bg-color-gray">
        <header>
            <span class="btn btn-left"  id="btn-left-1">
                <i class="fa fa-angle-left"></i>
            </span>
            <div class="title title-2">
                ${isStudent ? "评估指导人":"观察评估表" }
            </div>
        </header>
        <section class="wrapper-static margin-top-50">
            <div class="table-list">
                <div class="loading"></div>
            </div>
        </section>
        <c:if test="${isTeacherIncoach }">
	        <div class="block-answer">
	             <span class="btn-answer" onclick='gotoSurvey();'><i class="fa fa-plus"></i>添加观察评估</span>
	        </div>
        </c:if>
        <c:if test="${isStudent }">
        	<div class="block-answer">
	        		<c:if test="${flag }">
	        			<span class="btn-answer" style="background:#ccc; color:#898989;">您已经对指导人评估过了</span>
	        		</c:if>
	        		<c:if test="${empty flag}">
	                	<span class="btn-answer" onclick='gotoSurvey();'><i class="fa fa-plus"></i>添加指导人观察评估</span>
	                </c:if>
	        </div>
        </c:if>
        
        
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.2.0.js"></script>
        <script type="text/javascript">
        	var page = 1;
        	var coachid = "${coachid}"; 
            $(function () {
                var $btnLeft1 = $('#btn-left-1');
                var $loading;
                
                getlist(1);

                $btnLeft1.bind('click', function () {
                    window.history.go(-1);
                });

                swipeAjax.bindTapEvent(document, function () {//上滑回调
                    $loading = $('.table-list .loading');
                    if (!$loading.length) {
                        return;
                    }
                    
                    if(current >= total){
						swipeAjax.setAjaxCount(0);  //这一行必须加
                    	return;
                    }
                  	page = page + 1;
                    getlist(page);
                });
                
                
            });
            
            function getlist(i){
            	var  $load = $('.table-list .loading');
            	$load.html('<i class="fa fa-spinner fa-pulse"></i>正在加载...');
            	$.ajax({
					type:"GET",
					url:"${basepath}/m/ext/enn/coach/surveylist.list",
					data:{page : i,size :20,coachid:coachid,isStudent:'${isStudent }'},
					success:function(html){
						$load.before(html);
						if(total>current){
							$load.html('上滑加载更多');
						}else if(total!=1&&current!=1){
							$load.html('已无更多');
						}else {
							$load.html("");
						}
						swipeAjax.setAjaxCount(0);  //这一行必须加
					}
				});
            }
            
            function gotoSurvey(){
            	window.location.href='${basepath}/m/ext/enn/coach/survey.xhtml?coachid='+coachid;
            }
            
            
        </script>
	</body>
</html>