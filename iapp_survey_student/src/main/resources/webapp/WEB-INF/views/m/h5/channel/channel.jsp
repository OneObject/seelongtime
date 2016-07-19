<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%String uid = MwebHelper.getCurrentUid(); %>
<!DOCTYPE html>
<html>
<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="format-detection" content="telephone=no" />
<title>${channel.title }</title>
</head>

<body>
	<header>
      <div class="back"><a href="${basepath }/m/h5/index.xhtml"><i class="fa fa-home"></i></a></div>
    <span class="wrap" style="width:70%;">${channel.title }</span>
       
    </header>
    <input type="hidden" id="page" value="1">
    <article class="scroll">
    <section class="learnOnline" id="contents">
    
    </section>
    <div id="data" style="display: none"></div>

   <div class="placeHolder">
   <section class="more" id="load" onclick="page(false);">
    	<a >点击加载更多</a>
    </section>
    </div>
 	<section class="loading" id="loading"><i class="fa fa-spinner fa-spin"></i></section>   
 
    </article>
    
    
    <footer class="footer">
    
    </footer>
    <input type="hidden" id="hid_adminroot" name="hid_adminroot" value="<%=Constant.ADMIN_ROOT%>">
    <input id="channelid" value="${channelid}" type="hidden">
<script type="text/javascript">
	$(document).ready(function(){
		page(true);
	});
	function page(init){
		$("#load").hide();
	 	$("#loading").show();
	 	var params="";
	 	var size = 10;
	 	params += "size="+size;
	 	if(init){
	 		var pagenum = 1;
		}else{

	 		var pagenum = $("#page").val();
		}
	 	params +="&page="+pagenum;
	 	params +="&channelid="+$("#channelid").val();
	 	$("#data").load("${basepath}/m/h5/channelresource/list.list?"+params,function(){
	 		
	 		var add_html = $("#data").html();
	 		$("#data").html("");
	 		$("#contents").append(add_html);
	 		if(pagenum == $("#pagenum1").val()|| $("#pagenum1").val()==0){
	 			$("#load").hide();
	 		 	$("#loading").hide();
	 			return;
	 		}
	 		pagenum = parseInt(pagenum)+1;
	 		$("#page").val(pagenum);
	 		$("#load").show();
		 	$("#loading").hide();
	 	});
	}
	
	

	 
	function linkdetail(resourceid,thi){
	var type=$(thi).data("restype");
	var admin_root=$("#hid_adminroot").val();
	var url="";
    switch(type){
    case 0://素材
        url="${basepath}/m/ixin/fodder/detail.xhtml?id="+resourceid;
        break;
    case 1://调研
    	//url="${basepath}/m/ixin/nsurvey/index.xhtml?voteId="+resourceid;
       url = admin_root + "/protal/uservote/index.xhtml?voteId="
				+ resourceid +"&uid=<%=uid%>";
        break;
    case 2://投票
    	//url="${basepath}/m/ixin/nsurvey/index.xhtml?voteId="+resourceid;
    	 url = admin_root + "/protal/uservote/index.xhtml?voteId="
				+ resourceid +"&uid=<%=uid%>";
        break;
    case 3://抽奖
    	url=admin_root+"/protal/activity/cardreward.xhtml?rewardId="+resourceid;
        break;
    case 4://排行榜
    	url="";
        break;
    case 5://课程
    	//url="${basepath}/m/ixin/study/detail/"+resourceid+".xhtml?id="+resourceid;
    	url="${basepath}/m/study/detail/"+resourceid+".xhtml?fdomain=${current_domain}";
    	window.location.href=url;
    	return;
    case 6://考试
    	url="${basepath}/m/h5/exam/detail.xhtml?tid="+resourceid;
    	if (window.top.location!= window.location) {
            window.top.location.href=url;
            return;
          }
        break;
    case 7://活动
    	//url="${basepath}/m/ixin/activity/detail.xhtml?id="+resourceid;
        url = "${basepath}/m/ixin/activity/detaildispatch.xhtml?id="+resourceid;
    	break;
    case 8://作业
        url="${basepath}/m/task/tlist.xhtml?id="+resourceid;
        break;
    }
    toViewShell(url);
    //window.location.href=url;
}
	
</script>
	
</html>
