<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<!DOCTYPE html>
<html>
<head>
    <title>未提交列表</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="${basepath}/static/css/320.css">
</head>
<body>
<section class="check-task">
    <header>
        <!--页头部分 start-->
          <img src="${basepath}/static/img/task/task.png" class="img-rounded">
         <input type="hidden" id="hid_id" name="hid_id" value="${task.id}">
        <div class="task-miaoshu">
            <h3>${task.title}</h3>
            <ul>
                 <li id="haspigai">
                        <span class="btn btn-default"><i class="fa fa-check-circle-o"></i>${haspigai}人</span>
                    </li>
                    <li id="nopigai">
                        <span class="btn btn-success"><i class="fa fa-clock-o"></i>${nopigai}人</span>
                    </li >
                    <li id="noinform">
                        <span class="btn btn-warning"><i class="fa fa-exclamation-triangle"></i>${noinform}人</span>
                    </li>
            </ul>
        </div>
        <!--页头部分 end-->
    </header>
    <section class="check-user-list">
        <ul>
        <c:forEach var="item" items="${taskuservolist}">
            <li>
                <div class="user-item">
                    <img src="${basepath}/user/avatar/${item.uid}.xhtml?style=80x80" class="img-thumbnail">
                    <span>${item.name}</span>
                </div>
            </li>
         </c:forEach>
        </ul>
    </section>
</section>
<script type="text/javascript">
    $(document).ready(function(){
    	$("#nopigai").click(function(){
   		 var taskid=$("#hid_id").val();
      		 var noinform="${noinform}";
      		 var nopigai="${nopigai}";
      		 var haspigai="${haspigai}";
      		 window.location.href="${basepath}/m/task/tlist.xhtml?id="+taskid+"&noinform="+noinform+"&nopigai="+nopigai+"&haspigai="+haspigai;
   	});
    	$("#haspigai").click(function(){
   		 var taskid=$("#hid_id").val();
   		 var noinform="${noinform}";
   		 var nopigai="${nopigai}";
   		 var haspigai="${haspigai}";
   		 window.location.href="${basepath}/m/task/plist.xhtml?id="+taskid+"&noinform="+noinform+"&nopigai="+nopigai+"&haspigai="+haspigai;
   	 });
   	 
   	 $("#noinform").click(function(){
   		 var taskid=$("#hid_id").val();
   		  var noinform="${noinform}";
   		 var nopigai="${nopigai}";
   		 var haspigai="${haspigai}";
   		 window.location.href="${basepath}/m/task/flist.xhtml?id="+taskid+"&noinform="+noinform+"&nopigai="+nopigai+"&haspigai="+haspigai;
   	 });
        //计算两个div之间的间隔应该是多少
        var w=$(window).width()-20;//浏览器可用宽度
        var linecount=parseInt(w/78);//每行可放置的个数
        var lastw=w-linecount*78;//剩余的像素
        $(".check-user-list ul li").attr("style","margin-right:"+lastw/linecount+"px");
        $(".check-user-list ul li:nth-child("+linecount+"n)").attr("style","margin-right:0px");
    });
</script>

</body>
</html>