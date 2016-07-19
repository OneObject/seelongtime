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
    <link type="text/css" rel="stylesheet" href="${basepath }/static/css/easydialog.css">
    <script type="text/javascript" src="${basepath }/static/js/easydialog.min.js"></script>
    <style type="text/css">
    	.module-course-list {
	padding: 8px;
}
section,div,a,ul,dl,span,p,dd,dt,li {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}
div.gradeA .header{
  -webkit-box-sizing: content-box;
  -moz-box-sizing: content-box;
  box-sizing: content-box;
}
.module-course-list a:first-child .block-course {
	margin-top: 0;
}

.module-course-list .block-course {
	margin-top: 8px;
	padding: 8px;
	background: #fff;
	position: relative;
	overflow: hidden;
}

.module-course-list .block-course .image {
	display: inline-block;
	width: 80px;
	height: 50px;
	position: absolute;
	left: 8px;
	top: 8px;
}

.module-course-list .block-course .image img {
	display: block;
	width: 80px;
	height: 50px;
}

.module-course-list .block-course ul {
	width: 100%;
	padding: 0 0 0 90px;
}
.module-course-list .block-course ul li{
	
	width:100%;
	float:left;
}
.module-course-list .block-course ul li:nth-child(1) {
	line-height: 22px;
	color: rgba(0, 0, 0, 0.87);
	font-size: 16px;
}

.module-course-list .block-course ul li:nth-child(2) {
	margin-top: 4px;
	color: #999;
	font-size: 14px;
	line-height: 20px;
}

.module-course-list .block-course ul li:nth-child(2) i {
	margin-right: 4px;
}

.module-course-list .block-course ul li:nth-child(2) span {
	float: right;
}

.module-course-list .block-course ul li:nth-child(3) {
	color: #999;
	font-size: 14px;
	line-height: 20px;
	margin-top: 4px;
}

.module-course-list .block-course ul li:nth-child(3) i {
	margin-right: 4px;
}

.module-course-list .block-course ul li:nth-child(3) span {
	float: right;
}

