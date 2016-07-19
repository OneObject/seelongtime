<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="com.longtime.ajy.session.SessionHelper"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%><%--需重再一次导入 --%>

<!DOCTYPE html>
<html><%-- <fmt:formatDate value="" pattern="yyyy-MM-dd"/> --%>
	<head>
	
		<meta name="menu_path" content="home">
		
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    	<meta name="apple-mobile-web-app-capable" content="yes" />
    	<meta name="apple-mobile-web-app-status-bar-style" content="black" />
    	<meta name="format-detection" content="telephone=no" />
 		<title>首页</title>
 		<style type="text/css">
 				ul,ol,dl{list-style:none;}
                div.clear{clear: both;}
				#myBox{width:100%;min-width: 870px;}
 				#myBox .myContent{width:100%;-webkit-box-sizing: border-box;-moz-box-sizing:border-box;box-sizing: border-box;border-left:1px solid #ccc;overflow: hidden;background:#eee;}
 				#myBox .rightBox{float:right;width:33%;position:relative;height:400px;}
 				#myBox .leftBox{float:left;width:67%;box-sizing: border-box;background: #fff;padding:0 10px 12px 0;}
 				#myBox .leftBox video{display: block;width: 100%;float:left;clear:both;}
 				#myBox .links{margin-top:5px;overflow: hidden;}
 				#myBox .links .linkBox{display:inline-block;width:33%;border:3px solid #fff;-webkit-box-sizing: border-box;-moz-box-sizing:border-box;box-sizing: border-box;background:#eee;float:left;position:relative;}
 				#myBox .links .linkBox h2{margin:0;color:#920c0c;height:36px;line-height:36px;font-size:16px;padding:0 0 0 36px;background:url(${basepath}/static/chtwm/images/list_icon.png) 4px center no-repeat;background-size:auto 28px;-webkit-box-sizing: border-box;-moz-box-sizing:border-box;box-sizing: border-box;}
                #myBox .links .linkBox h2 a{float:right;margin-top:2px;}
                #myBox .links .linkBox h2 img{float:right;}
                #myBox .links .linkBox ul{width:100%;height:160px;overflow:hidden;padding:8px 10px;margin:0;box-sizing:border-box;color:#fff;}
 				#myBox .links .linkBox ul li{width:100%;padding:0 6px 0 28px;box-sizing: border-box;line-height: 24px;background: url(${basepath}/static/chtwm/images/book.png) left 1px no-repeat;background-size:auto 22px;}
 				#myBox .links .linkBox ul li a{color:#666;font-size:14px;line-height: 24px;}
 				#myBox .links .linkBox ul li a:hover{text-decoration: underline;}
                #myBox .links .linkBox:nth-child(1){border-left:0;}
                #myBox .links .linkBox:nth-child(2){width:34%;}
                #myBox .links .linkBox:nth-child(3){border-right:0;}
                #myBox .links .linkBox:nth-child(4){border-left:0;clear: left;}
                #myBox .links .linkBox:nth-child(5){width:34%;}
 				#myBox .links a img{width:100%;}
 				#myBox .links a label{display: inline-block;width:100%;box-sizing:border-box;padding:0 10px;position:absolute;bottom:0;left:0;margin:0;height:32px;line-height:32px;background:#00b0d3;font-size:16px;color:#fff;}
 				#myBox .scroll{padding:14px 10px 0 10px;box-sizing: border-box;width:100%;}
 				#myBox .scroll .ttl{padding:0 10px 0 35px;margin-bottom:0;box-sizing: border-box;width:100%;color:#fff;font-size:14px;height:32px;line-height: 32px;border-top-left-radius: 5px;border-top-right-radius:5px;}
 				#myBox .scroll .ttl1{background:#8f0000 url(${basepath}/static/chtwm/images/r1.png) 3px center no-repeat;background-size:auto 26px;}
 				#myBox .scroll .ttl2{background:#8f0000 url(${basepath}/static/chtwm/images/r2.png) 3px center no-repeat;background-size:auto 26px;}
                #myBox .scroll .ttl3{background:#8f0000 url(${basepath}/static/chtwm/images/r3.png) 3px center no-repeat;background-size:auto 26px;}
                #myBox .scroll .ttl4{background:#8f0000 url(${basepath}/static/chtwm/images/r4.png) 3px center no-repeat;background-size:auto 26px;}
 				#myBox .scroll .list {padding:15px 0;box-sizing: border-box;width:100%;height:196px;overflow:hidden;border:1px solid #8f0000;background: #fff;border-bottom-left-radius: 5px;border-bottom-right-radius: 5px;}
 				#myBox .scroll .list ul{padding:0;color:#666;margin:0;height:164px;overflow:hidden;}
 				#myBox .scroll .list ul li{padding:0 24px;box-sizing:border-box;width:100%;font-size:14px;height:32px;line-height: 32px;position:relative;background: url(${basepath}/static/chtwm/images/msgd.png) 8px center no-repeat;}
 				#myBox .scroll .list ul li a{width:100%;display: inline-block;box-sizing:border-box;float:left;padding:0 80px 0 5px;color:#666;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
 				#myBox .scroll .list ul li span{display: inline-block;width:80px;box-sizing:border-box;text-align: right;position: absolute;right:24px;top:0;}
				#myBox .scroll .list2 ul li{padding:0 24px;box-sizing:border-box;width:100%;font-size:14px;height:32px;line-height: 32px;position:relative;background: url(${basepath}/static/chtwm/images/l2_icon.png) 4px center no-repeat;}
				#myBox .scroll .list3 ul li{padding:0 18px 0 24px;box-sizing:border-box;width:100%;font-size:14px;height:32px;line-height: 32px;position:relative;background: url(${basepath}/static/chtwm/images/l3_icon1.png) 4px center no-repeat;}
                #myBox .scroll .list3 ul li span{text-align: left;right:18px;}
                #myBox .scroll .list3 ul li span img{margin-right:4px;}
                #myBox .scroll .list4{position:relative;padding:15px 0;box-sizing: border-box;width:100%;overflow:hidden;border:1px solid #8f0000;background: #fff;border-bottom-left-radius: 5px;border-bottom-right-radius: 5px;}
                #myBox .scroll .list4 a{color:inherit;text-decoration: none;}
                #myBox .scroll .list4 a:hover{text-decoration: none;}
                #myBox .scroll .list4 img{display: block;width:108px;float:left;margin-left:12px;}
                #myBox .scroll .list4 ul{width:100%;box-sizing: border-box;padding:0 12px 0 132px;}
                #myBox .scroll .list4 ul li:nth-child(1){font-size:16px;line-height: 22px;}
                #myBox .scroll .list4 ul li:nth-child(2){font-size:14px;line-height: 20px;color:#999;}
                #myBox .scroll .list4 ul li:nth-child(3){font-size:14px;line-height: 20px;color:#999;}
                
                #myBox .leftBox .video-box{display: block;width: 100%;float:left;clear:both;padding-top:56.25%;position: relative;}
				#myBox .leftBox .video-box iframe{position: absolute;width:100%;height:100%;left:0;top:0;}
        </style>
	</head>
	<body>
		<section class="main-home">
			<div id="myBox">
				<div class="myContent">
					<div class="leftBox">
						

						<div class="video-box">
							<iframe src="${basepath}/widget/ivideoplayer.xhtml?vid=2dbe4d7e2e93c890732c80c0bea9eae0&cover=http%3A%2F%2Fwww.aijiayou.com%3A80%2Fstudent%2Fstatic%2Fchtwm%2Fimages%2Fposter2.jpg" frameborder="0" allowfullscreen="" height="200" width="100%"></iframe>
						</div>
						


                        <div class="clear"></div>
						<div class="links">
							<div class="linkBox">
								<h2>资本市场<a href="${basepath}/study/list.xhtml?categoryid=4f525641-4566-4a9b-9a0d-8bf2142fca62"><img src="${basepath}/static/chtwm/images/arrow.png" /></a></h2>
								<a class="a2" href="#"><img src="${basepath}/static/chtwm/images/i_1.jpg" /></a>
								<ul id="category1">
									
								</ul>
							</div>
							<div class="linkBox">
								<h2>产品培训<a href="${basepath}/study/list.xhtml?categoryid=3e20f458-72c3-4c9b-a1c6-204e0be1be2e"><img src="${basepath}/static/chtwm/images/arrow.png" /></a></h2>
								<a class="a4" href="#"><img src="${basepath}/static/chtwm/images/i_2.jpg" /></a>
								<ul id="category2">
									
								</ul>
							</div>
							<div class="linkBox">
								<h2>精品课程<a href="${basepath}/study/list.xhtml?categoryid=ed92da54-2f35-41a4-85f9-f24bef8bd9c2"><img src="${basepath}/static/chtwm/images/arrow.png" /></a></h2>
								<a class="a6" href="#"><img src="${basepath}/static/chtwm/images/i_3.jpg" /></a>
								<ul id="category3">
									
								</ul>
							</div>
							<div class="linkBox">
								<h2>新员工课程<a href="${basepath}/study/list.xhtml?categoryid=b13a3189-aaa6-46fb-a30e-fe3993478b9f"><img src="${basepath}/static/chtwm/images/arrow.png" /></a></h2>
								<a class="a1" href="#"><img src="${basepath}/static/chtwm/images/i_4.jpg" /></a>
								<ul id="category4"> 
								
								</ul>
							</div>
							
							<div class="linkBox">
								<h2>管理课程<a href="${basepath}/study/list.xhtml?categoryid=3c613029-081c-4049-a6ca-92d5fef36d40"><img src="${basepath}/static/chtwm/images/arrow.png" /></a></h2>
								<a class="a3" href="#"><img src="${basepath}/static/chtwm/images/i_5.jpg" /></a>
								<ul id="category5">
									
								</ul>
							</div>

						</div>
					</div>
					<div class="rightBox">
						<div class="scroll">
							<div class="ttl ttl1">课程排行</div>
							<div class="list">
								<ul  id="scrollList1">
																	
								</ul>
							</div>
						</div>
                        <div class="scroll">
                            <div class="ttl ttl2">阅读率排行</div>
                            <div class="list list2">
                                <ul  id="scrollList2">
                                
                                </ul>
                            </div>
                        </div>
                        <div class="scroll">
                            <div class="ttl ttl3">讲师排行</div>
                            <div class="list list3">
                                <ul  id="scrollList3">
                                    
                                    
                                </ul>
                            </div>
                        </div>
                        <div class="scroll">
                            <div class="ttl ttl4">讲师风采</div>
                                <div class="list4" style="padding:15px 12px !important;">
                                    <a href="#">
                                        <img src="${basepath}/static/chtwm/images/teacher_1.png" style="margin:0 8px 2px 0px !important;"/>
                                        <span style="font-size:14px;color:#999;line-height:20px;">方建奇先生，恒天财富副总裁，恒天商学院特级讲师。毕业于北京航空航天大学经济管理学院，工学学士、管理学硕士，拥有12年私人银行和财富管理机构运营经验。曾参与创立首批独立财富管理机构，参与筹建首批 银行系私人银行业务，并研发了国内首支私人银行专属产品。负责私人银行投资顾问业务期间，主持建立了动态资产配置体系。专注于高净值客户财富管理事业，并与欧洲、北美及香港同业密切合作。主讲课程：《资产配置》《私人银行业务》等。</span>
                                    </a>
                                </div>
                        </div>
					</div>
				</div>
			</div>
		</section>
	</body>
