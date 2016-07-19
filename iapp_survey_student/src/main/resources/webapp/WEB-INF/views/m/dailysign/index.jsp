<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>每日签到</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link href="${basepath}/static/m/main.css" rel="stylesheet">
    <script type="text/javascript" src="${basepath}/static/js/jquery-2.1.0.min.js"></script>
    <link rel="stylesheet" href="${basepath }/static/css/easydialog.css">
    <script type="text/javascript" src="${basepath }/static/js/easydialog.js"></script>
    
<script type="text/javascript">
var showcredit = "${showcredit}";//是否显示积分
    function changeblue(){
        $(".sign-btn").css("background-color","#4a90e2");
        $(".sign-btn").css("color","#ffffff");
        $(".sign-btn").css("background-clip","padding-box");
        $(".sign-btn").find("img").attr("src",basepath+"/static/m/img/btnp.png");
    }
    function changewhite(){
       $(".sign-btn").css("background-color","#fff");
        $(".sign-btn").css("color","#4a90e2");
        $(".sign-btn").find("img").attr("src",basepath+"/static/m/img/btnu.png");
    }
    function qiandao(){
        $(".sign-btn").find("span").html("签到中...");
        $(".sign-btn").attr("onclick","");
    	$.ajax({
    		type:"POST",
    		url : basepath+"/m/dailysign/sign.json",
    		success:function(data){
    			if(data.rs == "fail"){
    				if(data.msg == "unlogin"){
    					showMsgDialog("您还未登录，请登录后操作！");
    				} else if(data.msg == "user"){
    					showMsgDialog("当前用户已不存在，请确认后操作！");
    				} else {
    					
    				}
    			} else if(data.rs == "success"){
        			var html = "签到成功";
					if(showcredit == "true"){//显示积分
						html += ",积分 + "+data.msg;
					}
	    				$("#tishi").html(html);
					$("#tishi").animate({
			            opacity:1
			        },500);
			        hidecorse(data.msg);
    			}
    		},
    		error:function(data){
    			showMsgDialog("系统错误，请刷新后尝试！");
    		}
    	});
    }
    
    function showMsgDialog(content){
    	easyDialog.open({
	        container : {
	            content : '<div style="background-color: #ffffff;width:260px;height:40px;text-align:center;">'+content+'</div>',
	            yesFn : function(){return true;}
	        }
	    });
    }
    
    function hidecorse(credit){
        $(".riliicon").attr("src",basepath+"/static/m/img/signover.png");
        $(".sign-btn").hide();
        var html = "<span>今日已签到</span>";
    	if(showcredit == "true"){//显示积分
        	html += "<br><span>获得积分"+credit+"分</span>"; 
    	}
        $("#fontbox").html(html);
        setTimeout(function(){
            $("#tishi").animate({
                opacity:0
            },500);
        },100);
    }
</script>
</head>
<body>
    <div class="todosign">
        <div class = "arow">
            <img src="${basepath }/static/m/img/${isSign ? 'signover' : 'nosign' }.png" class="riliicon">
            <p class="fontstyle" id="fontbox">
            	<c:if test="${isSign }">
            		<span>今日已签到</span><br><span>请明天再来</span>
            	</c:if>
            	<c:if test="${!isSign }">
	                <span>今日尚未签到</span><br>
	                <!-- <span>立即签到获得积分！</span> -->
                </c:if>
            </p>
        </div>
        <div class="arow mt30">
            <p class="sign-btn" style="${isSign ? 'display:none;' : ''}" ontouchstart="changeblue()"  ontouchend = "changewhite()" onclick="qiandao();">
                <img src="${basepath}/static/m/img/btnu.png"><span>签到</span>
            </p>
        </div>
    </div>
    <input type="hidden" id="uid" value="uid"/>
    <div class="hestory">

    </div>
    <span id="tishi"></span>
</body>
</html>
