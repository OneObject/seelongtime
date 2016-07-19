<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <title>抽奖</title>
    <style type="text/css">
        body.bg{background: url(${basepath}/static/m/img/zhonagjiang_h.png);background-size:100% 100%;padding:0px 15px;}
        .result{display: block;overflow: hidden;position: absolute;bottom: 170px;width: 100%;text-align:center;font-weight:normal;font-size:16px;}
        .gongxi{font-size: 1.2em;text-align: center;color: #fff;font-weight: bold;}
        .jiangxiang{font-size: 1.4em;color: #fff;text-align: center;margin-top: 20px;font-weight: bold;}
        .boxcontent {
            border-radius: 5px;
            padding: 2px;
            background-color: #FEF8B2;
            -webkit-box-shadow: 0 0 6px rgba(0, 0, 0, 0.5);
            -moz-box-shadow: 0 0 6px rgba(0, 0, 0, 0.5);
            -o-box-shadow: 0 0 6px rgba(0, 0, 0, 0.5);
            box-shadow: 0 0 6px rgba(0, 0, 0, 0.5);
            position:absolute;
            bottom:20px;
        }
        .boxyellow{
            background-color: #FEF8B2;
        }
        .boxwhite{
            background-color: #ffffff;
        }
        .box {
            border-radius: 5px;
            font-size:14px;
            border: 1px dashed rgba(0, 0, 0, 0.3);
        }
        .box .title-red {
            padding: 0 5px 0px 10px;

            border-radius: 3px 3px 3px 0;
            color:#ffffff;
            height:22px;
            margin:-1px;
            /*-moz-text-shadow:0 1px 0 #8d0001;-webkit-text-shadow:0 1px 0 #8d0001;text-shadow:0 1px 0 #8d0001;
            text-shadow:0px 1px 0 #8d0001;*/
        }
        .box .title-orange {
            padding: 0 5px 0px 10px;
            border-radius: 3px 3px 3px 0;
            color:#ffffff;
            height:22px;
            margin:-1px;
            /*-moz-text-shadow:0 1px 0 #8d0001;-webkit-text-shadow:0 1px 0 #8d0001;text-shadow:0 1px 0 #8d0001;
            text-shadow:0px 1px 0 #8d0001;*/
        }
        .box .title-green {
            padding: 0 5px 0px 10px;
            background:url(${basepath}/static/m/img/title-bg-green.png) no-repeat 0 0;
            border-radius: 3px 3px 3px 0;
            color:#ffffff;
            height:22px;
            margin:-1px; 
            /*-moz-text-shadow:0 1px 0 #8d0001;-webkit-text-shadow:0 1px 0 #8d0001;text-shadow:0 1px 0 #8d0001;
            text-shadow:0px 1px 0 #8d0001;*/
        }
        .box .title-brown {
            padding: 0 5px 0px 10px;
            background:url(${basepath}/static/m/img/title-bg-brown.png) no-repeat 0 0;
            border-radius: 3px 3px 3px 0;
            color:#ffffff;
            height:22px;
            margin:-1px;
            /*-moz-text-shadow:0 1px 0 #8d0001;-webkit-text-shadow:0 1px 0 #8d0001;text-shadow:0 1px 0 #8d0001;
            text-shadow:0px 1px 0 #8d0001;*/
        }
        .box .Detail {
            padding: 15px;
        }
        .zhongjiangbg{width: 100%;}
        .big_box{padding:0px 10px;background:url(${basepath}/static/m/img/zhonagjiang_h.png);background-size:100% 100%;position:relative;}
    </style>
</head>
<body>
<%--<img src="${basepath}/static/m/img/zhongjian.png" class="zhongjiangbg"> --%>
<div class="big_box">
<div class="result">
    <%--<div class="gongxi">恭喜你！中奖啦！</div> --%>
    <div class="jiangxiang" >${vo.awardTitle }</div>
</div>


<div class="boxcontent boxyellow">
    <div class="box">
        <div class="title-green"><span>兑奖说明：</span></div>
        <div class="Detail">
            <p>所获奖项：${vo.awardContent } </p>
            <p>兑奖SN码：${vo.sncode } </p>
            <p>说明：请根据SN码兑换奖品 </p>
        </div>
    </div>
</div>
  
</div>

<script src="${basepath}/static/js/jquery-2.1.0.min.js"	type="text/javascript"></script>
	<script type="text/javascript">
	$(function(){
		var h11=$(window).height();
		var b_w;
		$(".big_box").height(h11);
		b_w=$(".big_box").width();
		$(".boxcontent").width(b_w-4);
		$(".result").width(b_w-4);
		});	
	</script>
</body>

</html>