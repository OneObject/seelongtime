<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>摇一摇</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <!-- Disable phone number detection. -->
    <meta name="format-detection" content="telephone=no">
    <STYLE>
        * { margin: 0; padding: 0; }
        body { background: #292D2E; }
        .hand { width: 190px; height: 300px; background: url("${basepath}/static/ixin/img/yyy.png") no-repeat; position: absolute; top: 50px; left: 50%; margin-left: -95px; }
        .hand-animate { -webkit-animation: hand_move infinite 2s; }
        .result { background: #393B3C; border: #2C2C2C 1px solid; box-shadow: inset #4D4F50 0 0 0 1px; border-radius: 10px; color: #fff; padding: 10px; width: 300px; position: absolute; top: 300px; left: 50%; margin-left: -161px; opacity: 0;
            -webkit-transition: all 1s;
            -moz-transition: all 1s;
            -ms-transition: all 1s;
            -o-transition: all 1s;
            transition: all 1s; }
        .result .pic { width: 50px; height: 50px; float: left; background: #fff; }
        .result .con { overflow: hidden; zoom: 1; padding-left: 10px; line-height: 24px; }
        .result-show { opacity: 1; margin-top: 50px; }
        .loading { position: absolute; top: 240px; left: 50%; margin-left: -50px; width: 100px; height: 100px; background: url("${basepath}/static/ixin/img/loading.png") no-repeat; background-size: 100px 100px; opacity: 0;
            -webkit-animation: loading infinite linear .5s;
            -moz-animation: loading infinite linear .5s;
            -ms-animation: loading infinite linear .5s;
            -o-animation: loading infinite linear .5s;
            animation: loading infinite linear .5s;
            -webkit-transition: all .5s;
            -moz-transition: all .5s;
            -ms-transition: all .5s;
            -o-transition: all .5s;
            transition: all .5s; }
        .loading-show { opacity: 1; }

        @-webkit-keyframes hand_move {
            0% {
                -webkit-transform: rotate(0);
                -moz-transform: rotate(0);
                -ms-transform: rotate(0);
                -o-transform: rotate(0);
                transform: rotate(0); }
            50% {
                -webkit-transform: rotate(15deg);
                -moz-transform: rotate(15deg);
                -ms-transform: rotate(15deg);
                -o-transform: rotate(15deg);
                transform: rotate(15deg); }
            100% {
                -webkit-transform: rotate(0);
                -moz-transform: rotate(0);
                -ms-transform: rotate(0);
                -o-transform: rotate(0);
                transform: rotate(0); }
        }
        @-webkit-keyframes loading {
            0% {
                -webkit-transform: rotate(0);
                -moz-transform: rotate(0);
                -ms-transform: rotate(0);
                -o-transform: rotate(0);
                transform: rotate(0); }
            100% {
                -webkit-transform: rotate(360deg);
                -moz-transform: rotate(360deg);
                -ms-transform: rotate(360deg);
                -o-transform: rotate(360deg);
                transform: rotate(360deg); }
        }
    </STYLE>
</head>
<body>
<div class="hand hand-animate" id="hand"></div>
<div class="loading" id="loading"></div>
<div class="result" id="result">
<div class="pic"></div>
<div class="con">摇晃结果<BR>摇晃结果的其他信息哈哈哈</div></div>
<%-- 
<embed id="devUnknown"
       src="${basepath}/static/sound/shake_sound_male.mp3"
       width="0"
       height="0"
       loop="false"
       autostart="true">
</embed>
--%>
<script src="${basepath}/static/ixin/js/zepto.js"></script>
<script type="text/javascript" src="${basepath}/static/ixin/js/userInfo.js"></script>
<script type="text/javascript">
    var SHAKE_THRESHOLD = 900;
    var last_update = 0;
    var x = y = z = last_x = last_y = last_z = 0;
    var rewardId = "${rewardId}";
    if (window.DeviceMotionEvent) {
        window.addEventListener('devicemotion', deviceMotionHandler, false);
    } else {
        alert('请使用微信、或者移动设备来玩本游戏！');
    }
    var isChoose = false;
    function deviceMotionHandler(eventData) {
        var acceleration = eventData.accelerationIncludingGravity;
        var curTime = new Date().getTime();

        if ((curTime - last_update) > 100) {
            var diffTime = curTime - last_update;
            last_update = curTime;
            x = acceleration.x;
            y = acceleration.y;
            z = acceleration.z;
            var speed = Math.abs(x + y + z - last_x - last_y - last_z) / diffTime * 10000;
            var status = document.getElementById("status");
            if (speed > SHAKE_THRESHOLD  && isChoose==false) {
                isChoose = true;
                doResult();
            }
            last_x = x;
            last_y = y;
            last_z = z;
        }
    }
    function doResult() {
        document.getElementById("result").className = "result";
        document.getElementById("loading").className = "loading loading-show";
        setTimeout(function(){
        	document.getElementById("result").className = "result result-show";
            document.getElementById("loading").className = "loading";
            setUser();
        }, 1000);
        setTimeout(function(){
            isChoose=false
        },1000)
    }
    var old = new Array();
    function setUser(){
    	$.get("${basepath}/protal/activity/applycardreward.xhtml", { rewardId: "${reward.id}",containerId:"${container.id}", openId: "${openId}"},
		function(data){
    		if(data){
   			  window.location.href="${basepath}/protal/activity/cardreward.xhtml?rewardId=${reward.id}";
            }else{
   			  window.location.href="${basepath}/protal/activity/detail.xhtml?rewardId=${reward.id}";
            }
		});
    	
    }
</script>
</body>
</html>