<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
	<meta name="format-detection" content="telephone=no" />
	<meta content="black" name="apple-mobile-web-app-status-bar-style" />
	<title>在线学习</title>
	<link rel="stylesheet" href="${basepath }/static/m_h5/fosun/css/index.css" type="text/css" />
	<link rel="stylesheet" href="${basepath }/static/m_h5/fosun/css/font-awesome.min.css" type="text/css" />
	<style type="text/css">
		header {
          width:100%;
          height:50px;
          line-height:50px;
          text-align:center;
          font-size:16px;
          color:#fff;
          position:relative;
          position:fixed;
          left:0;
          top:0;
          z-index:50;
          background:#5582CF;
        }
        header .header-title {
          width:80%;
          margin:0 auto;
          overflow:hidden;
          height:50px;
          color:#fff;
        }
        header .header-back {
          font-size:24px;
          width:39px;
          height:50px;
          position:absolute;
          left:0;
          top:0;
        }
	</style>
</head>
<body style="padding-top:50px;">
	<header class="bg-color">
        <div class="header-back fa-angle-left"  id="btn-left-1"></div>
        <div class="header-title">在线学习</div>
    </header>
	<div class="wrapper-box">
		<div id="replace-box-1">
			<section class="wrap_banner">
				<img src="${basepath }/static/m_h5/fosun/img/banner.jpg" alt="" />
			</section>
            <section class="main">
            	<div class="title">
            		专项学习
            	</div>
                <div class="main-box clear">
                    <a href="http://www.aijiayou.com/student/m/h5/channelresource/index.xhtml?channelid=a154fd2cbe97437cab4137aabc4e1dba&fdomain=fosun">
                        <div>
                            <img src="${basepath }/static/m_h5/fosun/img/icon_1.png"/>
                            <label>星知星汇</label>
                        </div>
                    </a>
                    <a href="http://www.aijiayou.com/student/m/h5/channelresource/index.xhtml?channelid=eb0ae886f8234ad2900f26e6687a8558&fdomain=fosun">
                        <div>
                            <img src="${basepath }/static/m_h5/fosun/img/icon_2.png" />
                            <label>午餐会</label>
                        </div>
                    </a>
                    <a href="http://www.aijiayou.com/student/m/h5/channelresource/index.xhtml?channelid=edad24ceab8449ca954ff89aaf1e2e0d&fdomain=fosun">
                        <div>
                            <img src="${basepath }/static/m_h5/fosun/img/icon_3.png" />
                            <label>大讲堂</label>
                        </div>
                    </a>
                </div>
			</section>

			<section class="main main_2">
            	<div class="title">
            		热点话题
            	</div>
                <div class="main-box clear">
                    <a href="http://www.aijiayou.com/student/m/h5/channelresource/index.xhtml?channelid=f0e25e1da4854135a570c8fca9fec9b2&fdomain=fosun">
                        <div>
                            <img src="${basepath }/static/m_h5/fosun/img/icon_4.png" />
                            <label>投资</label>
                        </div>
                    </a>
                    <a href="http://www.aijiayou.com/student/m/h5/channelresource/index.xhtml?channelid=9ed6f9d7fdb04c42b9351799a655b08b&fdomain=fosun">
                        <div>
                            <img src="${basepath }/static/m_h5/fosun/img/icon_5.png" />
                            <label>保险</label>
                        </div>
                    </a>
                    <a href="http://www.aijiayou.com/student/m/h5/channelresource/index.xhtml?channelid=e65e5ddc5c4a45c7b5636162cf918638&fdomain=fosun">
                        <div>
                            <img src="${basepath }/static/m_h5/fosun/img/icon_6.png" />
                            <label>财富管理</label>
                        </div>
                    </a>
                    <a href="http://www.aijiayou.com/student/m/h5/channelresource/index.xhtml?channelid=a64a4ce87106424bbbd1202fb36ed38c&fdomain=fosun">
                        <div>
                            <img src="${basepath }/static/m_h5/fosun/img/icon_7.png" />
                            <label>大健康</label>
                        </div>
                    </a>
                    <a href="http://www.aijiayou.com/student/m/h5/channelresource/index.xhtml?channelid=7b079721ef784b6da98b77cb9dfdde17&fdomain=fosun">
                        <div>
                            <img src="${basepath }/static/m_h5/fosun/img/icon_8.png" />
                            <label>快乐时尚</label>
                        </div>
                    </a>
                    <a href="http://www.aijiayou.com/student/m/h5/channelresource/index.xhtml?channelid=729c9026e0a641fd9f051b0fdeb131d6&fdomain=fosun">
                        <div>
                            <img src="${basepath }/static/m_h5/fosun/img/icon_9.png" />
                            <label>互联网</label>
                        </div>
                    </a>
                </div>
			</section>
        </div>
    </div>


    <script type="text/javascript" src="${basepath }/static/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript">

        $(function (){
            $('body').show();

            var bdWid = $('.main-box a').width();

            var height = bdWid;
            $('section .main-box a').css('height',height);
        })
        
        $(function() {
    	
    	var $btnLeft1 = $('#btn-left-1');
    	$btnLeft1.bind('click', function() {
			window.history.go(-1);
		});
      });
    </script>
</body>
</html>