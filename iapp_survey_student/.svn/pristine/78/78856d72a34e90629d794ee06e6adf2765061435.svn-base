<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%

response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","No-cache"); 
response.setDateHeader("Expires", -1); 
response.setHeader("Cache-Control", "No-store");

 String uid=MwebHelper.getCurrentUid();
 if(uid.equals(MwebHelper.DEFAULT_UID)){
	 uid=MwebHelper.getCurrentOpenId();
 }
 pageContext.setAttribute("uid", uid);
%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>话题</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="${basepath}/static/plugins/fonticon/css/font-awesome.min.css">
    <link rel="stylesheet" href="${basepath}/static/m/new/plugins/shixy/dist/Jingle.css">
    <link rel="stylesheet" href="${basepath}/static/m/new/css/general.css">
</head>
</head>
<body>

<!--页面容器     start --->
<div id="section_container">
    <section id="topic_detail_section" class="active" >
        
        <footer class="otherfooter">
            <a href="${basepath}/m/ixin/ntopic/index.xhtml?ltdebug=${ltdebug }&activityid=${activityid}" class="secected goback"><i class="fa fa-angle-left" style="font-size: 32px;"></i></a>
            <a onclick="openreplay()" class="secected" id="replay"><i class="fa fa-comment-o"  style="font-size: 20px;margin-top: 16px;"></i><span style="font-size: 20px;">发表评论</span></a>
            <a class="replay"></a>
            <!--<a  href="#" id="layout-btn-getmore" class="secected"><i class="fa fa-ellipsis-h" style="font-size: 24px;margin-top: 16px;"></i></a>-->
        </footer>
        
        
        <article id="topic-detail" class="active" data-scroll="true">
        
 <!--详情页面-->
      <c:if test="${empty topicvo}">
      <div  id="nothing">
           <h1 class="nothing" >话题信息不存在</h1>
       </div>
      </c:if>
     <c:if test="${not empty topicvo}">
            <div>
                <div class = "tpoicitem">
                    <div class="topic-item-top">
                        <img src="${basepath}/user/avatar/${topicvo.topic.uid}.xhtml?style=80x80&color=blue">
                        <div class="topic-item-top-right">
                            <h2>${topicvo.topic.uname}</h2>
                            <span>${ltfun:dataLongToSNS(topicvo.topic.createtime,"yyyy-MM-dd HH:mm")}</span>
                        </div>
                    </div>
                    <p class="topic-content">
                       ${topicvo.topic.content}
                    </p>
                     <%--
                    <c:set var="zanstatus" value="${ajy:zanStatus(topicvo.topic.id,2,uid)}"/>
			        <c:set var="zanNum" value="${ajy:praiseTotal(topicvo.topic.id,2)}"/>--%>
                   <span class="topic-control">
                    <%-- <label onclick="<c:if test='${zanstatus eq 1 }'>dianzan(this)</c:if><c:if test='${zanstatus eq 0}'>removezan(this)</c:if>" c="${topicvo.topic.id}" n="${zanNum}" >
                    <i class="fa <c:if test='${zanstatus eq 1}'>fa-thumbs-o-up</c:if><c:if test='${zanstatus eq 0}'>fa-thumbs-up</c:if>"></i>&nbsp;
                    <c:if test="${zanNum>0}"><em>${zanNum}</em></c:if><c:if test="${zanNum<=0}"><em>赞 </em></c:if></label>&nbsp;&nbsp;--%>
                    <label onclick="openreplay(this)" c="${topicvo.topic.id}"><i class="fa fa-comment-o"></i>&nbsp;评论<c:if test="${not empty topicvo.commentSet.pageable.total}">(${topicvo.commentSet.pageable.total })</c:if></label>
                    </span>
                </div>
                <div class="top-replay-list-detail">
                    <ul id="detail_comment_${topicvo.topic.id}">
                    <c:if test="${empty topicvo.commentSet.data}">
                     <div  id="nothing">
                         <h1 class="nothing" >没有评论信息，快去添加一条吧</h1>
                     </div>
                     </c:if>
                    <c:forEach var="comment" items="${topicvo.commentSet.data }">
                        <li>
                            <div class="replay-detail-item">
                                <img src="${basepath}/user/avatar/${comment.uid}.xhtml?style=80x80&color=blue">
                                <div class="replay-detail-item-right">
                                    <h2>${comment.uname}</h2>
                                    <span>${ltfun:dataLongToSNS(comment.createtime,"yyyy-MM-dd HH:mm")}</span>
                                </div>
                                <p>
                                ${comment.body}
                                </p>
                            </div>
                        </li>
                  </c:forEach>
                    </ul>
                </div>
            </div>
            </c:if>
            
            
            
      </article>
        <script type="text/html" id="replayinput">
            <div style="padding:16px 8px 0px;" id="inputbox">
                <textarea class="topic-word" id="commentinfo"></textarea>
                <div id="popup_btn_container" class="popup_btn_container"><a onclick="J.closePopup()" >取消</a><a onclick="makesure()">确定</a></div>
            </div>
        </script>
    </section>
