<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<!DOCTYPE html>
<c:if test="${empty vo }">
	<html lang="zh-CN">
<head>
<title>error</title>
</head>
<h1>服务器没有查找到该条记录，原因：该条记录已删除或者参数有误。</h1>
	</html>
</c:if>
<c:if test="${not empty vo }">
<html lang="zh-CN">
<head>
<link rel="Shortcut Icon" href="${vo.coverPath }" />
<title>${vo.title }</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" type="text/css" href="${basepath }/static/ixin/css/weixin-client-page.css">
<script type="text/javascript" async="" src="${basepath }/static/ixin/js/weixin-wxa-1.0.0.js"></script>
<style>
#nickname {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	max-width: 90%;
}

ol,ul {
	list-style-position: inside;
}
</style>
<style>
#activity-detail .page-content .text {
	font-size: 16px;
}
</style>
</head>
<body>
<body id="activity-detail">
	<div class="page-bizinfo">
		<div class="header">
			<h1 id="activity-name" style="font-size: 20px;font-weight: bold;">${vo.title }</h1>
			<p class="activity-info">
				<span id="post-date" class="activity-meta no-extra"> <d:formatDate
						currentTime="${vo.modifyTime }" format="yyyy/MM/dd" />
				</span> <span class="activity-meta">${vo.author }</span>
			</p>
		</div>
	</div>
	<div class="page-content">
		<c:if test="${vo.coverShowInText == 1 }">
			<div class="media" id="media">
				<img alt="" src="${vo.coverPath }">
			</div>
		</c:if>
		<div class="text">${vo.content }</div>
		<c:if test="${not empty  vo.sourceUrl}">
			<a href=" ${vo.sourceUrl }" target="view_window"
				style="text-decoration: none; color: #999;">原文链接</a>
		</c:if>
	</div>
	<div style="width:100%;height:120px;"></div>
</body>
<script type="text/javascript">
 
var imgDate = {};//二位数组，保持图片的组别，顺序和地址信息

var defaultGid = 0;
var defaultIndex = 0;
var imgs = document.getElementsByTagName("img"); 
for(var i = 0; i < imgs.length; i++){
	var img = imgs[i];
  	var index = img.getAttribute("data-index");//存放索引
	var gid = img.getAttribute("data-gid");//组号 data-gid 存放组号
	var dsrc = img.getAttribute("data-src");//地址 
	if(index && gid && dsrc){ 
		imgDate[gid] = imgDate[gid]||[]; //该组不存在则创建
		imgDate[gid][index] = dsrc;//按照索引设置地址
	}else{
		//默认的组
		
		dsrc = img.getAttribute("data-src");
		if(!dsrc){
			dsrc=img.getAttribute("src");
		}
		
		img.setAttribute("data-index",defaultIndex);
		
		imgDate[defaultGid]=imgDate[defaultGid]||[];
		imgDate[defaultGid][defaultIndex]= dsrc;
		img.onclick = function () {
			preViewImg4Doc(defaultGid, this.getAttribute("data-index"));
		};
		defaultIndex = defaultIndex+1;
	}
} 
 //点击图片时调用，groupid组号，index索引号
function preViewImg4Doc(groupid, index) {  
	var wxJSbridge = window.WeixinJSBridge || parent.window.WeixinJSBridge;
	if (typeof wxJSbridge != 'undefined') {
		wxJSbridge.invoke('imagePreview', {
            'current' : imgDate[groupid][index],//当前地址
            'urls' : imgDate[groupid] //组
        });
    }else{
       //alert(groupid + " " + index);
    	console.log(groupid + " " + index);
    }
}
 
    
    var dataForWeixin={
    		   appId:"",
    		   MsgImg:"${vo.coverPath }",
    		   TLImg:"${vo.coverPath }",
    		   url:window.location.href,
    		   title:"${vo.title }",
    		   desc:"${vo.summary}",
    		   fakeid:"",
    		   callback:function(){}
    		};
    		(function(){
    		   var onBridgeReady=function(){
    		   //发送给朋友
    		   WeixinJSBridge.on('menu:share:appmessage', function(argv){
    		      WeixinJSBridge.invoke('sendAppMessage',{
    		         "appid":dataForWeixin.appId,
    		         "img_url":dataForWeixin.MsgImg,
    		         "img_width":"120",
    		         "img_height":"120",
    		         "link":dataForWeixin.url,
    		         "desc":dataForWeixin.desc,
    		         "title":dataForWeixin.title
    		      }, function(res){(dataForWeixin.callback)();});
    		   });
    		   //发送到朋友圈
    		   WeixinJSBridge.on('menu:share:timeline', function(argv){
    		      (dataForWeixin.callback)();
    		      WeixinJSBridge.invoke('shareTimeline',{
    		         "img_url":dataForWeixin.TLImg,
    		         "img_width":"120",
    		         "img_height":"120",
    		         "link":dataForWeixin.url,
    		         "desc":dataForWeixin.desc,
    		         "title":dataForWeixin.title
    		      }, function(res){});
    		   });
    		   //分享到微博
    		   WeixinJSBridge.on('menu:share:weibo', function(argv){
    		      WeixinJSBridge.invoke('shareWeibo',{
    		         "content":dataForWeixin.title,
    		         "url":dataForWeixin.url
    		      }, function(res){(dataForWeixin.callback)();});
    		   });
    		   //分享到facebook
    		   WeixinJSBridge.on('menu:share:facebook', function(argv){
    		      (dataForWeixin.callback)();
    		      WeixinJSBridge.invoke('shareFB',{
    		         "img_url":dataForWeixin.TLImg,
    		         "img_width":"120",
    		         "img_height":"120",
    		         "link":dataForWeixin.url,
    		         "desc":dataForWeixin.desc,
    		         "title":dataForWeixin.title
    		      }, function(res){});
    		   });
    		};
    		if(document.addEventListener){
    		   document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
    		}else if(document.attachEvent){
    		   document.attachEvent('WeixinJSBridgeReady'   , onBridgeReady);
    		   document.attachEvent('onWeixinJSBridgeReady' , onBridgeReady);
    		}
    		})();
    
    
    </script>
	</html>
</c:if>
<%@include file="/WEB-INF/jsp/include/student/wx.jsp"%>
<%--
<%@include file="/WEB-INF/jsp/include/analysis.jsp"%>
 --%>