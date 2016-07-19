<%@page import="com.longtime.ajy.ext.muyang.model.InformationDetail"%>
<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>${detail.name }</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta name="viewport"
	content="initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">

<script type="text/javascript" src="${basepath}/static/js/jquery-2.1.0.min.js"></script>

<script type="text/javascript">
    //去掉右上角选项
    document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
    	WeixinJSBridge.call('hideOptionMenu');
    });
</script>

<style type="text/css">
	*{padding:0px;margin:0px;}
	ul{list-style:none;}
	.clr{clear:both;}
	a,a:hover,a:focus{text-decoration:none;}
	input,textarea,a{outline:none;}
	textarea{resize:none;}
	input:focus,textarea:focus,a:focus{outline:none;}
	:root{height:100%;overflow-x: hidden;}
	body{font-family:"Microsoft yahei","sans-serif";font-size:62.5%;background:#eeeeee;color:#53575e;min-width:320px;height:100%;}
	body a,button,input{-webkit-tap-highlight-color:rgba(255,0,0,0);}
	article.scroll a:active{background:#f4f4f4;}
	
	header{width:100%;height:38px;line-height:38px;padding:6px 0px;text-align:center;font-size:16px;color:#fff;position:fixed;z-index:5;top:0px;left:0px;}
	.home{width:44px;height:38px;text-align:center;line-height:38px;position:absolute;right:0px;top:9px;}
	.home i{font-size:24px;width:44px;height:38px;line-height:38px;display:block;}
	.home a{color:#fff;}
	.home a.txt{font-size:12px;}
	.back{width:44px;height:38px;line-height:38px;position:absolute;left:0px;top:9px;}
	.back i{font-size:24px;}
	.back a{color:#fff;width:44px;height:38px;line-height:38px;display:block;}
	header span.addWrap{height:38px;width:70%;white-space:nowrap;text-overflow:ellipsis;display:inline-block;line-height:38px;overflow:hidden;}
	article.scroll{padding-top:50px;z-index:0;}
	footer.footer{display:none;}
	
	.ctl_header{display:none;}
	.ctl_footer{display:none;}
	article.ctl_cont{padding-top:50px;}
	
	
	section.showNews{width:auto;padding:12px 5px 15px 5px;overflow-x: hidden;}
	section.showNews h2{font-size:16px;font-weight:normal;color:#53575e;padding-left:5px;margin-bottom:10px;font-weight:bold;}
	section.showNews span.date{padding-left:5px;display:block;font-size:12px;color:#999;margin-bottom:5px;}
	section.showNews p{font-size:16px;line-height:24px;padding:5px 0px;}
	section.showNews p.pic{padding:5px;}
	section.showNews p.pic img{width:100%;}
	.bottomInfo{height:20px;line-height:20px;font-size:14px;margin-top:25px;box-sizing:border-box;color:#999;}
	section.showNews a{display: inline-block;float:left;color:#607fa6;text-decoration:none;margin-right:10px;}
	section.showNews .readNum{display: inline-block;float:left;}
	
</style>
<%@ include file="/WEB-INF/include/analysis_baidu.jsp"%>
<%@ include file="/WEB-INF/include/m_h5_setting.jsp"%>
</head>
<body >

<header id="backBtn" class="ctl_header" style="display:block;">
		<div class="back"><a href="javascript:history.go(-1);" style="background: url(${basepath}/static/m_h5/img/d.png) center 10px no-repeat;"> </a></div>
		<div style="overflow:hidden;width:250px;height:38px; margin:0 auto;">${detail.name }</div>
	</header>
	<article id ="ab" style="padding-top:50px;">


    <section class="showNews">
    	<c:if test="${empty detail }">
		<h1 style="text-align: center;  font-size: 18px;">未找到该资讯或已被删除</h1>
		</c:if>
    	<h2>${detail.name }</h2>
    	<span class="date">${ltfun:dateLongToStringFormat(detail.createtime,'yyyy-MM-dd') }</span>
    	${detail.content }
        
		<div class="bottomInfo">
       
        
		</div>
		 
  	  </section> 
    </article>

<script type="text/javascript">

	
	var defaultGid = 0;
	var defaultIndex = 0;
	
 	var imgDate = {};//二位数组，保持图片的组别，顺序和地址信息
	var imgs = document.getElementsByTagName("img");
	for ( var i = 0; i < imgs.length; i++) {
		var img = imgs[i];
		var index = img.getAttribute("data-index");//存放索引
		var gid = img.getAttribute("data-gid");//组号 data-gid 存放组号
		var dsrc = img.getAttribute("data-src");//地址 
		if (index && gid && dsrc) {
			imgDate[gid] = imgDate[gid] || []; //该组不存在则创建
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
		var wxJSbridge = window.WeixinJSBridge
				|| parent.window.WeixinJSBridge;
		if (typeof wxJSbridge != 'undefined') {
			wxJSbridge.invoke('imagePreview', {
				'current' : imgDate[groupid][index],//当前地址
				'urls' : imgDate[groupid] //组
			});
		} else {
			//alert("请在微信中查看", null, function(){});
			console.log(groupid + " " + index);
		}
	} 
	
	function isPc() {
	    if (!/AppleWebKit.*Mobile.*/i.test(navigator.userAgent)) {
	        return true;
	    }
	    return false;
	};

	if (isPc()) {
		$('iframe').height((window.innerWidth - 10) / 16 * 9 + 'px');
	}
	
</script>
</body>
</html>