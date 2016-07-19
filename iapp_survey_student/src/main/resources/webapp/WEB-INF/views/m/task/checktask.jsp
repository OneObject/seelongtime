<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<!DOCTYPE html>
<html>
<head>
    <title>待批改列表</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="${basepath}/static/css/easydialog.css">
    <link rel="stylesheet" href="${basepath}/static/css/320.css">
    <script src='${basepath }/static/js/commonValidate.js' type='text/javascript' ></script> 
</head>
<body>
    <section class="check-task">
        <header>
        <!--页头部分 start-->
            <img src="${basepath}/static/img/task/task.png" class="img-rounded">
            <input type="hidden" id="hid_id" name="hid_id" value="${task.id}">
            <div class="task-miaoshu">
                <h3>${task.title}</h3>
                <ul>
                    <li id="haspigai">
                        <span class="btn btn-default"><i class="fa fa-check-circle-o"></i>${haspigai}人</span>
                    </li>
                    <li id="nopigai">
                        <span class="btn btn-success"><i class="fa fa-clock-o"></i>${nopigai}人</span>
                    </li >
                    <li id="noinform">
                        <span class="btn btn-warning"><i class="fa fa-exclamation-triangle"></i>${noinform}人</span>
                    </li>
                </ul>
            </div>
        <!--页头部分 end-->
        </header>
        <section class="check-task-list">
          <input type="hidden" id="hid" value="">
          <input type="hidden" id="hid_uid" value="">
        <!--列表部分 start-->
            <ul>
            <c:forEach var="item" items="${taskuservolist}">
                <li id="${item.id}">
                <input type="hidden" id="hid_comment_${item.id}" value="${item.comment}"/>
                    <div class="check-task-item">
                        <div class="item-top">
                            <img src="${basepath}/user/avatar/${item.uid}.xhtml?style=80x80" class="img-thumbnail">
                            <div class="name-time-score">
                                <span class="nts-name">姓名：${item.name}</span>
                                <span class="nts-time">${ltfun:dataLongToSNS(item.createtime,"yyyy-MM-dd HH:mm")}</span>
                            </div>
                        </div>
                        <div class="item-miaoshu">
                            <p>${item.content}</p>
                        </div>
                        <div class="item-imglist">
                            <figure data-count="6张图片">
                                <div>
                                   <c:forEach var="m" items="${item.attachments}">
                                    <img style="width:80px;height:80px;" class="img-responsive img-rounded" src="<%=Constant.IMG_SERVER_DOWNLOAD%>${m.url}-80x80" data-src="<%=Constant.IMG_SERVER_DOWNLOAD%>${m.url}-1024x1024" data-gid="${item.uid}" onload="preViewImg(this, event);">
                                   </c:forEach>
                                </div>
                            </figure>
                        </div>
                        <div class="item-footer">
                            <span onclick="showinput(1,'${item.id}','${item.uid}')" style="cursor:pointer;"><i class="fa fa-keyboard-o"></i>写评语</span>
                            <span onclick="showinput(2,'${item.id}','${item.uid}')" style="cursor:pointer;"><i class="fa fa-compass"></i>打分</span>
                        </div>
                    </div>
                </li>
               </c:forEach>
            </ul>
        <!--列表部分 end -->
        </section>
        <footer style="display: none" id="inputbox">
        <!--输入框 start-->
            <div class="input-group">
              <input type="text" class="form-control" id="inputtext">
              <span class="input-group-btn">
                <button class="btn btn-default" type="button">提交</button>
              </span>
            </div>
        <!--输入框 end-->
        </footer>
    </section>
    <script type="text/javascript" src="${basepath}/static/js/easydialog.js"></script>
    <script type="text/javascript">
      $(document).ready(function(){
    		$("#nopigai").click(function(){
       		     var taskid=$("#hid_id").val();
          		 var noinform="${noinform}";
          		 var nopigai="${nopigai}";
          		 var haspigai="${haspigai}";
          		 window.location.href="${basepath}/m/task/tlist.xhtml?id="+taskid+"&noinform="+noinform+"&nopigai="+nopigai+"&haspigai="+haspigai;
       	});
    	 $("#haspigai").click(function(){
    		 var taskid=$("#hid_id").val();
    		 var noinform="${noinform}";
    		 var nopigai="${nopigai}";
    		 var haspigai="${haspigai}";
    		 window.location.href="${basepath}/m/task/plist.xhtml?id="+taskid+"&noinform="+noinform+"&nopigai="+nopigai+"&haspigai="+haspigai;
    	 });
    	 
    	 $("#noinform").click(function(){
    		 var taskid=$("#hid_id").val();
    		 var noinform="${noinform}";
    		 var nopigai="${nopigai}";
    		 var haspigai="${haspigai}";
    		 window.location.href="${basepath}/m/task/flist.xhtml?id="+taskid+"&noinform="+noinform+"&nopigai="+nopigai+"&haspigai="+haspigai;
    	 });
      });
       //写评语
        var tijiao = function(){
    	   var id=$("#hid").val();
    	   var taskid=$("#hid_id").val();
    	   var comment=$.trim($("#comment_"+id).val());
    	   var uid=$("#hid_uid").val();
        	$.ajax({
        		   type: "POST",
        		   url: "${basepath}/m/task/pigai.json",
        		   data: "taskid="+taskid+"&comment="+comment+"&uid="+uid,
        		   success: function(msg){
        			   if(msg){
        				   alert("添加评语成功!");
        				   return true;
        			   }else{
        				   return false;
        			   }
        		   }
        		});
        };
        //打分
        var dafen = function(){
          var id=$("#hid").val();
          var taskid=$("#hid_id").val();
     	  var score=$.trim($("#score_"+id).val());
     	  var isnumber=zeroFloatCheck(score);
          if(!isnumber){
        	  alert("分数必须为数字!");
        	  $.trim($("#score_"+id).val(""));
              return false;
              }
     	  var uid=$("#hid_uid").val();
     	  $.ajax({
   		   type: "POST",
   		   url: "${basepath}/m/task/pigai.json",
   		   data: "taskid="+taskid+"&score="+score+"&uid="+uid,
   		   success: function(msg){
   			   if(msg){
   				   $("#"+id).remove();
	   			   var taskid=$("#hid_id").val();
	         	   var noinform="${noinform}";
	         	   var nopigai="${nopigai}";
	         	   var haspigai="${haspigai}";
	         	   window.location.href="${basepath}/m/task/tlist.xhtml?id="+taskid+"&noinform="+noinform+"&nopigai="+nopigai+"&haspigai="+haspigai;
   				   return true;
   			   }else{
   				   return false;
   			   }
   		   }
   		});
        };
        function showinput(str,id,uid){
        	$("#hid").val(id);
        	$("#hid_uid").val(uid);
        	var comment=$("#hid_comment_"+id).val();
            if(str == 1){
                easyDialog.open({
                    container : {
                        header : "写评语",
                        content : "<textarea style='width: 100%;height: 100px;resize: none;border: 1px solid #eaeaea;' placeholder='评语···' id='comment_"+id+"'>"+comment+"</textarea>",
                        yesFn : tijiao,
                        noFn : true
                    }
                });
            }else{
                easyDialog.open({
                    container : {
                        header : "打分(通过分数：${task.score})",
                        content : "<input type = 'number' style='width: 100%;height: 100px;resize: none;border: 1px solid #eaeaea;' placeholder='打分···' id='score_"+id+"'></input>",
                        yesFn : dafen,
                        noFn : true
                    }
                });
            }
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
</body>

</html>