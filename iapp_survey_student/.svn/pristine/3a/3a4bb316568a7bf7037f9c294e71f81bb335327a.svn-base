<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>${course.name}</title>
<meta name="hiddenWxToolbar" content="true">
<meta name="hiddenWxMenubar" content="true">
<link rel="stylesheet" href="${basepath }/static/css/320.css">
<style type="text/css">
        .detail715{
            width: 100%;
            padding: 8px;
            display: block;
            overflow: hidden;
            max-width: 720px;
            margin: 0px auto;
        }
        .detailtitle715{
            font-size: 18px;
            display: block;
            overflow: hidden;
            line-height: 36px;;
        }
        .control715{
            margin: 10px 0px;
        }
        .courseposter715{
            width: 100%;;
        }
        .gotostudybtn{
            background-color: #ffffff;
            color: #529bea;
            border: 1px solid #529bea;
            border-radius: 3px;
            display: inline-block;
            line-height: 38px;;
            width: 80px;
        text-align: center;
            float: right;
            margin-right: 10px;;
            margin-bottom: 10px;
        }
        .shuoming715{
            display: block;
            overflow: hidden;
            clear: both;
            background-color: #beeaf2;
            border: 1px solid #CEE2F2;
            padding: 10px 8px;
            margin: 10px 0px;
            padding-bottom: 30px;
        }
        .coursedetail715{
            line-height: 24px;
            clear: both;
            display: block;
        }
    </style>
</head>
<body> 
	<section class="course-detail">
		<div id="contentarea"> 
			<!--  直接跳转 -->
			<c:redirect url="${location}"></c:redirect>
