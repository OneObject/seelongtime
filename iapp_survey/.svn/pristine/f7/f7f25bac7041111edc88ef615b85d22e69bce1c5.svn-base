<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="en" id="top" class="no-js">
<head>
<meta charset="utf-8">
<title>Player Demo Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<!-- jquery library -->
<script type="text/javascript" src="http://v.jteam.cn:80/player/static/jquery-1.10.2.min.js"></script>
<!-- player library -->
<script type="text/javascript" src="http://v.jteam.cn:80/player/static/player.js?v=1.0" charset="utf-8"></script>
<!-- 为了方便升级，请用绝对路径引用该 JS，src改成 http://v.jteam.cn:80/player/static/player.js -->
<script>
 $(function(){	 
	setupPlayer(); 
 });
 //初始化player 
 function setupPlayer(){
	$("#player").player({
	    playerKey:"testkey", //授权key
		serverUrl:"http://v.jteam.cn:80/jvideo/api/player/playUrl.do", //测试的平台服务器地址
		
		//playerType:"HTML5Player", //可以指定player的类型，默认是自动识别(建议)
	    onStateChanged:function(videoId,newPlayerState,oldPlayerState){
		  //播放状态变化
		  $("#status").text(newPlayerState);
		  // alert("videoId="+videoId+",newPlayerState="+newPlayerState+",oldPlayerState="+oldPlayerState);		 
	    },
	    onShowError:function(videoId,errorId,errorMsg){
		   //发生错误了，比如flash未安装，播放流错误
		   $("#status").html("videoId="+videoId+",errorId="+errorId+","+errorMsg);
	    },
	    onInited:function(){
		   //当player 初始化好之后
		   $("#status").html("player 已经初始完毕");
	    },
		onPlayerTimeUpdated:function(time){
		  if (!time) return;
		  //alert(time.currentTime);
		  $("#time").text("当前Video的Time:"+time.currentTime);   
	    }
	});	
 }
 //播放视频
 function playVideo(){
	$("#player").player("playVideo",{
	    "src":"e8360f2e52c1ea0d1d006b55ba8bb186"//"a09a10217bed552c3b3ea53925d978c8" //videoId,通过平台得到的唯一标识
	    ,"options":{
		  //"poster":"static/images/poster.png"  //封面
		} 
	});   
 }
 //暂停视频
 function pauseVideo(){
	$("#player").player("pauseVideo");
 }
 //停止视频
 function stopVideo(){
	$("#player").player("stopVideo");
 }
 //seek视频到某个时间点，单位秒, live 是绝对时间 ，vod 是 相对时间(从0开始)
 function seekVideo(pos){
	$("#player").player("seekVideo",pos,false);
 }
 //seek video 到相对时间，比如向前10秒，向后10秒
 function seekToVideo(t){	
	$("#player").player("seekVideo",t,true);
 }
</script>
</head>
<body>
<h1>播放视频测试</h1>
<button onClick="playVideo()">播放</button><button onClick="pauseVideo()">暂停</button><button onClick="stopVideo()">停止</button><button onClick="seekToVideo(10)">向前10秒</button><button onClick="seekToVideo(-10)">向后10秒</button>
<div id="status" style="color:#F00"></div>
<div id="time" style="color:#00F"></div> 
<!-- 视频是 16：9 的制式 -->
<div id="player" style="height:360px;width:640px; background:#000;"></div>     
</body>
</html>