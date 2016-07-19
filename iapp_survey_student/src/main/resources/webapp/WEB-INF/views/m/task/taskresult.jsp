<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>结果</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
     <link rel="stylesheet" href="${basepath }/static/css/320.css">
</head>
<body>
<section class="task-detail-box">
    <span class="task-detail-time"><i class="fa fa-clock-o"></i>时间：${ltfun:dateLongToStringFormat(task.begintime,'MM月dd日') }~${ltfun:dateLongToStringFormat(task.endtime,'MM月dd日 ')}</span>
    <div class="pingyu-book">
        <span class="task-need"><i class="fa fa-book"></i>评语(评分:${taskUser.score})</span>
        <p>
            ${taskUser.comment}
        </p>
    </div>
    <c:if test="${taskUser.score < task.score }">
    <span class="task-score">未通过</span>
    </c:if>
    <c:if test="${taskUser.score >= task.score }">
    <span class="task-score">通过</span>
    </c:if>
    
    <hr>
    <span class="task-need"><i class="fa fa-building-o"></i>说明</span>
    <p>
        ${task.taskrequire}
    </p>

    <hr>
    <span class="task-need"><i class="fa fa-tasks"></i>内容</span>
    <span class="task-textarea">
    <c:if test="${task.informtask eq 1 and taskUser.status ne 1 }">
       <textarea >${taskUser.content }</textarea>
    </c:if>
     <c:if test="${task.informtask eq 0 or taskUser.status eq 1 }">
       <textarea disabled="disabled" >${taskUser.content }</textarea>
    </c:if>
    </span>
    <span class="task-img-box">
       <ul>
       	  <c:forEach items="${taskUser.attachments }" var="attachment">
	       	   <li>
	               <img style="width:80px;height:80px;" class="img-responsive img-rounded" src="<%=Constant.IMG_SERVER_DOWNLOAD %>${attachment.url}-80x80" data-src="<%=Constant.IMG_SERVER_DOWNLOAD%>${attachment.url}-1024x1024" data-gid="${taskUser.uid}" onload="preViewImg(this, event);">
	           </li>
       	  </c:forEach>
       </ul>

    </span>
	<c:if test="${taskUser.status ne 3  && task.informtask eq 1}">
    	<span class="btn btn-success btn-block" onclick="javascript:window.location.href='${basepath}/m/task/viewinformtask.xhtml?id=${task.id}'">马上参加</span>
    </c:if>
</section>
<script type="text/javascript">
    $(function(){
        resizeaddbox()
    });
    $(window).resize(function(){
        resizeaddbox();
    });
    function resizeaddbox(){
        var h=$(".task-img-box").find("img:first-child").height();
        $(".task-img,.addimg").height(h-5);
        $(".addimg").attr("style","line-height:"+h+"px;height:"+h+"px");
    }
    function openfile(){
        $("#inputfile").click();
    }
    window.onerror = function(evt){
        console.log(evt);
        return true;
    }
    window.preViewImg = (function(){
        var imgsSrc = {};
        function reviewImage(dsrc, gid) {
            if (typeof window.WeixinJSBridge != 'undefined') {
                WeixinJSBridge.invoke('imagePreview', {
                    'current' : dsrc,
                    'urls' : imgsSrc[gid]
                });
            }else{
                /* alert("请在微信中查看", null, function(){}); */
            }
        }
        function init(thi, evt){
            var dsrc = thi.getAttribute("data-src");
            var gid = thi.getAttribute("data-gid");
            if(dsrc && gid){
                imgsSrc[gid] = imgsSrc[gid]||[];
                imgsSrc[gid].push(dsrc);
                thi.addEventListener("click", function(){
                    reviewImage(dsrc, gid);
                }, false);
            }
        }
        return init;
    })();
</script>
</body>
</html>