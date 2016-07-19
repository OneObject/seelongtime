<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style"
	content="black-translucent" />
<meta name="format-detection" content="telephone=no" /> 
<link type="text/css" rel="stylesheet"
	href="${basepath }/static/css/easydialog.css">
<script type="text/javascript"
	src="${basepath }/static/js/easydialog.min.js"></script>
	<style type="text/css">
		section.comment ul li.say {
			clear: left;
			margin-top: 8px;
			font-size: 16px;
			min-height:22px;
			height: auto;
			line-height: 22px;
			padding: 0 6px;
			}
	</style>
	
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
	width:100%;
	white-space:nowrap;
    text-align: center;
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
color:#26a69a  !important;}
section.sender a{
background-color:#26a69a  !important;}
</style>
<title>${course.name }</title>
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

	<article class="scroll ctl_cont">
		<section class="comment" id="content">
			<span class="count" id="comment">评论数<label id="commentTotal">0</label></span>
		</section>
		<div class="placeHolder"></div>
		<section class="more" id="toload"
			style="display: none; padding: 25px 55px 45px;" onclick="nextpage();">
			<a href="javascript:void(0);">点击加载更多</a>
		</section>

		<section class="loading" id="loading" style="padding: 25px 55px 45px;">
			<i class="fa fa-spinner fa-spin"></i>
		</section>
		<section id="placeholder" class="more" style="display: none;"></section>

		<section class="sender">
			<input type="text" id="discuss" placeholder="说两句，评论一下吧!" /><a
				href="javascript:void(0);" onclick="sub();">发送</a>
		</section>

	</article>

<script type="text/javascript" src="${basepath}/static/m_h5/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript">
var pagenumber = 1;//当前页
var pagesize = 10;//总页数
var cid = "${course.id}";
var commentTotal = 0;//总评论数
var currentNum = 0;//已显示评论数
$(function() {
	//设置评论悬浮框宽度
	var sWidth=$(document).width()-10;		
	var tWidth=$(document).width()-36;
	$("section.sender").width(sWidth);
	$("textarea").width(tWidth);
	
	if (/android/i.test(navigator.userAgent)){
  		 // todo : android
		 
		}

		if (/ipad|iphone|mac/i.test(navigator.userAgent)){
   	// todo : ios
			$("section.sender input").click(function(){
				$("header").hide();
				setTimeout(function(){
					
					$("article.scroll").css({"position":"absolute","bottom":"0px","width":"100%"});
					$("section.sender").css({"position":"absolute","bottom":"0px","z-index":"100"});
					},1);
					
				$("body").bind("touchmove",function(event){					
					event.preventDefault();
				
					});
				$("section.comment").click(function(){					
					$("section.sender input").blur();
					
					});
				
			}).blur(function(){			
				/*$("article.scroll").css({"position":"static","width":"100%"});*/
				$("header").removeAttr("style");
				$("header").addClass("ctl_header");
					
				$("article.scroll").css({"position":"static","width":"100%","min-height":"0px"});
				$("section.sender").css({"position":"fixed","bottom":"0px","z-index":"100"});
				$("body").unbind("touchmove");
				
				});
		}

		var w=$(window).width()-86;
		$(".sender input").width(w);			
		var orientationEvent;
		var supportsOrientationChange = "onorientationchange" in window;		
		orientationEvent = supportsOrientationChange ? "orientationchange" : "resize";   
		window.addEventListener(orientationEvent, function() {
			var _w1=$(window).width()-10;
			var _w2=_w1-76;
			$(".sender").width(_w1);
			$(".sender input").width(_w2); 			
		}, false);
		
	
	pagelist();
});

//下一页评论列表
function nextpage() {
	pagenumber++;
	pagelist();
}

function pagelist() {
	$("#loading").show(); //正在加载
	$("#toload").hide(); //加载更多
	$.ajax({
		type : "GET",
		url : "${basepath}/m/h5/study/comment.json",
		data : {
			"cid" : cid,
			page : pagenumber,
			size : pagesize
		},
		success : function(data) {
			commentTotal = data.pageable.total;
			if(commentTotal > 0){
				$("#commentTotal").html(commentTotal); 
				var comments = data.data;
				currentNum += comments.length;
				var html = [];
				for ( var i = 0; i < comments.length; i++) {
					var comm = comments[i];
					html.push('<ul>');
					html.push('<li class="pic"><img src="${basepath}/user/avatar/' + comm.uid + '.xhtml?style=80x80&color=gray"></li>');
					html.push('<li class="per">' + comm.username + '<span>'	+ formatDate(new Date(comm.createtime)) + '</span></li>');
					html.push('<li>' + comm.deptname + '</li>');
					html.push('<li class="say">' + comm.content	+ '</li>');
					html.push('</ul>');
				}
				$("#content").html($("#content").html() + html.join(""))//加载评论
				if (commentTotal == currentNum) {
					$("#toload").hide();
					$("#placeholder").show();
				} else {
					$("#toload").show();
				}
			}else{
				var html = [];
				html.push('<article class="scroll" id="noData">');
				html.push('<section class="noData">');
				
				
				html.push('<img src="${basepath }/static/m/ext/enn/img/no_data_img.png" />');
				html.push('</section>');
				html.push(' </article>');
				$("#content").html( $("#content").html() + html.join(""))//加载评论
				$("#toload").hide();
			}
			$("#loading").hide();
		},
		error : function() {
		}
	});
}

//发表评论
function sub() {
	var body = htmlEncode($("#discuss").val());
	if (body == null || body == "") {
		showMyTishi('请填写内容','white','black','120');
		return;
	}
	if($("#noData") != null){
		$("#noData").remove();
	}
	$.ajax({			
		url : "${basepath}/m/comment/add.json",
		type : "POST",
		data : {
			"restype" : "1",				
			"resid" : "${course.id}",
			"action" : "1",
			"body" : body
		},
			success : function(data) {
			currentNum = 0;
			pagenumber = 1;//页数设置为1
			$("#commentTotal").html(commentTotal);//评论加1
			$("#discuss").val(""); //评论框清除
			$("ul").remove();//移除所有评论
			$("#placeholder").hide();//隐藏占位标签
			pagelist();//重新加载评论
		}
	});
}

function formatDate(now) {
	var year = now.getFullYear();
	var month = now.getMonth() + 1;
	var date = now.getDate();
	var hour = now.getHours();
	var minute = now.getMinutes();
	if(hour<10){
		hour = "0"+hour;
	}
	if(minute<10){
		minute = "0"+minute;
	}
	return year + "-" + month + "-" + date + " " + hour + ":" + minute;
}

//Html编码获取Html转义实体
function htmlEncode(value) {
    return $('<div/>').text(value).html();
}
</script>
</body>
</html>
