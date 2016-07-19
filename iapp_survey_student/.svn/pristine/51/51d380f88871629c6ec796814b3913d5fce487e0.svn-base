<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>产品详情</title>
<link type="text/css" rel="stylesheet"
	href="${basepath}/static/m/ext/muyang/css/swiper.css" />
<link type="text/css" rel="stylesheet"
	href="${basepath}/static/m/ext/muyang/css/photoswipe.css" />
<style type="text/css">
body {
	background-color: #fff !important;
}
</style>
</head>
<body class="bg-white">
	<section class="search no-margin">
		<span class="back" onclick="window.history.go(-1);"></span>
		<div class="search-box">
			<form onsubmit="list();return false;">
				<input type="search" placeholder="请输入关键字" id="searchContent"
					value="${searchContent }" />
			</form>
			<span class="search-btn" onclick="list();"></span>
		</div>
	</section>
	<section class="banner no-margin">
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<c:choose>
					<c:when test="${empty covers }">
						<div class="swiper-slide">
							<a href="#"><img style="display: block;"
								src="${basepath}/static/m/ext/muyang/img/xq_pro_1.png" /></a>
						</div>
						<div class="swiper-slide">
							<a href="#"><img style="display: none;"
								src="${basepath}/static/m/ext/muyang/img/xq_pro_2.png" /></a>
						</div>
						<div class="swiper-slide">
							<a href="#"><img style="display: none;"
								src="${basepath}/static/m/ext/muyang/img/xq_pro_3.png" /></a>
						</div>
						<div class="swiper-slide">
							<a href="#"><img style="display: none;"
								src="${basepath}/static/m/ext/muyang/img/xq_pro_4.png" /></a>
						</div>
						<div class="swiper-slide">
							<a href="#"><img style="display: none;"
								src="${basepath}/static/m/ext/muyang/img/xq_pro_5.png" /></a>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach varStatus="v" var="cover" items="${covers }">
							<div class="swiper-slide">
								<a href="#"><img
									style="display: ${v.index eq 0 ? 'block':'none'};"
									src="<%=Constant.IMG_SERVER_DOWNLOAD%>${cover}-640x360" /></a>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="pagination"></div>
	</section>
	<section class="product-intro">
		<ul>
			<li>产品名称：${entity.name }</li>
			<c:if test="${!empty entity.englishname }"><li>英文名称：${entity.englishname }</li></c:if>
			<li>产品型号：${entity.type }</li>
			<li>商品名称：${entity.goodname } <label
				style="float: right; font-size: 13px;">${ltfun:dateLongToStringFormat(entity.createtime,'yyyy-MM-dd')}</label></li>
		</ul>
	</section>
	<section class="tab">
		<div class="tab-line-4">
			<span class="a active" data-id="img1">功能特性</span> 
			<span class="b" data-id="img2">技术参数</span> 
			<span class="c" data-id="img3">性能参数</span>
			<span class="d" data-id="more">更多</span>
		</div>
	</section>
	<section class="img-box">
		<div id="img1" style="display: block;">
			
		</div>
		<div id="img2" style="display: none">
			
		</div>
		<div id="img3" style="display: none">
			
		</div>

	</section>
	<script type="text/javascript"
		src="${basepath}/static/m/ext/muyang/js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript"
		src="${basepath}/static/m/ext/muyang/js/swiper.min.js"></script>
	<script type="text/javascript"
		src="${basepath}/static/m/ext/muyang/js/klass.min.js"></script>
	<script type="text/javascript"
		src="${basepath}/static/m/ext/muyang/js/code.photoswipe-3.0.5.js"></script>
	<script type="text/javascript">
            $(function () {
            	index1++;
				getProperty("img1",0);
                ///////
                var banner, tabBtns;
                var swiperSlideLen = $('.swiper-slide').length;
                var swiperConfig = {
                        pagination: '.pagination',
                        loop: true,
                        autoplay: 3000,
                        autoplayDisableOnInteraction: false,
                        autoResize: true,
                        calculateHeight: true,
                        paginationClickable: true
                    };
                if (swiperSlideLen === 1) {
                	swiperConfig.autoplay = 0;
                }
                tabBtns = $('.tab span');
                banner = new Swiper('.swiper-container', swiperConfig);
                setTimeout(function () {
                    $(".swiper-slide img").css({"display": "block"});
                }, 300);
                tabBtns.click(function () {
                    var cur = $(this);
                    var targetId = cur.attr('data-id');
                    if (targetId !== 'more') {
	                    cur.addClass('active').siblings().removeClass('active');
	                    getDatas(targetId);
                    } else {
                    	window.location.href = '${basepath}/m/ext/muyang/product/product/otherdetail.xhtml?id=${entity.id}';
                    }
                  
                    return false;
                });
	   			window.addEventListener("orientationchange", function() {
					$(".swiper-wrapper,.swiper-slide").css({"height": "auto"});
				}, false);                    
            });

            var index1 = 0;
			var index2 = 0;
			var index3 = 0;
        	function getDatas(targetId) {
        		if(targetId == 'img1' && index1 == 0){
					index1++;
					getProperty(targetId,0);
				}else if(targetId == 'img1' && index1 != 0){
					$('#'+targetId).show().siblings().hide();
				//产品认证
				}else if(targetId == 'img2' && index2 == 0){
					index2++;
					getProperty(targetId,1);
				}else if(targetId == 'img2' && index2 != 0){
					$('#'+targetId).show().siblings().hide();
				//工艺配置
				}else if(targetId == 'img3' && index3 == 0){
					index3++;
					getProperty(targetId,2);
				}else if(targetId == 'img3' && index3 != 0){
					$('#'+targetId).show().siblings().hide();
				}
				
    		}


            function getProperty(targetId,property){
    			var url = "${basepath}/m/ext/muyang/product/product/property.list?pid=${entity.id}&property="+property;
				$.ajax({
					type : "GET",
					url : url,
					cache : false,
					success : function(html) {
						if(targetId == 'img6'){
							$("#list"+targetId).after(html);
						}else{
							$("#"+targetId).html(html);
						}
						$('#' + targetId).show().siblings().hide();
				        var PhotoSwipe = window.Code.PhotoSwipe;
				        var options = {loop:false,allowUserZoom:true,captionAndToolbarAutoHideDelay:0},
				        instance = PhotoSwipe.attach( window.document.querySelectorAll('.img-box img'), options);
					}
				});
        	}
        </script>
	<script type="text/javascript">
            (function(window){
                document.addEventListener('DOMContentLoaded', function(){
                    var PhotoSwipe = window.Code.PhotoSwipe;
                    var options = {loop:false,allowUserZoom:true,captionAndToolbarAutoHideDelay:0},
                            instance = PhotoSwipe.attach( window.document.querySelectorAll('.img-box img'), options);
                }, false);
            })(window);

			/*
			 *搜索
			 */
        	function list() {
    			var searchContent = $.trim($("#searchContent").val());
    			if(searchContent==null||searchContent==""){
    				return;
    			}
    			window.location.href = "${basepath}/m/ext/muyang/product/product/index.xhtml?searchContent="+searchContent;
    		}
        </script>
</body>
</html>
