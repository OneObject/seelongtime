 <%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp" %>
<%@include file="/WEB-INF/jsp/include/admin/script.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>龙泰信息技术-iApp</title>

<link href="${basepath}/static/dwz/themes/default/style.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="${basepath}/static/dwz/themes/css/core.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="${basepath}/static/dwz/themes/css/print.css" rel="stylesheet" type="text/css" media="print"/>
<link href="${basepath}/static/dwz/uploadify/css/uploadify.css" rel="stylesheet" type="text/css" media="screen"/>
<!--[if IE]>
<link href="themes/css/ieHack.css" rel="stylesheet" type="text/css" media="screen"/>
<![endif]-->


<script type="text/javascript">
$(function(){
	DWZ.init("${basepath}/static/dwz/dwz.frag.xml", {
		loginUrl:"login_dialog.html", loginTitle:"登录",	// 弹出登录对话框
//		loginUrl:"login.html",	// 跳到登录页面
		statusCode:{ok:200, error:300, timeout:301}, //【可选】
		pageInfo:{pageNum:"pageNum", numPerPage:"numPerPage", orderField:"orderField", orderDirection:"orderDirection"}, //【可选】
		debug:false,	// 调试模式 【true|false】
		callback:function(){
			initEnv();
			$("#themeList").theme({themeBase:"${basepath}/static/dwz/themes"}); // themeBase 相对于index页面的主题base路径
		}
	});
});

</script>
</head>