</html>
<content tag="extra_js">
<script type="text/javascript">
        $(function(){
    		page();

    		
    	});
		function page(){
			$.ajax({
				type : "POST",
				url : "${basepath}/study/top_praise_course.json",
				cache:false,
				data : {'top':'5'},
				success : function(data){
					var html = '';
					for(var i = 0 ; i < data.length; i++){
						html += '<li><a href="${basepath}/study/detail.xhtml?cid='+data[i].id+'">'+ data[i].name +'</a><span><img src="${basepath}/static/chtwm/images/l3_icon2.png" />'+ data[i].top +'</span></li>';
					}
					$('#scrollList3').append(html);
					
				}
			});
			
			$.ajax({
				type : "POST",
				url : "${basepath}/study/orgtolist.json",
				cache:false,
				data : {'top':'5'},
				success : function(data){
					var html = '';
					for(var i = 0 ; i < data.length; i++){
						html += '<li><a href="javascript:void(0)" style="cursor:text;text-decoration:none;">'+ data[i].orgname +'</a><span>'+ data[i].percent +'</span></li>';
					}
					$('#scrollList2').append(html);
				}
			});
			
			$.ajax({
				type : "POST",
				url : "${basepath}/study/courseRand.json",
				cache:false,
				data : {'top':'5'},
				success : function(data){
					var html = '';
					for(var i = 0 ; i < data.length; i++){
						html += '<li><a href="${basepath}/study/detail.xhtml?cid='+data[i].id+'">'+data[i].name+'</a><span>'+data[i].sum+'</span></li>';
					}
					$('#scrollList1').append(html);
					
				}
			});

			$.ajax({
				type : "POST",
				url : "${basepath}/study/course.json",
				cache:false,
				data : {'top':'5','cid':'4f525641-4566-4a9b-9a0d-8bf2142fca62'},
				success : function(data){
					var html = '';
					for(var i = 0 ; i < data.length; i++){
						html += '<li><a href="${basepath}/study/detail.xhtml?cid='+data[i].id+'">'+data[i].name+'</a></li>';
					}
					$('#category1').append(html);
					
				}
			});
			
			$.ajax({
				type : "POST",
				url : "${basepath}/study/course.json",
				cache:false,
				data : {'top':'5','cid':'3e20f458-72c3-4c9b-a1c6-204e0be1be2e'},
				success : function(data){
					var html = '';
					for(var i = 0 ; i < data.length; i++){
						html += '<li><a href="${basepath}/study/detail.xhtml?cid='+data[i].id+'">'+data[i].name+'</a></li>';
					}
					$('#category2').append(html);
					
				}
			});
			
			$.ajax({
				type : "POST",
				url : "${basepath}/study/course.json",
				cache:false,
				data : {'top':'5','cid':'ed92da54-2f35-41a4-85f9-f24bef8bd9c2'},
				success : function(data){
					var html = '';
					for(var i = 0 ; i < data.length; i++){
						html += '<li><a href="${basepath}/study/detail.xhtml?cid='+data[i].id+'">'+data[i].name+'</a></li>';
					}
					$('#category3').append(html);
					
				}
			});
			
			$.ajax({
				type : "POST",
				url : "${basepath}/study/course.json",
				cache:false,
				data : {'top':'5','cid':'b13a3189-aaa6-46fb-a30e-fe3993478b9f'},
				success : function(data){
					var html = '';
					for(var i = 0 ; i < data.length; i++){
						html += '<li><a href="${basepath}/study/detail.xhtml?cid='+data[i].id+'">'+data[i].name+'</a></li>';
					}
					$('#category4').append(html);
					
				}
			});
			
			$.ajax({
				type : "POST",
				url : "${basepath}/study/course.json",
				cache:false,
				data : {'top':'5','cid':'3c613029-081c-4049-a6ca-92d5fef36d40'},
				success : function(data){
					var html = '';
					for(var i = 0 ; i < data.length; i++){
						html += '<li><a href="${basepath}/study/detail.xhtml?cid='+data[i].id+'">'+data[i].name+'</a></li>';
					}
					$('#category5').append(html);
					
				}
			});
			
			
		}
        </script>
</content>