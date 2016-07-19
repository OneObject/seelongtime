<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>

<%
boolean isTeacher = MwebHelper.isCoach(request);
pageContext.setAttribute("isTeacher", isTeacher);
%>
<!DOCTYPE html>
<html>
	<head>
		<title>${isTeacher?"辅导记录表":"实习记录表"}</title>
	</head>
	<body class="bg-color-gray">
        <header>
            <span class="btn btn-left"  id="btn-left-1">
                <i class="fa fa-angle-left"></i>
            </span>
            <div class="title title-2">
                ${isTeacher?"辅导记录表":"实习记录表"}(${count })
            </div>
        </header>
        <section class="wrapper-static margin-top-50">
            <div class="table-list">
                <div class="loading" id="loading">上滑加载更多</div>
            </div>
        </section>
        <div class="block-answer">
                
                <c:if test="${isTeacher }">
                <span class="btn-answer" onclick='gotoCoachRecord();'><i class="fa fa-plus"></i>添加辅导记录表</span>
                </c:if>
                <c:if test="${ not isTeacher }">
                <span class="btn-answer" onclick='gotoPractice();'><i class="fa fa-plus"></i>添加实习记录</span>
                </c:if>
                
                
        </div>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.2.0.js"></script>
        <script type="text/javascript">
            var page = 1;
			var coachid = "${id}";
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
                    //$loading.html('<i class="fa fa-spinner fa-pulse"></i>正在加载...');
                  	page = page + 1;
                    getlist(page);
                    
                });

            });
            
            function getlist(i){
            	var  $load = $('.table-list .loading');
            	$load.html('<i class="fa fa-spinner fa-pulse"></i>正在加载...');
            	$.ajax({
					type:"GET",
					url:"${basepath}/m/ext/enn/coach/coachlist.list",
					data:{page : i,size :20,coachid:coachid},
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
            
            function gotoPractice(){
            	
            	window.location.href="${basepath}/m/ext/enn/coach/toaddpractice.xhtml?coachid="+coachid;
            	
            }
			
			  function gotoCoachRecord(){
            	
            	window.location.href="${basepath }/m/ext/enn/coach/newaddguidance.xhtml?coachid="+coachid;
            	
            }
            
        </script>
	</body>
</html>
