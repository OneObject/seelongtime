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
<title> ${title }</title>
</head>
<body> 
	<header class="ctl_header">
    	<div class="back"><a href="javascript:history.go(-1);"><i class="fa fa-angle-left"></i></a></div>
    	 <span style="height:38px;width:120px;display:inline-block;line-heigth:38px;overflow:hidden;">   ${title }</span>
    </header>
    
    <article class="scroll ctl_cont">    
	    <section class="activity" id="activity">  
	    </section>
    
		<div class="placeHolder"></div>
		<section class="more" id="toload">
    		<a href="javascript:void(0);" onclick="next();">点击加载更多</a>
    	</section>
    
 		<section class="loading" id="loading" style="padding: 25px 55px 45px;">
			<i class="fa fa-spinner fa-spin"></i>
		</section>
		<section id="placeholder" class="more" style="display: none;"></section>
		
    </article>
		
<script type="text/javascript">
var pagenumber = 1;//当前页
var pagesize = 10;//总页数 
var channelTotal = 0;//总评论数
var currentNum = 0;//已显示栏目数
var channelid = "${channelid}";
var path = "<%=Constant.IMG_SERVER_DOWNLOAD%>";
$(function(){ 
	loadList();  
}) 

//下一页
function next(){
	pagenumber ++;
	loadList();	
}

//栏目列表
function loadList(){
	$("#loading").show();  //正在加载
	$("#toload").hide();  //加载更多

	$.ajax({
		type : "GET",
		url : "${basepath}/m/h5/channelresource/nlist.json",
		data : { 
			page : pagenumber,
			size : pagesize,
			channelid : channelid
		},
		success : function(data) {
			channelTotal = data.pageable.total;
			if(channelTotal > 0){
				var channels = data.data;
				currentNum += channels.length;
				var html = [];
				for ( var i = 0; i < channels.length; i++) {
					var channel = channels[i];
					html.push('<a href="javascript:void(0);" onclick="indetail(\'' + channel.resourceid +'\', ' + channel.restype +');")>');
					html.push('<ul>');
					html.push('<li ><img src="' + path+channel.rescover + '" onerror="javascript:this.src=\''+basepath+'/static/m_h5/img/activity_default.jpg\'"></li>');
					html.push('<li style="white-space:nowrap;text-overflow:ellipsis;overflow:hidden;">' +	channel.resname +  '</li>');
					html.push('</ul>');
					html.push('</a>');
				}
				$("#activity").html($("#activity").html() + html.join(""))//加载评论
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
				$("#activity").html( html.join(""))//加载评论
				$("#toload").hide();
			}
			$("#loading").hide();
		},
		error : function() {
		}
	});
}

//详情
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
    window.open(url);
}
</script> 
</body>
</html>
