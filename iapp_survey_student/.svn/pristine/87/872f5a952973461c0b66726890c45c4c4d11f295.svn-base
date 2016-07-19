<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%><%--需重再一次导入 --%>
<%
String domain = MwebHelper.getCurrentDomain();
request.setAttribute("currentdomain", domain);
%>
<!DOCTYPE html>
<html>
<head>
    <title>考试列表</title>
    <link rel="stylesheet" href="${basepath}/static/m/new.css">
	<link type="text/css" rel="stylesheet" href="${basepath }/static/m/nui/css/list.css">
	
    <script type="text/javascript">
	    function toDetail(tid){
	    	window.top.location.href="${basepath}/m/h5/exam/detail.xhtml?tid="+tid;
		}
    </script>
    <style>
    .activitybox ul li{
    border: 1px solid #ccc;}
    .test-time{
    background-color: #78c7ee}
    </style>
</head>
<body>
<div class="activitybox">
	<input type="hidden" value="<%=Constant.ADMIN_ROOT %>" id="adminRoot"/>
    <input type="hidden" value="${uid }" id="uid"/>
   <div style="text-align:center;height: 48px;line-height: 28px;font-size: 20px;padding:12px 16px;padding:0;padding-top:10px;">
         <input type="text" id="name" value="${name}">
         <img src="${basepath}/static/img/frame/find.png" class="search_btn" data-url="${basepath}/m/exam/list.xhtml" style="margin-bottom: 6px;height:36px;">
		
    </div>
    <div class="tabBtn" style="margin: 8px auto;">
         <span class="baseName " data-url="${basepath}/m/exam/list.xhtml">按名称</span>
         <span class="baseTime " data-url="${basepath}/m/exam/list.xhtml">按时间</span>
    </div>
    

		
    <ul>
    	<c:if test="${empty list }"><div class="well well-small text-center" style="margin:20px 10px 5px;">无考试</div></c:if>
       	<c:forEach items="${list}" var="item">
       		<c:if test="${currentdomain eq item.domain }">
        	<li class="activity-item" onclick="toDetail('${item.id}');">
	            <div class="activity-item-img">
	                 <c:if test="${empty item.cover}">
	                	<div class="test-time">
		                    <span class="month">${item.month }月</span>
		                    <span class="day">${item.day }</span>
		                </div>
	                </c:if>
	                <c:if test="${not empty item.cover }">
	                	<img style="width:80px;height:80px;" src = "<%=Constant.IMG_SERVER_DOWNLOAD%>${item.cover}-80x80" onerror="${basepath }/static/m/img/exam.png">
	                </c:if>
	            </div>
	            <div class="activity-item-content">
	                <span class="activity-name">${item.examName }</span>
	                <span class="activity-jianjie">&nbsp;</span>
	                <span class="activity-others">时间：${ltfun:dateLongToStringFormat(item.startTime,'yyyy-MM-dd HH:mm') }至${ltfun:dateLongToStringFormat(item.endTime,'yyyy-MM-dd HH:mm') }</span>
	            </div>
	        </li>
	        </c:if>
       	</c:forEach>
     
       	
  
  
    </ul>
</div>
   <input type="hidden" id="flag1" value="${flag1 }" >
   <input type="hidden" id="flag2" value="${flag2 }" >
   <input type="hidden" id="activityId" value="${activityId }" >
    <script type="text/javascript" src="${basepath }/static/m/nui/js/zepto.js"></script>
    <script type="text/javascript">
    var condition = "${condition}";
    if(condition=="name"){
    	 $(".baseTime").removeClass("active");
         $(".baseName").addClass("active");
        }else if(condition=="time"){
        	 $(".baseName").removeClass("active");
             $(".baseTime").addClass("active");
       }
    $(document).ready(function(){
    //按名称
     $(".baseName").on("click",function(){
         var url = $(this).attr("data-url");
         var name = $("#name").val();
         var flag1 = $("#flag1").val();
         var flag2 = $("#flag2").val();
         var activityId = $("#activityId").val();
         if(flag1==null||flag1==""){
 			flag1=0;
         }
         if(flag2==null||flag2==""){
 			flag2=0;
         }
         if(activityId==null||activityId==""){
         	url = url+"?condition=name&flag1="+flag1+"&flag2="+flag2+"&name="+name;
         }else{
        	url = "${basepath}/m/exam/serieslist.xhtml"+"?activityId="+activityId+"&condition=name&flag1="+flag1+"&flag2="+flag2+"&name="+name;
         }
         
	     console.log(url);
	     window.location.href =url;
	     
         });
    //按时间
    $(".baseTime").on("click",function(){
        var url = $(this).attr("data-url");
        var name = $("#name").val();
        var flag1 = $("#flag1").val();
        var flag2 = $("#flag2").val();
        var activityId = $("#activityId").val();
        if(flag1==null||flag1==""){
			flag1=0;
        }
        if(flag2==null||flag2==""){
			flag2=0;
        }
        if(activityId==null||activityId==""){
        	url = url+"?condition=time&flag1="+flag1+"&flag2="+flag2+"&name="+name;
         }else{
         	url = "${basepath}/m/exam/serieslist.xhtml"+"?activityId="+activityId+"&condition=time&flag1="+flag1+"&flag2="+flag2+"&name="+name;
         }
	      console.log(url);
	      window.location.href =url;
	      
        });
    //搜索
    $(".search_btn").on("click",function(){
    	 var url = $(this).attr("data-url");
    	 var name = $("#name").val();
    	 var flag1 = $("#flag1").val();
         var flag2 = $("#flag2").val();
         var activityId = $("#activityId").val();
         if(flag1==null||flag1==""){
 			flag1=0;
         }
         if(flag2==null||flag2==""){
 			flag2=0;
         }
         if(activityId==null||activityId==""){
    	 	url = url+"?condition="+condition+"&flag1="+flag1+"&flag2="+flag2+"&name="+name;
          }else{
          	url = "${basepath}/m/exam/serieslist.xhtml"+"?activityId="+activityId+"&condition=name&flag1="+flag1+"&flag2="+flag2+"&name="+name;
          }
    	 console.log(url);
	      window.location.href =url;
        });
    });
    </script>
</body>
</html>
<content tag="extra_js">
</content> 
