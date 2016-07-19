<%@page import="org.apache.commons.lang3.SystemUtils"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.io.IOUtils"%>
<%@page import="java.util.Enumeration"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%



boolean isMultipart = ServletFileUpload.isMultipartContent(request);//检查输入请求是否为multipart表单数据。

System.out.println(">>>>>>>>>>>>>>>" + isMultipart);
if (isMultipart == true) {
	
	FileUploadBase fu = new DiskFileUpload();
   List<FileItem> items = fu.parseRequest(request);
   Iterator<FileItem> itr = items.iterator();
   while (itr.hasNext()) {
       FileItem item = (FileItem) itr.next();
       //检查当前项目是普通表单项目还是上传文件。
   	String fieldName = item.getFieldName();
	   System.out.println(String.format("%s --- %s ", item.getFieldName(), item.getString("utf-8")));//显示表单内容。
}
}
%>
<!--  
file_name --- 16业绩说话表扬.zip 
file_content_type --- application/zip 
file_path --- /tmp/nginx_upload/0000000021 
file_md5 --- f6934db9be3052b2cd327d95b0703878 
file_size --- 41836736 
v1 --- v1 
v2 --- v2 
v3 --- v3 
submit --- submit
-->
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test upload</title>

</head>

<body>
afafaf
</body>
</html>