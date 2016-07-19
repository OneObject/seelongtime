<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="format-detection" content="telephone=no" />
    <link rel="stylesheet" href="${basepath }/static/plugins/font-awesome-4.1.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="${basepath }/static/m_h5/css/common.css" >
    <link rel="stylesheet" href="${basepath }/static/m_h5/css/color.css" >
<title></title>
<style type="text/css">

.com{width:115px;height:38px;text-align:center;line-height:38px;position:absolute;right:0px;top:6px;}
.com i{font-size:18px;height:38px;line-height:38px;display:inline-block;}
.com a{color:#fff;}
.com span.a{cursor:pointer;margin-left:7px;}
.com span.count{margin-left:3px;font-size:14px;}

article.frame{padding:50px 0px 0px 0px;width:100%;}
article.frame iframe{width:100%;height:100%;border:0px;frame-border:0;overflow-y:scroll;}
</style>


<%-- 页面风格设置 --%>
<%@ include file="/WEB-INF/include/m_h5_setting.jsp"%>

<script type="text/javascript" src="${basepath }/static/js/jquery-2.1.0.min.js"></script>
   
<script type="text/javascript"> 
$(document).ready(function(){
	//var h=$(window).height()-58;
	//var w=$(window).width();	
	//$("header").height(38);
	var hasHeader=($("header").css("display")==="none");
	var isWeiX=isWeiXin();
	var h=$(window).height()-50;
    var w=$(window).width();
    if(isWeiX && hasHeader){
    	h=$(window).height();
	}
    $("article.frame").height(h);
    
});
$(function(){
	if(/android/i.test(navigator.userAgent)){
		var orientationEvent;
		var supportsOrientationChange = "onorientationchange" in window;
		orientationEvent = supportsOrientationChange ? "orientationchange" : "resize";			 
		window.addEventListener(orientationEvent, function() {
			var isWeiX=isWeiXin();
			var iframe =window.frames[0].document;
			var len=$("#newactivebox .newactiveitem",iframe).length;
			var imgArr=$("#newactivebox .newactiveitem",iframe);
			var hasHeader=($("header").css("display")==="none");
			var j;
			var w;
			var imgW;
			var	picW;
			var h;
			if(isWeiX){
				setTimeout(function(){					
					w=$(window).width()-36;
					imgW=Math.floor(w/3); 
					picW=imgW*0.6;							
					h=$(window).height()-50;		
					if(isWeiX && hasHeader){
					    	h=$(window).height();
						}
					$("article.frame").height(h);			
					for(var i=0;i<len;i++){
						j=i+1;
						if(j%3==0){
							$(imgArr[i]).css({"margin-right":"0px"});
							}
						$(imgArr[i]).width(imgW);
						$(imgArr[i]).height(imgW);	
						$(imgArr[i]).find("img").width(picW);
						$(imgArr[i]).find("img").height(picW);				
						}		
					},800);
				}else{
					w=$(window).width()-36;
					imgW=Math.floor(w/3);
					picW=imgW*0.6;							
					h=$(window).height()-50;			
					if(isWeiX && hasHeader){
					    	h=$(window).height();
						}
					$("article.frame").height(h);			
					for(var i=0;i<len;i++){
						j=i+1;
						if(j%3==0){
							$(imgArr[i]).css({"margin-right":"0px"});
							}
						$(imgArr[i]).width(imgW);
						$(imgArr[i]).height(imgW);	
						$(imgArr[i]).find("img").width(picW);
						$(imgArr[i]).find("img").height(picW);				
						}		
					}
			
		}, false);
		}
});

//判断是否是微信
function isWeiXin(){
    var ua = window.navigator.userAgent.toLowerCase();
    if(ua.match(/MicroMessenger/i) == 'micromessenger'){
        return true;
    }else{
        return false;
    }
}

function setTitle(){
	var title = window.frames["icontent"].document.getElementsByTagName("title")[0].innerHTML;
	window.document.title = title;
	$("#ptitle").html(title);
}
</script>

</head>
<body>
	<header  class="ctl_header">
    	<div class="back"><a href="javascript:history.go(-1);" ><i class="fa fa-angle-left"></i></a></div>
     <span style="height:38px;width:70%;white-space:nowrap;text-overflow:ellipsis;display:inline-block;line-height:38px;overflow:hidden;" id="ptitle"></span>
        <div class="com">
      
        </div>
        
</header>    
    <article class="frame ctl_cont">
    	<iframe src="${param.url }" id="icontent" name="icontent" style="display:block;" onload="setTitle();"></iframe>
    </article>
</body>
</html>
	