<%-- <div class="detail715">
        <span class="detailtitle715">${course.name}</span>
        <c:if test="${empty course.cover}"><img class="courseposter715" src="<%=Constant.IMG_SERVER_DOWNLOAD%>default_course_cover" /></c:if>
	    <c:if test="${not empty course.cover}"><img class="courseposter715" src="<%=Constant.IMG_SERVER_DOWNLOAD%>${course.cover}" onerror="javascript:this.src='<%=Constant.IMG_SERVER_DOWNLOAD%>default_course_cover'" /></c:if>
        <div class="control715">
            <span class="gotostudybtn" onclick="toStudy()">学习</span>
            <span class="shuoming715" id="wifimsg" style="display:none;">
                	您目前没有使用WiFi网络，建议开启WiFi的环境下进行学习。
            </span>
        </div>
        <p class="coursedetail715">
            ${course.descript }
        </p>
    </div> --%>
			<!--正文的内容 end-->
			<!--评论 start-->
			<section class="discuss-box" id="discuss-box"
				style="display: none; margin-bottom: 100px;">
				<div class="tou">
					<!--顶部-->
					<span class="course-detail-label">课程评论</span>
					<p>
						<i class="fa fa-comment"><span id="commentTotal"></span></i>&nbsp;&nbsp;&nbsp;&nbsp;
						<!-- <i class="fa fa-eye">(0)</i> -->
					</p>
				</div>
				<div class="discuss-box-list">
					<ul id="commentList">

					</ul>
					<button type="button" class="btn btn-danger btn-lg btn-block"
						id="moreComment" style="display: none;">加载更多</button>
				</div>
			</section>


		</div>


		<!--评论 end-->
		<footer class="navbar-fixed-bottom">
			<input type="text" class="form-control" id="discuss"
				placeholder="我来评论···" style="display: none;">
				 <span
				class="btn btn-default biaoqing" id="biaoqing"
				style="float: left; margin-left: 20px; display: none;"><i
				class="fa fa-smile-o"></i></span> 
				<span class="btn btn-default"
				id="btn"><i class="fa fa-comment"></i><span id="commentNum"></span></span> <span class="btn btn-default" id="btn-back" style="display: none;"><i
				class="fa fa-reply"></i></span> 
				<span class="btn btn-default"
				id="addComment" style="display: none;" onclick="sub()">发表</span> <span
				class="btn btn-default" id="zan"><i class="fa fa-thumbs-up"></i></span>
		</footer>
	</section>
	<script type="text/javascript"
		src="${basepath}/static/plugins/qqface/jquery.qqFace.weixin.js"></script>
	<script type="text/javascript">
	
	function toStudy(){
		var url = "${location}";
		window.open(url);
	}
 
    $(function(){ 
        $('.biaoqing').qqFace({
            assign:'discuss', //给输入框赋值
            path:'${basepath}/static/plugins/qqface/face/'    //表情图片存放的路径
        });
    }); 
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
    	$("#commentList").find(".contenttext").each(function(){
			var html = replace_em($(this).html().toString());
			$(this).html(html);
    	})
    }
    var resid="${course.id}";
    var restype=1;
    var praisenum="${ajy:praiseTotal(course.id,1)}";
    if(praisenum=="0"){
        $(".fa-thumbs-up").html("(0)");
        }else{
            $(".fa-thumbs-up").html("("+praisenum+")");
            }

    $(".fa-thumbs-up").mouseover(function(){
    	 $(".fa-thumbs-up").css("cursor","pointer");
        });
    $(".fa-thumbs-up").click(function(){
    	$.ajax({
    		   type: "POST",
    		   url: "${basepath}/m/study/clickpraise.json",
    		   data: "resid="+resid+"&restype="+restype,
    		   success: function(msg){
                  if(msg.error=="uiderror"){
                      alert("请先登录");
                      }
        		   if(msg.isok=="true"){
            		    if(msg.num=="0"){
                            $(".fa-thumbs-up").html("(0)");
                		    }else{
                              $(".fa-thumbs-up").html("("+msg.num+")");
                    		    }
            		   }else if(msg.isok=="false"){
                		   
                		   }
    		   }
    		});
        });

    	var isShowComment = false;
    	var commentTotal = 0;
    	var currentPage = 0;
    	var pageSize = 10;
    	
    	function getCommentTotal(){
        	$.get("${basepath}/m/comment/count/1/${course.id}.json",function(data,status){
        		commentTotal = data;
        		showCommentTotal();
        	  });
        }
        function showCommentTotal(){
        	$("#commentNum").html("("+commentTotal+ ")");
        	$("#commentTotal").html("("+commentTotal+ ")");
        }
        getCommentTotal();
        
        $("#moreComment").click(function(){
        	page(currentPage);
        });
    	
		function page(i){
			$.ajax({
        		url:"${basepath}/m/comment/list.list",
        		type:"GET",
        		data:{"restype":"1","resid":"${course.id}","page":i,"size":""+pageSize},
        		success:function(data){
        			$("#commentList").append(data);
        			isShowComment = true;
        			replace_one();
        			if(commentTotal>i*pageSize){
        				currentPage = i+1;
            			$("#moreComment").show();
        			} else {
        				$("#moreComment").hide();
        			}
        		}
        	});
		}
		
		function showBtn(){
			$("#btn").show();
			$("#btn-back").hide();
			$("#addComment").hide();
			$("#zan").show();
			$("#discuss").hide();
		}
		
		function showBtnBack(){
			$("#btn-back").show();
			$("#btn").hide();
			$("#addComment").hide();
			$("#zan").hide();
			$("#discuss").show();
		}
		
		function showAddComment(){
			$("#addComment").show();
			$("#btn").hide();
			$("#btn-back").hide();
		}
		/*控制输入框和表情还有footer高度*/
		function reheight_add(){
			var w = $("footer").width();
			$("footer").height($("footer").height()*2);
        	$("#biaoqing").show();
        	$("#discuss").attr("style","width:"+(w-40)+"px;")
		}
		function reheight_remove(){
			if($("footer").height()>50){
				$("footer").height($("footer").height()/2);
					}
			
        	$("#biaoqing").hide();
        	$("#discuss").removeAttr("style")
		}
		
        $("#discuss,#biaoqing").click(function(){
            $("#iframepage").hide();
            if(!isShowComment){
            	 page(1);
            }
            $("#discuss-box").show();
           	showAddComment();
        });
        $("#contentarea").click(function(){
            $("#iframepage").hide();
            $("#discuss-box").show();
            showBtnBack();
        });
        $("#btn").click(function(){
        	if(!isShowComment){
        		page(1);
        	}
            $("#iframepage").hide();
            $("#discuss-box").show(function(){
            	reheight_add();
            });
            showBtnBack();
        });
        $("#btn-back").click(function(){
        	reheight_remove()
            $("#iframepage").show();
            $("#discuss-box").hide();
            showBtn();
            
        });
        
        function sub(){
        	var body = $("#discuss").val();
        	if(body == null || body == ""){
        		return;
        	}
        	$.ajax({
        		url:"${basepath}/m/comment/add.json",
        		type:"POST",
        		data:{"restype":"1","resid":"${course.id}","action":"1","body":body},
        		success:function(data){
        			$("#commentList").html("");
        			$("#iframepage").hide();
                    $("#discuss-box").show();
                    showBtnBack();
                    commentTotal = commentTotal+1;
                    showCommentTotal();
                    if(commentTotal > pageSize){
                    	currentPage = 2;
                    	$("#moreComment").show();
                    }
                    $("#discuss").val("");
                    page(1);
        		}
        	});
        }
        
        $(window).resize(function(){
            resizeFrame();
        });
        function resizeFrame(){
            var height = $('#iframepage').contents().find("body").height();
            $('#iframepage').height(height);
        }
        
        function onBridgeReady(){
       	 WeixinJSBridge.invoke('getNetworkType',{},
       	 		function(e){
       	 	    	WeixinJSBridge.log(e.err_msg);
       	 	   		var network = e.err_msg.split(":")[1]; 
    				
       	 	    	if(network == "wifi"){
       	 	    		$("#wifimsg").hide();
       	 	    	}else {
       	 	    		$("#wifimsg").show();
       	 	    	}
       	 	    });
       	}
       	if (typeof WeixinJSBridge == "undefined"){
       	    if( document.addEventListener ){
       	        document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
       	    }else if (document.attachEvent){
       	        document.attachEvent('WeixinJSBridgeReady', onBridgeReady); 
       	        document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
       	    }
       	}else{
       	    onBridgeReady();
       	    
       	}
       	
    </script>
</body>
</html>