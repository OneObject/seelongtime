<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<% response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","No-cache"); 
response.setDateHeader("Expires", -1);
response.setHeader("Cache-Control", "No-store");
%>
<!DOCTYPE html>
<html>
<head>
    <title>${task.title }</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
     <link rel="stylesheet" href="${basepath }/static/css/320.css">
</head>
<body>
    <section class="task-detail-box">
        <span class="task-detail-time"><i class="fa fa-clock-o"></i>时间：${ltfun:dateLongToStringFormat(task.begintime,'MM月dd日') }~${ltfun:dateLongToStringFormat(task.endtime,'MM月dd日 ')}</span>
         <c:if test="${taskUser.status ne 0 }">
       		<span class="alert alert-warning" style="display:block;overflow: hidden;">已参与，谢谢参加。</span>
        </c:if>
        <span class="task-need" ><i class="fa fa-building-o"></i><strong>说明</strong></span>
            <p>
                ${task.taskrequire}
            </p>
           <hr>
     <c:if test="${not empty taskUser.content}">
    <span class="task-need"><i class="fa fa-tasks"></i><strong>内容</strong></span>
    <span class="task-textarea">
    <c:if test="${task.informtask eq 1 and taskUser.status ne 1 }">
       <textarea  style="padding:5px;">${taskUser.content }</textarea>
    </c:if>
     <c:if test="${task.informtask eq 0 or taskUser.status eq 1 }">
       <textarea disabled="disabled" style="padding:5px;">${taskUser.content }</textarea>
    </c:if>
    </span>
    <c:if test="${not empty taskUser.attachments}">
    <div class="task-img-box item-imglist">
    	<figure data-count="6张图片">
    	<div>
			<c:forEach items="${taskUser.attachments }" var="attachment">
            	<img style="width:80px;height:80px;" class="img-rounded" src="<%=Constant.IMG_SERVER_DOWNLOAD %>${attachment.url}-80x80" data-src="<%=Constant.IMG_SERVER_DOWNLOAD%>${attachment.url}-1024x1024" data-gid="${taskUser.uid}" onload="preViewImg(this,event);" onerror="javascript:this.src='${basepath}/static/img/task/fujian.png'">
            </c:forEach>
		</div>
		</figure>
    </div>
    </c:if>
    </c:if>
        <c:if test="${taskUser.status eq 0 }">
       		<span class="btn btn-success btn-block" onclick="javascript:window.location.href='${basepath}/m/task/viewinformtask.xhtml?id=${task.id}'">马上参加</span>
        </c:if>
      
    </section>
    <script type="text/javascript">
 $(document).ready(function(){
        resizeaddbox();
        var that= $("textarea")[0];
        that.style.height= (that.scrollHeight+10)+'px';

    });
    $(window).resize(function(){
        resizeaddbox();
    });
    function resizeaddbox(){
        var h=$(".task-img-box").find("img:first-child").height();
        $(".task-img,.addimg").height(h-5);
        $(".addimg").attr("style","line-height:"+h+"px;height:"+h+"px");
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