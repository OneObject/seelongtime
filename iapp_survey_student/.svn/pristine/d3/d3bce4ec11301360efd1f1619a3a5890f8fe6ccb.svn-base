<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
        <meta name="format-detection" content="telephone=no" />
		<title>填写员工编号</title>
        <link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/css/font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/css/guidance.2.0.css" />
		<link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/css/module.css" />
	</head>
	<body class="bg-color-gray">
        <header>
            <div class="title title-2">
                填写员工编号
            </div>
        </header>
        <section class="wrapper-static margin-top-50">
            <div class="employee-num-box">
                <ul class="green-intro-info">
                    <li>系统中检测到您的登录账号为手机号，请您修改为员工编号。</li>
                    <li>温馨提示：今后的登录账号为员工编号，密码不变。</li>
                </ul>
                <div class="wrappre-input-box">
                    <div class="block-header">
                       ${user.name}
                    </div>
                    <div class="block-input">
                        <input type="text" placeholder="员工编号" id="username" />
                    </div>
                    <div class="block-error-info">
                        
                    </div>
                    <div class="block-login-btn" onclick="update()">
                        提交
                    </div>
                    <div class="block-footer" >
                        <span onclick="skip()">跳过设置 &raquo;</span>
                    </div>
                </div>
            </div>
        </section>

        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.2.0.js"></script>
        <script type="text/javascript">
			
            $(function () {
				
                var $btnLeft1 = $('#btn-left-1');
				
                $btnLeft1.bind('click', function () {
                    window.history.go(-1);
                });
				
            });


		function chackusername(){
			var message = $('.block-error-info');
			var username = $('#username').val();
			if(""==username){
				message.html("请输入员工编号！");
				return false;
			}
			
			var patten=new RegExp(/^[0-9]{8}$/);
			if(!patten.test(username)){
				message.html("员工编号为8位数字！");
				return false;
			}
			message.html("");
			return true;
		}
		function update(){
			if(!chackusername()){
				return;
			}
			lightDialog.show("确定设置为 "+$('#username').val()+" 吗？",
                function(){
                	lightDialog.remove();
					showHandling();
                		var username = $('#username').val();
						var message = $('.block-error-info');
		
						$.ajax({
							 type: "POST",
							 url:"${basepath}/m/ext/enn/user/updateusername.json",
							 data:{'newUserName':username},
							 success: function(map) {
							$('#module-handling').remove();
							if(map.isSuccess){
								lightBlock.show("提交成功！");
								setTimeout("window.location.href = '${basepath}/m/ext/enn/logout.xhtml'",200 );
								
							}else{
								message.html(map.message);
								}
							}
						 });
                		
                    },
                    function(){
                    	lightDialog.remove();
                    });
			
            }
		function skip(){
			
			var	id= '${user.id}';		
			setCookie("skipset",id,1);//1为跳过设置

			window.location.href = "${basepath}/m/ext/enn/ask/index.xhtml";
		} 
		
        </script>
	</body>
</html>
		
				
     