<body scroll="no">
	<div id="layout">
		<div id="header">
			<div class="headerNav">
				<span class="logo" >标志</span>
				<ul class="nav">
					<li id="switchEnvBox"><a href="javascript:">（<span>上海</span>）切换城市</a>
						<ul>
							<li><a href="sidebar_1.html">北京</a></li>
							<li><a href="sidebar_2.html">上海</a></li>
							<li><a href="sidebar_2.html">南京</a></li>
							<li><a href="sidebar_2.html">深圳</a></li>
							<li><a href="sidebar_2.html">广州</a></li>
							<li><a href="sidebar_2.html">天津</a></li>
							<li><a href="sidebar_2.html">杭州</a></li>
						</ul>
					</li>
					<li><a href="changepwd.html" target="dialog" width="600">设置</a></li>
					<li><a href="login.html">退出</a></li>
				</ul>
				<ul class="themeList" id="themeList">
					<li theme="default"><div class="selected">蓝色</div></li>
					<!-- <li theme="green"><div>绿色</div></li>
					<li theme="purple"><div>紫色</div></li> -->
					<li theme="silver"><div>银色</div></li>
					<li theme="azure"><div>天蓝</div></li>
				</ul>
			</div>

			<!-- navMenu -->
			
		</div>

		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse"><div></div></div>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse"><h2>主菜单</h2><div>收缩</div></div>

				<div class="accordion" fillSpace="sidebar">
					
					<!-- 模块  -->
					<%-- <div class="accordionHeader">
						<h2><span>Folder</span>用户管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<li><a href="${basepath }/user/admin/doupload.xhtml" target="navTab" rel="doupload" external="true">上传</a></li>
							<li><a href="${basepath }/user/list.xhtml?form=list" target="navTab" rel="list_upload">已上传</a></li>
							<li><a href="${basepath }/user/list.xhtml?form=video_production" target="navTab" rel="video_production">视频制作</a></li>
							<li><a href="${basepath }/live/liveList.xhtml" target="navTab" rel="live_list" title="直播管理列表">直播</a></li>
							<li><a href="${basepath }/mobile/versionList.xhtml" target="navTab" rel="version_list" title="移动端版本管理">移动端版本管理</a></li>
						</ul>
					</div> --%>
					
					<!-- 模块  -->
					<div class="accordionHeader">
						<h2><span>Folder</span>ivideo</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<li><a href="${basepath }/ivideo/admin/doupload.xhtml" target="navTab" rel="doupload" external="true">上传</a></li>
							<li><a href="${basepath }/ivideo/list.xhtml?form=list" target="navTab" rel="list_upload">已上传</a></li>
							<li><a href="${basepath }/ivideo/list.xhtml?form=video_production" target="navTab" rel="video_production">视频制作</a></li>
							<li><a href="${basepath }/live/liveList.xhtml" target="navTab" rel="live_list" title="直播管理列表">直播</a></li>
							<li><a href="${basepath }/mobile/versionList.xhtml" target="navTab" rel="version_list" title="移动端版本管理">移动端版本管理</a></li>
						</ul>
					</div>
					
					<!-- 模块  -->
					<div class="accordionHeader">
						<h2><span>Folder</span>考试管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<li><a href="${basepath }/itemblank/list.xhtml" target="navTab" rel="itemblank_index">题库管理</a></li>
							<li><a href="${basepath }/testquestion/list.xhtml" target="navTab" rel="testQuestion_index">试题管理</a></li>
							<li><a href="${basepath }/testpaper/list.xhtml" target="navTab" rel="testPaper_index">试卷管理</a></li>
							<li><a href="${basepath }/examination/list.xhtml" target="navTab" rel="examination_index">考试管理</a></li>
							
					
							<!-- <li><a href="javascript:;" target="navTab">考试管理</a>
								<ul>
									<li><a href="main.html" target="navTab" rel="main">我的主页</a></li> 
									<li><a href="http://www.baidu.com" target="navTab" rel="page1">页面一(外部页面)</a></li>
									
								</ul>
							</li> -->
						</ul>
					</div>
					
					
					<!-- 模块  -->
					<div class="accordionHeader">
						<h2><span>Folder</span>消息管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<li><a href="${basepath }/remind/list.xhtml" target="navTab" rel="remind_list" >消息列表</a></li>
						</ul>
					</div>
					
					
					<!-- 模块  
					<div class="accordionHeader">
						<h2><span>Folder</span>系统管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder treeCheck">
							<li><a href="demo_page1.html" target="navTab" rel="demo_page1">查询我的客户</a></li>
							<li><a href="demo_page5.html" target="navTab" rel="demo_page5">有文本输入的表单</a></li>
							<li><a href="javascript:;">选项卡和图形的页面</a>
								<ul>
									<li><a href="javascript:;">页面一</a></li>
									<li><a href="javascript:;">页面二</a></li>
								</ul>
							</li>
						</ul>
					</div>
					
					-->
				</div>
			</div>
		</div>
		
		
		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab">
							<li tabid="main" class="main"><a href="javascript:;"><span><span class="home_icon">我的主页</span></span></a></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div><!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
					<div class="tabsRight">right</div><!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
					<li><a href="javascript:;">我的主页</a></li>
				</ul>
				<div class="navTab-panel tabsPageContent layoutBox">
					<div class="page unitBox">
						<div class="accountInfo">
						<h2 style="margin: 20px 20px;">龙泰信息技术</h2>
							<!-- <div class="alertInfo">
								<h2><a href="doc/dwz-user-guide.pdf" target="_blank">DWZ框架使用手册(PDF)</a></h2>
								<a href="doc/dwz-user-guide.swf" target="_blank">DWZ框架演示视频</a>
							</div>
							<div class="right">
								<p><a href="doc/dwz-user-guide.zip" target="_blank" style="line-height:19px">DWZ框架使用手册(CHM)</a></p>
								<p><a href="doc/dwz-ajax-develop.swf" target="_blank" style="line-height:19px">DWZ框架Ajax开发视频教材</a></p>
							</div>
							<p><span>DWZ富客户端框架</span></p>
							<p>DWZ官方微博:<a href="http://weibo.com/dwzui" target="_blank">http://weibo.com/dwzui</a></p>
						 --></div>
						<div class="pageFormContent" layoutH="80" style="margin-right:230px">
							<!-- 
							<p style="color:red">DWZ官方微博 <a href="http://weibo.com/dwzui" target="_blank">http://weibo.com/dwzui</a></p>
							<p style="color:red">DWZ官方微群 <a href="http://q.weibo.com/587328/invitation=11TGXSt-148c2" target="_blank">http://q.weibo.com/587328/invitation=11TGXSt-148c2</a></p>

<div class="divider"></div>
<h2>dwz v1.2视频教程:</h2>
<p><a href="http://www.u-training.com/thread-57-1-1.html" target="_blank">http://www.u-training.com/thread-57-1-1.html</a></p>

<div class="divider"></div>
<h2>DWZ系列开源项目:</h2>
<div class="unit"><a href="http://code.google.com/p/dwz/" target="_blank">dwz富客户端框架 - jUI</a></div>
<div class="unit"><a href="http://code.google.com/p/dwz4j" target="_blank">dwz4j(Java Web)快速开发框架 + jUI整合应用</a></div>

<div class="divider"></div>
<h2>常见问题及解决:</h2>
<pre style="margin:5px;line-height:1.4em">
Error loading XML document: dwz.frag.xml
直接用IE打开index.html弹出一个对话框：Error loading XML document: dwz.frag.xml
原因：没有加载成功dwz.frag.xml。IE ajax laod本地文件有限制, 是ie安全级别的问题, 不是框架的问题。
解决方法：部署到apache 等 Web容器下。
</pre>

<div class="divider"></div>
</pre> -->
						</div>
						
					
					</div>
					
				</div>
			</div>
		</div>

	</div>

	<div id="footer">Copyright &copy; 2013 <a href="www.longtimeit.com" target="dialog">LT</a></div>

<!-- 注意此处js代码用于google站点统计-->
<script type="text/javascript">

</script>

</body>
</html>