<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%> 
<% 
 String domain=MwebHelper.getCurrentDomain();
%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="format-detection" content="telephone=no" />  
	<title>活动详情</title>
	</head>
<body>
<c:if test="${activity.startSignLocation eq 1 }">
   <script type="text/javascript" src="http://webapi.amap.com/maps?v=1.2&key= 8ec74296b8f76afc3a2219284c9a9e34"></script>
   <div id="iCenter" style="display:none;"></div> 
<script type="text/javascript"> 
  var coordinate="${activity.coordinate}";
	var mapObj,toolBar,locationInfo; 
	var locationX;
	var locationY;
	var isShowMap = ${activity.mapShowInDetail}; 
	if(isShowMap=='1')
		{
			mapInit();			
		}
	//初始化地图对象，加载地图  
	function mapInit(){  
	  mapObj = new AMap.Map("iCenter");  
	  mapObj.plugin(["AMap.ToolBar"],function(){ 
		  var toolbarOptions={
				  autoPosition:true
				  }       
	      toolBar = new AMap.ToolBar(toolbarOptions); //设置地位标记为自定义标记  
	      mapObj.addControl(toolBar); 
	      AMap.event.addListener(toolBar,'location',function callback(e){   
	          locationInfo = e.lnglat;
	          locationX=locationInfo.lng+0.0065;
	          locationY=locationInfo.lat+0.0060;
	        });  
	  });  
	}  
	</script>  
</c:if>  
     <c:set var="bm_username" value="${user.name eq null ? user.username:user.name }"/> 
	<header class="ctl_header">
    	<div class="back"><a href="javascript:history.go(-1);"><i class="fa fa-angle-left"></i></a></div>
        	活动详情
	</header>    
    <article class="hdDetail ctl_cont">
    		<section>
            	<div> 
            	<c:if test="${not empty activity.picUrl }">
            	<img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${activity.picUrl}-320x180" width="320" height="180" /></div>
            	</c:if>
            	
            	<c:if test="${empty activity.picUrl }">
            	<img src="${basepath}/static/m_h5/img/activity_default.jpg" width="320" height="180" /></div>
            	</c:if>
            	
            	<div class="li h"> ${activity.name}</div>
	            <c:if test="${activity.apply eq 1}">	<%-- 需要报名 --%> 
					<div class="li m">${ltfun:dateLongToStringFormat(activity.startDate,'yyyy-MM-dd HH:mm')} ~ ${ltfun:dateLongToStringFormat(activity.endDate,'yyyy-MM-dd HH:mm')}
	                	<span>已报名<label id="applynum">${fn:length(records)}</label>人</span>
	                </div>
	                
	                <c:if test="${not empty activity.descript}">
	                	<div class="li m">${activity.descript}</div>
	                </c:if>
	                
	                <c:if test="${not empty  activity.lastApplyDate and activity.lastApplyDate ne '0'}">
	              		<div class="li f">报名截止：&nbsp;${ltfun:dateLongToStringFormat(activity.lastApplyDate,'yyyy-MM-dd HH:mm')}</div>
	                </c:if>
	               	<c:if test="${empty record }"> 	<%-- 用户没有报名--%>
	               	   	<c:if test="${activity.lastApplyDate >= currTime ||  activity.lastApplyDate == 0}">
	               	     <div class="btn1" onclick="apply()" id="baomingbtn">报名</div>
	                    </c:if>
	                    
					    <c:if test="${activity.lastApplyDate < currTime && activity.lastApplyDate != 0}">
					      <div class="btn5">报名时间已过</div>
					    </c:if>
	               	</c:if> 
	               	
	                <c:if test="${not  empty record }"><%-- 用户已经报名--%>                
		                <c:if test="${activity.signin == 1 }">
					    	<c:if test="${record.isSignin eq 1 }">
						 		<div class="btn4">​签到成功! 感谢您的参与!​</div>
						 	</c:if>
						    <c:if test="${record.isSignin eq 0 }">
				            	<div class="btn2" onclick="qiandao()" id="qiandaobtn">​签到​</div>​
					    	</c:if>
				    	</c:if>
						
						<c:if test="${activity.signin == 0 }">
				    		  <div class="btn4">报名成功</div>
				    	</c:if>
	               	</c:if>
	               	
	            </c:if>
	           	<c:if test="${activity.apply eq 0 && activity.signin eq 1}"><%-- 不需要报名，需要签到 --%>
	           		<div class="li m">${ltfun:dateLongToStringFormat(activity.startDate,'yyyy-MM-dd HH:mm')} ~ ${ltfun:dateLongToStringFormat(activity.endDate,'yyyy-MM-dd HH:mm')}
	                <%--	<span>已报名<label >${fn:length(records)}</label>人</span> --%>
	                </div>
	                
	                <c:if test="${not empty activity.descript}">
	                	<div class="li m">${activity.descript}</div>
	                </c:if>
	                
					<c:if test="${not  empty record }">
						<c:if test="${record.isSignin eq 1 }">
							<div class="btn4">​签到成功! 感谢您的参与!​</div>
						</c:if>
						<c:if test="${record.isSignin eq 0 }">
							<div  class="btn2"  onclick="qiandao()" id="qiandaobtn">​签到​</div>
						</c:if>
					</c:if>
					<c:if test="${empty record }">
						<div class="btn2" onclick="qiandao()" id="qiandaobtn">​签到​</div>
					</c:if>
	            </c:if>
	            <c:if test="${activity.apply eq 0 && activity.signin eq 0}"> <%-- 不需要报名，不需要签到 --%>
            		<div class="li m">${ltfun:dateLongToStringFormat(activity.startDate,'yyyy-MM-dd HH:mm')} ~ ${ltfun:dateLongToStringFormat(activity.endDate,'yyyy-MM-dd HH:mm')}
	                </div>
				</c:if>
				<c:choose>
					<c:when test="${activity.hasLimit eq 1 and  activity.signin eq 1 and (empty record or record.isSignin eq 0)}"></c:when> <%-- 有限制,需要签到,没有签到 --%>
					<c:otherwise>${activity.content}</c:otherwise>
				</c:choose>
            </section>
    </article>
    
        <div class="dialogBg" id="baomingdialogBg" style="display:none;" >​</div>
    <%--报名提示框 --%>​
    <div class="dialogBox1" style="display: none;" id="baomingdialog">
    	<div class="dialogHeader">报名</div>
        <div class="dialogContent">
        	<span><label>姓名</label><input id="userName" type="text" placeholder="必填" value="${bm_username }" /></span>
            <span><label>手机</label><input id="userMobile" type="tel" value="${empty user.temporary_mobile ? user.mobile:user.temporary_mobile}"/></span>
            <span><label>单位</label><input id="userCompany" type="text" value="${user.unitinfo}"/></span>
            <span class="err" id="baomingMsg"> </span>
        </div>
        <div class="dialogFooter"><span class="a" onclick="cancel('baomingdialog');">取消</span><span class="b" onclick="baomingY();">报名</span></div>
    </div>
    <%--签到提示框 --%>
    <div class="dialogBg" id="qiandaodialogBg" style="display:none;" >​</div>
    <div class="dialogBox1" style="display: none;" id="qiandaodialog">
    	<div class="dialogHeader">请输入签到码</div>
        <div class="dialogContent">
