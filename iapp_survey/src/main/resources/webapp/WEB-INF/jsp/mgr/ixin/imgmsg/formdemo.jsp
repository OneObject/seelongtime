<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<%-- <!DOCTYPE html>
<html>
<head>

</head>
<body>
	<form method="post" action="http://up.qiniu.com/"
		enctype="multipart/form-data">
		<input name="token" type="hidden" value="${uptoken }"> 
		<input name="file" type="file" />
		<input type="submit" value="提交"/>
	</form>
	
	
</body>
</html>
 --%>
 <!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>UploadiFive Test</title>
<script src="http://www.uploadify.com/wp-content/themes/uploadify/js/jquery.uploadify.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${basepath }/static/ixin/css/uploadify.css">
<style type="text/css">
body {
	font: 13px Arial, Helvetica, Sans-serif;
}
</style>
</head>

<body>
<form method="post" action="http://up.qiniu.com/"
		enctype="multipart/form-data">
		<input name="token" type="hidden" value="${uptoken }"> 
		<input name="file" type="file" />
		<input name="key" value="/test/a.jpg"/>
		<input type="submit" value="提交"/>
	</form>
	<h1>Uploadify Demo</h1>
	<form>
		<div id="queue"></div>
		<input id="file_upload" name="file_upload" type="file" multiple="true">
	</form>

	<div id="showImage">
	</div>

	<script type="text/javascript">
		$(function() {
			$('#file_upload').uploadify({
				'formData'     : {
					'token'     : '${uptoken}',
					'key' :"/test/aa.jpg"
				},
				'fileObjName'  : 'file',
				'swf'      : '${basepath}/static/ixin/css/uploadify.swf',
				'uploader' : 'http://up.qiniu.com/',
				'onUploadSuccess' : function(file,data,response){
					var result = eval("("+data+")");
					$('#showImage').html('<img src="http://img.aijiayou.com/'+result.hash+'">');
				}
			});
		});
	</script>
</body>
</html>