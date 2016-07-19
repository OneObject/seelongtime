<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<% 
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","No-cache"); 
response.setDateHeader("Expires", -1); 
response.setHeader("Cache-Control", "No-store");
%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="format-detection" content="telephone=no" />    
<link rel="stylesheet"	href="${basepath}/static/plugins/font-awesome-4.1.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="${basepath}/static/m_h5/css/color.css">
	<title>${title }</title>
	<style type="text/css">
		article.searchList section.listBox2{padding:0px 8px;box-sizing:border-box;width:100%;}
		article.searchList section.listBox2 a{display:block;color:#53575e;}
		article.searchList .listBox2 a{padding:8px;background:#fff;overflow:hidden;margin-bottom:8px;box-shadow:0px 0px 3px #ccc;}
		article.searchList .listBox2 a>div{width:68px;height:39px;float:left; line-height:39px;}
		article.searchList .listBox2 a>div img{width:68px;height:39px;display:block;}
		article.searchList .listBox2 a ul{float:left;display:block;padding-left:10px;}
		article.searchList .listBox2 a ul li{font-size:16px;line-height:22px;padding:2px 0px 2px;white-space:normal;text-overflow:clip;}
		article.huodong .huodongBox .box1 .item ul li{font-size:16px;line-height:22px;padding:2px 0px 2px;}
	
	</style>
</head>
<body> 
	<header class="ctl_header">
    	<div class="back"><a href="javascript:history.go(-1);"><i class="fa fa-angle-left"></i></a></div>
     <span style="height:38px;width:120px;display:inline-block;line-heigth:38px;overflow:hidden;">   ${title }</span>
	</header>
    
    <article class="searchList ctl_cont">
    	<section class="searching">
        	<div>
            	<input id="chname" type="search" placeholder="搜索" />
                <span onClick="search();"><img src="${basepath}/static/m_h5/img/glass.png" alt="" /></span>
            </div>
        </section>
        <section class="listBox2" style="display:block;" id="channels"> 
        
        </section>        
        
       	<section class="more" style="padding-bottom:60px;" id="toload">
    		<a href="javascript:void(0);" onclick="next();">点击加载更多</a>
    	</section>
    
 		<section class="loading" id="loading" style="padding: 25px 55px 45px;">
			<i class="fa fa-spinner fa-spin"></i>
		</section>
		<section id="placeholder" class="more" style="display: none;"></section>
       	<div class="placeHolder" style="height:50px;width:100px;"></div>
  
    </article>
     

<script type="text/javascript">
var pagenumber = 1;//当前页
var pagesize = 10;//总页数 
var channelTotal = 0;//总数
var currentNum = 0;//已栏目数 
var channelid = "${channelid}";
var path = "<%=Constant.IMG_SERVER_DOWNLOAD%>";
var img_suffix = "<%=Constant.QINIU_COURSE_IMG_STYLE_320_180%>"; 
$(function(){ 
	loadList();  
});

//下一页
function next(){
	pagenumber ++;
   	loadList();	
}

//栏目列表
function loadList(){
	$("#loading").show();  //正在加载
	$("#toload").hide();  //加载更多
	var name = $("#chname").val();

	$.ajax({
		type : "GET",
		url : "${basepath}/m/h5/channelresource/nlist.json",
		cache:false,
		data : { 
			page : pagenumber,
			size : pagesize,
			channelid : channelid,
			name : name
		},
		success : function(data) { 
			channelTotal = data.pageable.total;   
			if(channelTotal > 0 ){
				var channels = data.data;
				currentNum += channels.length;
				var html = [];
				for ( var i = 0; i < channels.length; i++) {
					var channel = channels[i];
					html.push('<a class="a_link" href="" data-resourceid="'+channel.resourceid+'" data-restype="'+channel.restype+'"  target="_blank">');
					html.push('<div style="display:box;box-align:center;"><img src ="'+path+channel.rescover+img_suffix+'" onerror="javascript:this.src=\'${basepath}/static/img/study/cover_c.png\'"  /></div>');
					html.push('<ul>');
					html.push('<li class="channel-list">' + channel.resname + '</li>');
					html.push('</ul>');
					html.push('</a>');
				}
				$("#channels").html($("#channels").html() + html.join(""))//加载
				if (channelTotal == currentNum) {
					$("#toload").hide();
					$("#placeholder").show();
				} else {
					$("#toload").show();
				}
			}else{				
				var html = [];
					html.push('<article class="scroll">');
					html.push('<section class="noData">');
					html.push('<img src="${basepath }/static/img/noData.png" />');
					html.push('</section>');
					html.push(' </article>');
				$("#channels").html( html.join(""));//加载
				$("#toload").hide();
			}
			$("#loading").hide();
			setAlink();
			var orientationEvent;
			var supportsOrientationChange = "onorientationchange" in window;
			var w=$(".listBox2 a").width();
			var w1=$(".searching div").width();
			$("a>ul").width(w-78);
			$(".searching div>input").width(w1-35);
			orientationEvent = supportsOrientationChange ? "orientationchange" : "resize";   
			window.addEventListener(orientationEvent, function() {
				var w=$(".listBox2 a").width();
				var w1=$(".searching div").width();
				$("a>ul").width(w-78); 
				$(".searching div>input").width(w1-35);
			}, false);
			
		},
		error : function() {
		}
	});
}

function setAlink(){
	$(".a_link").each(function(){
	   var  resourceid = $(this).data("resourceid");
	   var  restype = $(this).data("restype");
	   var url = indetail(resourceid,restype);
	   $(this).attr('href',url); 		
	});
	
}

function search(){
	pagenumber = 1;//当前页
	pagesize = 10;//总页数 
	channelTotal = 0;//总数
	currentNum = 0;
	var name = $("#chname").val();
	if(name == null || "" == name){
		showTishi("请输入名称");
		return;
	}
	$("#channels").html("");//加载
	loadList();	    	  
}

function indetail(resourceid, type){ 
	var url="";
    switch(type){
    case 0://素材
        url="${basepath}/m/ixin/fodder/detail.xhtml?id="+resourceid;
        break;
    case 1://调研
    	url="${basepath}/m/ixin/nsurvey/index.xhtml?voteId="+resourceid;
        break;
    case 2://投票
    	url="${basepath}/m/ixin/nsurvey/index.xhtml?voteId="+resourceid;
        break;
    case 3://抽奖
    	//url=admin_root+"/protal/activity/cardreward.xhtml?rewardId="+resourceid;
    	url = "${basepath}/m/ixin/lottery/cardreward.xhtml?rewardId="+resourceid;
        break;
    case 4://排行榜
    	url="";
        break;
    case 5://课程
    	//url="${basepath}/m/ixin/study/detail/"+resourceid+".xhtml?id="+resourceid;
    	url="${basepath}/m/study/detail/"+resourceid+".xhtml?fdomain=${current_domain}";
        break;
    case 6://考试
    	url="${basepath}/m/h5/exam/detail.xhtml?tid="+resourceid;
        break;
    case 7://活动
    	//url="${basepath}/m/ixin/activity/detail.xhtml?id="+resourceid;
    	url = "${basepath}/m/ixin/activity/detaildispatch.xhtml?id="+resourceid;
        break;
    case 8://作业
        url="${basepath}/m/task/tlist.xhtml?id="+resourceid;
        break;
    }
  //window.location.href=url;
   // window.open(url);
   return url;
}
</script>
<style type="text/css">
	body{background:#f8f8f8;}
</style>     
</body>
</html>