</div>
<!--页面容器     end --->
<!--<script type="text/javascript" src="../static/js/zepto.js"></script>-->
<script type="text/javascript" src="${basepath}/static/m/new/plugins/shixy/libs/zepto.js"></script>
<!--<script type="text/javascript" src="../static/js/iscroll.js"></script>-->
<script type="text/javascript" src="${basepath}/static/m/new/plugins/shixy/libs/iscroll.js"></script>
<script type="text/javascript" src="${basepath}/static/m/new/plugins/shixy/libs/template.min.js"></script>
<!--<script type="text/javascript" src="../static/plugins/shixy/dist/Jingle.debug.js"></script>-->
<script type="text/javascript" src="${basepath}/static/m/new/plugins/shixy/libs/zepto.touch2mouse.js"></script>
<script type="text/javascript" src="${basepath}/static/m/new/js/Jingle.debug.js"></script>
<script type="text/javascript" src="${basepath}/static/m/new/plugins/qqface/jquery.qqFace.js"></script>
<script type="text/javascript">
    $(function(){
        Jingle.launch();
        
        changeface();
    });
    /*打开评论的窗口*/
    function openreplay(){
            J.popup({
                tplId : 'replayinput',
                pos : 'center',
                clickMask2Close : false,// 是否点击外层遮罩关闭popup
                showCloseBtn : false// 是否显示关闭按钮
            })
    }
    /*输入QQ表情支持*/
     //查看结果
    function replace_em(str){
       // str = str.replace(/\</g,'&lt;');
       // str = str.replace(/\>/g,'&gt;');
       // str = str.replace(/\n/g,'<br/>');
        str = str.replace(/\[em_([0-9]*)\]/g,'<img src="${basepath}/static/m/new/plugins/qqface/face/$1.gif" style="width: 18px;height: 18px;" border="0" />');
        return str;
    }

    function changeface(){
    	$(".topic-content").each(function(){
               $(this).html(replace_em($(this).html()));
    		});
    }
    function showface(){
//        测试用的方法
       $("#showface").html($("#saytext").val());
        $("#showface").html(replace_em($("#showface").html())) ;
    }

    /*点赞*/
    function dianzan(_this){
    	 var topicid=$(_this).attr("c");
         var n=parseInt($(_this).attr("n"));
        $("#topic-list").append('<span id = "addzan" style="display: block;height: 40px;color: #529bea;font-size: 24px;font-weight: bold;position: absolute;opacity: 0;">+ 1</span>');
        var postion = $(_this).offset();
        /*$("#addzan").css("top",postion.top+25);
        $("#addzan").css("left",postion.left);
        $("#addzan").animate({
            opacity:1
        },200);*/
        $.ajax({
       		url:"${basepath}/m/ixin/study/clickpraise.json",
       		type:"POST",
       		data:{"restype":"2","resid":topicid},
       		success:function(data){
       			if(data.uid != null && data.uid!=""){
       			 $("#addzan").animate({
                     opacity:0
                 },200);
       			 $(_this).find("i").addClass("fa-thumbs-up").removeClass("fa-thumbs-o-up");
       			 $(_this).find("em").text(n+1);
       			 $(_this).attr("onclick","removezan(this)")
       			 $(_this).attr("n",n+1);
                /* $("#addzan").remove();*/
       			}else{
           			
           			}
       		},
       		error:function(){
       			J.showToast('赞失败');
       			/*$("#addzan").remove();*/
           		}
        });
    }
    function removezan(_this) {
        $("#topic-list").append('<span id = "removezan" style="display: block;height: 40px;color: #529bea;font-size: 24px;font-weight: bold;position: absolute;opacity: 0;">- 1</span>');
        var postion = $(_this).offset();
       /* $("#removezan").css("top",postion.top+25);
        $("#removezan").css("left",postion.left);
        $("#removezan").animate({
            opacity:1
        },200);*/

        var topicid=$(_this).attr("c");
        var num=parseInt($(_this).attr("n"));
        $.ajax({
       		url:"${basepath}/m/ixin/study/clickpraise.json",
       		type:"POST",
       		data:{"restype":"2","resid":topicid},
       		success:function(data){
       			if(data.uid != null||data.uid!=""){
       			 $("#removezan").animate({
                     opacity:0
                 },200);
                 $(_this).find("i").addClass("fa-thumbs-o-up").removeClass("fa-thumbs-up");
                 if((num-1)>0){
                     $(_this).find("em").text(num-1);
                     }else{
                    	 $(_this).find("em").text("赞");
                         }
                 $(_this).attr("onclick","dianzan(this)");
                 if(num>0){
                 $(_this).attr("n",num-1);
                 }
                /* $("#removezan").remove();*/
       			}else{
           			
           			}
       		},
       		error:function(){
       			J.showToast('取消赞失败');
       			/*$("#removezan").remove();*/
           		}
        });
    }
    
    
    
  //发表评论
    function makesure(){
    	var content=$.trim($("#commentinfo").val());
        var topicid="${topicvo.topic.id}";
    	if(!content){
    		J.showWarn('请输入内容','error');
            return;
    	}
    	if(!topicid){
    		J.showWarn('点击取消，重新选择话题','error');
    		return;
    	}

    	$.ajax({
    		   type: "POST",
    		   url:"${basepath}/m/ixin/comment/add.json",
    		   data: {"restype":"2","resid":topicid,"action":"1","body":content,"ltdebug":"${ltdebug}"},
    		   success: function(data){
    			   $("#commentinfo").val("");
    			   if(data){
    				   	J.closePopup();
    				   	J.showToast('评论成功');
    				   	$('#nothing').hide();
    				   	//回显 -- 话题列表页
    				   	$("#comment_"+data.resid).prepend("<li><span class='replay-container'>"+data.uname+": "+data.body +"</span> <span class='replay-time'>刚刚</span></li>");
    				   	$("#p_comment_"+data.resid).show();
    				   	//回显-- 话题详情页
    				   	var detailComment = $("#detail_comment_"+data.resid);
    				   	if(detailComment){
    				   		var html = [];
    				        html.push('<li>');
    				        html.push('<div class="replay-detail-item">');
    						html.push('<img src="${basepath}/user/avatar/'+data.uid+'.xhtml?style=80x80&color=blue">');
    				        html.push('<div class="replay-detail-item-right">');
    				        html.push('<h2>'+data.uname+'<h2>');
    				        html.push('<span>刚刚<span>');
    				        html.push('</div>');
    				        html.push('<p>');
    				        html.push(data.body);
    				        html.push('</p>');
    				        html.push('</div>');
    				        html.push('</li>');
    				   		detailComment.prepend(html.join(""));
    				   	}
    	  		   }else{
    	  				J.closePopup();
    	  			 	J.showToast('评论失败','error');
    	      	   }
    		   },
    		   error: function(){
    			    J.closePopup();
     			 	J.showToast('评论失败','error');
    		   }
    		});


    	
    }


  
  
</script>
<script type="text/javascript">
    //去掉底部的黑条
    document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
    	WeixinJSBridge.call('hideToolbar');
    	WeixinJSBridge.call('hideOptionMenu');
    });
</script>
</body>
</html>       