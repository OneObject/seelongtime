<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<title>产品详情</title>
        <link type="text/css" rel="stylesheet" href="${basepath}/static/m/ext/muyang/css/swiper.css" />
		<link type="text/css" rel="stylesheet" href="${basepath}/static/m/ext/muyang/css/photoswipe.css"  />
		<style type="text/css">
		 body{background-color: #fff !important;}
		 .view-detail{
		 	display:inline-block;
		 	height:20px;
		 	line-height:20px;
		 	color:#fff;
		 	background:#529bea;
		 	text-align:center;
		 	width:60px;
		 	font-size:14px;
			div.version ul li{
			width:33%;
			}
		 }

		</style>
	</head>
	<body class="bg-white">
		<section class="search no-margin">
		<span class="back" onclick="window.history.go(-1);"></span>
			<div class="search-box">
				<form onsubmit="list();return false;">
                	<input type="search" placeholder="请输入关键字" id="searchContent" value="${searchContent }"/>
                </form>
                <span class="search-btn" onclick="list();"></span>
			</div>
		</section>
        <section class="banner no-margin">
        	<div  class="swiper-container">
            	<div class="swiper-wrapper">
                	<c:choose>
                	<c:when test="${empty covers }">
                    	<div class="swiper-slide"><a href="#"><img style="display: block;" src="${basepath}/static/m/ext/muyang/img/xq_pro_1.png" /></a></div>
                    	<div class="swiper-slide"><a href="#"><img style="display: none;" src="${basepath}/static/m/ext/muyang/img/xq_pro_2.png" /></a></div>
                    	<div class="swiper-slide"><a href="#"><img style="display: none;" src="${basepath}/static/m/ext/muyang/img/xq_pro_3.png" /></a></div>
                    	<div class="swiper-slide"><a href="#"><img style="display: none;" src="${basepath}/static/m/ext/muyang/img/xq_pro_4.png" /></a></div>
                    	<div class="swiper-slide"><a href="#"><img style="display: none;" src="${basepath}/static/m/ext/muyang/img/xq_pro_5.png" /></a></div>
                	</c:when>
                	<c:otherwise>
                		<c:forEach varStatus="v" var="cover" items="${covers }">
                			<div class="swiper-slide"><a href="#"><img style="display: ${v.index eq 0 ? 'block':'none'};" src="<%=Constant.IMG_SERVER_DOWNLOAD%>${cover}-640x360" /></a></div>
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
                <li>商品名称：${entity.goodname }<label style="float:right;font-size:13px;">${ltfun:dateLongToStringFormat(entity.createtime,'yyyy-MM-dd')}</label></li>
            </ul>
        </section>
        <section class="tab">
			<div class="tab-line-4">
	            <span class="a active" data-id="img4">工艺配置</span>
	            <span class="b" data-id="img5">产品认证</span>
                <span class="d" data-id="img7" >订购信息</span>
	            <span class="c" data-id="img6">其它</span>			
			</div>
        </section>
        <section class="img-box">
            <div id="img4" style="display: block">
            
            </div>
            <div id="img5" style="display: none;">
                
            </div>
            <div id="img7" style="display: none">
            
            </div>
            <div id="img6" style="display: none;" >
                <div class="line-title" id="titleimg6">版本记录</div>
                <div class="version" id="listimg6">
                </div>

            </div>
        </section>

		<script type="text/javascript" src="${basepath}/static/m/ext/muyang/js/showdetail.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/muyang/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/muyang/js/swiper.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/muyang/js/klass.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/muyang/js/code.photoswipe-3.0.5.js"></script>
        <script type="text/javascript">
            $(function () {
            	index4++;
				getProperty("img4",3);
                //////
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
                banner = new Swiper('.swiper-container',swiperConfig);
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
                    	window.location.href = 'chan-pin-xiang-qing-2.html';
                    }
                    return false;
                });
	   			window.addEventListener("orientationchange", function() {
					$(".swiper-wrapper,.swiper-slide").css({"height": "auto"});
				}, false);                    
            });

			var historyindex = 0 ;
			var index7 = 0;
			var index5 = 0;
			var index4 = 0;
        	function getDatas(targetId) {
        		//其他
        		if(targetId == 'img6' && historyindex == 0){
					historyindex++;
        			getHistory(targetId);
				}else if(targetId == 'img6' && historyindex != 0){
					$('#'+targetId).show().siblings().hide();
				//订购信息
				}else if(targetId == 'img7' && index7 == 0){
					index7++;
					getProperty(targetId,5);
				}else if(targetId == 'img7' && index7 != 0){
					$('#'+targetId).show().siblings().hide();
				//产品认证
				}else if(targetId == 'img5' && index5 == 0){
					index5++;
					getProperty(targetId,4);
				}else if(targetId == 'img5' && index5 != 0){
					$('#'+targetId).show().siblings().hide();
				//工艺配置
				}else if(targetId == 'img4' && index4 == 0){
					index4++;
					getProperty(targetId,3);
				}else if(targetId == 'img4' && index4 != 0){
					$('#'+targetId).show().siblings().hide();
				}
				
    		}

    		function getHistory(targetId){
    			var url = "${basepath}/m/ext/muyang/product/product/historylist.list?pid=${entity.id}";
				$.ajax({
					type : "GET",
					url : url,
					cache : false,
					success : function(list) {
						showHistory(targetId,list);
					}
				});
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

    		function showHistory(targetId,list){
    			$("#list"+targetId).html(list);
				//变更记录
				/*
				if(historytotal == 0 ){
					$("#title"+targetId).hide();
					$("#list"+targetId).hide();
				}else{
					$("#title"+targetId).show();
					$("#list"+targetId).show();
				}
				*/
				getProperty(targetId,6);

        	}
            
        </script>
	    <script type="text/javascript">
		    (function(window){
				document.addEventListener('DOMContentLoaded', function(){
					var PhotoSwipe = window.Code.PhotoSwipe;
					var options = {loop:false,allowUserZoom:true,captionAndToolbarAutoHideDelay:0},
					instance = PhotoSwipe.attach( window.document.querySelectorAll('.img-box img'), options );
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
		    
		    function viewDetail(_this) {
		    	var $temp = $(_this);
		    	var value = $temp.data('value');
				var title = $temp.data('title');
				lightDialog.show({'contentText':value,'headerText':title},
                    function(){
                		lightDialog.remove();
                	
                    },
                    function(){
                    	lightDialog.remove();
                    });
					
		    	
		    }
	    </script>
	</body>
</html>

