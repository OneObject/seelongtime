<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%> 
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    	<meta name="apple-mobile-web-app-capable" content="yes" />
    	<meta name="apple-mobile-web-app-status-bar-style" content="black" />
    	<meta name="format-detection" content="telephone=no" />
		<title>找回密码</title>
        <style type="text/css">
      		:root{height:100%;}
      		body{min-height: 400px;}
        	section.loginBox{width:230px;height:250px;position:absolute;left:50%;top:50%;margin-top:-150px;margin-left:-115px;}
        	section.loginBox .logo{width:100%;height:120px;}
        	section.loginBox .logo img{display: block;width:128px;margin-left:48px;}
        	section.loginBox div.err{color:#c26468;font-size:12px;text-align:left;height:16px;line-height:16px;width:100%;margin:8px 0px;}
        	section.loginBox ul{width:100%;}
        	section.loginBox li{width:100%;margin-bottom:32px;float:left;}
        	section.loginBox li:nth-child(2){margin-bottom:38px;}
        	section.loginBox li:nth-child(3){margin-bottom:30px;}
        	section.loginBox li input{color:#ccc;width:100%;box-sizing: border-box;height:34px;line-height:14px;font-size:12px;border:1px solid #ccc;padding:10px 12px 10px 48px; border-radius: 3px;}			
			section.loginBox li:last-child span{display: inline-block;width: 100%;border-radius: 3px;font-size:14px;height:34px;line-height: 34px;background:#59c3e6;color:#fff;text-align: center;cursor: pointer;}
			
			section.loginBox .help {width: 100%;text-align: center;}
			section.loginBox .help a{text-decoration:underline;color:#ccc;font-size:12px;}		
			input.user{background: url(${basepath}/static/img/use1.png) 15px center no-repeat;background-size: 18px 18px;}
			section.loginBox input.verify{background: none;width:100px;padding:10px 12px 10px 12px;float:left;}
			section.loginBox li input.curU{background: url(${basepath}/static/img/use2.png) 15px center no-repeat;background-size: 18px 18px;border-color:#4f5f6f;color:#4f5f6f;}
			section.loginBox li input.curV{background:none;border-color:#4f5f6f;color:#4f5f6f;}
			span.numBox{display:inline-block;width:122px;height:34px;margin-left:8px;float:left;}
			span.numBox > span{cursor:pointer;display:inline-block;width:60px;height:34px;margin-top:0px;border:1px solid #ccc;float:left;box-sizing: border-box;}
			span.numBox > label{text-decoration:underline;cursor:pointer;color:#59C3E6;display:inline-block;width:60px;line-height:34px;height:34px;margin-left:2px;font-size:12px;overflow: hidden;float:left;}
        </style>
	</head>
	<body>
		<section class="loginBox">
			<div class="err"  style="display:block;" id="msg"></div>
			<ul>
				<li><input class="user" type="text" placeholder="请输入账号" name="username" id="username" /></li>
				<li><input class="verify" type="text" placeholder="输入验证码"  name="captcha" id="captcha"/><span class="numBox"><span><img id="img_captcha" src="${basepath}/api/captcha.do?v=<%=System.currentTimeMillis()%>"/></span><label onclick="refreshCaptache();">看不清楚？</label></span></li>
				<li><span id="submit" onclick="submit();">找回密码</span></li>
			</ul>
			<div class="help">
				<a  onclick="javascript:history.go(-1);" style="cursor:pointer;">返回</a>
			</div>			
		</section>
		<script type="text/javascript" src="${basepath}/static/m_h5/js/jquery-2.1.1.min.js"></script>
    	<script type="text/javascript">
    		$(function(){
    			$("input.user").focus(function(){
    				$(this).addClass("curU");
    			});
    			$("input.user").blur(function(){
    				$(this).removeClass("curU");
    			});
    			$("input.verify").focus(function(){
    				$(this).addClass("curV");
    			});
    			$("input.verify").blur(function(){
    				$(this).removeClass("curV");
    			});
    			
    		});
    		
    		function submit(){
    			$("#msg").html("");
				disableSub();
				var username = $("#username").val();
				var captcha = $("#captcha").val();
				if(username == "" || captcha == ""){
			    	$("#msg").html("请完整输入信息");
			    	enableSub();
			    	return;
			    }
				
				/*
				$.post("${basepath}/api/captcha.do",{input:captcha},function(result){
				    if(result==null || !result.rs){
				    	$("#msg").html("验证码错误");
    			    	return;
				    }
				    findpwd(username,captcha);
				});			
			
			*/
				findpwd(username,captcha);
    			
    			
    		}
    		function refreshCaptache(){
    			$('#img_captcha').attr('src','${basepath}/api/captcha.do?v'+Math.random());
    			$('#captcha').val("");	
    		}
    		
    		function findpwd(username,captcha){
    			$.post("${basepath}/m/h5/findpwd.json",{account:username,captcha:captcha},function(result){
    				var msg = "密码找回失败，请联系管理员";
    				var success =false;
				    if(result==null ){
				    	msg = "账号填写错误";
				    }else if(result=="101"){
				    	msg = "验证码错误";
				    }else if(result=="1"){
				    	msg = "用户不存在";
				    }else if(result=="2"){
				    	msg = "用户未设置邮箱，请联系管理员";
				    }else if(result=="0"){
				    	msg = "密码已发送到您的邮箱,请查收.";
				    	success = true;
				    }
    				$("#msg").html(msg);
    				enableSub();
			    	return;
				});		
    		}
    		function disableSub(){
    			$("#submit").text("提交中...");
    			$("#submit").unbind("click");
    		}
    		function enableSub(){
    			$("#submit").text("找回密码");
    			$("#submit").bind("click");
    		}
    		
    	</script>
	</body>
</html>

