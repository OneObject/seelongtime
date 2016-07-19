<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "No-cache");
	response.setDateHeader("Expires", -1);
	response.setHeader("Cache-Control", "No-store");

	// for 国药
	String domain = MwebHelper.getCurrentDomain();
	boolean isHideAddTopic = StringUtils.equals("guoyao", domain);
	pageContext.setAttribute("isHideAddTopic", isHideAddTopic);
%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>话题讨论</title>
<meta name="viewport"
	content="initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="stylesheet"
	href="${basepath}/static/plugins/fonticon/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${basepath}/static/m/new/plugins/shixy/dist/Jingle.css">
<link rel="stylesheet"
	href="${basepath}/static/m/new/css/general.css?v=2">
<script type="text/javascript">
	if (top.location != self.location) {top.location=self.location;}
    var basepath = "${basepath}";
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
            	//J.showToast('打开失败，请重试',"toast",1500);
            }
        }
        function init(thi, evt){
            var dsrc = thi.getAttribute("data-src");
            var gid = thi.getAttribute("data-gid");
            if(dsrc && gid){
                imgsSrc[gid] = imgsSrc[gid]||[];
                imgsSrc[gid].push(dsrc);
                thi.addEventListener("tap", function(){
                    	reviewImage(dsrc, gid);
                    
                }, false);
            }
        }
        return init;
    })(); 
    </script>

	    <style type="text/css">
    	.add-header{border-bottom:0; box-sizing: content-box;width:100%;height:38px;line-height:38px;padding:6px 0px;text-align:center;font-size:16px;color:#fff;position:fixed;z-index:50;top:0px;left:0px;}
    	.add-header .back{width:44px;height:38px;line-height:38px;position:absolute;left:0px;top:9px;}
		.add-header .back i{font-size:24px;}
		.add-header .back a{color:#fff;width:44px;height:38px;line-height:38px;display:block;}
		.add-header span.addWrap{height:38px;width:70%;text-align:center;white-space:nowrap;text-overflow:ellipsis;display:block;margin:0 auto;line-height:38px;overflow:hidden;}
    	#topic-list{margin-top:50px !important;}
    	#publish-topic{margin-top:50px !important;}
    	#topic-detail{margin-top:50px !important;}
    </style>
</head>
<body>

		<header  class="add-header ctl_header">
    	 <div class="back"><a href="javascript:void(0);" onclick="myGoBack();" ><i class="fa fa-angle-left"></i></a></div> 
     <span class="addWrap">话题讨论</span>
		</header> 
	<!---侧边栏容器 start--->
	<div id="aside_container">
		<aside id="index_aside" data-position="left" data-transition="reveal"
			data-show-close="false">
			<!--侧边栏 这里放置导航-->
			<a href="#list_section" data-target="section">列表页</a>
		</aside>
		<aside id="main_aside" class="aside-list" data-position="right"
			data-transition="reveal" data-show-close="false">
			<img src="../static/img/tou.png"> <a href="#main_aside"
				data-target="menu" data-icon="question">我的课程</a> <a
				href="#main_aside" data-target="menu" data-icon="question">我的考试</a>
			<a href="#main_aside" data-target="menu" data-icon="question">我的积分</a>
			<a href="#main_aside" data-target="menu" data-icon="question">我的作业</a>
		</aside>
	</div>
	<!---侧边栏容器 end--->
	<!--页面容器     start --->
	<div id="section_container">
		<section id="topic_list_section" class="active">
			<!--<header>-->
			<!--&lt;!&ndash;<nav class="left">&ndash;&gt;-->
			<!--&lt;!&ndash;<a data-target="menu" data-icon="menu" href="#index_aside"></a>&ndash;&gt;-->
			<!--&lt;!&ndash;</nav>&ndash;&gt;-->
			<!--<h1 class="title">Jingle</h1>-->
			<!--<nav class="right">-->
			<!--<a href="#main_aside" class="" data-target="menu" data-icon="menu"></a>-->
			<!--</nav>-->
			<!--</header>-->
			<footer class="otherfooter">
				 <!-- <a data-target="article" href="#topic-list" class="secected goback"
					id="goback" style="display: none"><i class="fa fa-angle-left"
					style="font-size: 32px;"></i></a>  -->
					
				<c:if test="${empty isHideAddTopic || !isHideAddTopic}">
					 <!-- <a id="my_back" class="app_back" href="javascript:window.history.go(-1);" style="display: inline-block;position:absolute;left:0px;top:0px;width:50px;height:50px;line-height:50px;text-align:center;color:#529BEA;"><i class="fa fa-angle-left" style="font-size: 32px;"></i></a> -->
					<a data-target="article" href="#publish-topic" class="secected" 
						id="publish" style="display: inline-block;position:absolute;left:50%;top:0px;margin-left:-77px;width:154px;"><i class="fa fa-edit"
						style="font-size: 20px; margin-top: 16px;"></i><span
						style="font-size: 20px;">发表话题</span></a>
				</c:if>
				<!-- <a class="goback" style="display: none"></a> <a class="goback"
					style="display: none"></a> -->
				<!--<a  href="#" id="layout-btn-getmore" class="secected"><i class="fa fa-ellipsis-h" style="font-size: 24px;margin-top: 16px;"></i></a>-->
			</footer>
			<article id="topic-list" class="active" data-scroll="true">
				<!---do it yourself --->
				<div>
					<div class="graybg">
						<div class="top-header">

							<c:choose>
								<c:when test="${empty activityInfo }">
									<%--没有关联活动 --%>
									<%
										if ("aland".equals(domain)) {
									%>
									<img src="http://imweb.qiniudn.com/aland.png">
									<div class="top-header-right">
										<h1>学习成就梦想</h1>
										<span>大家一起来讨论吧</span>
									</div>
										<%
											}else{
										%>
										<c:if test="${empty topicConfig }">
										<img src="${basepath}/static/m/img/huati.png">
										<div class="top-header-right">
											<h1>话题讨论区</h1>
											<span>大家一起来讨论吧</span>
										</div>
										</c:if>
										
										<c:if test="${not empty topicConfig}">
										  <c:if test="${not empty topicConfig.cover}">
										  <img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${topicConfig.cover}">
										  </c:if>
										  <c:if test="${empty topicConfig.cover}">
										  <img src="${basepath}/static/m/img/huati.png">
										  </c:if>
										  <div class="top-header-right">
											<h1>
											<c:if test="${not empty topicConfig.title}">${topicConfig.title}</c:if>
											<c:if test="${empty topicConfig.title}">话题讨论区</c:if>
											</h1>			
											<span>
											<c:if test="${not empty topicConfig.descript}">${topicConfig.descript}</c:if>
											<c:if test="${empty topicConfig.descript}">大家一起来讨论吧</c:if>
											</span>
										</div>
										</c:if>
										<%
										   }
										%>
								</c:when>
								<c:when test="${not empty activityInfo }">
									<%--关联活动 --%>

									<%-- for 国药 --%>
									<c:if test="${ false && activityInfo.domain=='guoyao' }">
										<c:if test="${not empty  activityInfo.picUrl}">
											<img
												src="<%=Constant.IMG_SERVER_DOWNLOAD%>${activityInfo.picUrl}-320x180"
												style="width: 100%; height: 180px"
												data-src="<%=Constant.IMG_SERVER_DOWNLOAD%>${activityInfo.picUrl}"
												data-gid="${activityInfo.id}"
												onload="preViewImg(this,event);">
										</c:if>
										<c:if test="${empty activityInfo.picUrl }">
											<img src="${basepath}/static/m/img/huati.png">
										</c:if>
										<h4>${activityInfo.name}</h4>
									</c:if>

									<c:if test="${not empty  activityInfo.picUrl}">
										<img
											src="<%=Constant.IMG_SERVER_DOWNLOAD%>${activityInfo.picUrl}-180x180">
									</c:if>
									<c:if test="${empty activityInfo.picUrl }">
										<img src="${basepath}/static/m/img/huati.png">
									</c:if>
									<div class="top-header-right">
										<h1>${activityInfo.name}</h1>
										<span>大家一起来讨论吧</span>
									</div>


								</c:when>

							</c:choose>


						</div>


						<input type="hidden" id="hid_topicid" name="hid_topicid">
						<ul class="topic-list" id="topiclist">
							<%-- 列表内容 --%>
							<%--	<%@ include file="/WEB-INF/views/m/ntopic/list.jsp"%> --%>
							<%-- end列表内容 --%>
						</ul>

						<div style="display: none" id="nothing">
							<h1 class="nothing">还没有话题，赶快发布一个吧！</h1>
						</div>
						<div class="refresh-box">
							<span class="button light block" id="load-more"
								style="display: none" ontouchstart="changeblue(this)"
								ontouchend="changewiht(this)">加载更多···</span> <span
								class="loading-img" id="load-img" style="display: none"><i
								class="fa fa-spinner fa-spin"></i></span>
						</div>




						<!--<div class="kongbai">-->
						<!--&lt;!&ndash;空白区域:这个区域是专门放置gototop按钮的，不能去掉&ndash;&gt;-->
						<!--<span class="gotop">-->
						<!--</span>-->
						<!--</div>-->
					</div>
				</div>

			</article>
			<article id="publish-topic" data-scroll="true">
				<div>
					<textarea class="topic-word" id="saytext"></textarea>
					<div style="width: 100%;">
						<span class="qqface" id="emotion" onclick = "foucusout()"> <i class="fa fa-smile-o"></i></span>
						<span class="btnsure" ontouchstart="changeblue(this)"
							ontouchend="changewiht(this)" id="submitTopic">发表</span>
					</div>
					<div style="position: relative; margin-top: 80px;">

						<div class="image-box" id="upload"></div>
						<p style="margin-top: -200px; font-size: 10px; color: #cccccc">最多可上传三张图片</p>
					</div>
			<%--
					<div style="position: relative; margin-top: 10px;">
						<div id="audio_upload"></div>
						<p style="font-size: 10px;color: #cccccc;display: block;clear: both;margin-top: -10px;">选择音频</p>
					</div>
			--%>	
				</div>
			</article>
			<article id="topic-detail" data-scroll="true">
				<!-- 详情开始 -->

				<!-- 详情结束 -->
			</article>
			<script type="text/html" id="replayinput">
            <div style="padding:16px 8px 0px;" id="inputbox">
                <textarea class="topic-word" id="commentinfo"></textarea>
                <div id="popup_btn_container" class="popup_btn_container"><a onclick="J.closePopup()" >取消</a><a id="makesure">确定</a></div>
            </div>
        </script>
		</section>
	</div>
	<!--页面容器     end --->
	<script type="text/javascript"
		src="${basepath}/static/m/new/plugins/shixy/libs/zepto.js"></script>
	<script type="text/javascript"
		src="${basepath}/static/m/new/plugins/shixy/libs/iscroll.js"></script>
	<script type="text/javascript"
		src="${basepath}/static/m/new/plugins/shixy/libs/template.min.js"></script>
	<!--<script type="text/javascript" src="../static/plugins/shixy/dist/Jingle.debug.js"></script>-->
	<script type="text/javascript"
		src="${basepath}/static/m/new/plugins/shixy/libs/zepto.touch2mouse.js"></script>
	<script type="text/javascript"
		src="${basepath}/static/m/new/js/Jingle.debug.js"></script>
	<script type="text/javascript"
		src="${basepath}/static/m/new/plugins/qqface/jquery.qqFace.js"></script>

	<script type="text/javascript"
		src="${basepath}/static/plugins/Huploadify/jquery.js"></script>
	<script type="text/javascript">
jQuery.noConflict();
</script>
	<script type="text/javascript"
		src="${basepath}/static/plugins/Huploadify/jquery.HuploadifyNew.js"></script>



	<script type="text/javascript">
    $(function(){
    	initApp();
       
        /* 右侧滑动菜单  
        $("section").on("swipeLeft",function(){
            J.Menu.show("#main_aside");
        });*/
      
        bindfunction(); //绑定点击事件
        /*QQ表情支持*/
        $('#emotion').qqFace({
            id : 'facebox',
            assign:'saytext',
            path:'${basepath}/static/m/new/plugins/qqface/face/'	//表情存放的路径
        });
        /*
        J.Refresh({
            selector : '#topic-list',
            type : 'pullDown',
            pullText : '下拉刷新',
            releaseText : '松开加载最新',
            //refreshTip : '最后一次拉的人：<span style="color:#e222a5">骚年</span>',
            callback : function(){
                var scroll = this;
                refreshList();
                setTimeout(function () {
                    scroll.refresh();
                    J.showToast('更新成功','success');
                }, 2000);
            }
        });
        */
    });
  //  function textfocus(){
  //  	$("#saytext").focus();
   // }
    function bindfunction() {
        $('#layout-btn-getmore').tap(function(){
            J.popup({
                html: '<div style="height: 100px;line-height: 100px;font-size: 20px;font-weight: 600;text-align: center;">这里展示更多功能</div>',
                pos : 'bottom-second',
                showCloseBtn : false
            });
        })
        $("#publish").tap(function(){
            $("#goback,.goback").show();
            $("#publish").hide();
            $("#my_back").hide();
            $("#publish-topic").addClass("active");
            $("#topic-list").removeClass("active");

			pageFlag = 'page3';  
          //  $("#saytext").focus();
        });
        $("#goback").tap(function(){
            $("#publish").show();
            $("#my_back").show();
            $("#goback,.goback").hide();
            $("#topic-list").addClass("active");
            $("#publish-topic").removeClass("active");
        });

    }
    
    function changeblue(o) {
        $(o).css("background-color","#529bea");
        $(o).css("color","#ffffff");
        $(o).css("border-radius","8px");
        $(o).css("background-clip","padding-box");
    }
    function changewiht(o){
        $(o).css("background-color","#eeeeee");
        $(o).css("color","#529bea");
        $(o).css("border-radius","8px");
        $(o).css("background-clip","padding-box");
    }
    /*打开评论的窗口*/
    function openreplay(thi){
            $("#hid_topicid").val($(thi).attr("c"));                 
            J.popup({
                tplId : 'replayinput',
                pos : 'center',
                clickMask2Close : false,// 是否点击外层遮罩关闭popup
                showCloseBtn : false// 是否显示关闭按钮
            });

            $("#makesure").tap(function(){
            	makesure();
            });
    }
   
    function removezan(_this) {
        //$("#topic-list").append('<span id = "removezan" style="display: block;height: 40px;color: #529bea;font-size: 24px;font-weight: bold;position: absolute;opacity: 0;">- 1</span>');
        //var postion = $(_this).offset();
       /* $("#removezan").css("top",postion.top+25);
        $("#removezan").css("left",postion.left);
        $("#removezan").animate({
            opacity:1
        },200);*/
        var topicid=$(_this).attr("data-topicid");
        var num=parseInt($(_this).attr("data-zannum"));
        $.ajax({
       		url:"${basepath}/m/ixin/study/clickpraise.json",
       		type:"POST",
       		data:{"restype":"2","resid":topicid},
       		success:function(data){
       			if(data.uid != null||data.uid!=""){
       			 $("#removezan").animate({
                     opacity:0
                 },200);
       			 
                 $("#detail_zan_icon_"+topicid).addClass("fa-thumbs-o-up").removeClass("fa-thumbs-up");
                 $("#list_zan_icon_"+topicid).addClass("fa-thumbs-o-up").removeClass("fa-thumbs-up");
                 
                 var msg = num -1 ;
                 if(num<=1){
                	 msg = "赞";
                 }
                 $("#detail_zan_lb_"+topicid).text(msg);
                 $("#list_zan_lb_"+topicid).text(msg);
                 
                 $("#detail_zan_"+topicid).attr("call-back","dianzan(this)");
                 $("#list_zan_"+topicid).attr("call-back","dianzan(this)");
                 
                 $("#detail_zan_"+topicid).attr("data-zannum",num-1);
                 $("#list_zan_"+topicid).attr("data-zannum",num-1);
                 
                 
                 J.showToast('取消赞成功',"toast",1500);
       			}else{
       				J.showToast('取消赞失败',"toast",1500);
           		}
       		},
       		error:function(){
       			J.showToast('取消赞失败',"toast",1500);
           		}
        });
    }
    /*输入QQ表情支持*/
    function inputqqface(){
        var str = $("#saytext").val();
    }
    //查看结果
    function replace_em(str){
       // str = str.replace(/\</g,'&lt;');
       // str = str.replace(/\>/g,'&gt;');
       // str = str.replace(/\n/g,'<br/>');
        str = str.replace(/\[em_([0-9]*)\]/g,'<img src="${basepath}/static/m/new/plugins/qqface/face/$1.gif" style="width: 18px;height: 18px;" border="0" />');
        return str;
    }
    function showface(){
//        测试用的方法
       $("#showface").html($("#saytext").val());
        $("#showface").html(replace_em($("#showface").html())) ;
    }
    
    function showDetailFooter(){
        var html = [];
       /*  html.push('<a data-target="article" id="gogoback" href="#topic-list" class="secected goback" onclick="goback()"><i class="fa fa-angle-left" style="font-size: 32px;"></i></a>');  */
      <c:if test="${empty isHideAddTopic || !isHideAddTopic}">
        html.push('<a data-target="article" href="#publish-topic" class="secected" id="toreplay" style="display: none;"><i class="fa fa-edit"  style="font-size: 20px;margin-top: 16px;"></i><span style="font-size: 20px;">发表话题</span></a>');
      </c:if>
        html.push('<a onclick="openreplay()" class="secected" id="replay" style="width:120px;text-align:center;display:block;margin:0 auto;"><i class="fa fa-comment-o"  style="font-size: 20px;margin-top: 16px;"></i><span style="font-size: 20px;">发表评论</span></a>');
        html.push('<a class="replay"></a>');
        $("footer").html(html.join(""));
    }
    function goback(){
        var html = [];
/*       html.push('<a data-target="article" href="#topic-list" class="secected goback" id="goback" style="display: none"><i class="fa fa-angle-left" style="font-size: 32px;"></i></a>');
 */     <c:if test="${empty isHideAddTopic || !isHideAddTopic}">  
		 /* html.push('<a id="my_back" class="app_back" href="javascript:window.history.go(-1);" style="display:inline-block;position:absolute;left:0px;top:0px;width:50px;height:50px;line-height:50px;text-align:center;color:#529BEA;"><i class="fa fa-angle-left" style="font-size: 32px;"></i></a>');  */
        html.push('<a data-target="article" href="#publish-topic"  class="secected" id="publish" style="display: inline-block;position:absolute;left:50%;top:0px;margin-left:-77px;width:154px;"><i class="fa fa-edit"  style="font-size: 20px;margin-top: 16px;"></i><span style="font-size: 20px;">发表话题</span></a>');
     </c:if>
        html.push(' <a class="goback" style="display: none"></a>');
        html.push(' <a class="goback" style="display: none"></a>');
        $("footer").html(html.join(""));
//begin add new
		pageFlag = 'page1';
		$("#topic-list").addClass("active");
		$("#topic-detail").removeClass("active");
//end add new
        bindfunction();
    }
    
    
    
    
</script>

	<script type="text/javascript">


var activityid = "${activityInfo.id}";
var pageSize = 20;
var currentSize = 0;
var lastTimestamp = 0;//加载内容的最后一条的时间

function setLastTimestamp(time){
	lastTimestamp = time;
}
function setCurrentTopicId(id){
	$("#hid_topicid").val(id);
}

/*点赞*/
function dianzan(_this){
	 var topicid=$(_this).attr("data-topicid");
     var n=parseInt($(_this).attr("data-zannum"));
     $.ajax({
   		url:"${basepath}/m/ixin/study/clickpraise.json",
   		type:"POST",
   		data:{"restype":"2","resid":topicid},
   		success:function(data){
   			if(data.uid != null && data.uid!=""){
   				
   				
   			 $("#detail_zan_icon_"+topicid).addClass("fa-thumbs-up").removeClass("fa-thumbs-o-up");
             $("#list_zan_icon_"+topicid).addClass("fa-thumbs-up").removeClass("fa-thumbs-o-up");
             
             var num = n + 1 ;
             $("#detail_zan_lb_"+topicid).text(num);
             $("#list_zan_lb_"+topicid).text(num);
             
             $("#detail_zan_"+topicid).attr("call-back","removezan(this)");
             $("#list_zan_"+topicid).attr("call-back","removezan(this)");
             
             $("#detail_zan_"+topicid).attr("data-zannum",num);
             $("#list_zan_"+topicid).attr("data-zannum",num);
             
   			 J.showToast('赞成功',"toast",1500);
   			}else{
   				J.showToast('赞失败',"toast",1500);
       			}
   		},
   		error:function(){
   			J.showToast('赞失败',"toast",1500);
       		}
    });
}

//业务方法
function loadList(timestamp,num,activityid,append){
	$("#load-img").show();
	
	$.ajax({
		   type: "GET",
		   url:"${basepath}/m/ixin/ntopic/list.list",
		   data: {"timestamp":timestamp,"num":num,"activityid":activityid,"ltdebug":"${ltdebug}"},
		   success: function(response){
			   $("#load-img").hide();
				if(append){
					$("#topiclist").append(response);
				}else{
					$("#topiclist").html(response);
				}
				//获取加载后的数据和当前listSize记录的条数
				var totalsize = $(".topic-item").length;
				
				if(totalsize == 0 ){  //没有数据
					$("#nothing").show();	
				}else{
					if( totalsize>=currentSize+pageSize){
						$("#load-more").show();
					}
				}
				
				currentSize = totalsize;
				changeface();
				Jingle.launch();
		   },
		   error: function(){
			    $("#load-img").hide();
			 	J.showToast('加载失败','error');
		   }
		});
	
	/*
	$.get('${basepath}/m/ixin/ntopic/list.list',{"timestamp":timestamp,"num":num,"activityid":activityid,"ltdebug":"${ltdebug}"}, function(response){
		$("#load-img").hide();
		
		$("#topiclist").append(response);
		//获取加载后的数据和当前listSize记录的条数
		var totalsize = $(".topic-item").length;
		
		if(totalsize == 0 ){  //没有数据
			$("#nothing").show();	
			return;
		}
		if( totalsize>=currentSize+pageSize){
			$("#load-more").show();
		}
		
		currentSize = totalsize;
		changeface();
		Jingle.launch();
		
		});	
	*/
}

function showDetail(id){
	//J.showMask();
	pageFlag = 'page2';
	setCurrentTopicId(id);
	$("#topic-detail").html("<span class='loading-img' id='load-img'><i class='fa fa-spinner fa-spin'></i></span>");
	$.ajax({
		type:"GET",
		url:"${basepath}/m/ixin/ntopic/detail.list",
		data:{"topicid":id,"ltdebug":"${ltdebug}"},
		async:false,
		success:function(data){
			$("#topic-detail").html(data);
			changeface();
			
		}
	})
	setTimeout(function(){
		$("#topic-detail").removeAttr("data--jscroll-").removeAttr("style");
				Jingle.launch();
            },0);
	/* $.get('${basepath}/m/ixin/ntopic/detail.list',{"topicid":id,"ltdebug":"${ltdebug}"}, function(response){
		$("#topic-detail").html(response+"");
		changeface();
		Jingle.launch();

		//alert(1);
		//J.hideMask();
		}); */
	
	showDetailFooter();
}

$("#submitTopic").tap(function(){
	submitTopic();
});


//发布话题
function submitTopic(){
	var content =$.trim($("#saytext").val()); 
	
	if(!content){ //没有内容
		//alert("请输入内容");
		J.showWarn('请输入内容','error');
		return ;
	}
	
	var paths='';
	var hasImgUploading = false;

	//jQuery(".uploadify-queue-item").each(function(){
  	 $("#upload").find(".uploadify-queue-item").each(function(){
		var path = jQuery(this).data("imgpath");
		if(!path){
			hasImgUploading = true;
			return ;
		}
		paths += path+',';
	 });
	if(hasImgUploading){
		J.showWarn('图片仍在上传','error');
		return ;
	}

	var audiopaths='';
	var hasAudioUploading = false;
	$("#audio_upload").find(".uploadify-queue-item").each(function(){
	var path = $(this).find("img")[0].attributes["data-index"];
		if(!path){
			hasAudioUploading = true;
			return ;
		} 
	//audiopaths += path.value+',';
		audiopaths += path.value;
	});
	if(hasAudioUploading){
		J.showWarn('音频仍在上传','error');
		return ;
	}
	
	
	J.showMask();
	$.ajax({
		   type: "POST",
		   url:"${basepath}/m/ixin/topic/addtopic.json",
		   data: {"content":content,"activityid":activityid,"ltdebug":"${ltdebug}","cover":paths,"audiourl":audiopaths},
		   success: function(bool){
 		   		if(bool==1){
 		   			$("#saytext").val("");
 		   			location.reload();
     		   	}else if(bool == 2){
     		   		J.showWarn('话题内容还有敏感词，被屏蔽 。','error',2000);
     		   		setTimeout(function(){
     		   			location.reload();
     		   		}, 1000);
         	   	}else if(bool==0){
         	   		J.showWarn('发表失败 。','error');
             	   	}
		   }
		});
}

//发表评论
function makesure(){
	var content=$.trim($("#commentinfo").val());
    var topicid=$("#hid_topicid").val();
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
				    $("#nothing_"+topicid).hide();
				   	J.closePopup();
				 if(data.shield==1)
					{
				   	  J.showToast('评论含有敏感词，被屏蔽。',"toast",1500);
					}
				  else{
					  J.showToast('评论成功',"toast",1500);
					   	
					   	//回显 -- 话题列表页
					   	$("#comment_"+data.resid).prepend("<li><span class='replay-container'>"+data.uname+": "+data.body +"</span> <span class='replay-time'>刚刚</span></li>");
					   	$("#p_comment_"+data.resid).show();
					   	//回显-- 话题详情页
					   	var detailComment = $("#detail_comment_"+data.resid);
					   	if(detailComment){
					   		var html = [];
					        html.push('<li>');
					        html.push('<div class="replay-detail-item">');
							html.push('<img src="${basepath}/user/avatar/'+data.uid+'.xhtml?style=80x80&color=blue&r="'+Math.random()+'>');
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
					   	
					   	//评论数显示+1
					   	var lbCommentNum = $("#lb_commentnum_"+data.resid);
					   	if(lbCommentNum){
					   		var num = lbCommentNum.data("num");
					   		if(num){
					   			 num = num+1;
					   		}else{
					   			num = 1;
					   		}
					   		lbCommentNum.html(""+num+"");
					   		lbCommentNum.data("num",num);
					   	}
						var listlbCommentNum = $("#list_lb_commentnum_"+data.resid);
					   	if(listlbCommentNum){
					   		var num = listlbCommentNum.data("num");
					   		if(num){
					   			 num = num+1;
					   		}else{
					   			num = 1;
					   		}
					   		listlbCommentNum.html(""+num+"");
					   		listlbCommentNum.data("num",num);
					   	}
					   	
					   	Jingle.launch();
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


function refreshList(){
	currentSize=0;
	loadList(0,pageSize,activityid,false);
}

function initApp(){
	
	loadList(lastTimestamp,pageSize,activityid,true);
}


//绑定点击更多事件
$("#load-more").tap(function(){
    $(this).hide();
    $("#load-img").show();
    
    loadList(lastTimestamp,pageSize,activityid,true);
    
    //模拟数据请求
   /* setTimeout(function(){
        //在五秒钟之后隐藏loading动画
        $("#load-more").show();
        $("#load-img").hide();
    },5000)
    */
});



function changeface(){
	$(".topic-content").each(function(){
           $(this).html(replace_em($(this).html()));
		});
}

function foucusout(){
	$("#saytext").blur();
}
var coverpath=''; 
(function($){
	var obj = new Object();
	var attachments = [];

	//图片
    $('#upload').Huploadify({
    	auto:true,
    	fileTypeExts:'*.jpg;*.png;*.gif;*.jpeg;*.JPG;*.PNG;*.GIF;*.JPEG',
        multi:false,
        formData:{'token':'${uptoken}'},
        fileSizeLimit:10*1024,
        showUploadedPercent:false,//是否实时显示上传的百分比，如20%
        showUploadedSize:false,
        removeTimeout:60*60*1000,
        uploader:'<%=Constant.QINIU_SERVER%>',
        onUploadStart:function(){
         //  	var i = $(".uploadify-queue-item").length;
           	var i = $("#upload").find(".uploadify-queue-item").length;
	        if(i>=3)
		    {
	        	 $("#upload").find("a").hide();
				//	$("#file_upload_1-button").hide();
		    }
        },
        onInit:function(){
           // alert('初始化');
        },
        onUploadComplete:function(file,data,response){
			var i = file.index;
         	$("#progress_fileupload_1_"+i).show();
      	    //$("#progress_fileupload_1_"+i).html("100%");  //完成之后进度可显示
        	var result = eval("("+data+")");
			var path = result.url;
			var name = result.name;
			var extStart=name.lastIndexOf(".");
			var ext=name.substring(extStart,name.length).toUpperCase();
			if(ext==".BMP" || ext==".PNG" || ext==".GIF" || ext==".JPG" || ext==".JPEG"){
				var url="<%=Constant.IMG_SERVER_DOWNLOAD%>"+path+"-80x80";
				$("#pic_fileupload_1_"+i).attr("src",url);
			}
			$("#name_fileupload_1_"+i).html(name.substring(0,6)+"...");
			
			$("#fileupload_1_"+i).data("imgpath",path);//把地址存在div的 data属性里待用
			
			//alert($(".uploadify-queue-item").length);  //获得所有文件个数
        },
        onCancel:function(file){
     		//$("#select_btn_"+file.index).val("");
     		//var i = $(".uploadify-queue-item").length;
     		var i = $("#upload").find(".uploadify-queue-item").length;
	      	if(i<=3)
	       	{
	      		//alert($("#file_upload_1-button")+'该出现了,可以在上传');
			//$("#file_upload_1-button").show();
	      		 $("#upload").find("a").show();
	       	}
        }
    });

    //声音
    $('#audio_upload').Huploadify({
    	auto:true,
    	fileTypeExts:'*.mp3;*.MP3;*.m4a;*.M4A',
        multi:false,
        formData:{'token':'${uptoken}'},
        fileSizeLimit:10*1024,
        showUploadedPercent:true,//是否实时显示上传的百分比，如20%
        showUploadedSize:false,
        removeTimeout:60*60*1000,
        uploader:'<%=Constant.QINIU_SERVER%>',
        onUploadStart:function(){
           	var i = $("#audio_upload").find(".uploadify-queue-item").length; 
	       if(i>=1)
	 	    {
	    	   $("#audio_upload").find("a").hide();
	 	    }
        },
        onInit:function(){
           // alert('初始化');
        },
        onUploadComplete:function(file,data,response){
			var i = file.index;
         	$("#progress_fileupload_1_"+i).show(); 
        	var result = eval("("+data+")");
			var path = result.url;
			var name = result.name;
			var extStart=name.lastIndexOf(".");
			var ext=name.substring(extStart,name.length).toUpperCase();
			if(ext==".mp3" || ext==".MP3" || ext==".m4a" || ext==".M4A"){
				var url="<%=Constant.IMG_SERVER_DOWNLOAD%>"+path; 
				//$("#audioUrl").attr("value",$("#audioUrl").attr("value") + "," +path); 
			 	$("#pic_fileupload_1_"+i).attr("data-index",path);
			} 			
        },
        onCancel:function(file){ 
        	var i = $("#audio_upload").find(".uploadify-queue-item").length;
	      	if(i<=1)
	       	{
	      		 $("#audio_upload").find("a").show();
	       	}
        }
    });
  
 
})(jQuery);

var pageFlag = 'page1';  //page1:首页，page2：详情，page3：提问

function myGoBack() {
	
	switch (pageFlag) {
		case 'page1':
			window.history.go(-1);
			break;
		case 'page2':
				goback();
			break;
		case 'page3':
				$("#publish").show();
				$("#my_back").show();
				$("#goback,.goback").hide();
				$("#topic-list").addClass("active");
				$("#publish-topic").removeClass("active");
				pageFlag = 'page1';
			break;
		default:
			console.log('error');
			break;
	}
	
}
</script>

	<script type="text/javascript">
    document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
    	WeixinJSBridge.call('hideToolbar');
    	WeixinJSBridge.call('hideOptionMenu');
    });


</script>

</body>
</html>
<%@ include file="/WEB-INF/include/analysis.jsp"%>