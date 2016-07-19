<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>活动详情</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" type="text/css"
	href="${basepath }/static/ixin/css/weixin-client-page.css">
	<link rel="stylesheet" type="text/css"
    href="${basepath }/static/public/easydialog-v2.0/easydialog.css">
     <script type="text/javascript" src="${basepath }/static/js/jquery-1.10.2.min.js"></script>
      <script type="text/javascript" src="${basepath }/static/public/easydialog-v2.0/easydialog.js"></script>
<style>

#nickname {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	max-width: 90%;
}

ol,ul {
	list-style-position: inside;
}
</style>
<style>
#activity-detail .page-content .text {
	font-size: 16px;
}
.btnGreen {
    font-size: 16px;
    text-align: center;
    text-align: center;
    text-align: center;
    text-decoration: none;
    text-decoration: none;
    text-decoration: none;
    cursor: pointer;
    cursor: pointer;
    cursor: pointer;
    overflow: visible;
    padding: 0 20px;
    height: 38px;
    line-height: 38px;
    border: 1px solid rgba(0, 0, 0, 0.6);
    border-radius: 5px;
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    border-radius: 5px;
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    box-shadow: 0 1px 0 0 rgba(255, 255, 255, 0.2) , inset 0 1px 1px 0 rgba(255, 255, 255, 0.25);
    -moz-box-shadow: 0 1px 0 0 rgba(255, 255, 255, 0.2) , inset 0 1px 1px 0 rgba(255, 255, 255, 0.25);
    -webkit-box-shadow: 0 1px 0 0 rgba(255, 255, 255, 0.2) , inset 0 1px 1px 0 rgba(255, 255, 255, 0.25);
    box-shadow: 0 1px 0 0 rgba(255, 255, 255, 0.2) , inset 0 1px 1px 0 rgba(255, 255, 255, 0.25);
    -moz-box-shadow: 0 1px 0 0 rgba(255, 255, 255, 0.2) , inset 0 1px 1px 0 rgba(255, 255, 255, 0.25);
    -webkit-box-shadow: 0 1px 0 0 rgba(255, 255, 255, 0.2) , inset 0 1px 1px 0 rgba(255, 255, 255, 0.25);
    -webkit-tap-highlight-color: rgba(255, 255, 255, 0);
    display: block;
    display: block;
    display: block;
    width: auto;
    width: auto;
    color: #FFF;
    color: #FFF;
    text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.5);
    text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.5);
    background-color: #21A52B;
    background-image: -moz-linear-gradient(top, #53c15c 0, #00920b 83%);
    background-image: -webkit-gradient(linear, 0 0, 0 83%, from(#53C15C), to(#00920B));
    background-image: -webkit-linear-gradient(top, #53C15C 0, #00920B 83%);
    background-image: -o-linear-gradient(top, #53c15c 0, #00920b 83%);
    background-image: linear-gradient(to bottom, #53C15C 0, #00920B 83%);
    background-color: #21A52B;
    background-image: -moz-linear-gradient(top, #53c15c 0, #00920b 83%);
    background-image: -webkit-gradient(linear, 0 0, 0 83%, from(#53C15C), to(#00920B));
    background-image: -webkit-linear-gradient(top, #53C15C 0, #00920B 83%);
    background-image: -o-linear-gradient(top, #53c15c 0, #00920b 83%);
    background-image: linear-gradient(to bottom, #53C15C 0, #00920B 83%);
}
.easyDialog_wrapper .btn_highlight{width: 100px;height:30px;margin-right: 100px;}
</style>
</head>
<body>
<body id="activity-detail">
	<div class="page-bizinfo">
		<div class="header">
			<h1 id="activity-name">${info.name }</h1>
			<p class="activity-info">
				<span id="post-date" class="activity-meta no-extra">
				<d:formatDate currentTime="${info.createDate }" format="yyyy-MM-dd HH:mm"/>
				</span>
				<span class="activity-meta">${info.sponsor }</span>
			</p>
		</div>
	</div>
	<div class="page-content">

		<div class="media" id="media">
			<img src="http://img0.aijiayou.com/${info.picUrl }">
		</div>

		<div class="text">
		<!-- 
		    <div class="baoming">
		        <span class="btnGreen" id="baoming" onclick="opendialog('报名')">我要报名</span>
		    </div> -->
		      <p><strong>培训班介绍</strong></p>
		      <p>
		      ${info.desc }
		      </p> 
		      <p><strong>培训时间</strong></p>
		      <p><d:formatDate currentTime="${info.startDate }" format="yyyy-MM-dd HH:mm"/>
		      ~
		      <d:formatDate currentTime="${info.endDate }" format="yyyy-MM-dd HH:mm"/>
		      </p>
		      <p><strong>日程安排</strong></p>
              <p>${info.content }</p>
              <p><strong>培训地点</strong></p>
              <p>${info.address }</p>
              <p>==================================</p>
               <p><strong>报名须知</strong></p>
              <p>${info.remark }</p>
		</div>
	</div>
	<script type="text/javascript" charset="utf-8">
	var btnFn = function(){
          if($(".baoming").children(".btnGreen").attr("id")== "qiandao"){
              $(".baoming").remove();
          }else{
              $("#baoming").remove();
              $(".baoming").html('<span class="btnGreen" id="qiandao" onclick="opendialog(\'签到\')">签到</span>');
          }
          easyDialog.close();
        };

    	function opendialog(text){
            easyDialog.open({
              container : {
                content : '<span style="text-algin: center;text-align: center;display: block;font-size: 24px;">'+text+'已成功</span>',
                yesFn : btnFn,
                noFn : false
              }
            });
    	}	
	</script>
</body>
</html>