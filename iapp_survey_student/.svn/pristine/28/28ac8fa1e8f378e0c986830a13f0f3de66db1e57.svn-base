<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%
String uid = MwebHelper.getCurrentUid(); 
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
<script type="text/javascript">

    //去掉右上角选项
    document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
    	WeixinJSBridge.call('hideOptionMenu');
    });

</script>
</head>
<body>
	<input type="hidden" id="hid_adminroot" name="hid_adminroot" value="<%=Constant.ADMIN_ROOT%>">
    <c:if test="${style eq 2 }">
    <div style="display:block;padding: 8px;">
    	<table style="width:100%;padding: 8px 20px;">
         	<tr>
         		<td style="width: 200px;; text-align: right;">
         			<input type="text" id="name" value="${name}"  style="border:1px solid #ddd;padding: 5px;">
         		</td>
         		<td style="width: 100px;text-align: left;">
					<img src="${basepath}/static/img/frame/find.png" class="search_btn" onclick="dosearch();">         		
         		</td>
         	</tr>
         </table>
    </div>
         
    </c:if>
    <div class = "container">
        <ul class="courselist">
	        <c:if test="${empty list }">
		        <div>
			        <h1 style="text-align:center;font-size: 18px;">没有该${title}栏目列表信息</h1>
			    </div>
		   	</c:if>
         	<c:forEach items="${list }" var="item">
	        	<li class="courseitem" onclick="linkdetail('${item.resourceid}',this);" data-restype="${item.restype}">
	                <img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${item.rescover}<%=Constant.QINIU_COURSE_IMG_STYLE_320_180%>"  onerror="javascript:this.src='${basepath}/static/img/study/cover_c.png'"  style="cursor: pointer;">
	                 <span>${item.resname}</span>    
	            </li>
	      </c:forEach>
	      <c:if test="${pageable.totalPages ne 0 }">
            <li class="cutpage">
               <div>
                   <a class="button" href="javascript:upPage();">上一页</a>
                   <a href="javascript:void(0);">${pageable.pageNumber}/${pageable.totalPages}</a>
                   <a class="button" href="javascript:downPage();">下一页</a>
               </div>
            </li>
          </c:if>
        </ul>
    </div>
    <script>
    	 var totalPage =  "${pageable.totalPages}";
    	 var pageindex="${pageable.pageNumber}"; 
    	 var pageSize =  "${pageable.pageSize}";
		 function courseDetail(cid){
	     	window.location.href="${basepath}/study/detail.xhtml?cid="+cid;
	     }
	
		 function downPage(){
			
			 if(pageindex>=totalPage){
				 return;
			}else{
				pageindex++;
				window.location.href="${basepath}/m/ixin/channelresource/list.xhtml?page="+pageindex+"&size=10&channelid=${channelid}&name=${name}";
			}
		 }
		 function upPage(){ 
			 if(pageindex == 1){
				 return;
			 }else{
				 pageindex--;
				window.location.href="${basepath}/m/ixin/channelresource/list.xhtml?page="+pageindex+"&size=10&channelid=${channelid}&name=${name}";
			}
		}

		function dosearch(){
			var name = $("#name").val();
			window.location.href="${basepath}/m/ixin/channelresource/list.xhtml?channelid=${channelid}&name="+name;
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
    	url="${basepath}/m/ixin/study/detail/"+resourceid+".xhtml?id="+resourceid;
    	if (window.top.location != window.location) {
            window.top.location.href=url;
            return;
          }
    	break;
    case 6://考试
    	url="${basepath}/m/exam/detail.xhtml?tid="+resourceid;
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

    window.location.href=url;
}
		 
	</script>
</body>
</html>