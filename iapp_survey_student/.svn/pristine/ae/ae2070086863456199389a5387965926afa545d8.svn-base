<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<!DOCTYPE html>
<html>
	<head>
		<title>修改密码</title>
		<link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/css/module.css" />
        <style type="text/css">
            body{
                background: #f8f8f8;
            }
        </style>
	</head>
	<body>
		<header>
            <span class="btn btn-left"  id="btn-left-1">
                <i class="fa fa-angle-left"></i>
            </span>
            <div class="title title-2">
                修改密码
            </div>
        </header>
        <div class="wrapper-box" id="wrapper-box-1" style="padding-top:50px;">
            <section class="module-login" id="module-login">
            	<div class="block-green-info">
                    *旧密码
                </div>
                <div class="block-input">
                    <input type="password" placeholder="请输入你的旧密码" id="oldpassword" onblur="verifypassword()"/>
                </div>
            <div class="block-green-info">
                    *新密码
                </div>
                <div class="block-input">
                    <input type="password" placeholder="请输入你的密码" id="newpassword"/>
                </div>
                <div class="block-green-info">
                    *确认密码
                </div>
                <div class="block-input">
                    <input type="password" placeholder="再次输入密码" id="repassword" />
                </div>
                <div class="block-error-info">
                 <p id="tishi"></p>
                </div>
                <div class="block-login-btn" onclick="submit_();">
                    提交
                </div>
                
            </section>
        </div>

        
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.2.0.js"></script>
        <script type="text/javascript">
            $(function () {

                var $btnLeft1 = $('#btn-left-1');


                
                $btnLeft1.bind('click',function(){
                	window.history.go(-1);
                });

            });
                

            
            function verifypassword(){
            	var oldpassword = $.trim($("#oldpassword").val());
            	if(oldpassword==''){
            			$("#tishi").html("旧密码错误");
            		    return;
                	}
            	$.ajax({
                    type: "POST",
                    url:"${basepath}/m/ext/enn/user/validatepassword.json",
                    data:{'oldpassword':oldpassword},
                    error: function(data) {
                    	$("#tishi").html("旧密码错误");
	                	return;
	                },
	                success: function(data) {
	                    if(!data){
	                    	$("#tishi").html("旧密码错误");
	                    	return;
	                     }else{
	                    	$("#tishi").html("");
	                     }
	                }
                });
            }
            
            


            function submit_(){
            	$("#tishi").html("");
            	var newpassword = $.trim($("#newpassword").val());
            	var repassword = $.trim($("#repassword").val());
            	var oldpassword = $.trim($("#oldpassword").val());
            	
            	if(repassword=='' || newpassword==""){
    				$("#tishi").html("密码不能为空");
    				return;
    			}else if(repassword.length<6 || newpassword.length <6 || repassword.length>15 || newpassword.length>15){
    				$("#tishi").html("密码长度为6-15");
    				return;
    			}else{
    				$("#tishi").html("");
        		}
            	if(newpassword != repassword){
                	$("#tishi").html("两次密码输入不一致");
                	return;
                }
            	if($("#tagids").val()==''){
            		$("#tishi").html("请添加标签");
                	return;
            		
            	}else{
                	$("#tishi").html("");
    				$.ajax({
    	                type: "POST",
    	                url:"${basepath}/m/ext/enn/user/updatepassword.json",
    	                data:{'password':repassword,'oldpassword':oldpassword},
    	                error: function(data) {
    	                	$("#tishi").html("修改失败");
    	                },
    	                success: function(data) {
    	                    if(data){
    	                    	lightBlock.show("修改成功!");
    	                    	setTimeout("window.history.go(-1)",1500 );
    	                    	
    	                    }else{
    	                    	$("#tishi").html("旧密码错误");
    	                     }
    	                }
    	            });
	
                }
            }
                
        </script>
	</body>
            