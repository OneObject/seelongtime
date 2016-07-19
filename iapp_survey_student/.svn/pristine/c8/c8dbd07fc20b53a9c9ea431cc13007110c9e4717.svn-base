<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%@ page contentType="text/html;charset=UTF-8" buffer="none"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%
String uid = MwebHelper.getCurrentUid();
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","No-cache"); 
response.setDateHeader("Expires", -1); 
response.setHeader("Cache-Control", "No-store");
%>

<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>${activity.name}</title>
<meta http-equiv="pragma" content="no-cache"> 
<meta http-equiv="cache-control" content="no-cache"> 
<meta http-equiv="expires" content="0">   
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="stylesheet" href="${basepath }/static/css/easydialog.css">
<script type="text/javascript" src="${basepath }/static/js/easydialog.js"></script>
<style type="text/css">
* {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

body,html {
	margin: 0px;
	padding: 0px;
	height:100%;
	background:#FFFFFF;
}

#newactivebox {
	height:100%;
	width: 100%;
	padding: 8px;
	
}

.newactiveitem{
            display: block;
            overflow: hidden;
            text-align: center;
            font-size: 1em;
            color: #529bea;
            border-radius: 5px;
            float: left;
			margin-right:10px;
			margin-bottom:5px;
        }

.newactiveitem>img {
	width: 60%;
}

.color1 {
	background-color: #fff;
}

.color2 {
	background-color: #fff;
}

.color3 {
	background-color: #83EAD4;
}

.color4 {
	background-color: #F7C068;
}

.color5 {
	background-color: #D1ACE9;
}

.color6 {
	background-color: #E9ACD1;
}

.color7 {
	background-color: #ED6E90;
}

.color8 {
	background-color: #65D69E;
}

.color9 {
	background-color: #D69D65;
}

.yanzhengcontainer {
	display: block;
	overflow: hidden;
	text-align: center;
	padding: 10px;
}

.errormsg {
	display: block;
	padding: 10px;
	background-color: red;
	color: #fff;
	position: absolute;
	top: 0px;
}

#number {
	padding: 10px;
	border: 1px solid #999;
	width: 100%;
	border-radius: 8px;
}

.titltlelelle {
	font-size: 15px;
	color: #999;
	line-height: 40px;
	margin-top: 10px;
}

.submitbtn {
	display: block;
	overflow: hidden;
	line-height: 40px;
	font-size: 20px;
	text-align: center;
	background-color: #7fd256;
	color: #ffffff;
	border-radius: 8px;
	background-clip: padding-box;
	margin-top: 30px;
}

.titltlelelle {
	display: block;
	text-align: left;
	color: #999;
	font-size: 16px;
	margin-bottom: 30px;
	margin-top: 20px;
}
</style>
<%
		String skip = request.getParameter("skip");
