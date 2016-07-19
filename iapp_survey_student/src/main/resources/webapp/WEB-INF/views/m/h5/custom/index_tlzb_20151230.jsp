<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
	<meta name="format-detection" content="telephone=no" />
	<meta content="black" name="apple-mobile-web-app-status-bar-style" />
	<title>首页</title>
	<link rel="stylesheet" href="${basepath }/static/c_tlzb/css/index.css" type="text/css" />
    <link rel="stylesheet" href="${basepath }/static/c_tlzb/css/swiper.css" type="text/css">
    <script type="text/javascript" src="${basepath }/static/c_tlzb/js/jquery-2.1.1.min.js"></script>
</head>
<body>
	<div class="wrapper-box">
		<div id="replace-box-1">
			<section class="banner">
                <div class="swiper-container">
    				<div class="swiper-wrapper">
                        <div class="swiper-slide"><a href="#"><img style="display: block;" src="${basepath }/static/c_tlzb/img/banner1_20160111.jpg" /></a></div>
                        <div class="swiper-slide"><a href="#"><img style="display: none;" src="${basepath }/static/c_tlzb/img/banner2_20160111.jpg" /></a></div>
                        <div class="swiper-slide"><a href="#"><img style="display: none;" src="${basepath }/static/c_tlzb/img/banner3_20160111.jpg" /></a></div>
                        
                    </div>
                </div>
                <div class="pagination"></div>
            </section>

            <section class="main">
                <div class="main-box clear">
                    <a href="http://www.aijiayou.com/student/m/h5/channelresource/index.xhtml?channelid=ed2e934a63c24c99a47eaf5d74fa7fbe&fdomain=tlzb">
                        <div>
                            <img src="${basepath }/static/c_tlzb/img/icon_1.png" />
                            <label>培训通知</label>
                        </div>
                    </a>
                    <a href="http://www.aijiayou.com/student/m/h5/channelresource/index.xhtml?channelid=b637e1b12064481bac130540ba882ac9&fdomain=tlzb">
                        <div>
                            <img src="${basepath }/static/c_tlzb/img/icon_6.png" />
                            <label>美文共赏</label>
                        </div>
                    </a>
                	<a href="http://www.aijiayou.com/student/m/h5/channelresource/index.xhtml?channelid=4e955aadc91b43028913b047de079cbd&fdomain=tlzb">
                        <div>
                            <img src="${basepath }/static/c_tlzb/img/icon_3.png" />
                            <label>需求调研</label>
                        </div>
                    </a>
                	<a href="http://www.aijiayou.com/student/m/h5/exam/index.xhtml?fdomain=tlzb">
                        <div>
                            <img src="${basepath }/static/c_tlzb/img/icon_4.png" />
                            <label>在线测试</label>
                        </div>
                    </a>
                	<a href="http://www.aijiayou.com/student/m/site/index/ff80808151f079870151f37889254279.xhtml?fdomain=tlzb">
                        <div>
                            <img src="${basepath }/static/c_tlzb/img/icon_5.png" />
                            <label>在线课程</label>
                        </div>
                    </a>
                	<a href="http://www.aijiayou.com/student/m/h5/channelresource/index.xhtml?channelid=c86701a9b0134eb1a61f651a98819eb5&fdomain=tlzb">
                        <div>
                            <img src="${basepath }/static/c_tlzb/img/icon_2.png" />
                            <label>产品手册</label>
                        </div>
                    </a>
                	<a href="http://www.aijiayou.com/student/m/h5/channelresource/index.xhtml?channelid=33d6ffdaf6e249f58f7688a65c345c6a&fdomain=tlzb">
                        <div>
                            <img src="${basepath }/static/c_tlzb/img/icon_7.png" />
                            <label>案例专区</label>
                        </div>
                    </a>
                	<a href="http://www.aijiayou.com/student/m/site/index/ff80808151f079870151f35b3e5740e5.xhtml?fdomain=tlzb">
                        <div>
                            <img src="${basepath }/static/c_tlzb/img/icon_8.png" />
                            <label>话术专区</label>
                        </div>
                    </a>
                	<a href="http://www.aijiayou.com/student/m/h5/channelresource/index.xhtml?channelid=d409049f2b6643b48aa4b7de35a5a4bc&fdomain=tlzb">
                        <div>
                            <img src="${basepath }/static/c_tlzb/img/icon_9.png" />
                            <label>加盟风向标</label>
                        </div>
                    </a>
                </div>
			</section>
        </div>
    </div>

    <footer>
    	<div class="footer-fection">
    		<div class="main-box">
				<a href="http://www.aijiayou.com/student/m/ixin/ntopic/index.xhtml?activityid=2e0d5e35a0b144948b2df2d952a7cfed#topic_list_section">
                    <div>
                        <img src="${basepath }/static/c_tlzb/img/icon_10.jpg.png" />
                        <label>互动</label>
                    </div>
                    <span class="line">|</span>
                </a>
                <a href="http://www.aijiayou.com/student/m/h5/nask/index.xhtml?fdomain=tlzb">
                    <div>
                        <img src="${basepath }/static/c_tlzb/img/icon_11.jpg.png" />
                        <label>问答</label>
                    </div>
                    <span class="line">|</span>
                </a>
                <a href="http://www.aijiayou.com/student/m/h5/usercenter/index.xhtml?fdomain=tlzb">
                    <div>
                        <img src="${basepath }/static/c_tlzb/img/icon_12.jpg.png" />
                        <label>个人中心</label>
                    </div>
                </a>
    		</div>
    	</div>
    </footer>


    <script type="text/javascript" src="${basepath }/static/c_tlzb/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="${basepath }/static/c_tlzb/js/swiper.min.js"></script>
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
                paginationClickable: true,
            });
            setTimeout(function () {
                $(".swiper-slide img").css({"display": "block"});
            }, 300);  
            window.addEventListener("orientationchange", function() {
                $(".swiper-wrapper,.swiper-slide").css({"height": "auto"});
            }, false);                
        });

        $(function (){
            $('body').show();

            var bdWid = $('.main-box a').width();

            var height = bdWid;
            $('section .main-box a').css('height',height);
        })
    </script>
</body>
</html>