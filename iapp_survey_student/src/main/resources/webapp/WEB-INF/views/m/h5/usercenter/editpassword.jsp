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
    
    <link rel="stylesheet" href="${basepath}/static/css/easydialog.css">
<title>修改密码</title>
</head>

<body>
	

	<header class="ctl_header">
    	<div class="back"><a href="${basepath}/m/h5/usercenter/index.xhtml"><i class="fa fa-angle-left"></i></a></div>
        修改密码

    </header>
    
    <article class="scroll ctl_cont">
    
    <section class="password">
    	<div><input type="password" placeholder="旧密码" id="oldpassword"  onblur="verifypassword()"/></div>
		<p class="error" id="passworderror">密码输入错误</p>
        
        <div><input type="password" placeholder="新密码" id="newpassword"/></div>
        
        
        <div><input type="password" placeholder="再输一次" id="repassword"/></div>
        <p class="error" id="notsamerror">两次密码输入不一致</p>
        <p class="error" id="repassworderror">密码不能为空，长度6-15</p>
    
    </section>
    

    
    <a  class="sub sub2" onclick="submit_()">提交</a>
    
    
    </article>


 	<script type="text/javascript" src="${basepath}/static/m_h5/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="${basepath}/static/m_h5/js/common.js"></script>
    <script type="text/javascript" src="${basepath }/static/js/easydialog.min.js"></script>
    <script type="text/javascript">
    	function verifypassword()
    	{
        	var oldpassword = $.trim($("#oldpassword").val());
        	if(oldpassword=='')
            	{
        				$("section.password  p:first").css("display","block");
        		          return;
            	}
        	$.ajax({
                type: "POST",
                url:"${basepath}/m/h5/usercenter/verifypassword.json",
                data:{'oldpassword':oldpassword},
                error: function(data) {
                	$("section.password  p:first").css("display","block");
                },
                success: function(data) {
                    if(data)
                        {
                        	$("section.password  p:first").css("display","none");
                        }
                    else
                        {
                        	$("section.password  p:first").css("display","block");
                        }
                }
            });
        }

    	function submit_()
    	{
    		var oldpassword = $.trim($("#oldpassword").val());
    		if(oldpassword=='')
        	{
    		 	$("section.password  p:first").css("display","block");
        		return;
        	}
        	var newpassword = $.trim($("#newpassword").val());
        	var repassword = $.trim($("#repassword").val());
        	$("#repassworderror").hide();
        	if(newpassword == repassword)
            	{
        			$("#notsamerror").css("display","none");
        			if($("#passworderror").css("display")=='none')
        			{
            			if(repassword==''||repassword.length<6)
                			{
                				$("#repassworderror").show();
                			}
            			else
                			{
	            				$.ajax({
	            	                type: "POST",
	            	                url:"${basepath}/m/h5/usercenter/updatepassword.json",
	            	                data:{'password':repassword},
	            	                error: function(data) {
	            	                	showTishi('修改失败');
	            	                },
	            	                success: function(data) {
	            	                    if(data)
	            	                        {
	            	                    		showTishi('修改成功');
	            	                    		location.href="${basepath}/m/h5/usercenter/index.xhtml";
	            	                        }
	            	                    else
	            	                        {
	            	                    		showTishi('修改失败');
	            	                        }
	            	                }
	            	            });
                			}
            		}
            	}else{
            		$("#notsamerror").css("display","block");
                	}
        }

    	function showMsgDialog(content){
    		easyDialog.open({
    	        container : {
    	            header : '提示',
    	            content : '<div style="background-color: #ffffff;width:260px;height:20px;text-align:center;">'+content+'</div>'
    	        },
    	        autoClose:1000
    	    });
    	}
    	
    </script>
    
</body>
</html>