%>
<script type="text/javascript">
var key = "s_${activity.id}";
$(function(){
    if(getCookie(key) && "${param.skip}" != "true"){
        $(".yanzhengcontainer").remove();
        $("#newactivebox").show();
    	//window.location.href="${basepath }/m/ixin/activity/detaildispatch.xhtml?id=${activity.id}&skip=true";
    }
});
</script>
</head>
<body> 
	<c:if
		test="${param.skip ne 'true'  && activity.domain eq 'SMG' }">
	<div class="yanzhengcontainer">
		<div class="titltlelelle">
			不知道通关密码？<br />赶紧向班级辅导员获取吧！
		</div>
		<input type="tel" id="number" placeholder="请输入六位通关密码"> <span
			class="submitbtn" id="submitbtn">提交验证</span>
	</div>
	</c:if>

	<div id="newactivebox"
		<c:if test="${param.skip ne 'true' && activity.domain eq 'SMG' }"> style="display: none;"</c:if>>
		<c:choose>
			<c:when test="${activity.apply ==1 && activity.signin==1}">
				<div data-url="baoming" class="newactiveitem ">
					<img src="${basepath }/static/m/img/bm.png"><br> <span>报名/签到</span>
				</div>
			</c:when>
			<c:when test="${activity.apply == 1 && activity.signin==0}">
				<div data-url="baoming" class="newactiveitem ">
					<img src="${basepath }/static/m/img/bm.png"><br> <span>报名</span>
				</div>
			</c:when>
			<c:when test="${activity.apply == 0 && activity.signin==1}">
				<div data-url="baoming" class="newactiveitem ">
					<img src="${basepath }/static/m/img/bm.png"><br> <span>签到</span>
				</div>
			</c:when>
			<c:when
				test="${activity.apply == 0 && activity.signin==0 && activity.domain!='SMG'}">
				<div data-url="baoming" class="newactiveitem ">
					<img src="${basepath }/static/m/img/bm.png"><br> <span>活动详情</span>
				</div>
			</c:when>
		</c:choose>
		<c:if test="${not empty list }">
			<c:forEach items="${list}" var="item" varStatus="vs">
				<c:choose>
					<c:when test="${ item.type == 1 }">
						<div
							data-url="${item.type },${item.itemNum },${item.rid},${activity.id }"
							class="newactiveitem ">
							<img src="${basepath }/static/m/img/tp.png"><br> <span>投票</span>
						</div>
					</c:when>
					<c:when test="${ item.type == 2}">
						<div
							data-url="${item.type },${item.itemNum },${item.rid},${activity.id }"
							class="newactiveitem ">
							<img src="${basepath }/static/m/img/dy.png"><br> <span>调研</span>
						</div>
					</c:when>
					<c:when test="${ item.type == 3 }">
						<div
							data-url="${item.type },${item.itemNum },${item.rid},${activity.id }"
							class="newactiveitem ">
							<img src="${basepath }/static/m/img/cj.png"><br> <span>抽奖</span>
						</div>
					</c:when>
					<c:when test="${ item.type == 4 }">
						<div
							data-url="${item.type },${item.itemNum },${item.rid},${activity.id }"
							class="newactiveitem ">
							<img src="${basepath }/static/m/img/top.png"><br> <span>排行榜</span>
						</div>
					</c:when>
					<c:when test="${ item.type == 6 }">
						<div
							data-url="${item.type },${item.itemNum },${item.rid},${activity.id }"
							class="newactiveitem">
							<img src="${basepath }/static/m/img/kc.png"><br> <span>课程</span>
						</div>
					</c:when>
					<c:when test="${ item.type == 7 }">
						<div
							data-url="${item.type },${item.itemNum },${item.rid},${activity.id }"
							class="newactiveitem #fff">
							<img src="${basepath }/static/m/img/ks.png"><br> <span>考试</span>
						</div>
					</c:when>
					<c:when test="${ item.type == 8 }">
						<div
							data-url="${item.type },${item.itemNum },${item.rid},${activity.id }"
							class="newactiveitem #fff">
							<img src="${basepath }/static/m/img/zx.png"><br> <span>资讯</span>
						</div>
					</c:when>
					<c:when test="${item.type==9}">
						<div
							data-url="${item.type },${item.itemNum },${item.rid},${activity.id }"
							class="newactiveitem #fff">
							<c:if test="${empty item.icon}">
								<img src="${basepath }/static/m/img/lanm.png">
							</c:if>
							<c:if test="${not empty item.icon}">
								<img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${item.icon}">
							</c:if>
							<br> <span>${item.title}</span>
						</div>
					</c:when>
				</c:choose>
			</c:forEach>
		</c:if>
		<c:if test="${activity.showTopic eq 1 }">
			<div data-url="huati" class="newactiveitem #fff">
				<img src="${basepath }/static/m/img/ht.png"><br> <span>话题</span>
			</div>
		</c:if>
		<c:if test="${activity.showQuestion eq 1 }">
			<div data-url="wenda" class="newactiveitem #fff">
				<img src="${basepath }/static/m/img/wd.png"><br> <span>问答</span>
			</div>
		</c:if>
		
		<input type="hidden" id="signin" value="${activity.signin }">
		<input type="hidden" id="isSign" value="${isSign}">
		<input type="hidden" id="afterSignIn" value="${activity.afterSignIn}">
	</div>
	<script type="text/javascript"
		src="${basepath }/static/m/nui/js/zepto.js"></script>
	<script type="text/javascript">


