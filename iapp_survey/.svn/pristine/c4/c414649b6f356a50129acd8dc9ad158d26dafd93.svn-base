<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp" %>
<!DOCTYPE html>
<html>
  <head>
    <title>新闻</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-theme.min.css">
  </head>
  <body>
      <div class="container">
            <div class="title">
                <h3>
                    ${msg.title }
                </h3>
                <span><!-- 2013-10-28 22:22 -->${msg.datelineFormat }</span>
            </div>
            <div class="row" style="margin: auto; display: block;">
                <c:if test="${not empty msg.imgUrl }">
                <img src="${msg.imgUrl }" class="img-responsive" alt="Responsive image">
                </c:if>
            </div>
            <div class="row">
                <pre style="font-size: 18px;border:none;background:none;">${msg.content }
                </pre>
            </div>
        </div>
      
    

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <!-- Latest compiled and minified JavaScript -->
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
  </body>
</html>