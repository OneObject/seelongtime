<%@page import="org.apache.commons.lang.math.RandomUtils"%>
<%@ page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>

<!DOCTYPE html>
<html>
	<head>
		<title>我的信息</title>
		<style type="text/css">
			body {
				background: #eee;
			}
		</style>
	</head>
	<body class="bg-color-gray">
        <header>
            <span class="btn btn-left" id="btn-back">
                <i class="fa fa-angle-left"></i>
            </span>
            <div class="title title-2">
                我的信息
            </div>
        </header>
        <section class="wrapper-static margin-top-50" id="wrapper-static">
            <div class="module-edit-info">
                <ul>
                    <li onclick="changeAvatar('${user.id}');">
                        <label>头像</label>
                        <span><img src="${basepath}/user/avatar/${user.id}.xhtml?style=80x80&color=gray&v=<%=RandomUtils.nextInt() %>" /></span>
                    </li>
                    <li>
                        <label>账号</label>
                        <span>${user.username }</span>
                    </li>
                    <li>
                        <label>真实姓名</label>
                        <span>${user.name }</span>
                    </li>
                    <li>
                        <label>产业集团</label>
                        <span>${empty org.acronym ? org.name:org.acronym }</span>
                    </li>
                </ul>
            </div>

            <div class="block-eidt-password" onclick="updatepassword();">
                <span>修改密码</span>
            </div>
        </section>

        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.2.0.js"></script>

        <script type="text/javascript">
            $(function () {
                var $btnBack = $('#btn-back');

                $btnBack.bind('click', function () {
                	window.location.href="${basepath}/m/ext/enn/ask/index.xhtml#e";
                });

            });
            
            function changeAvatar(id){
            	window.location.href="${basepath}/m/ext/enn/user/changeAvatar.xhtml";
            }
            
            function updatepassword(){
            	window.location.href="${basepath}/m/ext/enn/user/editpassword.xhtml";
            }
            
        </script>
	</body>
</html>
