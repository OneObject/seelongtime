<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
	<%
	   	response.setHeader("Pragma","No-cache");
	   	response.setHeader("Cache-Control","No-cache"); 
	   	response.setDateHeader("Expires", -1); 
	   	response.setHeader("Cache-Control", "No-store");
	   	
	   	String domain = MwebHelper.getCurrentDomain();
		boolean isShowCai = StringUtils.equals("chtwm", domain);
		pageContext.setAttribute("isShowCai", isShowCai);
		
   	%>
	<%
	if("ennapp".equals(domain)){
%>


<html>
<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="format-detection" content="telephone=no" />
   
    <link rel="stylesheet" href="http://libs.baidu.com/fontawesome/4.1.0/css/font-awesome.min.css" />
   <%--   
    <link rel="stylesheet" href="${basepath }/static/plugins/font-awesome-4.1.0/css/font-awesome.min.css?v=20141113" />
   
    <link rel="stylesheet" href="http://imweb.qiniudn.com/static/plugins/font-awesome-4.1.0/css/font-awesome.min.css" />
   		--%>
    <script type="text/javascript">
	
    //去掉底部的黑条
    document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
    	WeixinJSBridge.call('hideToolbar');
    });
    
    <%if(!"fosun".equalsIgnoreCase(domain)){%>
    //去掉右上角选项
    document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
    	WeixinJSBridge.call('hideOptionMenu');
    });
    <%}%>
	</script>
