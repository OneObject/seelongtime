<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<% response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","No-cache"); 
response.setDateHeader("Expires", -1);
response.setHeader("Cache-Control", "No-store");
%>
<!DOCTYPE html>
<html lang="zh-CN">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="format-detection" content="telephone=no" />
     
    <link rel="stylesheet"	href="${basepath}/static/plugins/font-awesome-4.1.0/css/font-awesome.min.css" />
	<link rel="stylesheet" href="${basepath}/static/m_h5/css/common.css">
	<link rel="stylesheet" href="${basepath}/static/m_h5/css/color.css">
	<title>${taskuser.creator }的提交</title>
</head>
<body>
	<header class="ctl_header">
    	<div class="back"><a href="javascript:void(0);" onclick="goback();"><i class="fa fa-angle-left"></i></a></div>
        ${taskuser.creator }的提交
	</header>
  <article class="zuoye ctl_cont">
    	<section class="subInfo">
        	<h2>${task.title }</h2>
            <p>${task.taskrequire}</p>
        </section>
        <section class="detailBox1">
        	<ul>
            	<li>${taskuser.creator }的提交</li>
                  <li>提交时间： ${ltfun:dateLongToStringFormat(taskuser.createtime, "yyyy-MM-dd HH:mm") }</li>
                <p>${taskuser.content}</p>
            </ul>
        	<div>
            <c:forEach items="${taskuser.attachments }" var="attachment" varStatus="status">
            	<img style="width: 442px; height: 442px;" class="img-rounded" src="<%=Constant.IMG_SERVER_DOWNLOAD %>${attachment.url}" data-src="<%=Constant.IMG_SERVER_DOWNLOAD%>${attachment.url}-1024x1024" data-gid="${task.id}" onclick="preViewImg4Doc('${task.id}', ${status.index});" data-index="${status.index }" onerror="javascript:this.src='${basepath}/static/img/task/fujian.png'">
      		</c:forEach>        
            </div>                          
        </section>
        <div style="clear:both;"></div>    
        <section class="comment1">
        <c:if test="${taskuser.status eq 1 }"><%-- 未批改 --%>
	     	<ul>  
				<li style="font-size: 16px;">暂无点评<span style="color:#f0ad4e;">未批改</span></li>
	     	</ul>
        </c:if>    
        <c:if  test="${taskuser.status ne 1}"><%-- 已经批改 --%>
        	<ul>
            	<li>点评<span>得分：<label>${taskuser.score}</label></span></li>
                <li>点评时间： ${ltfun:dateLongToStringFormat(taskuser.updatetime, "yyyy-MM-dd HH:mm") }
               <c:if test="${taskuser.status eq 3}">
                <span class="b"><i class="fa fa-check"></i>通过</span>
               </c:if>
               <c:if test="${taskuser.status eq 2}">
                <span class="a"><i class="fa fa-times"></i>未通过</span>
               </c:if>
                </li>
                <li> ${taskuser.comment}</li>      
            </ul>
             <c:if test="${taskuser.status eq 2 and task.informtask eq 1 and 'user' eq usertype}">
             	 <span style="margin-top:20px;" class="uploadSub" onclick="recommit('${taskuser.id}')">再次提交</span>   
             </c:if>
        </c:if>
        </section>
    </article>
   
 <script type="text/javascript" src="${basepath}/static/m_h5/js/jquery-2.1.1.min.js"></script>
   <script type="text/javascript">
	 var imgDate = {};//二位数组，保持图片的组别，顺序和地址信息
		$(function(){
			var orientationEvent;
			var supportsOrientationChange = "onorientationchange" in window;
			var w=$(".detailBox1 div").width()-40;
			var len=$(".detailBox1 div img").length;
			var imgArr=$(".detailBox1 div img");
			var j;
			var imgW=Math.floor(w/3);
			for(var i=0;i<len;i++){
				j=i+1;
				if(j%3==0){
					$(imgArr[i]).css({"margin-right":"0px"});
					}
				$(imgArr[i]).width(imgW);
				$(imgArr[i]).height(imgW);				
				}


			orientationEvent = supportsOrientationChange ? "orientationchange" : "resize";   
			window.addEventListener(orientationEvent, function() {
				var w=$(".detailBox1 div").width()-40;
				var len=$(".detailBox1 div img").length;
				var imgArr=$(".detailBox1 div img");
				var j;
				var imgW=Math.floor(w/3);
				for(var i=0;i<len;i++){
					j=i+1;
					if(j%3==0){
						$(imgArr[i]).css({"margin-right":"0px"});
						}
					$(imgArr[i]).width(imgW);
					$(imgArr[i]).height(imgW);				
					}			
			}, false);
		
			    var imgs = document.getElementsByTagName("img"); 
			    for(var i = 0; i < imgs.length; i++){
			    	var img = imgs[i];
			      	var index = img.getAttribute("data-index");//存放索引
			    	var gid = img.getAttribute("data-gid");//组号 data-gid 存放组号
			    	var dsrc = img.getAttribute("data-src");//地址 
			    	if(index && gid && dsrc){ 
			    		imgDate[gid] = imgDate[gid]||[]; //该组不存在则创建
			    		imgDate[gid][index] = dsrc;//按照索引设置地址
			    	}
			    } 
			});
 
	   
	     //点击图片时调用，groupid组号，index索引号
	    function preViewImg4Doc(groupid, index) {  
	    	var wxJSbridge = window.WeixinJSBridge || parent.window.WeixinJSBridge;
	    	if (typeof wxJSbridge != 'undefined') {
	    		wxJSbridge.invoke('imagePreview', {
	                'current' : imgDate[groupid][index],//当前地址
	                'urls' : imgDate[groupid] //组
	            });
	        }else{
	           // alert("请在微信中查看", null, function(){});
	        }
	    }
	    

	    //跳回重新提交作业页面
	    function recommit(id){
			window.location.href="${basepath}/m/h5/task/detail.xhtml?recommit=true&id="+id;
		}

	    function goback(){
	    	window.location.href="${basepath}/m/h5/task/index.xhtml";
	    }
    </script>
    
   	<style type="text/css">
    	body{background:#f8f8f8;}
    </style> 
</body>
</html>
