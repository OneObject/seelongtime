<%@page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>二维码</title>
<style type="text/css">
#qrcode{
width: 595px;
height: 842px;
margin: 0px auto;
border: 1px solid #cccc;
text-align: center;
display: block;
overflow: hidden;
}
.innerbox{
width: 595px;
height:595px;
padding: 0px;
}
</style>
<script type="text/javascript" src ="${basepath }/iapp/static/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${basepath }/iapp/static/js/jquery.qrcode.big.js"></script>
<script type="text/javascript">
		$(document).ready(function(){
			var activityId="${activityId}";
			var base_root="${base_root}";
			var sign="${sign}";
			var domain="${domain}";
			console.log(base_root+"m/ixin/activity/signbycode.xhtml?activityId="+activityId+"&sign="+sign+"&fdomain="+domain);
			$('#qrcodeTable').qrcode({
				render	: "canvas",
				text	: base_root+"m/ixin/activity/signbycode.xhtml?activityId="+activityId+"&sign="+sign+"&fdomain="+domain
			});	
		});
	</script>
</head>
<body>
	<div id="qrcode">
		<h1>请扫码签到</h1>
		<div class="innerbox" id="qrcodeTable" style="width:595px;">
			
		</div>
	</div>
	
</body>
</html>