<%--       	<span>请输入签到码</span> --%>
            <span class="qiandao" style="margin-top:10px;"><input id="code" type="text" style="height:24px;"></span>
             <span class="err" id="qiandaoMsg"> </span>
        </div>
        <div class="dialogFooter"><span class="a" onclick="cancel('qiandaodialog');">取消</span><span class="b" onclick="qiandaoY();">签到</span></div>
    </div>
	<%-- 无法签到提示框 --%>
     <div class="dialogBg" id="qiandaofdialogBg" style="display:none;" >​</div>
    <div class="dialogBox1" style="display: none;" id="qiandaofdialog">
    	<div class="dialogHeader">提示</div>
        <div class="dialogContent"> 
             <span class="err" id="tishiMsg"></span>
        </div>
        <div class="dialogFooter"><span class="a" onclick="cancel('qiandaofdialog');">取消</span> </div>
    </div>
    
<script type="text/javascript">
var startSignLocation="${activity.startSignLocation}";//是否开启位置签到 0不需要1需要
var praisenum = "${fn:length(records)}"; //赞数量
/**用户报名对话框*/
function apply(){ 
	$("#userName").val("${bm_username}");
	$("#userMobile").val("${empty user.temporary_mobile ? user.mobile:user.temporary_mobile}");
	$("#userCompany").val("${user.unitinfo}");
	$("#baomingMsg").html('');
	$("#baomingdialog").show();	
	$("#baomingdialogBg").show();	
}
/**关闭提示框*/
function cancel(dialogid){
	$("#"+dialogid).hide();	
	$("#"+dialogid + "Bg").hide();	
}
/**用户报名*/
function baomingY(){
	  var userName = $("#userName").val();
	  var userMobile = $("#userMobile").val();
	  var userCompany = $("#userCompany").val();
	  var qcorder="${qcorder}"; 
	  if($.trim(userName) == ""){
		 $("#baomingMsg").html('用户名不能为空');
		  return false;
	  } 
	  
	  $.ajax({
		  	type:"POST",
     		url:"${basepath}/m/ixin/activity/saveixinuserinfo.json",
     		data:{"mobile":userMobile,"name":userName,"company":userCompany},
     		success:function(data){
     			if(data == 1){
     				$.ajax({
  				  	type:"POST",
  		       		url:"${basepath}/m/ixin/activity/apply.json",
  		       		data:{"activityId": "${activity.id}","baseuid":"${uid}","name":userName},
  		       		success:function(data){
  		       			if(data == 0) {
							praisenum++;
  	     					$("#applynum").html(praisenum);
			    	        var html = '<div class="btn4" >​报名成功​</div>';
			    	        var signin = "${activity.signin}";
			    	        if(signin == 1){//需要签到
  				    	        if(!qcorder){//不是二维码过来的
	  				    	        html += '<div class="btn2" onclick="qiandao()" id="qiandaobtn">​签到​</div>';
  				    	        }else{
  				    	        	autosignin();
	  				    	    } 
			    	        }else {
			    	        	html = '<div class="btn4">报名成功​</div>';
			    	        }
			    	      	$("#baomingbtn").hide();
	  				    } else if(data == 1) {
	  				      	$("#baomingbtn").hide();
	  				     	html = ' <div class="btn5">​报名时间已过​</div>';
	  				    } else {
		  					html = '<div class="btn5">​报名失败，服务器访问失败​</div>';
	  				    }
 		       			$("#baomingbtn").after(html);
 		      		 	cancel("baomingdialog");
  		       		},
  		       		error:function(data){
  		       			$("#baomingbtn").after(' <div  class="btn5">​报名失败，服务器访问失败​</div>')
  		       		}
  		       	});
     			} else { 
         				$("#baomingbtn").after(' <div  class="btn5">​报名失败，服务器访问失败​</div>')
     			}
     		},
     		error:function(data){
     			showtishi("服务器访问失败​");
     		}
     	});
}

