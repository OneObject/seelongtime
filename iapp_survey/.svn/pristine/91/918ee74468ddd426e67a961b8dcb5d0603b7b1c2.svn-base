<%@ page import="org.springframework.data.mongodb.core.MongoTemplate" %>
<%@ page import="com.longtime.common.spring.SpringContextUtil"%>
<%@ page import="com.mongodb.CommandResult" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
  MongoTemplate mongoTemplate = (MongoTemplate)SpringContextUtil.getBean("mongoTemplate");
%>
<%
  boolean success = false;
  if(null!=mongoTemplate){
      CommandResult rs = mongoTemplate.executeCommand("{ping:1}");
      int s = rs.getInt("ok");
      success = 1==s;
  }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>mongodb ping</title>
</head>
<body>
pong:<%=success%>
</body>
</html>
