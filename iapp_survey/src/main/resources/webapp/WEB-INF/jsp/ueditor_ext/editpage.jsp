<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.longtime.app.config.Constants"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
var pa = "${basepath}"; 
</script> 
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8"
	src="${basepath }/static/ixin/plugin/ueditor1_4_3-utf8-jsp/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${basepath }/static/ixin/plugin/ueditor1_4_3-utf8-jsp/ueditor.all.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${basepath }/static/ixin/plugin/ueditor1_4_3-utf8-jsp/third-party/video-lt/videoDialog.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${basepath }/static/ixin/plugin/ueditor1_4_3-utf8-jsp/third-party/document-lt/documentDialog.js"></script>
<title>完整demo</title>
</head>
<body>

	<div>
		<br> <br> <br> <br> <br> <br>
		<h1>完整demo</h1>
		<br> <br> <br> <br> <br> <br> 
			<input type="hidden" id="videourl" value=""> 
			<input type="hidden" id="posterurl" value=""> 
			<input type="hidden" id="pagenum"	value=""> 
			<input type="hidden" id="docpath" value="">
			<input type="hidden" id="docid" value="">
			<input type="hidden" id="imgtype" value="">
		
		 <textarea id="editor"> 
		 	<p><script type="text/javascript">
			  	window.onerror = function(evt) { console.log(evt);return true;}  
	 			window.preViewImg = (function() {	var imgsSrc = {};	function reviewImage(dsrc, gid) { if (typeof window.WeixinJSBridge != 'undefined') { WeixinJSBridge.invoke('imagePreview', {	'current' : dsrc,'urls' : imgsSrc[gid]});} else {alert("请在微信中查看", null, function() {});}}	function init(thi, evt) {var dsrc = thi.getAttribute('data-src'); var gid = thi.getAttribute('data-gid');	if (dsrc && gid) {imgsSrc[gid] = imgsSrc[gid] || []; imgsSrc[gid].push(dsrc); thi.addEventListener('click', function() {	reviewImage(dsrc, gid);	}, false);}}return init;})();
 			</script></p>
		</textarea>
		
	<!-- <script id="editor" type="text/plain"	style="width: 1024px; height: 500px;"></script> -->
	
	</div>

	<script type="text/javascript">
		var token ="";	 //七牛上传token
		$.ajax({
	        type: "GET",
	        async:false,
	        url: "${basepath }/mgr/fodder/gettoken.xhtml",
	        success: function(data){
	        	token = data;
	        }
	    });
	
		//实例化编辑器
		//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
		var editor = UE.getEditor('editor',{
			//http://ajy-test.qiniudn.com
			imageUrlPrefix:"<%=Constants.IMG_SERVER_DOWNLOAD%>" 
			//http://up.qiniu.com/
			,serverUrl:"<%=Constants.QINIU_SERVER%>", 
			token : token,
			imageActionName : "token=",
			imageFieldName : "file",
			imagewidth : "100%",
			imageAllowFiles : [ ".png", ".jpg", ".jpeg", ".gif", ".bmp" ]
			//工具栏上的所有的功能按钮和下拉框，可以在new编辑器的实例时选择自己需要的从新定义
			,toolbars : [ [ "source", "bold", "italic", "underline", "|",
					"insertorderedlist", "insertunorderedlist", "|",
					"insertimage", "|", 'removeformat', 'forecolor',
					'backcolor'] ]
		});
	</script>
</body>
</html>