/* 
功能：保存cookies函数  
参数：name，cookie名字；value，值 
*/  
function setCookie(name,value){  
    var Days = 14;   //cookie 将被保存两个星期
    var exp  = new Date();  //获得当前时间  
    exp.setTime(exp.getTime() + Days*24*60*60*1000);  //换成毫秒  
    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();  
}  
/*
功能：获取cookies函数  
参数：name，cookie名字 
*/  
function getCookie(name){  
    var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));  
    if(arr != null){  
        return unescape(arr[2]) == 'true';   
    }else{  
     return false;  
    }  
} 
    </script>

	<script type="text/javascript">
	var admin_root ="<%=Constant.ADMIN_ROOT%>";
		function check() {
			var signin = $("#signin").val();
			var isSign = $("#isSign").val();
			var afterSignIn = $("#afterSignIn").val();
			if (signin == 1 && afterSignIn == 1) {
				if (isSign != 1) {
					showMsg("请签到后再来查看");
					return false;
				}
			}
			return true;
		}
		function toDetail(type, size, id, activityId) {

			if (type != "10" && !check()) {
				return;
			}

			var url = "";
			if (type == "1") {
				if (size == 1) {
					url = "${basepath}/m/ixin/nsurvey/index.xhtml?voteId="
							+ id ;
					window.top.location.href=url;
					return;
				} else {
					// url = "${basepath}/m/ixin/vote/serieslist.xhtml?type=1&activityId=" + activityId;
					url = "${basepath}/m/h5/vote/index?type=1&activityid=" + activityId;
					window.top.location.href=url;
					return;
				}
			} else if (type == "2") {
				if (size == 1) {
					url = "${basepath}/m/ixin/nsurvey/index.xhtml?voteId="
							+ id;
					window.top.location.href=url;
					return;
				} else {
					// url = "${basepath}/m/ixin/vote/serieslist.xhtml?type=2&activityId=" + activityId;
					url = "${basepath}/m/h5/vote/index?type=2&activityid=" + activityId;
					window.top.location.href=url;
					return;
				}
			} else if (type == "3") {
				if (size == 1) {
					//url = admin_root + "/protal/activity/cardreward.xhtml?rewardId="+ id;
					url = "${basepath}/m/ixin/lottery/cardreward.xhtml?rewardId="+id;
				} else {
					url = "${basepath}/m/ixin/lottery/serieslist.xhtml?activityId="
							+ activityId;
				}
			} else if (type == "4") {
				if (size == 1) {
					url = admin_root + "/protal/rank/" + id + ".xhtml";
				} else {
					url = "${basepath}/m/ixin/rank/serieslist.xhtml?activityId="
							+ activityId;
				}
			} else if (type == "6") {
				if (size == 1) {
					url = "${basepath}/m/study/detail/" + id + ".xhtml?fdomain=${current_domain}";
					if (window.top.location!= window.location) {
			            window.top.location.href=url;
			            return;
			         }
					
				} else {
					url = "${basepath}/m/ixin/study/serieslist.xhtml?activityId="
							+ activityId;
				}
			} else if (type == "7") {
				if (size == 1) {
					url = "${basepath}/m/h5/exam/detail.xhtml?tid=" + id;
				   window.top.location.href=url;
				   return;
				} else {
					url = "${basepath}/m/exam/serieslist.xhtml?activityId="
							+ activityId;
				}
			} else if (type === "8") {
				if (size == 1) {
					url = "${basepath}/m/ixin/fodder/detail.xhtml?id=" + id;
				} else {
					url = "${basepath}/m/ixin/fodder/serieslist.xhtml?activityId="
							+ activityId;
				}
			} else if (type == "9") {
				if (size == 1) {
				 	url = "${basepath}/m/ixin/channelresource/detail.xhtml?channelid=" + id;
				} else {
					//url = "${basepath}/m/ixin/channelresource/list.xhtml?channelid=" + id;
					url = "${basepath}/m/h5/channelresource/index.xhtml?channelid=" + id;
					window.top.location.href=url;
					return;
				}
			} else if (type == "10") {
				//url = "${basepath}/m/ixin/activity/seriesdetail.xhtml?id="+ activityId;
				url = "${basepath}/m/h5/activity/seriesdetail.xhtml?id="+activityId;
				window.top.location.href=url;
				return;
			} else {
				alert("未知类型，请联系管理人员！");
				return;
			}
			openUrl(url);

		}

		function toTopic(id) {
			if (!check()) {
				return;
			}
			var url = "";

			url = "${basepath }" + "/m/ixin/ntopic/index.xhtml?activityid="
					+ id;
			
	       window.top.location.href=url;
	         
			//openUrl(url);
		}
		//跳转到问答
		function toQuestion(id){
			if(!check()){
				return;
			}
			window.location.href = "${basepath }"+"/m/h5/ask/page.xhtml?activityid="+id;
		}
		function showMsg(msg) {
			easyDialog
					.open({
						container : {
							content : '<span style="text-algin: center;text-align: center;display: block;font-size: 16px;">'
									+ msg + '</span>'
						},
						autoClose : 1500
					});
		}

		function openUrl(url){
			window.location.href=url;
		}

		
	</script>
	
		<script type="text/javascript">
        $(function(){      	      	
			var w=0;
			var h=0;
			var len=$("#newactivebox .newactiveitem").length;
			var imgArr=$("#newactivebox .newactiveitem");
			var j;			
			if(window.top.location!=window.location){
        		w = $("header",parent.document).width()-36;
            	}else{
            		w =$(window).width()-36;
               }
			var imgW=Math.floor(w/3);
			var picW=imgW*0.6;
			var orientationEvent;
			var supportsOrientationChange = "onorientationchange" in window;
			for(var i=0;i<len;i++){
				j=i+1;
				if(j%3==0){
					$(imgArr[i]).css({"margin-right":"0px"});
					}
				$(imgArr[i]).width(imgW);
				$(imgArr[i]).height(imgW);	
				$(imgArr[i]).find("img").width(picW);
				$(imgArr[i]).find("img").height(picW);				
				}			
			orientationEvent = supportsOrientationChange ? "orientationchange" : "resize";			 
			window.addEventListener(orientationEvent, function() {
				var w=0;
				var h=0;
				var len=$("#newactivebox .newactiveitem").length;
				var imgArr=$("#newactivebox .newactiveitem");
				var j;			
				if(window.top.location!=window.location){
	        		w = $("header",parent.document).width()-36;
	            	}else{
	            		w =$(window).width()-36;
	               }
				var imgW=Math.floor(w/3);
				var picW=imgW*0.6;
				var orientationEvent;
				var supportsOrientationChange = "onorientationchange" in window;
				for(var i=0;i<len;i++){
					j=i+1;
					if(j%3==0){
						$(imgArr[i]).css({"margin-right":"0px"});
						}
					$(imgArr[i]).width(imgW);
					$(imgArr[i]).height(imgW);	
					$(imgArr[i]).find("img").width(picW);
					$(imgArr[i]).find("img").height(picW);				
					}
			}, false);

			$("#submitbtn").click(function(){
				var num = $("#number").val();
				if(num == "123321"){
					$("#newactivebox").show();
					$(".yanzhengcontainer").remove();
					//写cookie 
					setCookie(key, "true");
					window.location.href="${basepath }/m/ixin/activity/detaildispatch.xhtml?id=${activity.id}&skip=true";
					}else{
						alert("通关密码错误,请重新输入!");
						}
			});	


			  $(".newactiveitem").on("click",function(){
		            var url = $(this).attr("data-url");
		            if(url=="huati"){
		            	toTopic('${activity.id}');
		            }else if(url=="baoming"){
		            	toDetail('10','','','${activity.id}');
		            }
		            else if(url=="wenda"){
		            	toQuestion( '${activity.id}');
		            }
		            else{
		                var array = url.split(",");
		            	toDetail(array[0],array[1],array[2],array[3]);
		            }
		        });

		        
        });
        
      
    </script>
	
	
</body>
</html>