<title>${course.name }</title>
<style type="text/css">
	*{padding:0px;margin:0px;}
	ul{list-style:none;}
	.clr{clear:both;}
	a,a:hover,a:focus{text-decoration:none;}
	input,textarea,a{outline:none;}
	textarea{resize:none;}
	input:focus,textarea:focus,a:focus{outline:none;}
	:root{height:100%;}
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
		
	/*新版课程详情评论模块*/
	.funcBox{width:100%;height:48px;line-height:48px;border-top:1px solid #e0e0e0;position:fixed;left:0px;bottom:0px;background:#fff;z-index:12000;}
	.funcBox span{display:inline-block;height:48px;font-size:14px;color:#627f26;box-sizing:border-box;width:32%;text-align:center;cursor:pointer;}
	.funcBox span:first-child+span{border-left:1px solid #e0e0e0;border-right:1px solid #e0e0e0;box-sizing:border-box;}
	.funcBox span:first-child i{display:inline-block;margin-right:5px;position:relative;top:0px;}
	
	.funcBox1{width:100%;height:48px;line-height:48px;border-top:1px solid #e0e0e0;position:fixed;left:0px;bottom:0px;background:#fff;z-index:12000;}
	.funcBox1 span{display:inline-block;height:48px;font-size:14px;color:#627f26;box-sizing:border-box;width:49%;text-align:center;cursor:pointer;}
	.funcBox1 span:first-child+span{border-left:1px solid #e0e0e0;}
	.funcBox1 span:first-child i{display:inline-block;margin-right:5px;position:relative;top:0px;}
	.com{width:115px;height:38px;text-align:center;line-height:38px;position:absolute;right:0px;top:6px;}
	.com i{font-size:18px;height:38px;line-height:38px;display:inline-block;}
	.com a{color:#fff;}
	.com span.a{cursor:pointer;margin-left:7px;}
	.com span.count{margin-left:3px;font-size:14px;}
	
	article.frame{padding:50px 0px 48px 0px;display:block;box-sizing:content-box;}
	article.frame iframe{width:100%;height:100%;border:0px;frame-border:0;overflow-y:scorll;}
	header{box-sizing:content-box;}
	
	span.tishi {width:80px;height:14px;padding:5px 20px;line-height:14px;color:#fff;background:#333;font-size:14px;display:block;position:fixed;left:50%;margin-left:-60px;bottom:50px;text-align:center;}
	span.tishi1 {width:80px;height:14px;padding:5px 20px;line-height:14px;color:#fff;background:#333;font-size:14px;display:block;position:fixed;left:50%;margin-left:-60px;bottom:80px;text-align:center;}
	
	.funcBox-col-1 span{width:100% !important;float:left;}
	.funcBox-col-1 span{border-right:none !important;border-left:none !important;}
	.funcBox-col-1 span:last-child{border-right:none !important;}
	
	.funcBox-col-2 span{width:50% !important;float:left;}
	.funcBox-col-2 span{border-right:1px solid #e0e0e0 !important;border-left:none !important;}
	.funcBox-col-2 span:last-child{border-right:none !important;}
	
	.funcBox-col-3 span{width:33% !important;float:left;}
	.funcBox-col-3 span{border-right:1px solid #e0e0e0 !important;border-left:none !important;}
	.funcBox-col-3 span:last-child{border-right:none !important;}
	
	.funcBox-col-4 span{width:25% !important;float:left;}
	.funcBox-col-4 span{border-right:1px solid #e0e0e0 !important;border-left:none !important;}
	.funcBox-col-4 span:last-child{border-right:none !important;}
	.funcBox-col-4 span{padding-top:4px;}
	.funcBox-col-4 span > label{display:block;width:100%;text-align:center;height:20px;line-height:20px;float:left;}
	
	.funcBox-col-5 span{width:20% !important;float:left;}
	.funcBox-col-5 span{border-right:1px solid #e0e0e0 !important;border-left:none !important;}
	.funcBox-col-5 span:last-child{border-right:none !important;}
	.funcBox-col-5 span{padding-top:4px;}
	.funcBox-col-5 span > label{display:block;width:100%;text-align:center;height:20px;line-height:20px;float:left;}
	a,button,input,textarea,span,img,li,div{-webkit-tap-highlight-color:rgba(255,0,0,0);}
</style>
<%-- 页面风格设置 --%>
<%@ include file="/WEB-INF/include/m_h5_setting.jsp"%>
<style type="text/css">
header {
  width: 100%;
  height: 50px;
  line-height: 50px !important;
  background: #26a69a !important;
  -webkit-box-sizing:border-box;
  box-sizing:border-box;
  position: fixed;
  left: 0;
  top: 0;
  padding:0  !important;
  z-index: 50; }
  header .btn {
    height: 50px;
    line-height: 50px;
    display: inline-block;
    width: 50px;
    text-align: center;
    color: #fff;
    font-size: 18px; }
  header .btn-left {
    float: left;
    text-align: center; }
    header .btn-left i {
      font-size: 34px;
      position: relative;
      top: 3px; }
  header .btn-right {
    float: right;
    text-align: center; }
  header .btn-width-70 {
    width: 70px; }
  header .title {
    -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
    padding: 0 50px;
    color: #fff;
    font-size: 18px;
    height: 50px;
    line-height: 50px;
    text-align: center;
	width:100%;
	white-space:nowrap;
	overflow:hidden;
	text-overflow:ellipsis;
	position:absolute;
	left:0px;
	top:0px;
	z-index:-1;}
  header .title-2 {
    -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
    padding: 0 70px;
	width:100%;
	white-space:nowrap;
	overflow:hidden;
	text-overflow:ellipsis;
	position:absolute;
	left:0px;
	top:0px;
	z-index:-1;}

.funcBox span, .funcBox1 span{
color:#26a69a !important;}
</style>
<%--
<%@ include file="/WEB-INF/include/analysis_baidu.jsp"%>
 --%>
</head>
<body>
	<header class="ctl_header">
		<span  class="btn btn-left"  onclick="javascript:history.go(-1);">  <i class="fa fa-angle-left"></i></span>
    	<%--
    	 <div class="back"><a href="javascript:history.go(-1);"><i class="fa fa-angle-left"></i></a></div>
    	 --%>
     	<div class="title ">${course.name }</div>
     <%--   <div class="com">
        <a href="${basepath }/m/h5/study/comments.xhtml?cid=${course.id}"><i class="fa fa-comment-o"></i><span id="commentnum" class="count">0</span></a> 
        	<span class="a"  onclick="zan(this)" ><i id="zanicon" class="fa fa-thumbs-o-up"></i><span class="count" id="zannum">0</span></span>
        </div> --%>  
	</header>
    
    <article  class="scroll ctl_cont frame">
    <iframe id="iframe_content" src="${location}">  </iframe>
 </article>
 
 		
	
	 <div class="funcBox1 toolbar funcBox-col-${isShowCai ? 3 : 1 }">
        <!-- <span  onclick="zan(this)" ><i id="zanicon" class="fa fa-thumbs-o-up"></i>赞（<label id="zannum">0</label>）</span> -->
        
		<span  class="b"  onclick="toComments('${course.id}')">评论（<label id="commentnum">0</label>）</span>
		
    </div>
	
	
		
    
	<%--计时 --%>
<iframe style="display: none;" id="iframe_trace" ></iframe> 

<%--
<script type="text/javascript" src="${basepath}/static/m_h5/js/jquery-2.1.1.min.js"></script> 
 --%>
 
<script type="text/javascript" src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script> 
   
<script type="text/javascript">
var praisenum = "${ajy:praiseTotal(course.id,1)}"; //赞数量
var unpraisenum = "${ajy:unpraiseTotal(course.id,1)}"; //踩数量
var commentnum = "${ajy:commentTotal(course.id,1)}"; //评论数量
var zanstatus = "${zanStatus}";
var caistatus = "${caiStatus}";


$(function(){
      
	var orientationEvent;	
	var supportsOrientationChange = "onorientationchange" in window;	  
	orientationEvent = supportsOrientationChange ? "orientationchange" : "resize";

	changeIframe();
	   
	window.addEventListener(orientationEvent, function() {	
		//setTimeout(changeIframe,2000);
		changeIframe();
	}, false); 
	
		
	//getCommentTotal();
	var zicon;
	if (zanstatus == "1") {//已取消赞
		 zicon = "fa fa-thumbs-o-up";
	} else {//已赞
		zicon = "fa fa-thumbs-up";
	}
	
	var cicon;
	if (caistatus == "1") {//已取消赞
		 cicon = "fa fa-thumbs-o-down";
	} else {//已赞
		cicon = "fa fa-thumbs-down";
	}
	
	$("#zanicon").removeClass().addClass(zicon);
	$("#caiicon").removeClass().addClass(cicon);
	$("#zannum").html(praisenum);
	$("#cainum").html(unpraisenum);
	$("#commentnum").html(commentnum);
	
});



function changeIframe(){
		var pc = isPC();
		var android = isAndroid();
		var ios =  isIos();
		var h=$(window).height();
		if(h==0){
			h=500;
		} 
	    var w=$(window).width();
	    var hasHead = $("header").css("display");
		
	    $("#iframe_content").contents().find("html,body").height(h-98);
	    
	    if(pc){
	    	$("article.frame").height(h-98);
	    	//$("article.frame iframe").width(w);
	        }
	    if(android){
	        if(hasHead == "block" ){
	        	$("article.frame").height(h-98);
	        	$("article.frame #iframe_content").height(h-98);
	        	//$("article.frame #iframe_content").width(w);
	        	$("article.frame").css({"padding-bottom":"0px"});
	            }else{
	            	$("article.frame").height(h-48);
	            	$("article.frame #iframe_content").height(h-48);
	            	//$("article.frame #iframe_content").width(w);
	            	$("article.frame").css({"padding-bottom":"0px"});
	                }
	        if(!!$("#iframe_content").contents().find("#myVideo").length){
					//$("#iframe_content").contents().find("#myVideo").width(w);
					$("#iframe_content").contents().find("#myVideo").height(w * 9 / 16);
		        }
			try{
		   	 window.frames["iframe_content"].myResize();
			}catch(e){
				console.log(e);
			}

	    }
	    if(ios){
	        if(hasHead == "block" ){
	                $("article.frame").height(h-98);
	                $("article.frame #iframe_content").height(h-98);
	                //$("article.frame #iframe_content").width(w);
	                $("article.frame #iframe_content").css({"margin-bottom":"48px"});
	                
	            }else{
	                $("article.frame").height(h-48);
	                $("article.frame #iframe_content").height(h-48);
	                //$("article.frame #iframe_content").width(w);
	                $("article.frame #iframe_content").css({"margin-bottom":"48px"});
	                }

	        	try{
			   	 window.frames["iframe_content"].myResize();
				}catch(e){
					console.log(e);
				}	
	        }

}


//judge pc
function isPC() 
{ 
    var userAgentInfo = navigator.userAgent; 
    var Agents = new Array("Android", "iPhone", "SymbianOS", "Windows Phone", "iPad", "iPod"); 
    var flag = true; 
    for (var v = 0; v < Agents.length; v++) { 
        if (userAgentInfo.indexOf(Agents[v]) > 0) { flag = false; break; } 
    } 
    return flag; 
} 
function isIos(){
			if (/ipad|iphone|mac/i.test(navigator.userAgent)){
				return true;
			}else{
				return false;
				}		
}

function isAndroid(){
	if (/android/i.test(navigator.userAgent)){
		return true; 
	}else{
		return false;
		}
	}

//定制提示色块
function showMyTish(_val,_color,_bg,_width){
	var val=_val.toString();
	var color=_color.toString();
	var bg=_bg.toString();
	var width=_width+"px";
	if(!!val){
		$("body").append('<span class="tishi">'+val+'</span>');
	}else{		
		$("body").append('<span class="tishi">已无更多</span>');	
	}
	if(!!color){
		$(".tishi").css({"color":color});					
	} 
			
	if(!!bg){
		$(".tishi").css({"background":bg});					
	} 
			
	if(!!width){
		$(".tishi").css({"width":width,"margin-left":(-(_width/2))+"px"});					
	}
	$(".tishi").fadeOut(2000);
}
			
/*获取论数
function getCommentTotal() { 
$.ajax({
		url : "${basepath}/m/comment/count/1/${course.id}.json",
		cache:false,
		type : "GET",
		success : function(data) {
			$("#commentnum").html(data);
		}
	});
 
}
*/

/*点赞*/
function zan(_this) {
	var courseid = "${course.id}";
	$.ajax({
		url : "${basepath}/m/ixin/study/clickpraise.json",
		type : "POST",
		data : {
			"restype" : "1",
			"resid" : courseid
		},
		success : function(data) {
			if (data.uid != null && data.uid != "") {
				var zanclass = "";
				if (praisenum < data.num) {//赞
					praisenum++;
					showMyTish("已赞","#fff","#000",100);
					zanclass = "fa fa-thumbs-up";
				} else {//取消赞
					praisenum--;
					showMyTish("取消赞","#fff","#000",100);	
					zanclass = "fa fa-thumbs-o-up";						
				}
				if(praisenum < 0){
					praisenum = 0;
				} 
				$("#zannum").html(praisenum);
				$("#zanicon").removeClass().addClass(zanclass);
				$("span.tishi").height(14);
			} else {
				showMyTish("赞失败","#fff","#000",100);
			}
		},
		error : function() {
			showMyTish("赞失败","#fff","#000",100);
		}
	});
}

/*踩*/
function cai(_this) {
	var courseid = "${course.id}";
	$.ajax({
		url : "${basepath}/m/ixin/study/clickpraise.json",
		type : "POST",
		data : {
			"restype" : "1",
			"type" : "1",
			"resid" : courseid
		},
		success : function(data) {
			if (data.uid != null && data.uid != "") {
				var caiclass = "";
				if (unpraisenum < data.num) {//踩
					unpraisenum++;
					showMyTish("已踩","#fff","#000",100);
					caiclass = "fa fa-thumbs-down";
				} else {//取消踩
					unpraisenum--;
					showMyTish("取消踩","#fff","#000",100);	
					caiclass = "fa fa-thumbs-o-down";
				}
				if(unpraisenum < 0){
					unpraisenum = 0;
				} 
				$("#cainum").html(unpraisenum);
				$("#caiicon").removeClass().addClass(caiclass);
				$("span.tishi").height(14);
			} else {
				showMyTish("踩失败","#fff","#000",100);
			}
		},
		error : function() {
			showMyTish("踩失败","#fff","#000",100);
		}
	});
}
//跳转到评论列表
function toComments(courseid){
	window.location.href="${basepath }/m/h5/study/comments.xhtml?cid="+courseid;
}
//跳到练习页面
function topratice(practiceId, courseId) {
	window.location.href = "${basepath }/m/h5/practice/detail.xhtml?id="
			+ practiceId + "&courseid=" + courseId;
}

//跳到考试页面
function toexam(examId, sign,timestamp) {
	window.location.href = "${basepath }/m/h5/exam/detail.xhtml?tid="+examId+"&sign="+sign+"&timestamp="+timestamp;
}


//计时页面加载
$(function(){
	$("#iframe_trace").attr('src', "${traceLocation}");
});

</script>
</body>
</html>







<%	
	}else{

	%>


<html>
<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="format-detection" content="telephone=no" />
   
    <link rel="stylesheet" href="http://libs.baidu.com/fontawesome/4.1.0/css/font-awesome.min.css" />
   <%--   
    <link rel="stylesheet" href="${basepath }/static/plugins/font-awesome-4.1.0/css/font-awesome.min.css?v=20141113" />
   
    <link rel="stylesheet" href="http://imweb.qiniudn.com/static/plugins/font-awesome-4.1.0/css/font-awesome.min.css" />
   		--%>
   
    <script type="text/javascript">
    //去掉底部的黑条
    document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
    	WeixinJSBridge.call('hideToolbar');
    });
    
    <%if(!"fosun".equalsIgnoreCase(domain)){%>
    //去掉右上角选项
    document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
    	WeixinJSBridge.call('hideOptionMenu');
    });
    <%}%>
	</script>
<title>${course.name }</title>
<style type="text/css">
	*{padding:0px;margin:0px;}
	ul{list-style:none;}
	.clr{clear:both;}
	a,a:hover,a:focus{text-decoration:none;}
	input,textarea,a{outline:none;}
	textarea{resize:none;}
	input:focus,textarea:focus,a:focus{outline:none;}
	:root{height:100%;}
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
		
	/*新版课程详情评论模块*/
	.funcBox{width:100%;height:48px;line-height:48px;border-top:1px solid #e0e0e0;position:fixed;left:0px;bottom:0px;background:#fff;z-index:12000;}
	.funcBox span{display:inline-block;height:48px;font-size:14px;color:#627f26;box-sizing:border-box;width:32%;text-align:center;cursor:pointer;}
	.funcBox span:first-child+span{border-left:1px solid #e0e0e0;border-right:1px solid #e0e0e0;box-sizing:border-box;}
	.funcBox span:first-child i{display:inline-block;margin-right:5px;position:relative;top:0px;}
	
	.funcBox1{width:100%;height:48px;line-height:48px;border-top:1px solid #e0e0e0;position:fixed;left:0px;bottom:0px;background:#fff;z-index:12000;}
	.funcBox1 span{display:inline-block;height:48px;font-size:14px;color:#627f26;box-sizing:border-box;width:49%;text-align:center;cursor:pointer;}
	.funcBox1 span:first-child+span{border-left:1px solid #e0e0e0;}
	.funcBox1 span:first-child i{display:inline-block;margin-right:5px;position:relative;top:0px;}
	.com{width:115px;height:38px;text-align:center;line-height:38px;position:absolute;right:0px;top:6px;}
	.com i{font-size:18px;height:38px;line-height:38px;display:inline-block;}
	.com a{color:#fff;}
	.com span.a{cursor:pointer;margin-left:7px;}
	.com span.count{margin-left:3px;font-size:14px;}
	
	article.frame{padding:50px 0px 48px 0px;display:block;box-sizing:content-box;}
	article.frame iframe{width:100%;height:100%;border:0px;frame-border:0;overflow-y:scorll;}
	header{box-sizing:content-box;}
	
	span.tishi {width:80px;height:14px;padding:5px 20px;line-height:14px;color:#fff;background:#333;font-size:14px;display:block;position:fixed;left:50%;margin-left:-60px;bottom:50px;text-align:center;}
	span.tishi1 {width:80px;height:14px;padding:5px 20px;line-height:14px;color:#fff;background:#333;font-size:14px;display:block;position:fixed;left:50%;margin-left:-60px;bottom:80px;text-align:center;}
	
	.funcBox-col-2 span{width:50% !important;float:left;}
	.funcBox-col-2 span{border-right:1px solid #e0e0e0 !important;border-left:none !important;}
	.funcBox-col-2 span:last-child{border-right:none !important;}
	
	.funcBox-col-3 span{width:33% !important;float:left;}
	.funcBox-col-3 span{border-right:1px solid #e0e0e0 !important;border-left:none !important;}
	.funcBox-col-3 span:last-child{border-right:none !important;}
	
	.funcBox-col-4 span{width:25% !important;float:left;}
	.funcBox-col-4 span{border-right:1px solid #e0e0e0 !important;border-left:none !important;}
	.funcBox-col-4 span:last-child{border-right:none !important;}
	.funcBox-col-4 span{padding-top:4px;}
	.funcBox-col-4 span > label{display:block;width:100%;text-align:center;height:20px;line-height:20px;float:left;}
	
	.funcBox-col-5 span{width:20% !important;float:left;}
	.funcBox-col-5 span{border-right:1px solid #e0e0e0 !important;border-left:none !important;}
	.funcBox-col-5 span:last-child{border-right:none !important;}
	.funcBox-col-5 span{padding-top:4px;}
	.funcBox-col-5 span > label{display:block;width:100%;text-align:center;height:20px;line-height:20px;float:left;}
	a,button,input,textarea,span,img,li,div{-webkit-tap-highlight-color:rgba(255,0,0,0);}
</style>
<%-- 页面风格设置 --%>
<%@ include file="/WEB-INF/include/m_h5_setting.jsp"%>
<%--
<%@ include file="/WEB-INF/include/analysis_baidu.jsp"%>
 --%>
</head>
<body>
	<header class="ctl_header">
		<div class="back"><a href="javascript:history.go(-1);" style="background: url(${basepath}/static/m_h5/img/d.png) center 10px no-repeat;"> </a></div>
    	<%--
    	 <div class="back"><a href="javascript:history.go(-1);"><i class="fa fa-angle-left"></i></a></div>
    	 --%>
     <span class="addWrap">${course.name }</span>
     <%--   <div class="com">
        <a href="${basepath }/m/h5/study/comments.xhtml?cid=${course.id}"><i class="fa fa-comment-o"></i><span id="commentnum" class="count">0</span></a> 
        	<span class="a"  onclick="zan(this)" ><i id="zanicon" class="fa fa-thumbs-o-up"></i><span class="count" id="zannum">0</span></span>
        </div> --%>  
	</header>
    
    <article  class="scroll ctl_cont frame">
    <iframe id="iframe_content" src="${location}">  </iframe>
 </article>
 
 		<c:if test="${practiceId ne null and examId ne null }">
        <div class="funcBox toolbar funcBox-col-${isShowCai ? 5 : 4 }">
        <span class="a" onclick="zan(this)" ><label><i id="zanicon"  class="fa fa-thumbs-o-up"></i>赞</label><label>（<label id="zannum">0</label>）</label></span>
        <c:if test="${isShowCai }">
        	<span class="a" onclick="cai(this)" ><label><i class="fa fa-thumbs-o-down" id="caiicon" style="margin-right:5px;"></i>踩</label><label>（<label id="cainum">0</label>）</label></span>
        </c:if>
        <span  class="b" onclick="toComments('${course.id}')"><label>评论</label><label>（<label id="commentnum">0</label>）</label></span>
        <span onclick="topratice('${practiceId}','${course.id }')">练习</span>
        <span onclick="toexam('${examId}','${course.id }')">考试</span>
         </div>	  
		</c:if>
 
      <c:if test="${practiceId ne null and examId eq null}">
        <div class="funcBox toolbar funcBox-col-${isShowCai ? 4 : 3 }">
	        <span class="a" onclick="zan(this)" ><label><i id="zanicon"  class="fa fa-thumbs-o-up"></i>赞</label><label>（<label id="zannum">0</label>）</label></span>
	        <c:if test="${isShowCai }">
	        	<span class="a" onclick="cai(this)" ><label><i class="fa fa-thumbs-o-down" id="caiicon" style="margin-right:5px;"></i>踩</label><label>（<label id="cainum">0</label>）</label></span>
	        </c:if>
	        <span  class="b" onclick="toComments('${course.id}')"><label>评论</label><label>（<label id="commentnum">0</label>）</label></span>
	        <span onclick="topratice('${practiceId}','${course.id }')">练习</span>
         </div>	  
		</c:if>
	<c:if test="${practiceId eq null and examId eq null}">
	 <div class="funcBox1 toolbar funcBox-col-${isShowCai ? 3 : 2 }">
        <span  onclick="zan(this)" ><i id="zanicon" class="fa fa-thumbs-o-up"></i>赞（<label id="zannum">0</label>）</span>
        <c:if test="${isShowCai }">
        	<span class="a" onclick="cai(this)" ><i class="fa fa-thumbs-o-down" id="caiicon" style="margin-right:5px;"></i>踩（<label id="cainum">0</label>）</span>
        </c:if>
		<span  class="b"  onclick="toComments('${course.id}')">评论（<label id="commentnum">0</label>）</span>
		
    </div>
	</c:if>
	<c:if test="${practiceId eq null and examId ne null}">
        <div class="funcBox toolbar funcBox-col-${isShowCai ? 4 : 3}">
        <span class="a" onclick="zan(this)" ><label><i id="zanicon"  class="fa fa-thumbs-o-up"></i>赞</label><label>（<label id="zannum">0</label>）</label></span>
	        <c:if test="${isShowCai }">
	        	<span class="a" onclick="cai(this)" ><label><i class="fa fa-thumbs-o-down" id="caiicon" style="margin-right:5px;"></i>踩</label><label>（<label id="cainum">0</label>）</label></span>
	        </c:if>
	        <span  class="b" onclick="toComments('${course.id}')"><label>评论</label><label>（<label id="commentnum">0</label>）</label></span>
        <span onclick="toexam('${examId}','${sign }','${timestamp }')">考试</span>
         </div>	  
	</c:if>
		
    
	<%--计时 --%>
<iframe style="display: none;" id="iframe_trace" ></iframe> 

<%--
<script type="text/javascript" src="${basepath}/static/m_h5/js/jquery-2.1.1.min.js"></script> 
 --%>
 
<script type="text/javascript" src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script> 
   
<script type="text/javascript">
var praisenum = "${ajy:praiseTotal(course.id,1)}"; //赞数量
var unpraisenum = "${ajy:unpraiseTotal(course.id,1)}"; //踩数量
var commentnum = "${ajy:commentTotal(course.id,1)}"; //评论数量
var zanstatus = "${zanStatus}";
var caistatus = "${caiStatus}";


$(function(){
      
	var orientationEvent;	
	var supportsOrientationChange = "onorientationchange" in window;	  
	orientationEvent = supportsOrientationChange ? "orientationchange" : "resize";

	changeIframe();
	   
	window.addEventListener(orientationEvent, function() {	
		//setTimeout(changeIframe,2000);
		changeIframe();
	}, false); 
	
		
	//getCommentTotal();
	var zicon;
	if (zanstatus == "1") {//已取消赞
		 zicon = "fa fa-thumbs-o-up";
	} else {//已赞
		zicon = "fa fa-thumbs-up";
	}
	
	var cicon;
	if (caistatus == "1") {//已取消赞
		 cicon = "fa fa-thumbs-o-down";
	} else {//已赞
		cicon = "fa fa-thumbs-down";
	}
	
	$("#zanicon").removeClass().addClass(zicon);
	$("#caiicon").removeClass().addClass(cicon);
	$("#zannum").html(praisenum);
	$("#cainum").html(unpraisenum);
	$("#commentnum").html(commentnum);
	
});



function changeIframe(){
		var pc = isPC();
		var android = isAndroid();
		var ios =  isIos();
		var h=$(window).height();
		if(h==0){
			h=500;
		} 
	    var w=$(window).width();
	    var hasHead = $("header").css("display");
		
	    $("#iframe_content").contents().find("html,body").height(h-98);
	    
	    if(pc){
	    	$("article.frame").height(h-98);
	    	//$("article.frame iframe").width(w);
	        }
	    if(android){
	        if(hasHead == "block" ){
	        	$("article.frame").height(h-98);
	        	$("article.frame #iframe_content").height(h-98);
	        	//$("article.frame #iframe_content").width(w);
	        	$("article.frame").css({"padding-bottom":"0px"});
	            }else{
	            	$("article.frame").height(h-48);
	            	$("article.frame #iframe_content").height(h-48);
	            	//$("article.frame #iframe_content").width(w);
	            	$("article.frame").css({"padding-bottom":"0px"});
	                }
	        if(!!$("#iframe_content").contents().find("#myVideo").length){
					//$("#iframe_content").contents().find("#myVideo").width(w);
					$("#iframe_content").contents().find("#myVideo").height(w * 9 / 16);
		        }
			try{
		   	 window.frames["iframe_content"].myResize();
			}catch(e){
				console.log(e);
			}

	    }
	    if(ios){
	        if(hasHead == "block" ){
	                $("article.frame").height(h-98);
	                $("article.frame #iframe_content").height(h-98);
	                //$("article.frame #iframe_content").width(w);
	                $("article.frame #iframe_content").css({"margin-bottom":"48px"});
	                
	            }else{
	                $("article.frame").height(h-48);
	                $("article.frame #iframe_content").height(h-48);
	                //$("article.frame #iframe_content").width(w);
	                $("article.frame #iframe_content").css({"margin-bottom":"48px"});
	                }

	        	try{
			   	 window.frames["iframe_content"].myResize();
				}catch(e){
					console.log(e);
				}	
	        }

}


//judge pc
function isPC() 
{ 
    var userAgentInfo = navigator.userAgent; 
    var Agents = new Array("Android", "iPhone", "SymbianOS", "Windows Phone", "iPad", "iPod"); 
    var flag = true; 
    for (var v = 0; v < Agents.length; v++) { 
        if (userAgentInfo.indexOf(Agents[v]) > 0) { flag = false; break; } 
    } 
    return flag; 
} 
function isIos(){
			if (/ipad|iphone|mac/i.test(navigator.userAgent)){
				return true;
			}else{
				return false;
				}		
}

function isAndroid(){
	if (/android/i.test(navigator.userAgent)){
		return true; 
	}else{
		return false;
		}
	}

//定制提示色块
function showMyTish(_val,_color,_bg,_width){
	var val=_val.toString();
	var color=_color.toString();
	var bg=_bg.toString();
	var width=_width+"px";
	if(!!val){
		$("body").append('<span class="tishi">'+val+'</span>');
	}else{		
		$("body").append('<span class="tishi">已无更多</span>');	
	}
	if(!!color){
		$(".tishi").css({"color":color});					
	} 
			
	if(!!bg){
		$(".tishi").css({"background":bg});					
	} 
			
	if(!!width){
		$(".tishi").css({"width":width,"margin-left":(-(_width/2))+"px"});					
	}
	$(".tishi").fadeOut(2000);
}
			
/*获取论数
function getCommentTotal() { 
$.ajax({
		url : "${basepath}/m/comment/count/1/${course.id}.json",
		cache:false,
		type : "GET",
		success : function(data) {
			$("#commentnum").html(data);
		}
	});
 
}
*/

/*点赞*/
function zan(_this) {
	var courseid = "${course.id}";
	$.ajax({
		url : "${basepath}/m/ixin/study/clickpraise.json",
		type : "POST",
		data : {
			"restype" : "1",
			"resid" : courseid
		},
		success : function(data) {
			if (data.uid != null && data.uid != "") {
				var zanclass = "";
				if (praisenum < data.num) {//赞
					praisenum++;
					showMyTish("已赞","#fff","#000",100);
					zanclass = "fa fa-thumbs-up";
				} else {//取消赞
					praisenum--;
					showMyTish("取消赞","#fff","#000",100);	
					zanclass = "fa fa-thumbs-o-up";						
				}
				if(praisenum < 0){
					praisenum = 0;
				} 
				$("#zannum").html(praisenum);
				$("#zanicon").removeClass().addClass(zanclass);
				$("span.tishi").height(14);
			} else {
				showMyTish("赞失败","#fff","#000",100);
			}
		},
		error : function() {
			showMyTish("赞失败","#fff","#000",100);
		}
	});
}

/*踩*/
function cai(_this) {
	var courseid = "${course.id}";
	$.ajax({
		url : "${basepath}/m/ixin/study/clickpraise.json",
		type : "POST",
		data : {
			"restype" : "1",
			"type" : "1",
			"resid" : courseid
		},
		success : function(data) {
			if (data.uid != null && data.uid != "") {
				var caiclass = "";
				if (unpraisenum < data.num) {//踩
					unpraisenum++;
					showMyTish("已踩","#fff","#000",100);
					caiclass = "fa fa-thumbs-down";
				} else {//取消踩
					unpraisenum--;
					showMyTish("取消踩","#fff","#000",100);	
					caiclass = "fa fa-thumbs-o-down";
				}
				if(unpraisenum < 0){
					unpraisenum = 0;
				} 
				$("#cainum").html(unpraisenum);
				$("#caiicon").removeClass().addClass(caiclass);
				$("span.tishi").height(14);
			} else {
				showMyTish("踩失败","#fff","#000",100);
			}
		},
		error : function() {
			showMyTish("踩失败","#fff","#000",100);
		}
	});
}
//跳转到评论列表
function toComments(courseid){
	window.location.href="${basepath }/m/h5/study/comments.xhtml?cid="+courseid;
}
//跳到练习页面
function topratice(practiceId, courseId) {
	window.location.href = "${basepath }/m/h5/practice/detail.xhtml?id="
			+ practiceId + "&courseid=" + courseId;
}

//跳到考试页面
function toexam(examId, sign,timestamp) {
	window.location.href = "${basepath }/m/h5/exam/detail.xhtml?tid="+examId+"&sign="+sign+"&timestamp="+timestamp;
}


//计时页面加载
$(function(){
	$("#iframe_trace").attr('src', "${traceLocation}");
});

</script>
</body>
</html>



	<%
	}
	%>
	