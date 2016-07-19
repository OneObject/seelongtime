<%@page import="org.slf4j.LoggerFactory"%>
<%@page import="org.slf4j.Logger"%>
<%@page import="com.longtime.common.utils.UAgentInfo"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="com.longtime.ajy.support.SpringContextUtil"%>
<%@page import="com.longtime.ajy.mweb.service.*"%>
<%@ page import="com.longtime.ajy.mweb.model.Video" %>
<%@ page import="com.longtime.ajy.session.SessionHelper" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	Logger logger = LoggerFactory.getLogger("com.longtime.ajy.ivideoplayer.jsp");
	boolean isMobile = false;
	boolean isAndroid = false;
	String userAgent = request.getHeader("User-Agent");
	String httpAccept = request.getHeader("Accept");
    String domain  = SessionHelper.getCurrentDomain();
    if (StringUtils.isBlank(userAgent) && StringUtils.isBlank(httpAccept)) {

	}else{
		UAgentInfo detector = new UAgentInfo(userAgent, httpAccept);
		isMobile =  detector.isMobilePhone || detector.isTierTablet || detector.isTierIphone;
		isAndroid =  detector.isAndroid;
	}
	logger.debug("the from device is mobile=[{}]", isMobile);
	
	VideoService videoService = (VideoService)SpringContextUtil.getBean("videoService");
	String videoId = request.getParameter("vid");
	String cover = request.getParameter("cover");
	String mp4url = null;
	String type = request.getParameter("type");
	String url = null;
	if(StringUtils.isNotBlank(type) && "local".equals(type)){
		url = request.getParameter("url");
	}

    Video video = videoService.findByVideoId(videoId,domain);

    if(video==null || video.is_delete()){
        videoId = "";
    }

	if(isAndroid){
		
		if(videoService != null && null!= video && video.is_delete()==false){
			mp4url = video.getMp4downloadurl();
		}
	}
	
	
%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>ividoe player</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <style type="text/css">
    html,body{
    	margin: 0px;
    	padding: 0px;
    	display: block;
    	overflow: hidden;
    }
    </style>
</head>
<body>


<% 
//本地视频
if(StringUtils.isNotBlank(type) && "local".equals(type)){
	if(!isMobile){
		%>
		<video  poster="<%=cover%>" controls   autoplay  width="100%" height="100%">
				<source src="<%=url %>" type='video/mp4'></source>
				
		</video>
		
	<% 
	}else{
%>
	<video  controls  width="100%" height="100%" style="position:absolute;" poster="<%=cover%>">
			<source src="<%=url %>" type='video/mp4'></source>
	</video>
<%	}
}else{
	//云端视频
	if(!isMobile){
%>
            <!-- 视频是 16：9 的制式 -->
            <div class="player">
                <div id="player" style="width: 100%;height: auto;position:absolute;"></div>
            </div>
    
     <!-- player library -->
    <script type="text/javascript" src="http://v.jteam.cn:80/player/static/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="http://v.jteam.cn:80/player/static/player.js?v=1.2" charset="utf-8"></script>

	<script>
        $(function(){
            setupPlayer();
        });
        //初始化player
        function setupPlayer(){
            $("#player").player({
            	autoPlay:false,
                playerKey:"testkey", //授权key
                serverUrl:"http://v.jteam.cn:80/jvideo/api/player/playUrl.do", //测试的平台服务器地址
                onStateChanged:function(videoId,newPlayerState,oldPlayerState){
                    //播放状态变化
                },
                onShowError:function(videoId,errorId,errorMsg){
                },
                onInited:function(){
                    setSource();
                    //playVideo();
                },
                onPlayerTimeUpdated:function(time){
                    if (!time) return;
                }
            });
        }
        //播放视频
        function setSource(){
	       	$("#player").player("setSource",{
                "src":"<%=videoId%>" ,//"a09a10217bed552c3b3ea53925d978c8" //videoId,通过平台得到的唯一标识
                "options":{
                	<%if(StringUtils.isNotBlank(cover)){%>
                		"poster":"<%=cover%>"  //封面
                	<%}%>
                }
            }); 
        }
        //播放视频
        function playVideo(){
        	$("#player").player("playVideo");
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
 <%
	}else{
		
		if(StringUtils.isNotBlank(mp4url)){

            //播放地址替换
            mp4url = mp4url.replace("121.41.116.92","video.aijiayou.com");

	
%>
		<video src="<%=mp4url %>" controls  width="100%" height="100%" style="position:absolute;" poster="<%=cover%>"></video>
		<%
		}else{
		%> 
 		<video src="<%=Constant.IVIDEO_SERVER %>/jvideo/player/<%=videoId%>.m3u8" controls  width="100%" height="100%" style="position:absolute;" poster="<%=cover%>"></video>
	<%	
		}
	}
%>
	
<% 	
}
%>

</body>
</html>