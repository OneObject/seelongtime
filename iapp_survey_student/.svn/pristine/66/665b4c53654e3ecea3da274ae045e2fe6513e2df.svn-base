<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<title>产品中心</title>
        <link type="text/css" rel="stylesheet" href="${basepath}/static/m/ext/muyang/css/swiper.css" />
        <style type="text/css">
        
        .new-product-1{
        	width:100%;
        	overflow:hidden;
        }
        .new-product-1 a{
        	display:block;
        	width:100%;
        }
        .new-product-1 img{
        	display:block;
        	width:100%;
        	float:left;
        }
        .new-product-2{
        	width:100%;
        	overflow:hidden;
        }
        .new-product-2 a{
        	display:block;
        	width:50%;
        	float:left;
        }
        .new-product-2 img{
        	display:block;
        	width:100%;
        	float:left;
        }
        .new-product-3{
        	width:100%;
        	overflow:hidden;
        }
        .new-product-3 a{
        	display:block;
        	width:33%;
        	float:left;
        }
        .new-product-3 a:nth-child(2){
        }
        .new-product-3 img{
        	display:block;
        	width:100%;
        	float:left;
        }
        .product-show  a{
        	min-height:0;
        }
        </style>
	</head>
	<body>
		<section class="banner">
			<div  class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide"><a href="#"><img style="display: block;" src="${basepath}/static/m/ext/muyang/img/banner1.png" /></a></div>
                    <div class="swiper-slide"><a href="#"><img style="display: none;" src="${basepath}/static/m/ext/muyang/img/banner2.png" /></a></div>
                    <div class="swiper-slide"><a href="#"><img style="display: none;" src="${basepath}/static/m/ext/muyang/img/banner3.png" /></a></div>
                    <div class="swiper-slide"><a href="#"><img style="display: none;" src="${basepath}/static/m/ext/muyang/img/banner4.png" /></a></div>
                    <div class="swiper-slide"><a href="#"><img style="display: none;" src="${basepath}/static/m/ext/muyang/img/banner5.png" /></a></div>
                </div>
            </div>
            <div class="pagination"></div>
		</section>
		<section class="search" style="padding:8px 12px 8px 12px;">
			<div class="search-box" >
				<form onsubmit="list();return false;">
                	<input type="search" placeholder="请输入关键字" id="searchContent" value="${searchContent }"/>
                </form>
                <span class="search-btn" onclick="list();"></span>
			</div>
		</section>
		<section class="nav">
            <nav>
                <a href="${basepath}/m/ext/muyang/product/category.xhtml?id="><img src="${basepath}/static/m/ext/muyang/img/c1.png" /></a>
                <a href="${basepath}/m/h5/channelresource/index.xhtml?channelid=5ad8823c0bfd4c0c94056e1e3e2de28a&fdomain=muyang"><img src="${basepath}/static/m/ext/muyang/img/c2.png" /></a><!-- http://120.25.158.216/student/ -->
                <a href="${basepath}/m/ext/muyang/techservice/index.xhtml"><img src="${basepath}/static/m/ext/muyang/img/c3.png" /></a>
                <a href="${basepath}/m/ext/muyang/feedback.xhtml"><img src="${basepath}/static/m/ext/muyang/img/c5.png" /></a>
                <a href="${basepath}/m/ext/muyang/information/index.xhtml"><img src="${basepath}/static/m/ext/muyang/img/c4.png" /></a>
                <a href="${basepath}/m/ext/muyang/404.xhtml"><img src="${basepath}/static/m/ext/muyang/img/c6.png" /></a>
            </nav>
		</section>
		<section class="product">
		
			<c:if test="${not empty show }">
				<c:forEach items="${show }" var="item" varStatus="i">
				
						<div class="product-show new-product-${item.type }">
							<c:forEach items="${item.items }" var="content" varStatus="c">
			                <a href="${content.url }">
			                    <img src="<%=Constant.IMG_SERVER_DOWNLOAD%>/${content.img}" />
			                </a>
			                </c:forEach>
			            </div>
					
					
				<%-- 	<c:if test="${item.model eq 2}">
						<div class="product-show  new-product-${item.type }">
							<c:forEach items="${item.items }" var="content" varStatus="c">
			                <a href="${content.url }">
			                    <img src="<%=Constant.IMG_SERVER_DOWNLOAD%>/${content.img}" />
			                </a>
			                </c:forEach>
			            </div>
					</c:if>
				 --%>
				</c:forEach>
			
			</c:if>
		
			
            <%-- <div class="product-show  new-product-2">
                <a href="${basepath}/m/ext/muyang/product/product/detail.xhtml?id=ff8080814dffe4a0014e0976b4440c80">

                    <img src="${basepath}/static/m/ext/muyang/img/K25.jpg" />
                </a>
                <a href="${basepath}/m/ext/muyang/product/product/detail.xhtml?id=ff8080814dffe4a0014e09615c3c0c6a">

                    <img src="${basepath}/static/m/ext/muyang/img/K15.jpg" />
                </a>
            </div> --%>
		</section>
		<script type="text/javascript" src="${basepath}/static/m/ext/muyang/js/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="${basepath}/static/m/ext/muyang/js/swiper.min.js"></script>
		<script type="text/javascript">
            var banner;
			$(function () {
                banner = new Swiper('.swiper-container',{
                	pagination: '.pagination',
                    loop: true,
                    autoplay: 3000,
                    autoplayDisableOnInteraction: false,
                    autoResize: true,
                    calculateHeight: true,
                    paginationClickable: true
                });
                setTimeout(function () {
                	$(".swiper-slide img").css({"display": "block"});
                }, 300);
	   			window.addEventListener("orientationchange", function() {
					$(".swiper-wrapper,.swiper-slide").css({"height": "auto"});
				}, false);                  
			});

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
