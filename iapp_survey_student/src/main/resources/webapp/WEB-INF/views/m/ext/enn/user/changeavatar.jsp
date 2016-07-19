<%@page import="org.apache.commons.lang.math.RandomUtils"%>
<%@page import="org.apache.commons.lang3.RandomStringUtils"%>
<%@ page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>

<!DOCTYPE html>
<html>
	<head>
		<title>修改头像</title>
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
            <span class="btn btn-right" id="btn-save">
                保存
            </span>
            <div class="title title-2">
                修改头像
            </div>
        </header>
        <section class="wrapper-static margin-top-50 module-login module-login2"  id="module-login">
            <div class="block-image block-image2" id="block-image">
                <div class="image-header" id="image-header">

                    <div class="icon-uploaded-box">
                        <img src="${basepath}/user/avatar/${user.id}.xhtml?style=180x180&color=gray&v=<%=RandomUtils.nextInt()%>">
                    </div>
                    
                </div>
                <div class="image-footer">
                    更换头像
                </div>
            </div>
        </section>


        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.2.0.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/plupload/plupload.full.min.js"></script>

        <script type="text/javascript">
            var $imageHeader;
            var saveHash;
            $(function () {
                $imageHeader = $('#image-header');
                var $btnBack = $('#btn-back');
                var $btnSave = $('#btn-save');


                $btnBack.bind('click', function () {
                	window.history.go(-1);
    	            //window.location.href="${basepath}/m/ext/enn/ask/index.xhtml#e";
                });

                $btnSave.bind('click', function () {
					
                	$.ajax({
    	                type: "POST",
    	                url:"${basepath}/m/ext/enn/updateavatar.json",
    	                data:{'avatar':saveHash},
    	                error: function(data) {
    	                },
    	                success: function(data) {
                    		//$imageHeader.html('<div class="icon-uploaded-box"  id="icon-uploaded-box"><img src="'+ url +'-80x80" /></div>');
    	                	window.location.href="${basepath}/m/ext/enn/user/center.xhtml";
    	                	 //window.history.go(-1);
    	                }
    	            });
                	
                });


            });

            uploadImage.createUploader(document.getElementById('block-image'), document.getElementById('module-login'),  '<%=Constant.QINIU_SERVER%>', '${token}', '<%=Constant.IMG_SERVER_DOWNLOAD%>', {
            	container: document.getElementById('image-header')
                });
            
            
            function insertImage(url, hash) {
                if (!url) {
                    return;
                }
                saveHash = hash;
                $imageHeader.html('<div class="icon-uploaded-box"  id="icon-uploaded-box"><img src="'+ url +'-180x180" /></div>');
                
            }
        </script>
	</body>
</html>
