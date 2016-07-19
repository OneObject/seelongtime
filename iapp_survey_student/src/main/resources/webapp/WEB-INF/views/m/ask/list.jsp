<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<% response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","No-cache"); 
response.setDateHeader("Expires", -1);
response.setHeader("Cache-Control", "No-store");
%>
<!DOCTYPE html>
<html>
<head>
    <title>问答列表</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" type="text/css" href="${basepath}/static/css/easydialog.css">
    <script type="text/javascript" async="" src="${basepath}/static/js/easydialog.min.js"></script>
    <link rel="stylesheet" href="${basepath}/static/plugins/fonticon/css/font-awesome.min.css">
    <link rel="stylesheet" href="${basepath}/static/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${basepath}/static/plugins/bootstrap/css/bootstrap-theme.css">
    <link rel="stylesheet" href="${basepath}/static/css/320.css">
    <style type="text/css">
     	.askerror {
    	  color: #A94442;
  		  border-color:#DCA7A7;
		  padding: 5px 5px 5px 10px;
		  margin-bottom: 5px;
		  text-shadow: 0 0px 0 rgba(255, 255, 255, 0.5);
		  background-color: #E7C5C5;
		  -webkit-border-radius: 4px;
		  -moz-border-radius: 4px;
		  border-radius: 4px;
		} 
    </style>
</head>
<body>
<div class="ask-box">
    <img class="ask-poster" src="${basepath }/static/img/ask.png">
    <div class="havequestion">
        <span class="btn btn-success btn-block" onclick = "open_w()">我要提问</span>
    </div>
    <div class="asklist">
        <ul id="questionlist">
        	<c:forEach var="question" items="${list}">
            <li>
                <div class="anask" onclick="detail('${question.id}')">
                    <div class="ask-detail">
                       <span class="ask-title">${question.title}</span>
                       <span class="ask-detail-span">${ltfun:html2Text(question.supplement,20)}</span>
                    </div>
                    <div class="enter">
                        <i class="fa fa-chevron-right"></i>
                    </div>
                </div>
            </li>
        	</c:forEach>
        </ul>
    </div>
</div>
  <script type="text/javascript">
  	var html =[];
  	html.push("请在下面填写您要提出的问题（必填）：<br><input style='width:290px;height:30px;' id='question' onkeyup='checkquestion()'></input>");
  	html.push("<div class='askerror' id='lb_error' style='display: none;width:300px;'></div>");
	html.push("请填写问题的详细描述（可选）：<br><textarea style='width:290px;height:100px;resize:none;' id='describe'></textarea>");
	html.push("<div style='width:290px;display:block;text-align:center;overflow:hidden;margin-top:30px;'>");
	html.push("<span class='btnGreen' style='float:right;width:100px;' onclick='ask()'>提交</span>");
	html.push("<span class='btnGreen' style='float:right;width:100px;margin-right:30px;' onclick='cancel()'>取消</span>");
	html.push("</div>");
	function open_w(){
 		easyDialog.open({
		  container : {
		    content : html.join("")
		  }
		});
 		$("#question").focus();
	}
	//关闭弹出窗口
    function cancel(){
   	 easyDialog.close();
    }
    
	//验证提问的问题是否有输入
	function checkquestion(){
		var question = $.trim($("#question").val());

	}
	//使用ajax添加提问部题
  	function ask(){
  		var question = $.trim($("#question").val());
  		var describe = $.trim($("#describe").val());
		if (question.length == 0) {
  			$("#lb_error").html("<span style='font-size:10px;width:30px;'>请输入您要提问的问题</span>");
  			$("#lb_error").show();
  			return;
  		}else{
  			$("#lb_error").hide();
  			$.ajax({
				type: "POST",
				url: basepath+"/m/ask/addquestion.json",
				data: {"question":question,"describe":describe},
				success:function(data){
 					if(data.id!=null && data.id!=""){
 						var html2=[];
 						html2.push("<li>");
    					html2.push("<div class='anask' onclick='detail(\""+data.id+"\")'>");
    					html2.push("<div class='ask-detail'>");
    					html2.push("<span class='ask-title'>"+data.title+"</span>");
    					html2.push("<span class='ask-detail-span'>${ltfun:html2Text('"+data.supplement+"',20)}</span>");
    					html2.push("</div>");
    					html2.push("<div class='enter'>");
    					html2.push("<i class='fa fa-chevron-right'></i>");
    					html2.push("</div>");
    					html2.push("</div>");
    					html2.push("</li>");
  		 				$("#questionlist").prepend(html2.join(""));
						easyDialog.close();
					}else{
						alert("发表提问失败");
					}
				}
			});
  		}

  			
  	}
     function detail(id){
         window.location.href=basepath+"/m/ask/detail.xhtml?id="+id;
     } 
  </script>
</body>
</html>