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
    <meta charset="UTF-8">
    <title>${title}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no"/>
    <script type="text/javascript" src="${basepath}/static/js/jquery-2.1.0.min.js"></script>
    <style type="text/css">
        html,body{
            margin: 0px;
            padding: 0px;
            color: #53575E;
        }
        .container{
            width: 100%;
            display: block;
            overflow: hidden;
            padding-left: 0px;
        }
        .courselist{
            margin: 0px;
            padding: 0px;
            display: block;
            overflow: hidden;
            width: 100%;
        }
        .courselist>li{
            list-style: none;
        }
        .courseitem{
            width: 100%;
            padding: 8px;
            min-height: 48px;
            padding: 8px;
            border-bottom:1px solid #CCCCCC ;
        }
        .courseitem>img{
            height: 48px;;
            width:  85.3px;
        }
        .courseitem>span{
            min-height: 48px;
            padding-left: 90px;
            display: block;
            margin-top: -48px;
            font-size: 16px;
            padding-right: 8px;
        }
        .cutpage{
            min-height: 48px;
            clear: both;
            display: block;
        }
        .cutpage>div>a{
            display: block;
            overflow: hidden;
            height: 32px;
            line-height: 32px;
            width: 82px;
            font-size: 16px;
            float: left;
            text-align: center;
            text-decoration: none;
            color: #53575E;
        }
        .cutpage>div{
            width: 252px;
            margin: 8px auto;
        }
        .cutpage>div>.button{
            border: 1px solid #CCCCCC;
            border-radius: 5px;
            -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
        }
    </style>
</head>
<body>
	<input type="hidden" id="hid_adminroot" name="hid_adminroot" value="<%=Constant.ADMIN_ROOT%>">
	<input type="hidden" id="path"  value="<%=Constant.IMG_SERVER_DOWNLOAD%>">
	<input type="hidden" id="size"  value="<%=Constant.QINIU_COURSE_IMG_STYLE_320_180%>">

         
    <div class = "container">
        <ul class="courselist" id="list">
	     
        
        </ul>
    </div>
<script>
var list = null;
var totalPage =  null;
var pageNumber=null; 
var pageSize = null;
$(function(){
	getList();
});

function getList(){
	$.ajax({
		async:false,
		type: "POST",
		url: "${basepath}/m/ixin/channelresource/nlist",
		data: {channelid:'${channelid}'},
		success: function(data){
			list = data.list;
			totalPage =  data.pageable.totalPages;
			pageNumber= data.pageable.pageNumber; 
	    	pageSize = data.pageable.pageSize;
		}	
	});
	page(pageNumber);
}

function page(num){
	var html = "";
	var path = $("#path").val();
	var img_suffix =$("#size").val();
	if (list!=null&&list.length>0){
		if(((num-1)*pageSize+10)<list.length){
			for(var i =(num-1)*pageSize; i<(num-1)*pageSize+10 ;i++){
				html = html+'<li class="courseitem" onclick="linkdetail(\''+list[i].resourceid+'\',this);" data-restype="'+list[i].restype+'">';
				html = html+'<img src = "'+path+list[i].rescover+img_suffix+'" onerror="javascript:this.src=\'${basepath}/static/img/study/cover_c.png\'"  style="cursor: pointer;">';
				html = html+'<span>'+list[i].resname+'';
				html = html+'</span></li>';
				
			}
		}else{
			for(var i =(num-1)*pageSize; i<list.length ;i++){
				html = html+'<li class="courseitem" onclick="linkdetail(\''+list[i].resourceid+'\',this);" data-restype="'+list[i].restype+'">';
				html = html+'<img src = "'+path+list[i].rescover+img_suffix+'" onerror="javascript:this.src=\'${basepath}/static/img/study/cover_c.png\'"  style="cursor: pointer;">';
				html = html+'<span>'+list[i].resname+'';
				html = html+'</span></li>';
				
			}
		}
		
		html = html+' <li class="cutpage"><div>';
		
		if(num==1){
			html = html+'<a class="button" href="#">上一页</a>';
		}else{
			html = html+'<a class="button" href="javascript:page('+(num-1)+');">上一页</a>';
		} 
		
		html = html+'<a href="javascript:void(0);">'+num+'/'+totalPage+'</a>';
		
		if(num==totalPage){
			html = html+'<a class="button" href="#">下一页</a>';
		}else{
			html = html+'<a class="button" href="javascript:page('+(num+1)+');">下一页</a>';
		} 
		
		html = html+'</div><li>';
		 
	}else{
		html = html+'<div> <h1 style="text-align:center;font-size: 18px;">没有列表信息</h1></div>';
	}
	$("#list").html(html);
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
    	url="${basepath}/m/ixin/nsurvey/index.xhtml?voteId="+resourceid;
        break;
    case 2://投票
    	url="${basepath}/m/ixin/nsurvey/index.xhtml?voteId="+resourceid;
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

    window.location.href=url;
}
</script>
</body>
</html>