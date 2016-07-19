<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="com.longtime.ajy.session.SessionHelper"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%><%--需重再一次导入 --%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="menu_path" content="home"><%--当前菜单选中设置 --%>
		
 		<title>首页</title>
 				<style type="text/css">
 				ul,ol,dl{list-style:none;}
				#myBox{width:100%;min-width: 870px;}
				#myBox .banner{position:relative;width:100%;height:180px;background: url(${basepath}/static/mercer/img/banner.jpg) center center no-repeat;background-size:100% 100%;border-top-left-radius: 5px;border-top-right-radius: 5px;}
				#myBox .banner label{display:block;position:absolute;bottom:0px;left:0px;width:100%;box-sizing:border-box;height:68px;padding:0px 18px;margin:0;line-height:68px;white-space:nowrap;overflow: hidden;text-overflow: ellipsis;font-size:18px;color:#fff;}
 				#myBox .myContent{width:100%;box-sizing: border-box;border-left:1px solid #ccc;overflow: hidden;background:#eee;}
 				#myBox .rightBox{float:right;width:33%;position:relative;height:400px;}
 				#myBox .leftBox{float:left;width:67%;box-sizing: border-box;background: #fff;padding-bottom: 20px;}
 				#myBox .leftBox > p{padding:16px 14px 0px 14px;font-size:14px;line-height:22px;margin: 0;}
 				#myBox .leftBox > p span{color: #00b0d3;}
 				#myBox .links{margin-top:24px;}
 				#myBox .links .linkBox{display:inline-block;width:33%;border:3px solid #fff;box-sizing:border-box;background:#eee;float:left;position:relative;}
 				#myBox .links .linkBox h2{margin:0px;background-color:#3d4450;height:36px;line-height:36px;font-size:16px;font-family: "microsoft yahei";color:#fff;padding:0px 10px;box-sizing: border-box;}
 				#myBox .links .linkBox ul{width:100%;height:160px;overflow:hidden;background: #00a6c1;padding:8px 10px;margin:0px;box-sizing:border-box;color:#fff;color:#fff;}
 				#myBox .links .linkBox ul li{width:100%;padding:0px 6px 0px 24px;box-sizing: border-box;line-height: 24px;background: url(${basepath}/static/mercer/img/book.png) left 4px no-repeat;background-size:auto 16px;}
 				#myBox .links .linkBox ul li a{color:#fff;font-size:14px;line-height: 24px;}
 				#myBox .links .linkBox ul li a:hover{text-decoration: none;}
 				#myBox .links a img{width:100%;}
 				#myBox .links a label{display: inline-block;width:100%;box-sizing:border-box;padding:0px 10px;position:absolute;bottom:0px;left:0px;margin:0;height:32px;line-height:32px;background:#00b0d3;font-size:16px;color:#fff;}
 				#myBox .scroll{padding:20px 10px;box-sizing: border-box;width:100%;}
 				#myBox .scroll .ttl{padding:0 10px 0 35px;margin-bottom:0px;box-sizing: border-box;width:100%;color:#fff;font-size:14px;height:32px;line-height: 32px;border-top-left-radius: 5px;border-top-right-radius:5px;}
 				#myBox .scroll .ttl1{background:#00a6c1 url(${basepath}/static/mercer/img/gd.png) 8px center no-repeat;background-size:auto 14px;}
 				#myBox .scroll .ttl2{background:#00a6c1 url(${basepath}/static/mercer/img/kc.png) 8px center no-repeat;background-size:auto 14px;}
 				#myBox .scroll .list {padding:15px 0px;box-sizing: border-box;width:100%;height:196px;overflow:hidden;border:1px solid #00b0d3;background: #fff;border-bottom-left-radius: 5px;border-bottom-right-radius: 5px;}
 				#myBox .scroll .list ul{padding:0px;color:#666;margin:0;height:164px;overflow:hidden;}
 				#myBox .scroll .list ul li{padding:0px 24px;box-sizing:border-box;width:100%;font-size:14px;height:32px;line-height: 32px;position:relative;background: url(${basepath}/static/mercer/img/msgd.png) 8px center no-repeat;}
 				#myBox .scroll .list ul li a{display: inline-block;box-sizing:border-box;float:left;padding:0px 80px 0px 5px;box-sizing:border-box;color:#666;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
 				#myBox .scroll .list ul li span{display: inline-block;width:80px;box-sizing:border-box;text-align: right;position: absolute;right:24px;top:0px;}
 				#myBox .scroll .list2{border-bottom-left-radius: 0px;border-bottom-right-radius: 0px;border-bottom: none;}
 				#myBox .scroll .list2 ul li{background: url(${basepath}/static/mercer/img/mskc.png) 8px center no-repeat;}
 				#myBox .scroll .list2 ul li a{padding-right:140px;cursor:text;}
 				#myBox .scroll .list2 ul li a:hover{text-decoration: none;}
 				#myBox .scroll .list2 ul li span{display: inline-block;width:140px;box-sizing:border-box;text-align: right;position: absolute;right:24px;top:0px;}
 				#myBox .scroll .listFoot{background:#008075;height:38px;line-height: 38px;border-bottom-left-radius: 5px;border-bottom-right-radius: 5px;}
 				#myBox .scroll .listFoot a{display: block;width:240px;margin:0 auto;height:38px;line-height: 38px;color:#fff;font-size:14px;background:url(${basepath}/static/mercer/img/xz.png) 8px center no-repeat;background-size:auto 14px;padding-left:40px;}
 				#myBox .scroll .listFoot a:hover{text-decoration: none;}
 				#myBox .contact{width:100%;margin-top:30px;border-top:1px solid #ccc;box-sizing: border-box;padding:20px 18px;font-size:14px;}
 				#myBox .contact dt,#myBox .contact dd{margin-bottom:8px;}
 				#myBox .contact a{color:#00a6c1;text-decoration: underline;font-weight:400;}
				#myBox .contact a:hover{text-decoration: none;}
 		</style>
 		
        <script type="text/javascript">
        $(function(){
    		page();

    		
    	});
      /*
        $(function(){
            if($(window).width()/$(window).height() < 1.4){
                $(".contact").css({"position":"static","margin-top":"0px"});
                }
    		setTimeout(function(){
    			var w1 = $("#myBox .list li").width();
        		var h1 = $("#myBox .myContent").height();
        		$("#myBox .rightBox").height(h1);
        		$("#myBox .list li a").width(w1-90);
    		},100);
    		page();
    	});
		$(function(){
			var len =  $("#scrollList > li").length;
			if(len > 5){
		        var box=document.getElementById("scrollList"),can=true;
				box.innerHTML+=box.innerHTML;
				box.onmouseover=function(){can=false};
				box.onmouseout=function(){can=true};
				new function (){
				    var stop=box.scrollTop%32==0&&!can;
				    if(!stop)box.scrollTop==parseInt(box.scrollHeight/2)?box.scrollTop=0:box.scrollTop++;
				    setTimeout(arguments.callee,box.scrollTop%32?10:1500);
				};				
				}
		});
	*/
		function page(){
			$.ajax({
				type : "POST",
				url : "${basepath}/ext/resource/getresource.json",
				cache:false,
				data : {},
				success : function(data){
					for(var i = 0 ; i < data.length ; i++){
						var html = '<li title="'+data[i].title+'"><a href="${basepath }/'+data[i].path+'" target="download">'+data[i].title+'</a><span>'+data[i].releasetimestr+'</span></li>';
						$("#scrollList").append(html);
					}
					var len =  $("#scrollList > li").length;
					if(len > 5){
						var box=document.getElementById("scrollList"),can=true;
						box.innerHTML+=box.innerHTML;
						box.onmouseover=function(){can=false};
						box.onmouseout=function(){can=true};
						new function (){
						    var stop=box.scrollTop%32==0&&!can;
						    if(!stop)box.scrollTop==parseInt(box.scrollHeight/2)?box.scrollTop=0:box.scrollTop++;
						    setTimeout(arguments.callee,box.scrollTop%32?10:1500);
						};
						
					}

					var len2 =  $("#scrollList2 > li").length;
					if(len2 > 5){
						var box1=document.getElementById("scrollList2"),can=true;
						box1.innerHTML+=box1.innerHTML;
						box1.onmouseover=function(){can=false};
						box1.onmouseout=function(){can=true};
						new function (){
						    var stop=box1.scrollTop%32==0&&!can;
						    if(!stop)box1.scrollTop==parseInt(box1.scrollHeight/2)?box1.scrollTop=0:box1.scrollTop++;
						    setTimeout(arguments.callee,box.scrollTop%32?10:1500);
						};
					}

							
					var w1 = $("#myBox .list li").width();
	        		var h1 = $("#myBox .myContent").height();
	        		$("#myBox .rightBox").height(h1);
	        		$("#myBox .list li a").width(w1-90);
	        		$("#myBox .list2 li a").width(w1-150);
				}
			});
		}
        </script>
	</head>
	<body>
		<section class="main-home">
			<div id="myBox">
				<div class="banner">
					<label>美世学习与发展咨询业务  - 助力人力资源管理者和业务领导提升个人胜任能力和组织竞争力</label>
				</div>
				<div class="myContent">
					<div class="leftBox">
						<p>
							美世学习与发展咨询业务是中国地区最早开展人力资源管理和领导力公开课、集团客户学习与发展解决方案和体系化认证课程的专业机构。通过对美世的观点、方法论与咨询实践的有效结合，我们提供系统、完整的学习方案帮助人力资源管理者和业务经理提升他们个人胜任能力和组织竞争力。
						</p>
						<p>
							<span>美世在线课堂</span>是美世学习与发展咨询业务为客户提供的在线课程平台。我们提供六大系列的人力资源管理课程：
						</p>
						<div class="links">
							<div class="linkBox">
								<h2>业务伙伴 &nbsp;&nbsp;B</h2>
								<a class="a2" href="javascript:void(0);" style="cursor:text;"><img src="${basepath}/static/mercer/img/i1.jpg" /></a>
								<ul>
									<li><a href="javascript:void(0);" style="cursor:text;">B01&nbsp;业务伙伴第一课</a></li>
									<li><a href="javascript:void(0);" style="cursor:text;">B02&nbsp;提高员工敬业度与劳动生产率</a></li>
									<li><a href="javascript:void(0);" style="cursor:text;">B03&nbsp;制定有效的人力资源政策</a></li>
								</ul>
							</div>
							
							<div class="linkBox">
								<h2>薪酬与绩效 &nbsp;&nbsp;R</h2>
								<a class="a1" href="#"><img src="${basepath}/static/mercer/img/i4.jpg" /></a>
								<ul>
									<li><a href="${basepath}/study/detail.xhtml?cid=ff8080814a725674014ab2aca59f1056">R01&nbsp;绩效与薪酬管理基础</a></li>
									<li><a href="${basepath }/study/detail.xhtml?cid=ff8080814a725674014ab2a9fbb11042">R02&nbsp;优化福利</a></li>
									<li><a href="${basepath }/study/detail.xhtml?cid=ff8080814a725674014ab2abab54104a">R03&nbsp;销售激励方案设计</a></li>
									<li><a href="javascript:void(0);" style="cursor:text;">R04&nbsp;高管薪酬和长期激励基础</a></li>
								</ul>
							</div>
							
							
							<div class="linkBox">
								<h2>人才管理  &nbsp;&nbsp;T</h2>
								<a class="a3" href="javascript:void(0);" style="cursor:text;"><img src="${basepath}/static/mercer/img/i5.jpg" /></a>
								<ul>
									<li><a href="${basepath }/study/detail.xhtml?cid=ff8080814a725674014abe15eb8b11ea" >T01&nbsp;职业生涯管理</a></li>
									<li><a href="${basepath}/study/detail.xhtml?cid=ff8080814a725674014ab2ac5e321052" >T02&nbsp;培训设计与评估</a></li>
									<li><a href="javascript:void(0);" style="cursor:text;">T03&nbsp;人才管理基础</a></li>
								</ul>
							</div>
							
							<div class="linkBox">
								<h2>员工关系 &nbsp;&nbsp;E</h2>
								<a class="a4" href="javascript:void(0);" style="cursor:text;"><img src="${basepath}/static/mercer/img/i2.jpg" /></a>
								<ul>
									<li><a href="${basepath }/study/detail.xhtml?cid=ff8080814a725674014ab2acf2c0105a">E01&nbsp;劳动法律基础</a></li>
									<li><a href="${basepath }/study/detail.xhtml?cid=ff8080814a725674014ab2ad5808105e">E02&nbsp;劳动管理过程中的法律风险防范</a></li>
								</ul>
							</div>
							
							<div class="linkBox">
								<h2>组织发展与变革 &nbsp;&nbsp;O</h2>
								<a class="a5" href="javascript:void(0);" style="cursor:text;"><img src="${basepath}/static/mercer/img/i6.jpg" /></a>
								<ul>
									<li><a href="${basepath }/study/detail.xhtml?cid=ff8080814a725674014ab2ab57bd1046" >O01&nbsp;职位分析与职位描述</a></li>
									<li><a href="${basepath }/study/detail.xhtml?cid=ff8080814a725674014abe0f879311e6" >O02&nbsp;变革管理基础</a></li>
									<li><a href="javascript:void(0);" style="cursor:text;">O03&nbsp;组织设计</a></li>
									<li><a href="javascript:void(0);" style="cursor:text;">O04&nbsp;劳动力规划与组织业绩提升</a></li>
									<li><a href="${basepath }/study/detail.xhtml?cid=ff8080814a725674014ab2abfa08104e" >O05&nbsp;人力资源信息与技术</a></li>
								</ul>
							</div>
							
							<div class="linkBox">
								<h2>人才甄选 &nbsp;&nbsp;S</h2>
								<a class="a6" href="#"><img src="${basepath}/static/mercer/img/i3.jpg" /></a>
								<ul>
									<li><a href="javascript:void(0);" style="cursor:text;">S01&nbsp;招聘与EVP基础</a></li>
									<li><a href="javascript:void(0);" style="cursor:text;">S02&nbsp;招聘与入职管理</a></li>
									<li><a href="javascript:void(0);" style="cursor:text;">S03&nbsp;有效运用测评工具</a></li>
								</ul>
							</div>
							
							
							
							
							

						</div>
					</div>
					<div class="rightBox">
					<c:set var="time" value="<%=System.currentTimeMillis() %>"></c:set>
						<div class="scroll">
							<div class="ttl ttl1">美世观点</div>
							<div class="list">
								<ul id="scrollList">
								<%-- 
									<li><a href="javascript:void(0);">《人力资源流程：并购中的人才评估》 </a><span>${ltfun:dateLongToStringFormat(time,'yyyy.MM.dd') }</span></li>
									<li><a href="javascript:void(0);">《税收递延型养老福利调研报告》</a><span>${ltfun:dateLongToStringFormat(time,'yyyy.MM.dd') }</span></li>
									<li><a href="javascript:void(0);">《2014年销售团队整体报酬和激励计划调研报告》</a><span>${ltfun:dateLongToStringFormat(time,'yyyy.MM.dd') }</span></li>
									<li><a href="javascript:void(0);">《CFO的三大人才抓手》</a><span>${ltfun:dateLongToStringFormat(time,'yyyy.MM.dd') }</span></li>
									<li><a href="javascript:void(0);">《中国地区人才保留实践》</a><span>${ltfun:dateLongToStringFormat(time,'yyyy.MM.dd') }</span></li>
								--%>
								</ul>
							</div>
						</div>
						
							<div class="scroll">
							<div class="ttl ttl2">美世课程动态</div>
							<div class="list list2">
								<ul  id="scrollList2">
									<li title="能力模型建立和能力评估"><a href="javascript:void(0)">能力模型建立和能力评估</a><span>3月24日-25日  上海</span></li>
									<li title="绩效管理有效实践"><a href="javascript:void(0)">绩效管理有效实践</a><span>3月26日-27日 上海</span></li>
									<li title="非人力资源经理的人力资源管理"><a href="javascript:void(0)">非人力资源经理的人力资源管理</a><span>3月17日-18日 上海</span></li>
									<li title="培训培训师"><a href="javascript:void(0)">培训培训师</a><span>3月13日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 上海</span></li>
									<li title="3P薪酬管理"><a href="javascript:void(0)">3P薪酬管理</a><span>3月26日-27日 北京</span></li>
								</ul>
							</div>
							<div class="listFoot">
								<a target="_download" href="http://www.cn.mercer.com/content/dam/mercer/attachments/asia-pacific/asia/mercer-college/mercer-college-china-schedule-2015-13537-MC.pdf">下载2015公开课程排期表</a>
							</div>
						</div>
						
						<div class="contact">
							<dl>
								<dt>联系我们</dt>
								<dd>深圳：86-755 3332 4560 彭女士 </dd>
								<dd>上海：86-21&nbsp;&nbsp;&nbsp;6103 5486  邓女士</dd>
								<dd>邮箱：<a href="mailto:learning.china@mercer.com" target="_blank">learning.china@mercer.com</a></dd>
								<dd>官网：<a href="http://www.cn.mercer.com" target="_blank">www.cn.mercer.com</a></dd>
							</dl>
						</div>
					</div>
				</div>
			</div>
		</section>
	</body>
</html>
<content tag="extra_js">
<script type="text/javascript">
	function gotoCourseList(categoryid){
		window.location.href="${basepath}/study/list.xhtml?categoryid="+categoryid;		
	}
</script>
</content>
