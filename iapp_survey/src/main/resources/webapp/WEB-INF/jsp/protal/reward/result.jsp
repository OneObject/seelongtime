<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        .bg{background-image: url(${basepath}/iapp/static/ixin/img/activity-scratch-card-bg.jpg);}
        .result{display: block;overflow: hidden;position: absolute;top: 0px;width: 100%;}
        .gongxi{font-size: 1.2em;text-align: center;color: #fff;font-weight: bold;}
        .jiangxiang{font-size: 1.4em;color: #fff;text-align: center;margin-top: 20px;font-weight: bold;}
        .boxcontent {
            margin:15px 15px 0;
            border-radius: 5px;
            padding: 2px;
            background-color: #FEF8B2;
            -webkit-box-shadow: 0 0 6px rgba(0, 0, 0, 0.5);
            -moz-box-shadow: 0 0 6px rgba(0, 0, 0, 0.5);
            -o-box-shadow: 0 0 6px rgba(0, 0, 0, 0.5);
            box-shadow: 0 0 6px rgba(0, 0, 0, 0.5);
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
            background:url(${basepath}/iapp/static/ixin/img/title-bg-green.png) no-repeat 0 0;
            border-radius: 3px 3px 3px 0;
            color:#ffffff;
            height:22px;
            margin:-1px;
            /*-moz-text-shadow:0 1px 0 #8d0001;-webkit-text-shadow:0 1px 0 #8d0001;text-shadow:0 1px 0 #8d0001;
            text-shadow:0px 1px 0 #8d0001;*/
        }
        .box .title-brown {
            padding: 0 5px 0px 10px;
            background:url(${basepath}/iapp/static/ixin/img/title-bg-brown.png) no-repeat 0 0;
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
    </style>
</head>
<body class="bg">
<img src="${basepath}/iapp/static/ixin/img/zhongjian.png" class="zhongjiangbg">
<div class="result">
    <div class="gongxi">恭喜你！中奖啦！</div>
    <div class="jiangxiang" >${vo.awardTitle }</div>
</div>
<script src="${basepath}/iapp/static/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function(){
    	$(".gongxi").attr("style","margin-top:"+$(".zhongjiangbg").height()/2+"px");
    });
    $(window).resize(function(){
    	$(".gongxi").attr("style","margin-top:"+$(".zhongjiangbg").height()/2+"px");
    });
    </script>
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
  
</body>

</html>