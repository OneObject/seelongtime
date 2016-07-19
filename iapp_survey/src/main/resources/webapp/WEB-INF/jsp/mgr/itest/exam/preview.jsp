<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<%@page language="java" import="com.longtime.app.config.Constants"%>
<!DOCTYPE html>
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>考试预览</title>
<meta charset="UTF-8">
<meta name="menu_path" content="test.testManage" />
    <link rel="stylesheet" href="${basepath}/static/plugins/fonticon/css/font-awesome.css">
    <link rel="stylesheet" href="${basepath}/static/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${basepath}/static/public/easydialog-v2.0/easydialog.css">
</head>
<body>
<div id="phone-preview">
    <span onclick="easyDialog.close()" style="width: 30px;height: 30px;background-color: #999999;color: #ffffff;display: block;line-height: 30px;text-align: center;border-radius: 50%;position: absolute;margin-left: 240px;cursor: pointer;">
        <i class="fa fa-times"></i>
    </span>
    <table>
        <tr>
            <td colspan="3">
                <img src="img/iphone-top.png" style="width: 264px;">
            </td>
        </tr>
        <tr>
            <td style="width: 24px;height: 357px;"><img src="img/iphone-left.png" style="width: 24px;height: 357px;"></td>
            <td style="width: 218px;height: 357px;display: block;overflow: hidden">
                <iframe style="width: 218px;height:357px;border: none " src="http://sallon89.com">

                </iframe>
            </td>
            <td style="width: 20px;height: 357px;"><img src="img/iphone-right.png" style="width: 20px;height: 357px;"></td>
        </tr>
        <tr>
            <td colspan="3"><img src="img/iphone-bottom.png" style="width: 264px;height: 80px;"></td>
        </tr>
    </table>
</div>
<script type="text/javascript" src="${basepath}/static/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${basepath}/static/plugins/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="${basepath}/static/public/easydialog-v2.0/easydialog.js"></script>
<script type="text/javascript" >
    function phonepreview(){
        easyDialog.open({
            container :"phone-preview"
        });
    }
    
</script>
</body>
</html>