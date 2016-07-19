<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%
 String uid=MwebHelper.getCurrentUid();
 if(uid.equals(MwebHelper.DEFAULT_UID)){
	 uid=MwebHelper.getCurrentOpenId();
 }
 pageContext.setAttribute("uid", uid);
%>
<!DOCTYPE html>
<html>
<head>
    <title>话题列表</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="${basepath}/static/css/easydialog.css">
    <link rel="stylesheet" href="${basepath}/static/css/320.css">
    <script type="text/javascript">

    //去掉底部的黑条
    document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
    	WeixinJSBridge.call('hideToolbar');
    });
	</script>

</head>
<body>
	<input type="hidden" id="hid_topicid" />
    <section class="huati-list-box" id="huati-list-box">
        <header>
        	
        	<c:if test="${activityInfo.id!='809adf48f8254471901e21a225c837b2' }">
            <img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${activityInfo.picUrl}">
            
           
            <span class="huati-title">
                  ${activityInfo.name}
            </span>
            
            </c:if>
        </header>
         <input type="hidden" id="activityid" value="${activityInfo.id}"/>
        <c:if test="${activityInfo.id=='809adf48f8254471901e21a225c837b2' }"><%--for 国药大学 --%>
        <script type="text/javascript">
			    window.preViewImg = (function(){
			        var imgsSrc = {};
			        function reviewImage(dsrc, gid) {
			            if (typeof window.WeixinJSBridge != 'undefined') {
			                WeixinJSBridge.invoke('imagePreview', {
			                    'current' : dsrc,
			                    'urls' : imgsSrc[gid]
			                });
			            }else{
			                alert("请在微信中查看", null, function(){});
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
        	<img src="http://ajy-test.qiniudn.com/zn.jpg" width="100%" data-src="http://ajy-test.qiniudn.com/zn.jpg" data-gid="999991" 
onload="preViewImg(this,event);">
        	
        </c:if>
        	
        	
        <section class="huati-list-items  commentList" style="margin-bottom:50px;">
            <ul id="topic">
             <c:if test="${empty topicvos}">
            <li>
               <span class="alert alert-warning" style="display:block;overflow: hidden; text-align: center;">没有话题</span>
            </li>
            </c:if>
            <c:forEach var="item" items="${topicvos}">
                <li>
                    <div class="huati-item">
                        <img src="${basepath}/user/avatar/${item.topic.uid}.xhtml?style=80x80" class="img-responsive">
                        <div class="huati-item-detail">
                            <span class="huati-user-name">${item.topic.uname}</span>
                            <p class="huati-content contenttext">
                                ${item.topic.content}
                            </p>
                            <span class="huati-item-time">${ltfun:dataLongToSNS(item.topic.createtime,"yyyy-MM-dd HH:mm")}</span>
                            <div class="huati-item-caozuo">
                                <span class="huati-caozuo-hide" id="popView-${item.topic.id }" style="display: none">
                                	<input type="hidden"  id="popid-${item.topic.id }" value="hide" class="hidebox">
                                    <button class="btn btn-black" onclick="hidebtnbox(this,'${item.topic.id}','${uid}')" dotype="${ajy:zanStatus(item.topic.id,2,uid)}">
                                      	<c:if test="${ajy:zanStatus(item.topic.id,2,uid)==1}">
                                    		<i class="fa fa-heart-o"></i>赞
                                    	</c:if>
                                    	<c:if test="${ajy:zanStatus(item.topic.id,2,uid)==0}">
                                    		<i class="fa fa-heart-o"></i>取消赞
                                    	</c:if>
                                    </button>
                                    <button class="btn btn-black" onclick="openinput('comment','${item.topic.id}')"><i class="fa fa-comment-o"></i>评论</button>
                                </span>
                                <span class="toolbtn" onclick="openpop('${item.topic.id }')">
                                   <img src="${basepath}/static/img/topic/caozuobtn.png">
                                </span>
                            </div>
                        </div>
                        <div class="huati-customer" id="huati-customer_${item.topic.id }">
                        	<c:if test="${not empty item.praiseHistorylist }">
	                            <i class="fa fa-heart-o" id="faheart_${item.topic.id}"></i>
	                            <ul class="saypraise_${item.topic.id}">
		                            <c:forEach var="praise" items="${item.praiseHistorylist}">
		                                <li id="praiseuid_${praise.uid}${item.topic.id}">
		                                    <img src="${basepath}/user/avatar/${praise.uid}.xhtml?style=80x80">
		                                </li>
		                            </c:forEach>
	                            </ul>
                            </c:if>
                            <c:if test="${not empty item.commentlist }">
	                            <i class="fa fa-comment-o"></i>
	                            <ul class="saybox commentlist" id="comment_${item.topic.id}">
	                             	<c:forEach var="comment" items="${item.commentlist}">
		                                <li >
		                                    <span class="say-name">${comment.uname}</span>:<span class="contenttext">${comment.body}</span>
		                                </li>
	                                </c:forEach>
	                            </ul>
                            </c:if>
                        </div>
                    </div>
                </li>
                </c:forEach>
            </ul>
        </section>

    </section>
    <footer class="navbar-fixed-bottom huati-input">
        <span class="btn btn-block btn-default" onclick="openinput('topic','')">发起话题</span>
    </footer>
    <div id="pinglun-input" style="display: none">
    	<form id="addcommentform" method="post" action="${basepath}">
    		<textarea placeholder="评论···" id="saytext"></textarea>
	        <div class="control-box">
	            <input type="hidden" id="hid_operate" name="hid_operate">
	            <span class="btn btn-default emotion" style="float:left;"><i class="fa fa-smile-o"></i></span>
	            <span class="btn btn-info" id="submitbtn">提交</span>
	            <span class="btn btn-default" onclick="easyDialog.close()">取消</span>
	            
	        </div>
        </form>
    </div>
    <script type="text/javascript" src="${basepath}/static/js/easydialog.js"></script>
    <script type="text/javascript" src="${basepath}/static/qqface/jquery.qqFace-huati.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            
            var w=$(window).width()-20;//可用宽度
            //获得可用宽度以后先要给那个黑条赋值
            $(".huati-title").width(w);
            $('.emotion').qqFace({
                assign:'saytext', //给那个控件赋值
                path:'${basepath}/static/qqface/face/',        //表情存放的路径
                tip : 'em_'//在输入框中显示的表情的前缀
            });
            replace_one();
        })
        $(window).resize(function(){
            var w=$(window).width()-20;//可用宽度
            //获得可用宽度以后先要给那个黑条赋值
            $(".huati-title").width(w);
        });
        function openpop(id){
        	if($("#popid-"+id).val()=="hide"){
        		 $('#popView-'+id).removeAttr("style");
                 $('#popView-'+id).animate({right:'+=380px'});//菜单块向you移动
                 $("#popid-"+id).val("show");
        	}else{
        		$('#popView-'+id).animate({right:'-=380px'},function(){
                    $('#popView-'+id).attr("style","display:none");
                    $("#popid-"+id).val("hide");
                }); //菜单块向左移动
        	}
        }
        //将所有的都隐藏起来
        function hidebox(){
        	$(".huati-list-items").find(".huati-caozuo-hide").each(function(){
        		if($(this).find(".hidebox").val() =="show"){
        			$(this).parent().animate({right:'-=380px'},function(){
                        $('#popView-'+id).attr("style","display:none");
                        $(this).find(".hidebox").val("hide")
                    });
        		}
        	});
        }
        /*将表情符转意过来*/
        function replace_em(str){
            str = str.replace(/\</g,'<；');
            str = str.replace(/\>/g,'>；');
           // str = str.replace(/\n/g,'<；br/>；');
            str = str.replace(/\[em_([0-9]*)\]/g,'<img src="${basepath}/static/plugins/qqface/face/$1.gif" border="0"  style="width:24px;height:24px"/>');
            return str;
        }
        //逐个转意的方法
        function replace_one(){
        	$(".commentList").find(".contenttext").each(function(){
    			var html = replace_em($(this).html().toString());
    			$(this).html(html);
        	});
        }
        
        function hidebtnbox(thi,topicid,uid){
            var flag=$(thi).attr("dotype");
          	 $.ajax({
           		url:"${basepath}/m/ixin/study/clickpraise.json",
           		type:"POST",
           		data:{"restype":"2","resid":topicid},
           		success:function(data){
           			if(data.uid != null||data.uid!=""){
            			if (flag==1){
            				if($(".saypraise_"+topicid).html() == undefined){
            					var html=[];
            					html.push("<i class='fa fa-heart-o' id='faheart_"+topicid+"'></i>");
            					html.push("<ul class='saypraise_"+topicid+"'>");
            					html.push("<li id='praiseuid_"+uid+topicid+"'><img src='"+basepath+"/user/avatar/"+uid+".xhtml?style=80x80'></li>");
            					html.push("</ul>");
          		 				$("#huati-customer_"+topicid).prepend(html.join(""));
          	 				}else{
          	 					var str = "<li id='praiseuid_"+uid+topicid+"'><img src='"+basepath+"/user/avatar/"+uid+".xhtml?style=80x80'></li>";
    	           				$(".saypraise_"+topicid).prepend(str);	
          	 				}
           				}else{
           					$("#praiseuid_"+uid+topicid).remove();
            				var num =$(".saypraise_"+topicid).find("li").length;
           					if(num==0){
           						$("#faheart_"+topicid).remove();
           						$(".saypraise_"+topicid).remove();
           					}
          				}
           			}else{
           				alert("操作失败");
           			}
           			
           		}
           	});
          $("#popid-"+topicid).val("hide");
           if(flag==1){
                $(thi).html('<i class="fa fa-heart-o"></i>取消赞');
                $(thi).removeAttr("dotype");
                $(thi).attr("dotype",0);
            }else{
                $(thi).html('<i class="fa fa-heart-o"></i>赞');
                $(thi).removeAttr("dotype");
                $(thi).attr("dotype",1);
            }
            $(".huati-caozuo-hide").animate({right:'-=380px'},function(){
                $(".huati-caozuo-hide").attr("style","display:none")
            }); //菜单块向左移动
        }
        /*取消绑定 事件*/
        function closezan(){
            $(".huati-caozuo-hide").animate({right:'-=380px'},function(){
                $(".huati-caozuo-hide").attr("style","display:none")
            }); //菜单块向左移动
        }
        /*弹出输入框的*/
        function openinput(str,topicid){
        	if(str == "topic"){
        		$("#submitbtn").attr("onclick","submitTopic()");
    		}else{
    			$("#submitbtn").attr("onclick","submitComment()");
    		}
        	
            $("#hid_topicid").val(topicid);
            $("ul[id='topic']").attr("id","topic_"+topicid);
            $("#hid_operate").val(str);
            $("#saytext").val("");
            if(str=="topic"){
                $("#saytext").attr("placeholder","话题...");
                }else{
                 $("#saytext").attr("placeholder","评论...");
                }
            easyDialog.open({
                container:'pinglun-input'
            });
           $("#saytext").focus();
        }
       function submitTopic(){
            var content=$.trim($("#saytext").val());
            var activityid=$("#activityid").val();
            if(content==null || content==""){
                 alert("请填写话题内容");
                }else{
                	$.ajax({
                		   type: "POST",
                		   url: basepath+"/m/ixin/topic/addtopic.json",
                		   data: "content="+content+"&activityid="+activityid,
                		   success: function(msg){
                    		   if(msg){
                        		   easyDialog.close();
                        		   window.location.href=basepath+"/m/ixin/topic/list.xhtml?activityid="+activityid;
                        		   }else{
                                      alert("添加失败");
                            	   }
                		   }
                		});
                    }
           }
       
        //提交评论
        function submitComment(){
        	var topicid=$("#hid_topicid").val();
        	var body = $.trim($("#saytext").val());
            var saytext = $.trim($("#saytext").val());
        	if (saytext.length==0){
        		alert("请填写评论内容");
        	}else{
        		$.ajax({
        		url:"${basepath}/m/ixin/comment/add.json",
        		type:"POST",
        		data:{"restype":"2","resid":topicid,"action":"1","body":body},
        		success:function(data){
        			if(data.id>0){
        				easyDialog.close();
        				if ($("#comment_"+topicid).html()==undefined){
        					var html=[];
        					html.push("<i class='fa fa-comment-o'></i>");
        					html.push("<ul class='saybox commentlist' id='comment_"+topicid+"'>");
        					html.push("<li><span class='say-name'>"+data.uname+"</span>:<span class='contenttext'>"+replace_em(data.body)+"</span></li>");
        					html.push("</ul>");
      		 				$("#huati-customer_"+topicid).append(html.join(""));
        				}else{
 	        				var str = "<li><span class='say-name'>"+data.uname+"</span>:<span class='contenttext'>"+replace_em(data.body)+"</span></li>";
	        				$("#comment_"+topicid).prepend(str); 
        				}
        			}else{
        				alert("评论失败");
        			}
        		}
        		});
        	}            $("#popid-"+topicid).val("hide");
            $(".huati-caozuo-hide").animate({right:'-=380px'},function(){
                $(".huati-caozuo-hide").attr("style","display:none")
         }); //菜单块向左移动
        }
    </script>
</body>
</html>