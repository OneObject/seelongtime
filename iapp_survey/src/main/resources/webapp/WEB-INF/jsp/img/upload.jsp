<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${basepath }/upload" method="post" enctype="multipart/form-data">
		<input name="token" value="token">
		<input name="appid" value="appid">
		
		<input type="file" name="file">
		<button type="submit">upload</button>
	</form>
</body>
</html>