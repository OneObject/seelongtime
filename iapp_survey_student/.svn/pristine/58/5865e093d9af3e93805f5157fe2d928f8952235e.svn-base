<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%response.setStatus(200);%>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>404页面</title>
    <style type="text/css">
    .error-container{
        width: 100%;
        margin: 0px auto;
        height: 600px;
        text-align: center;
    }
    .error-msg{
        font-size: 200px;
        color: #3498DB;
        font-family: "microsoft yahei";
        font-weight: bold;
    }
    .other-do{
        font-family: "microsoft yahei";
        font-size: 24px;;
        width: 100%;
        text-align: center;
        color: #999999;
    }
    </style>
    <script type="text/javascript" src="${basepath}/static/js/jquery-2.1.0.min.js"></script>
    <script type="text/javascript">
    $(function(){
    	var w = window.screen.availWidth ;
    	if(w < 700){
    		$("#gback").html("返回上一页 ");
    	}
    })
    
    	function backIndex(){
    		var w = window.screen.availWidth ;
    		if(w < 700){
    			window.history.go(-1);
    		}
    		else
        		{
	    			window.location.href="${basepath }";
        		}
    	}
    </script>

</head>
<body>
    <div class="error-container">
        <!--主要内容-->
        <span class="error-msg">
            404
        </span>
        <div class="other-do">
            <span>很抱歉！您访问的页面不存在。</span><br>
            <a href="javascript:backIndex();" style="color: #3498DB;text-decoration: none" id="gback">返回首页</a>
        </div>
    </div>
</body>
</html>