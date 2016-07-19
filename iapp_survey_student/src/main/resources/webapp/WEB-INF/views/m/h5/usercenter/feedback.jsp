<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="format-detection" content="telephone=no" />
   
<title>${model eq '0'?'意见反馈':'联系我们'}</title>
</head>

<body>
	

	<header  class="ctl_header">
	<c:if test="${model eq '0'}">
    	<div class="back"><a href="javascript:history.go(-1);"><i class="fa fa-angle-left"></i></a></div>
		意见反馈
	</c:if>
	<c:if test="${model eq '1'}">
    	<div class="back"><a href="javascript:history.go(-1);"><i class="fa fa-home"></i></a></div>
		联系我们
	</c:if>

    </header>
    
    <article class="scroll ctl_cont">
    <div class="radio">
    	<span class="checked" value="0">建议</span>
        <span value="1">投诉</span>
    </div>
    <section class="msg">
   
    	<div>
        	<textarea id="context"  placeholder="欢迎您提出使用平台的感受和建议"></textarea>
        </div>
    </section>
    <a id="save"  onclick="save();" class="sub">提交</a>
    
    </article>
    <input type="hidden" id="type" value="0">
<script type="text/javascript" >
$(function(){
	var tWidth=$(window).width()-36;
	$("textarea").width(tWidth);
	$("div.radio span").click(function(){
		var value;
		
		$(this).addClass("checked").siblings().removeClass("checked");
		value=$(this).attr("value");
		$("#type").val(value);
		
		});

	});
function save(){
	var context = $.trim($("#context").val());
	var type = $("#type").val();
	if(context==""||context==null){
		showTishi("请输入内容");
		return;
	}
	$('#save').attr("onclick","");
	$.ajax({
		   async:false,
	       type:"POST",
	       url:"${basepath}/m/h5/feed/save.json",
	       data:{"context":context,"type":type},
	       success:function(data){
				if(data){
				//	showTishi("感谢您的反馈");
					 showMyTishi("感谢您的反馈", "#fff" , "#000" , 85);
					setTimeout(function(){
						window.location.href="${basepath}/m/h5/usercenter/index.xhtml";
					},1000);
				}else{
					$('#save').attr("onclick","save();");
					showTishi("保存失败");
				}
	       },
		   error:function(){
			   $('#save').attr("onclick","save();");
			   showTishi("保存失败");
			}

		});
	
	
}


</script>
</body>
</html>
