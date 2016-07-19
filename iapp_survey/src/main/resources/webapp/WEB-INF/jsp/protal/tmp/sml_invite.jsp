<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
    <head>
        <title>weiixn</title>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
        <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="format-detection" content="telephone=no">
        <link rel="stylesheet" type="text/css" href="${basepath }/static/ixin/css/weixin-client-page.css">
        <link rel="stylesheet" type="text/css" href="${basepath }/static/public/easydialog-v2.0/easydialog.css">
        <link href="http://cdn.bootcss.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet">
        <script type="text/javascript" src="${basepath }/static/ixin/js/weixin-wxa-1.0.0.js"></script>
        <script type="text/javascript" src="${basepath }/static/ixin/js/jquery-1.10.2.min.js"></script>
        <script type="text/javascript" src="${basepath }/static/public/easydialog-v2.0/easydialog.min.js"></script>
        <style>
            #nickname {
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
                max-width: 90%;
            }
            ol, ul {
                list-style-position: inside;
            }
        </style>
        <style>
            #activity-detail .page-content .text {
                font-size: 16px;
            }
        </style>
    </head>
    <body>
    <body id="activity-detail">
        <div class="page-content">
            <div class="media" id="media">
                <img alt="" src="http://img02.taobaocdn.com/imgextra/i2/679214160/T2JrVFXDhaXXXXXXXX-679214160.png">
            </div>
            <div class="text">
				<p><strong>培训班介绍</strong></p>
				<p>本期SML沙龙探讨的主题是微信时代的企业学习，大家一起交流在社会化新媒体时代，如何结合新的工具开展企业培训。</p>
<p><strong>培训时间</strong></p>
<p>2014-02-27 13:50 ~ 2014-02-27 17:00</p>
<p><strong>活动出席嘉宾</strong></p>
<p>韩玉华&nbsp;&nbsp;&nbsp;&nbsp;上海聚劲传媒  CEO</p>
<p>陶华&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;GE医疗集团客户教育  首席顾问</p>
<p><strong>沙龙流程</strong></p>
<p>13:30-14:00 签到</p> 
<p>14:00-14:05 欢迎致辞 </p>
<p>14:05-14:55 移动互联网思维</p> 
<p>15:55-15:30 微信与企业学习 </p>
<p>15:35-15:50 茶歇 </p>
<p>15:50-16:30 微信营销逆袭企业培训</p> 
<p>16:30-16:50 GE的社会化学习之路 </p>
<p>16:50-17:00 发布下次沙龙主题&时间</p>
<p><strong>已报名企业</strong></p>
<p>安利、复星保德信、招商银行、交通银行、汇金百货、SGS、阿里巴巴、思科、宝钢、欧莱雅、春秋航空、NU SKIN、携程、CIC、红星美凯龙、罗莱家纺、圆通物流、技美电子、瑞拓电气、金宝肾、乐巢家居、松岩机电、学尔森教育。</p>
<p><strong>培训地点</strong></p>
<p>上海市黄浦区延安东路433号（黄浦区延安东路433号）</p>
				<span id="baomingbtn" class="btn btn-block btn-success btn-lg" onclick="openinput()">我要报名</span>
		</div>
        </div>
        <script type="text/javascript">
        function openinput(){
        	var html = [];
        	html.push('<div style="width:80%;background-color:#fff;">');
        	html.push('<lable>姓名：</lable>');
        	html.push('<input type="text" style="max-width:400px;min-width:320px;" class="form-control" id="name">');
        	html.push('<lable>电话：</lable>');
        	html.push('<input type="number" style="max-width:400px;min-width:320px;" class="form-control" id="phone"> ');
        	html.push('<lable>单位：</lable>');
        	html.push('<input type="text" style="max-width:400px;min-width:320px;" class="form-control" id="org">');
        	html.push('<span style="max-width:400px;min-width:320px;" class="btn btn-block btn-success btn-lg" onclick="submitfn()">提交</span>');
        	html.push('</div>');
        	easyDialog.open({
        		container:{
        			header:'输入报名信息',
        			 content:html.join('')
        		}
        	});
        }
        function submitfn(){
        	if($("#name").val()==""){
        		alert("请输入姓名");
        	}else if($("#phone").val()==""){
        		alert("请输入电话");
        	}else if($("#org").val()==""){
        		alert("请输入单位");
        	}else{
        		other();
        	}
        }
        
        function other(){
        	easyDialog.close();
        	easyDialog.open({
        		container:{
        			header:'报名成功',
        			content:'<span style="max-width:400px;min-width:320px;display:block;font-size:16px;text-align:center;">报名成功！请按时参加！</span>'
        		},
        		autoClose : 2000
        	});
        	changemsg();
        }
        /*改变页面上的信息*/
        function changemsg(){
        	$("#baomingbtn").remove();
        	$(".text").append('<div class="alert alert-success"><h3>已成功报名，请按时参加。</h3></div>')
        }
        </script>
    </body>
</html>
