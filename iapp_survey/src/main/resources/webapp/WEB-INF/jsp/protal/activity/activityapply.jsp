<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<link rel="Shortcut Icon" href="http://img0.aijiayou.com/${info.picUrl }-portalCover" />
<title>${info.name }</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" type="text/css"
	href="${basepath }/static/ixin/css/weixin-client-page.css">
	<link rel="stylesheet" type="text/css"
    href="${basepath }/static/public/easydialog-v2.0/easydialog.css">
     <script type="text/javascript" src="${basepath }/static/js/jquery-1.10.2.min.js"></script>
      <script type="text/javascript" src="${basepath }/static/public/easydialog-v2.0/easydialog.js"></script>
      <link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.0/jquery.mobile-1.4.0.min.css" />
<style>

#nickname {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	max-width: 90%;
}

ol,ul {
	list-style-position: inside;
}
</style>
<style>
#activity-detail .page-content .text {
	font-size: 16px;
}
.btnGreen {
    font-size: 16px;
    text-align: center;
    text-align: center;
    text-align: center;
    text-decoration: none;
    text-decoration: none;
    text-decoration: none;
    cursor: pointer;
    cursor: pointer;
    cursor: pointer;
    overflow: visible;
    padding: 0 20px;
    height: 38px;
    line-height: 38px;
    border: 1px solid rgba(0, 0, 0, 0.6);
    border-radius: 5px;
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    border-radius: 5px;
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    box-shadow: 0 1px 0 0 rgba(255, 255, 255, 0.2) , inset 0 1px 1px 0 rgba(255, 255, 255, 0.25);
    -moz-box-shadow: 0 1px 0 0 rgba(255, 255, 255, 0.2) , inset 0 1px 1px 0 rgba(255, 255, 255, 0.25);
    -webkit-box-shadow: 0 1px 0 0 rgba(255, 255, 255, 0.2) , inset 0 1px 1px 0 rgba(255, 255, 255, 0.25);
    box-shadow: 0 1px 0 0 rgba(255, 255, 255, 0.2) , inset 0 1px 1px 0 rgba(255, 255, 255, 0.25);
    -moz-box-shadow: 0 1px 0 0 rgba(255, 255, 255, 0.2) , inset 0 1px 1px 0 rgba(255, 255, 255, 0.25);
    -webkit-box-shadow: 0 1px 0 0 rgba(255, 255, 255, 0.2) , inset 0 1px 1px 0 rgba(255, 255, 255, 0.25);
    -webkit-tap-highlight-color: rgba(255, 255, 255, 0);
    display: block;
    display: block;
    display: block;
    width: auto;
    width: auto;
    color: #FFF;
    color: #FFF;
    text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.5);
    text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.5);
    background-color: #21A52B;
    background-image: -moz-linear-gradient(top, #53c15c 0, #00920b 83%);
    background-image: -webkit-gradient(linear, 0 0, 0 83%, from(#53C15C), to(#00920B));
    background-image: -webkit-linear-gradient(top, #53C15C 0, #00920B 83%);
    background-image: -o-linear-gradient(top, #53c15c 0, #00920b 83%);
    background-image: linear-gradient(to bottom, #53C15C 0, #00920B 83%);
    background-color: #21A52B;
    background-image: -moz-linear-gradient(top, #53c15c 0, #00920b 83%);
    background-image: -webkit-gradient(linear, 0 0, 0 83%, from(#53C15C), to(#00920B));
    background-image: -webkit-linear-gradient(top, #53C15C 0, #00920B 83%);
    background-image: -o-linear-gradient(top, #53c15c 0, #00920b 83%);
    background-image: linear-gradient(to bottom, #53C15C 0, #00920B 83%);
}
.easyDialog_content{width:300px;}
.easyDialog_footer{text-align: center;}
.easyDialog_wrapper .btn_normal{height: 30px;width:100px;margin-left: 10px;}
.easyDialog_wrapper .btn_highlight{height: 30px;width:100px;}
.alert-success {
color: #3c763d;
background-color: #dff0d8;
border-color: #d6e9c6;
}
.alert {
padding: 15px;
margin-bottom: 20px;
border: 1px solid transparent;
border-radius: 4px;
}
.form-group{
margin:10px;0px;
}

</style>
</head>
<body>
<body id="activity-detail">
	<div class="page-bizinfo">
		<div class="header">
			<h1 id="activity-name">${info.name }</h1>
			<p class="activity-info">
				<span id="post-date" class="activity-meta no-extra">
				<d:formatDate currentTime="${info.createDate }" format="yyyy-MM-dd"/>
				</span>
				<span class="activity-meta">${info.sponsor }</span>
			</p>
		</div>
	</div>
	<div class="page-content">

		<div class="media" id="media">
			<img src="http://img0.aijiayou.com/${info.picUrl }">
		</div>

		<div class="text">
		
		<c:if test="${info.apply==1}">
			<c:if test="${empty record }">
				<c:if test="${info.lastApplyDate >= currTime ||  info.lastApplyDate == 0}">
			    <div class="baoming" style="margin-bottom:20px;">
			        <span class="btnGreen" id="baoming" onclick="apply()">我要报名</span>
			    </div> 
			    </c:if>
		    </c:if> 
		    <c:if test="${not  empty record }">
		    	<div class="alert alert-success">
			        <strong>已报名</strong>
			      </div>
		    </c:if>
		</c:if>
		</div>
			<%--
		      <p><strong>培训介绍</strong></p>
		      <p>
		      ${info.desc }
		      </p>
		      <br/> 
		     --%>  

		      <p><strong>培训时间</strong></p>
		      <p><d:formatDate currentTime="${info.startDate }" format="yyyy-MM-dd"/><!-- yyyy-MM-dd HH:mm -->
		      ~
		      <d:formatDate currentTime="${info.endDate }" format="yyyy-MM-dd"/>
		      </p>
		      <br/> 
		      <p><strong>欢迎辞</strong></p>
              <div style="display:block;overflow:hidden;width:100%;">${info.content }</div>
              <br/> 
              <p><strong>培训地点</strong></p>
              <p>${info.address }</p>
		<!-- <p>${openId }</p> -->
	</div>
	<script type="text/javascript" charset="utf-8">
	
	  function apply(){
		  $.get("${basepath}/protal/ixin/banduser/getuser.xhtml?id=${openId}",function(data){
			  var baseuid = jQuery.isEmptyObject(data)?"":data.base_id;
			  var v1 = jQuery.isEmptyObject(data)?"":data.name;
			  var v2 = jQuery.isEmptyObject(data)?"":data.mobile;
			  var v3 = jQuery.isEmptyObject(data)?"":data.company;
			  if(null==v1){
				  v1="";
			  }
			  if(null==v2){
				  v2="";
			  }
			  if(null==v3){
				  v3="";
			  }
			  var html = [];
			  html.push('<div style="width:100%;height:130px;">');
				html.push('	<div class="form-group" id="">');
				html.push('		<input type="hidden" id="userId" value="">');
				html.push('		<lable style="font-size:18px; width:25%">姓名：</lable>');
				html.push('		<input type="text" name="userName" id="text-basic" style="width:75%;height:30px;" value="'+v1+'">');
				html.push('	</div>');
				html.push('	<div class="form-group" id="">');
				html.push('		<lable style="font-size:18px; width:25%">手机：</lable>');
				html.push('		<input type="tel" name="userMobile" id="tel" style="width:75%;height:30px;" value="'+v2+'">');
				html.push('	</div>');
				html.push('	<div class="form-group" id="">');
				html.push('		<lable style="font-size:18px; width:25%">单位：</lable>');
				html.push('		<input type="text" name="userCompany" style="width:75%;height:30px;" id="text-basic" value="'+v3+'">');
				html.push('	</div>');
				html.push("</div>");
				
				easyDialog.open({
					  container : {
					    header : '请输入个人信息',
					    content : html.join(''),
					    yesFn : btnFn,
					    noFn : true
					  }
					});
				  function btnFn(){
					  var userName = $("input[name='userName']").val();
					  var userMobile = $("input[name='userMobile']").val();
					  var userCompany = $("input[name='userCompany']").val();
					  $("input[name='userName']").css({"background-color":"#fff"});
					  $("input[name='userMobile']").css({"background-color":"#fff"});
					  if($.trim(userName) == ""){
						  $("input[name='userName']").css({"background-color":"red"});
						  return false;
					  }
					  if($.trim(userMobile) == ""){
						  $("input[name='userMobile']").css({"background-color":"red"});
						  return false;
					  }
					  $.post("${basepath}/protal/ixin/banduser/save.xhtml",{"openid":"${openId}","mobile":userMobile,"name":userName,"company":userCompany},function(){
						  $.get("${basepath}/protal/activity/apply.xhtml", { activityId: "${info.id}", openId: "${openId}" ,baseuid: "'"+baseuid+"'"},
			  				   function(data){
			  				     if(data == 0) {
			  				    	 opendialog('报名成功');
			  				    	 $("#baoming").remove();
			  			              $(".text").html('<div class="alert alert-success"><strong>已报名</strong></div>');
			  				     } else if(data == 1) {
			  				    	 opendialog('报名失败，已经过了报名时间');
			  				     } else {
			  				    	opendialog('报名失败，服务器访问失败');
			  				     }
			  				     
			  				   }); 
					  });
				  }
		  });
		  
		  
		  
		 // 
  		/* */
  		}
	  function signindialog(){
          easyDialog.open({
            container : {
              content : '<label>请输入4位数的签到码</label><br><input type="number" id="code" style="width:100%;height:30px"/>',
              yesFn : signin,
              noFn : btnFn
            }
          });
  	}
	var signin = function() {
		var code = $("#code").val();
		easyDialog.close();
		if(code == "${info.signinCode}") {
			$.get("${basepath}/protal/activity/signin.xhtml", { activityId: "${info.id}", openId: "${openId}", code:code},
					   function(data){
					     if(data) {
					    	 opendialog('签到成功');
					    	 $("#baoming").remove();
				              $(".text").html('<div class="alert alert-success"><strong>已签到</strong> 欢迎参加</div>');
					     } else {
					    	 opendialog('签到失败');
					     }
					   });
		} else {
			alert("请输入正确的签到码");
		}
		
	};
	
	var btnFn = function(){
		
          easyDialog.close();
        };
        
    	function opendialog(text){
            easyDialog.open({
              container : {
                content : '<span style="text-algin: center;text-align: center;display: block;font-size: 24px;">'+text+'</span>',
                yesFn : btnFn,
                noFn : false
              }
            });
    	}
    	
	</script>
	
<script type="text/javascript">
(function(){
	var onBridgeReady=function(){
		// 发送给好友; 
		/* WeixinJSBridge.on('menu:share:appmessage', function(argv){
			WeixinJSBridge.invoke('sendAppMessage',{
				"appid":		dataForWeixin.appId,
				"img_url":		dataForWeixin.img,
				"img_width":	"120",
				"img_height":	"120",
				"link":				dataForWeixin.url,
				"desc":				dataForWeixin.desc,
				"title":			dataForWeixin.title
			}, function(res){});
		}); */
		// 分享到朋友圈;
		WeixinJSBridge.on('menu:share:timeline', function(argv){
			WeixinJSBridge.invoke('shareTimeline',{
			"img_url":"http://img0.aijiayou.com/${info.picUrl }-portalCover",
			"img_width":"120",
			"img_height":"120",
			"link":"${basepath}/protal/activity/activitypage.xhtml?activityId=${info.id}&openId=${info.domain}",
			"desc":"${info.name }",
			"title":"${info.name }"
			}, function(res){});
		});
		// 分享到微博;
		/* WeixinJSBridge.on('menu:share:weibo', function(argv){
			WeixinJSBridge.invoke('shareWeibo',{
			"content":dataForWeixin.title+' '+dataForWeixin.url,
			"url":dataForWeixin.url
			}, function(res){<?php do_action('weixin_share','ShareWeibo');?>});
		});*/
		// 分享到Facebook
		/*WeixinJSBridge.on('menu:share:facebook', function(argv){
			WeixinJSBridge.invoke('shareFB',{
			"img_url":dataForWeixin.img,
			"img_width":"120",
			"img_height":"120",
			"link":dataForWeixin.url,
			"desc":dataForWeixin.desc,
			"title":dataForWeixin.title
			}, function(res){<?php do_action('weixin_share','ShareFB');?>});
		}); */
	};
	if(document.addEventListener){
		document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
	}else if(document.attachEvent){
		document.attachEvent('WeixinJSBridgeReady'   , onBridgeReady);
		document.attachEvent('onWeixinJSBridgeReady' , onBridgeReady);
	}
})();
</script>
<%@include file="/WEB-INF/jsp/include/student/wx.jsp"%>
</body>
</html>
<%@include file="/WEB-INF/jsp/include/analysis.jsp"%>