/**无法签到提示框*/
function showtishi(message){
	$("#tishiMsg").html(message);	
	$("#qiandaofdialog").show();	
	$("#qiandaofdialogBg").show();	
}

/**签到对话框*/
function qiandao(){
	$("#code").val("");
	$("#qiandaoMsg").html("");
	if(startSignLocation==1){
		var currentPosition=locationX+","+locationY;//当前位置
		$.ajax({
            type:"GET",
            url:"${basepath}/m/ixin/activity/getdistance.json",
            data:{"point":coordinate,"currentPoint":currentPosition},
            success:function(data){
                if(data>2000){
                    showtishi("不在活动现场，无法签到");
             }else{ 
              		$("#qiandaolog").show();	
              		$("#qiandaologBg").show();
                }
            }
		});
	}else{
		$("#qiandaodialog").show();	
		$("#qiandaodialogBg").show();
	}
}

/**签到*/
function qiandaoY(){
	var code = $("#code").val();
	if(code == "${activity.signinCode}") {
		$("#qiandaoMsg").html();
		$.get("${basepath}/m/ixin/activity/signin.json", { "activityId": "${activity.id}", "openId": "${openId}", "code":code,"baseuid":"${uid}"},
			function(data){
		    	if(data) {//签到成功
			    	$(".btn4").hide();
			    	$("#qiandaobtn").hide();
			    	$("#qiandaobtn").after('<div class="btn4">签到成功! 感谢您的参与!</div>');
					cancel("qiandaodialog");
					location.reload();
				} else { 
					showtishi("签到失败");
		     	}
		});
	} else {
		$("#qiandaoMsg").html("请输入正确的签到码"); 
	}
}

/**自动签到*/
function autosignin(){
	$.get("${basepath}/m/ixin/activity/autosignin.json", { "activityId": "${activity.id}", "openId": "${openId}","baseuid":"${uid}"},
		function(data){
			if(data) { 
				$(".btn2 .btn4").hide();
			    $("#qiandaobtn").after('<div class="btn4">签到成功! 感谢您的参与!</div>');
			} else {
				showtishi("签到失败");
	     }
	});
}

$(function(){	
	var orientationEvent;
	var supportsOrientationChange = "onorientationchange" in window;
	var h = $(window).height();
	var hasHead = $("header").css("display");
	$("html,body").css({"overflow":"hidden"});
	$("body").height(h).css({"background":"#f8f8f8"}); 
	if(hasHead == "block"){
		$("article.hdDetail").height(h-50);
		$("article.hdDetail > section").height(h-66);
		}else{
			$("article.hdDetail").height(h);
			$("article.hdDetail  > section").height(h-16);
			}		  
	orientationEvent = supportsOrientationChange ? "orientationchange" : "resize";   
	window.addEventListener(orientationEvent, function() {
		var h = $(window).height();
		$("body").height(h).css({"background":"#f8f8f8"}); 
		if(hasHead == "block"){
			$("article.hdDetail").height(h-50);
			$("article.hdDetail > section").height(h-66);
			}else{
				$("article.hdDetail").height(h);
				$("article.hdDetail  > section").height(h-16);
				}	  
	}, false); 

});

</script>    
</body>
</html>