.searching{padding:8px;box-sizing:border-box;width:100%;border-bottom:1px #e0e0e0 solid;overflow:hidden;}
.searching div{border-radius:5px;border:1px solid #eee;height:26px;background:#fff;position:relative;}
.searching div input{border-radius:5px;height:24px;width:100%;display:block;padding:0 5px;line-height:24px;box-sizing:border-box;border:none;color:#999;font-size:16px;}
.searching div span{width:18px;height:18px;position:absolute;right:5px;top:5px;}
.searching div span img{width:18px;height:18px;cursor:pointer;} 

</style>
<title>在线课程</title>
</head>

<body>
	<header>
      <div class="back ctl_rl"><a href="${basepath }/m/h5/index.xhtml"><i class="fa fa-home"></i></a></div>
       在线课程
       <div class="home" onclick="showPopBox();"><a href="javascript:void();" class="gradeA"><i class="fa fa-bars"></i></a></div>
    </header>
    <input type="hidden" id="categoryid" value="">
    <input type="hidden" id="issubtree" value="1">
    <input type="hidden" id="parentid" value="">
    <input type="hidden" id="level" value="1">
    <article class="scroll">
    <div class="searching">
    		<form action="#" method="post" onsubmit="search();return false;" >
        	<div>
            	<input id="name" value="${name}" type="search" placeholder="搜索" style="width: 277px; outline: none; z-index: 0;">
                <span onclick="search();"><img src="${basepath}/static/m_h5/img/glass.png" alt=""></span>
            </div>
            </form>
    </div>
    <section>
    	 <div class="module-course-list" id="contents">
    	 </div>
    </section>
    <div id="Interchange" style="display: none"></div>
	<div class="placeHolder">
   <section class="more" id="toload"  style="display: none;" onclick="page();">
    	<a href="javascript:void(0);">点击加载更多</a>
    </section>
 	</div>
 	<section class="loading" id="loading"><i class="fa fa-spinner fa-spin"></i></section>  
    </article>
    
     <div class="popBox" id="popBox" style="display:none;">
        <div class="showPopup"></div>
            <div class="gradeA">
            <div class="header" style="padding:6px 30px;width:170px;overflow:hidden;" ><div class="back" id="back" style="display: none;"><a href="javascript:categoryGoBack();"><i class="fa fa-angle-left"></i></a></div><span id="ctitle" style="width:180px;overflow:hidden;">课程分类</span></div>
            <ul class="a" id="items">
            </ul>
        </div>
    </div>
    
    <footer class="footer">
    
    </footer>
    
<script type="text/javascript">
	var pagenum = 1;
	var size = 10;
	var _h=$(window).height()-50;
	$(document).ready(function(){
		$(".showPopup").click(function(){
			hidePopBox();
		});
		
		var orientationEvent;
		var supportsOrientationChange = "onorientationchange" in window;		
		orientationEvent = supportsOrientationChange ? "orientationchange" : "resize";   
		window.addEventListener(orientationEvent, function() {
			var h=$(window).height()-50;
			$("body .popBox ul").height(h); 			
		}, false);	
	});
	
	//限制字符数为十二个
	function limitLen(){
		var len=$(".popBox ul li").length;
		for(var i=0;i<len;i++){
			var _text=$(".popBox ul li:eq("+i+") a").text().substr(0,11);
			
			$(".popBox ul li:eq("+i+") a").text(_text);
						
			}
		}
	
    //显示初始弹出层弹出
	function showPopBox(){
		var widthA=230;
		$("body .popBox").show();
		$(".gradeA").css("right",-widthA);		
		$(".gradeA").animate({right:"0"},300);		
		$("body .popBox ul").height(_h);
		$(".showPopup")[0].ontouchmove=function(event){event.preventDefault();};
		fixedBase();
	}
    
	//隐藏弹出层
	function hidePopBox(){
		$("body .popBox").hide();
		cancelFixedBase();
	}
	
	//固定底层
	function fixedBase(){		
		$("article.scroll").css({"position":"fixed","width":"100%"});		
	}
	//固定底层
	function cancelFixedBase(){		
		$("article.scroll").css({"position":"static"});		
	}	
	function search(){
		$("#toload").hide();
	 	$("#loading").show();

	 	pagenum = 1;
	 	
		var params="";
	 	params += "size="+size;
	 	
	 	params +="&page="+pagenum;

	 	params +="&name="+document.getElementById("name").value;

	 	var categoryid = $("#categoryid").val();
	 	if(categoryid != ""){
	 		params += "&categoryid="+categoryid;
	 	}
	 	
	 	var issubtree = $("#issubtree").val();
	 	if(issubtree != ""){
	 		params += "&issubtree="+issubtree;
	 	}
	 	
	 	var model = "${model}";
	 	if(model == ""){
	 		model = "all";
	 	}
	 	$("#Interchange").load("${basepath}/m/h5/study/"+model+".list?"+params,function(){
	 		var add_html = $("#Interchange").html();
	 		if(add_html==null||add_html==""){
	 				$("#toload").hide();
	 				$("#loading").hide();
	 				/* if(pagenum != 1){
	 					showTishi("没有更多了...");
	 				} */
	 				return;
	 			}
	 		var len = $("#Interchange .flag").length;
	 		
	 		$("#Interchang").html("");

	 		$("#contents").html(add_html);
	
	 		pagenum = pagenum+1;
	 		
	 		if(len<size){
	 			$("#toload").hide();
	 		}else {
	 			$("#toload").show();
	 		}
	 		
	 		$("#loading").hide();
	 	});
	}
	
	function page(){
	 	$("#toload").hide();
	 	$("#loading").show();
	 	
	 	var params="";
	 	params += "size="+size;
	 	
	 	params +="&page="+pagenum;
	 	
	 	var categoryid = $("#categoryid").val();
	 	if(categoryid != ""){
	 		params += "&categoryid="+categoryid;
	 	}
	 	
	 	var issubtree = $("#issubtree").val();
	 	if(issubtree != ""){
	 		params += "&issubtree="+issubtree;
	 	}
	 	
	 	var model = "${model}";
	 	if(model == ""){
	 		model = "all";
	 	}
	 	$("#Interchange").load("${basepath}/m/h5/study/"+model+".list?"+params,function(){
	 		var add_html = $("#Interchange").html();
	 		if(add_html==null||add_html==""){
	 				$("#toload").hide();
	 				$("#loading").hide();
	 				/* if(pagenum != 1){
	 					showTishi("没有更多了...");
	 				} */
	 				return;
	 			}
	 		var len = $("#Interchange .flag").length;
	 		
	 		$("#Interchang").html("");

	 		$("#contents").append(add_html);
	
	 		pagenum = pagenum+1;
	 		
	 		if(len<size){
	 			$("#toload").hide();
	 		}else {
	 			$("#toload").show();
	 		}
	 		
	 		$("#loading").hide();
	 	});
	}
	
	function findByCategory(categoryid,isSubTree){
		hidePopBox();
		$("#contents").html("");
		$("#categoryid").val(categoryid);
		$("issubtree").val(isSubTree);
		pagenum = 1;
		page();
	}
	
	function categoryGoBack(){
		var parentid = $("#parentid").val();
		if(parentid == ""){
			//隐藏弹出层
			hidePopBox();
		}else {
			showCategorys(parentid);
		}
	}
	
	function showCategorys(id){
		$("#items").html("");
		$.ajax({
			type:"get",
			url:basepath+"/m/h5/study/category.json",
			data:{"pid":id},
			contentType:"application/json; charset=utf-8",
			success:function(data){
				var categorys = data.list;
				var gid = data.gid;
				var name = data.name;
				if(name == null || name == ""){
					name = "分类";
				}
				$("#ctitle").html(name);
				
				if(gid != null && gid != ""){
					$("#back").show();
				} else {
					$("#back").hide();
				}
				$("#parentid").val(gid);
				if(categorys.length == 0){
					$("#items").append('<li><a class="b" href="javascript:findByCategory(\''+id+'\',\'1\')" index="0">全部</a></li>');
				}else {
					$("#items").append('<li><a class="b" href="javascript:findByCategory(\''+id+'\',\'1\')" index="0">全部</a></li>');
					for(var i=0;i<categorys.length;i++){
						if(categorys[i].is_leaf == 1){
							$("#items").append('<li><a class="b" href="javascript:findByCategory(\''+categorys[i].id+'\',\'0\')" index="'+(i+1)+'">'+categorys[i].name+'</a></li>');
						}else {
							$("#items").append('<li><a class="a" href="javascript:showCategorys(\''+categorys[i].id+'\')" index="'+(i+1)+'">'+categorys[i].name+'</a></li>');
						}
					}
				}
				
				$("#items").append('<li style="border-bottom:none;"></li>');
			},
			error:function(data){
				showTishi("系统繁忙...");
			}
		});
	}
	
	
	function showMsgDialog(content){
	 	easyDialog.open({
	         container : {
	             content : '<div style="background-color: #ffffff;width:260px;height:20px;text-align:center;">'+content+'</div>'
	         },
	         autoClose:900
	     });
	 }
	function toDetail(id){
	 	window.open("${basepath}/m/study/detail/"+id+".xhtml?fdomain=${current_domain}&v="+Math.random());
	}
	
	page();
	showCategorys('');
</script>
	
</html>
