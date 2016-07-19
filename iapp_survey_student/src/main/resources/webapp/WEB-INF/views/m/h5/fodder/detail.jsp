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
<title>新闻详情</title>
</head>

<body>
	
	<header class="ctl_header">
    	<div class="back"><a href="javascript:history.go(-1);"><i class="fa fa-angle-left"></i></a></div>
     	<span class="addWrap" id="ptitle">${vo.title }</span>
	</header>
    
    <article class="scroll ctl_cont">
    
    <section class="showNews">
    
    	<h2>${vo.title }</h2>
    	<span class="date">${ltfun:dateLongToStringFormat(vo.modifyTime,'yyyy-MM-dd') }</span>
    	<c:if test="${vo.coverShowInText == 1 }">
    	<p class="pic">
       	 <img src="${vo.coverPath }" style="width: 100%">
       	 </p>
    	</c:if>
        ${vo.content }
        <c:if test="${not empty  vo.sourceUrl}">
		<a href=" ${vo.sourceUrl }" target="view_window" style="text-decoration: none;color:#999;">原文链接</a>
		</c:if>
    </section>
    

    
    
    
    
    
    
    </article>
    
    
	

<script type="text/javascript">
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
		}
	} 
</script>
</body>

</html>
