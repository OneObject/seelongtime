<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>签到提示</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no"/>
    <style type="text/css">
        html,body{
            margin: 0px;padding: 0px;
        }
        *{
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
        }
        .container{
            max-width: 760px;
            margin: 0px auto;
            position: absolute;
            width: 100%;
            height: 100%;
            padding: 8px;
        }
        .choosestate{
            color: #3A87AD;
            background-color: #D9EDF7;
            border: 1px solid #BCE8F1;
            font-size: 14px;
            padding: 10px 8px;
            border-radius: 5px;
            line-height: 28px;
        }
        .tiaozhuan{
            color: #529bea;
            display: block;
            text-align: center;
            line-height: 50px;
            padding-right: 20px;
        }
        .tiaozhuan a{text-decoration: none;color: #529bea}
    </style>
    <script type="text/javascript">
  var i=1;
  setInterval(jishi,1000);
  setTimeout(todetail,3000); 
  function todetail(){
	    $("#jishi").html(0);
	    var style="${style}";
	    if(style=="series" || style=="stemp"){
		    //window.location.href="${basepath}/m/ixin/activity/seriesdetail.xhtml?id=${id}&qcorder=true";
		   // window.location.href="${basepath}/m/h5/activity/seriesdetail.xhtml?id=${id}&qcorder=true";
	    	window.top.location.href="${basepath}/m/h5/activity/seriesdetail.xhtml?id=${id}&qcorder=true";
			return;
		    }else{
	    window.location.href="${basepath}/m/ixin/activity/detaildispatch.xhtml?id=${id}&qcorder=true";
		    }
	  }
  function jishi(){
	  $("#jishi").html(i);
	  if(i>0){
	  i--;
	  }
	  }
</script>
</head>
<body>
    <div class="container">
        <div class="choosestate">
          ${map.msg}(页面将在<span id="jishi">2</span>秒后自动跳转)
        </div>
       <span class="tiaozhuan"><a href="#" onclick="todetail();">跳转到详情</a></span> 
    </div>
</body>

</html>