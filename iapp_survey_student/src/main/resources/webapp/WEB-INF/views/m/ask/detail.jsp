<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
    <head>
        <title>${question.title}</title>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
        <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="format-detection" content="telephone=no">
        <link rel="stylesheet" type="text/css" href="${basepath}/static/css/weixin-client-page1a1cdb.css">
        <link rel="stylesheet" type="text/css" href="${basepath}/static/css/easydialog.css">
        <script type="text/javascript" async="" src="${basepath}/static/js/easydialog.min.js"></script>
        <script type="text/javascript" async="" src="${basepath}/static/js/weixin-wxa-1.0.0.js"></script>
        <style>
            #nickname {
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
                max-width: 90%;
            }
            ol, ul {
                list-style-position: inside;
            }
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
        <style>
            #activity-detail .page-content .text {
                font-size: 16px;
            }
            .pice_block{display:block;clear:both;margin:0px;padding:0px;width:100%;overflow:hidden;margin-top:5px;}
            .u_photo{width:50px;display:block;overflow:hidden;}
            .u_photo img{width:60px;}
            .u_content{float:left;margin-left:5px;width:100%;padding-left:60px;
            	display:block;overflow:hidden;
            	margin-top: -70px;
            }
            .u_info{font-size:12px;display:block;overflow:hidden;width:100%;}
            .u_info .name{color:#3393f5;text-align:center;display:block;overflow:hidden;}
            .u_info .action{float:left;margin-left:8px;display:block;overflow:hidden;}
            .u_info .time{display:block;overflow:hidden;float:right;}
            .a_title{width:100%;color:#3393f5;font-size:14px;}
            .u_img{width:100%;}
            .u_img img{width:100%;}
            .u_control{color:#999;font-size:12px;}
            .u_said{font-size:14px;text-align: left;word-wrap: break-word; 
word-break: normal;}
            .spit_bar{font-size:12px;width:100%;overflow:hidden;height:12px;color:#aaa;}
            .no_more{display:block;overflow:hidden;height:50px;width:100%;background-color:#eee;color:#999;line-height:50px;text-align:center;}
        </style>
    </head>
    <body>
    <body id="activity-detail">
        <div class="page-bizinfo">
            <div class="header">
                <input type="hidden" id="hid_questionid" name="hid_questionid" value="${question.id}">
                <h1 id="activity-name">${question.title}</h1>
                <p class="activity-info">
                    <span id="post-date" class="activity-meta no-extra">${ltfun:dateLongToStringFormat(question.dateCreated,'yyyy-MM-dd')}</span>
                    <span class="activity-meta">${question.userCreated}</span>
                 
                </p>
            </div>
        </div>
        <div class="page-content">
            <div class="text">
                <p><strong>问题描述：</strong></p>
                <hr>
                <p>
                ${question.supplement}
                           </p>
                 <div class="spit_bar">
	        		<span>-----------------------------------------------------------------------------------------------</span>
	        	</div>
                <p>
                	<div style="width:100%;">
                		<span>共有${question.answer_num}条回答 </span>
                		<span class="btnGreen" style="float:right;" onclick = "open_w()">我来回答</span>
                	</div>
                </p>
               
               <div class="spit_bar">
	        		<span>-----------------------------------------------------------------------------------------------</span>
	        	</div>
	        	<c:forEach var="answer" items="${list}">
                <div class="pice_block">
	        		<div class="u_photo">
	        			<img src="${basepath}/user/avatar/${answer.author_id}.xhtml?style=80x80">
	        			<div class="u_info">
	        				<span class="name">${answer.author_name}</span>
	        			</div>
	        		</div>
	        		<div class="u_content">
	        			<div class="u_said">
	        				${answer.content}
	        			</div>
	        			<!-- 
	        			<div class="u_control">
	        				<span>评论（${answer.comment_num}）</span>
	        				<span>赞（${answer.agree_num}）</span>
	        			</div>
	        			 -->
	        		</div>
	        	</div>
	        	<div class="spit_bar">
	        		<span>-----------------------------------------------------------------------------------------------</span>
	        	</div>
	        	</c:forEach>	
            </div>
        </div>
        <script type="text/javascript">
			var html =[];
			html.push("<div class='askerror' id='lb_error' style='display: none;width:300px;'></div>");
        	html.push("<textarea style='width:290px;height:100px;resize:none;' id='content'></textarea>");
        	html.push("<div style='width:290px;display:block;text-align:center;overflow:hidden;margin-top:20px;'>");
        	//html.push('<img src = "img/xiao.png" style="float:left;">');
        	html.push("<span class='btnGreen' style='float:right;width:100px;' onclick='answer()'>提交</span>");
        	html.push("<span class='btnGreen' style='float:right;width:100px;margin-right:30px;' onclick='cancel()'>取消</span>");
        	html.push("</div>");
        	function open_w(){
        		easyDialog.open({
				  container : {
				    content : html.join("")
				  }
				});
        		$("#content").focus();
        	}
			function cancel(){
				easyDialog.close();
			}
        	function answer(){
                var content=$.trim($("#content").val());
                var questionid=$("#hid_questionid").val();
                if(content==null || content==""){
                	$("#lb_error").html("<span style='font-size:10px;width:30px;'>请在以下文本框输入您要回答的内容</span>");
          			$("#lb_error").show();
                	return;
                }{
                    $.ajax({
                        url:basepath+"/m/ask/add.json",
                        type:"POST",
                        data:{"questionid": questionid, "content": content},
                       // data:"questionid="+questionid+"&content="+content,
                        success:function(data){
                            if(data.id!=null && data.id!=""){
                                easyDialog.close();
                             /*  //拼接html
                                var html2=[];
                                html2.push(" <div class='pice_block'><div class='u_photo'>");
                                html2.push("<img src='${basepath}/user/avatar/"+data.author_id+".xhtml?style=80x80'>");
                                html2.push("<div class='u_info'><span class='name'>"+data.author_name+"</span></div></div>");
                                html2.push("<div class='u_content'> <div class='u_said'><span>"+data.content+"</span>");
                                html2.push("<div class='u_control'><span>评论（"+data.comment_num+"）</span> ");
                                html2.push("<span>赞（"+data.agree_num+"）</span>");
                                html2.push("</div></div></div><div class='spit_bar'><span>-----------------------------------------------------------------------------------------------</span></div>");
                                $(".text").append(html2);*/
                                window.location.href=basepath+"/m/ask/detail.xhtml?id="+questionid;
                                }else{
                                     alert("提交失败");
                                    }
                            }
                      });
                }
            }
        </script>
        
    </body>
</html>