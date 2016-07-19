<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<%@page language="java" import="com.longtime.app.config.Constants"%>
<!DOCTYPE html>
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>编辑活动</title>
<meta name="menu_path" content="active.menu_activity" />
<script src="${basepath }/static/ixin/js/jquery.uploadify.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${basepath }/static/ixin/css/uploadify.css">
<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
  <link rel="stylesheet" href="${basepath}/static/public/easydialog-v2.0/easydialog.css">
  <link rel="stylesheet" href="${basepath}/static/css/active.css">
  <script src="${basepath}/static/public/easydialog-v2.0/easydialog.min.js"></script>
  <script src="${basepath}/static/js/activity/active.js"></script>
  <script  type="text/javascript" src="${basepath }/static/public/My97DatePicker/WdatePicker.js"></script>
  <script type="text/javascript">
</script>
</head>
<body>

       <!-- BEGIN PAGE HEADER-->
         <div class="row" >
            <div class="col-md-12">
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
               <ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
				<li><span href="#">活动管理</span></li>
				</ul>
               <!-- END PAGE TITLE & BREADCRUMB-->
            </div>
         </div>
         <!-- END PAGE HEADER-->
		<div class="col-md-12">
			<!-- BEGIN VALIDATION STATES-->
			<div class="portlet box green">
				<div class="portlet-title">
					<div class="caption">
						<i class="fa fa-bookmark-o"></i><span>添加子活动</span>
					</div>
				</div>
				<div class="portlet-body form box_box">
					<div class="col-md-12" id="course_info">
						 <ul class="stemp-box">
                <li class="tep-left">
                    <img src="${basepath}/static/img/step-left.png">
                </li>
                <li class="over-step" onclick="next1('${id}');">
			                    1
                </li>
                <li class="step-xian${stepStatus['2'] ?'-lv':'' }"></li>
                <li class="${stepStatus['2'] ?'over':'nor' }-step" onclick="next2('${id}');">
                    2
                </li>
                <li class="step-xian${stepStatus['3'] ?'-lv':'' }"></li>
                <li class="${stepStatus['3'] ?'over':'nor' }-step" onclick="next3('${id}');">
                    3
                </li>
                <li class="step-xian-lv"></li>
                <li class="current-step" onclick="next4('${id}');">
                    4
                </li>
                <li class="step-xian${stepStatus['5'] ?'-lv':'' }"></li>
                <li class="${stepStatus['5'] ?'over':'nor' }-step" onclick="next5('${id}');">
                    5
                </li>
                <li class="tep-right">
                     <img src="${basepath}/static/img/step-right${stepStatus['all'] ?'-over':'' }.png">
                </li>
            </ul>
            <div class="preview-style" style="width:864px;">
             <input id="path" type="hidden" name="path" value="<%=Constants.IMG_SERVER_DOWNLOAD%>">
             <input type="hidden" id="hid_id" name="hid_id" value="${id}">
             	<div style="margin-top:10px;margin-bottom:10px;">
             		<input type="checkbox" name="afterSignIn" id="afterSignIn" value="1"  ${activity.afterSignIn == 1 ?'checked="checked"' : '' }>
             		<label for="afterSignIn">签到后可参加子活动（活动需要签到时有效）</label>
             		
             		<input type="checkbox" name="showtopic" id="showtopic" value="1"  ${activity.showTopic == 1 ?'checked="checked"' : '' }>
             		<label for="showtopic">是否显示话题</label>
             		
             		<input type="checkbox" name="showquestion" id="showquestion" value="1"  ${activity.showQuestion == 1 ?'checked="checked"' : '' }>
             		<label for="showquestion">是否显示问答</label>
             	</div>
             	
                <div class="addbtnbox">
                    <ul>
                       <li title="添加调研" onclick="openactivebox('diao')">
                           <img src="${basepath}/static/img/diao.png" class="img-thumbnail">
                       </li>
                        <li title="添加投票"  onclick="openactivebox('tou')">
                            <img src="${basepath}/static/img/tou.png" class="img-thumbnail">
                        </li>
                        <li title="添加抽奖" onclick="openactivebox('jiang')">
                            <img src="${basepath}/static/img/jiang.png" class="img-thumbnail">
                        </li>
                        <li title="添加排行榜" onclick="openactivebox('bang')">
                            <img src="${basepath}/static/img/bang.png" class="img-thumbnail">
                        </li>
                        <li title="添加课程" onclick="openactivebox('ke')">
                            <img src="${basepath}/static/img/ke.png" class="img-thumbnail">
                        </li>
                        <li title="添加考试" onclick="openactivebox('kao')">
                            <img src="${basepath}/static/img/kao.png" class="img-thumbnail">
                        </li>
                        <li title="添加资讯" onclick="openactivebox('xun')" >
                            <img src="${basepath}/static/img/xun.png" class="img-thumbnail">
                        </li>
                        <li title="添加栏目" onclick="openactivebox('lan')" style="">
                            <img src="${basepath}/static/img/lanmu.png" class="img-thumbnail">
                        </li>
                    </ul>
                </div>
                <div id="selectedbox" class="selectedbox">
                    <ul>
                      <c:forEach var="activityVo" items="${list}">
                        <li class="one-a " h="${activityVo.itemid}" f="${activityVo.id}">
                                <div class="one-active">
                                    <span class="otheractive-title">${activityVo.title}</span>
                                    <span class="otheractive-time"> <d:formatDate currentTime="${activityVo.createtime}" format="yyyy-MM-dd"/></span>
                                    <c:choose>
                                    	<c:when test="${activityVo.type==7}">
                                    		<img class="otheractive-poster" src="${basepath}/static/img/examption.png">
                                    	</c:when>
                                    	<c:when test="${activityVo.type==8}">
                                    		<img class="otheractive-poster" src="${activityVo.cover}">
                                    	</c:when>
                                    	<c:when test="${activityVo.type==9}">
                                    	     <c:if test="${empty activityVo.cover}">
                                    	     <img class="otheractive-poster" src="${basepath}/static/img/lm.png">
                                    	     </c:if>
                                    	     <c:if test="${not empty activityVo.cover}">
                                    	     <img class="otheractive-poster" src="<%=Constants.IMG_SERVER_DOWNLOAD %>${activityVo.cover}">
                                    	     </c:if>
                                    	</c:when>
                                    	<c:otherwise>
                                    		<img class="otheractive-poster" src="<%=Constants.IMG_SERVER_DOWNLOAD %>${activityVo.cover}">
                                    	</c:otherwise>
                                    </c:choose>
                                    <span class="otheractive-jianjie">${activityVo.summary}</span>
                                </div>
                                <div class="select-active hidexbox" onclick="removethis(this);">
                                    <i class="glyphicon glyphicon-remove"></i>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
	</div>		
			</div>
		</div>
      <div class="form-group" style="text-align: right;margin-top: 10px;">
                    <span class="btn btn-success" onclick="next3('${id}')"><i class="glyphicon glyphicon-arrow-left"></i>&nbsp;&nbsp;上一步</span>
                    <%-- <span class="btn btn-success"><i class="glyphicon glyphicon-floppy-save"></i>&nbsp;&nbsp;保存</span>--%>
                    <span class="btn btn-success" onclick="updatestep4('${id}')">下一步&nbsp;&nbsp;<i class="glyphicon glyphicon-arrow-right"></i></span>
                 </div>
	</div>
      <div class="easyDialog_wrapper" id="easyDialogWrapper" style="width: 667px;">
            <div class="easyDialog_content" style="height: 450px;">
                <h4 class="easyDialog_title" id="easyDialogTitle">
                    <a href="javascript:void(0)" title="关闭窗口" class="close_btn" onclick="easyDialog.close()">&times;</a>
                    <span id="dialogtitle"></span>
                </h4>
                <div class="easyDialog_text" style="display: block;overflow: hidden;width: 660px;height: 320px;overflow-x: hidden;overflow-y: auto;">
                    <div id="activity-box" class="activity-box" style="position: absolute;width: 650px;height: 320px;overflow-x: hidden;overflow-y: auto;">
                        <ul>
                             <li>没有内容</li>
                        </ul>
                    </div>
                </div>
                <div class="easyDialog_footer" style="position: absolute;margin-top: 60px;width: 90%;">
                    <button class="btn_normal" id="cancel" >取消</button>
                    <button class="btn_highlight" id="easyDialogYesBtn">确定</button>
                </div>
            </div>
        </div>
<script type="text/javascript">
var ids="";
var names="";
var type="";

/**
 * 下面的代码为转换时间格式的
 */
//扩展Date的format方法 
Date.prototype.format = function (format) {
    var o = {
        "M+": this.getMonth() + 1,
        "d+": this.getDate(),
        "h+": this.getHours(),
        "m+": this.getMinutes(),
        "s+": this.getSeconds(),
        "q+": Math.floor((this.getMonth() + 3) / 3),
        "S": this.getMilliseconds()
    }
    if (/(y+)/.test(format)) {
        format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    }
    for (var k in o) {
        if (new RegExp("(" + k + ")").test(format)) {
            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
        }
    }
    return format;
}
/**  
 *转换long值为日期字符串  
 * @param l long值  
 * @param pattern 格式字符串,例如：yyyy-MM-dd hh:mm:ss  
 * @return 符合要求的日期字符串  
 */  

 function getFormatDateByLong(l, pattern) {
     return getFormatDate(new Date(l), pattern);
 }
 /**  
 *转换日期对象为日期字符串  
 * @param l long值  
 * @param pattern 格式字符串,例如：yyyy-MM-dd hh:mm:ss  
 * @return 符合要求的日期字符串  
 */  
 function getFormatDate(date, pattern) {
     if (date == undefined) {
         date = new Date();
     }
     if (pattern == undefined) {
         pattern = "yyyy-MM-dd hh:mm:ss";
     }
     return date.format(pattern);
 }

function page(){
	 var aid=$("#hid_id").val();
	window.location.href=basepath+"/mgr/activity/step4.xhtml?id="+aid;
}

/**
 * 提交
 */
 $("#easyDialogYesBtn").click(function(){
	var aid = $("#hid_id").val();    
	var afterSignIn = $('input[name="afterSignIn"]:checked').val();
	if(afterSignIn == null || afterSignIn==""){
		afterSignIn = "0";
	}
		
	var showTopic=$('input[name="showtopic"]:checked').val();
	if(showTopic==null || showTopic==""){
		showTopic="0";
	}
	 
    if(ids=="" || ids==null){
    	easyDialog.close(); 
        }
	 $.ajax({
  	   type: "POST",
  	   url: basepath+"/mgr/activity/relation/add.json",
  	   //data: "type="+type+"&aid="+aid+"&ids="+ids+"&names="+names+"&afterSignIn"+afterSignIn+"&showTopic"+showTopic,
  	  data: {type:type,aid:aid,ids:ids,names:names,afterSignIn:afterSignIn,showTopic:showTopic},
  	   success: function(msg){
  	  	   if(msg){
  	  	  	   //回显
  	  		page();
  	  		ids="";
  	  		names="";
  	  		type="";
  	  	  	   }else{
  	  	  	  	   }
  	   }
	 });
	 });
 $("#cancel").click(function(){
      ids="";
      names="";
      type="";
     easyDialog.close(); 
	 });

function chooseselect(thi)
{    
	if($(thi).parent("li").attr("class") == "one-a cactive" || $(thi).parent("li").attr("class") == "cactive one-a" ){
        $(thi).parent("li").removeClass("cactive");
        var idstr=$(thi).parent("li").attr("t")+",";
        var namestr=$(thi).parent("li").attr("k")+",";
        ids=ids.replace(idstr,"");
        names=names.replace(namestr,"");
        //删除关联关系
        var id=$(thi).parent("li").attr("t");
        var itemid="";
        $("#selectedbox").find("li").each(function(){
              if($(this).attr("f")==id){
                $(this).children(".select-active").click();
                  }
            });
    }else{
        $(thi).parent("li").addClass("cactive");
        ids=ids+$(thi).parent("li").attr("t")+",";
    	names=names+$(thi).parent("li").attr("k")+",";
    	type=$(thi).parent("li").attr("g");
    }
}
    function openactivebox(str){
        var html="";
        var path=$("#path").val();
        switch(str){
            case "tou":
                    $("#dialogtitle").html("选择投票");
                    $.ajax({
                    	   type: "POST",
                    	   url: basepath+"/mgr/activity/votelist.json",
                    	   data: "current_page=1&page_size=20",
                    	   success: function(msg){
                    		   if(msg.votelist.length>0){
                                   for(var i=0;i<msg.votelist.length;i++)
                                       {
                                         html=html+'<li class="one-a" t="'+msg.votelist[i].id+'" k="'+msg.votelist[i].title+'" g="vote">';
                                         html=html+' <div class="one-active">';
                                         html=html+'<span class="otheractive-title">'+msg.votelist[i].title+'</span>';
                                         html=html+'<span class="otheractive-time">'+msg.votelist[i].startTimeStr+'</span>';
                                         html=html+' <img class="otheractive-poster" src="'+path+msg.votelist[i].coverPath+'">';
                                         html=html+' <span class="otheractive-jianjie">'+msg.votelist[i].summary+'</span>';
                                         html=html+'</div>';
                                         html=html+'<div class="select-active hidexbox" onclick="chooseselect(this);" >';
                                         html=html+'<i class="glyphicon glyphicon-ok"></i>';
                                         html=html+'</div>';
                                         html=html+'</li>';
                                       }
                                   $("#activity-box").find("ul").html(html);
                                   getchoosed();
                                  }else{
                                 	 $("#activity-box").find("ul").html("<li>没有内容</li>");	
         						 } 
                    	   }
                    	});
                break;
            case "diao":
                $("#dialogtitle").html("选择调研");
                $.ajax({
             	   type: "POST",
             	   url: basepath+"/mgr/activity/surveylist.json",
             	   data: "current_page=1&page_size=20",
             	   success: function(msg){
                      if(msg.surveylist.length>0){
                           for(var i=0;i<msg.surveylist.length;i++)
                               {
                                 html=html+'<li class="one-a" t="'+msg.surveylist[i].id+'" k="'+msg.surveylist[i].title+'" g="survey">';
                                 html=html+' <div class="one-active">';
                                 html=html+'<span class="otheractive-title">'+msg.surveylist[i].title+'</span>';
                                 html=html+'<span class="otheractive-time">'+msg.surveylist[i].startTimeStr+'</span>';
                                 html=html+' <img class="otheractive-poster" src="'+path+msg.surveylist[i].coverPath+'">';
                                 html=html+' <span class="otheractive-jianjie">'+msg.surveylist[i].summary+'</span>';
                                 html=html+'</div>';
                                 html=html+'<div class="select-active hidexbox" onclick="chooseselect(this);">';
                                 html=html+'<i class="glyphicon glyphicon-ok"></i>';
                                 html=html+'</div>';
                                 html=html+'</li>';
                               } 
                           $("#activity-box").find("ul").html(html);
                           getchoosed();
                     
                          }else{
                         	 $("#activity-box").find("ul").html("<li>没有内容</li>");	
 						 }   
             	   }
             	});
                break;
            case "jiang":
                $("#dialogtitle").html("选择抽奖");
                $.ajax({
             	   type: "POST",
             	   url: basepath+"/mgr/activity/rewardlist.json",
             	   data: "current_page=1&page_size=20",
             	   success: function(msg){
             		  if(msg.rewardlist.length>0){
                          for(var i=0;i<msg.rewardlist.length;i++)
                              {
                                html=html+'<li class="one-a" t="'+msg.rewardlist[i].id+'" k="'+msg.rewardlist[i].title+'" g="lottery">';
                                html=html+' <div class="one-active">';
                                html=html+'<span class="otheractive-title">'+msg.rewardlist[i].explain2.title+'</span>';
                                html=html+'<span class="otheractive-time">'+getFormatDateByLong(msg.rewardlist[i].createDate,"yyyy-MM-dd")+'</span>';
                                html=html+' <img class="otheractive-poster" src="'+path+msg.rewardlist[i].explain2.picUrl+'">';
                                html=html+' <span class="otheractive-jianjie">'+msg.rewardlist[i].explain2.content+'</span>';
                                html=html+'</div>';
                                html=html+'<div class="select-active hidexbox" onclick="chooseselect(this);">';
                                html=html+'<i class="glyphicon glyphicon-ok"></i>';
                                html=html+'</div>';
                                html=html+'</li>';
                              } 
                          $("#activity-box").find("ul").html(html);
                          getchoosed();
                    
                         }else{
                        	 $("#activity-box").find("ul").html("<li>没有内容</li>");	
						 }  
             	   }
             	});
                break;
            case "bang":
                $("#dialogtitle").html("选择排行榜");
                $.ajax({
             	   type: "POST",
             	   url: basepath+"/mgr/activity/ranklist.json",
             	   data: "current_page=1&page_size=20",
             	   success: function(msg){
             		  if(msg.ranklist.length>0){
                          for(var i=0;i<msg.ranklist.length;i++)
                              {
                                html=html+'<li class="one-a" t="'+msg.ranklist[i].id+'" k="'+msg.ranklist[i].title+'" g="rank">';
                                html=html+' <div class="one-active">';
                                html=html+'<span class="otheractive-title">'+msg.ranklist[i].title+'</span>';
                                html=html+'<span class="otheractive-time">'+getFormatDateByLong(msg.ranklist[i].createtime,"yyyy-MM-dd")+'</span>';
                                html=html+' <img class="otheractive-poster" src="'+path+msg.ranklist[i].cover+'">';
                                html=html+' <span class="otheractive-jianjie">'+msg.ranklist[i].remark+'</span>';
                                html=html+'</div>';
                                html=html+'<div class="select-active hidexbox" onclick="chooseselect(this);">';
                                html=html+'<i class="glyphicon glyphicon-ok"></i>';
                                html=html+'</div>';
                                html=html+'</li>';
                              } 
                          $("#activity-box").find("ul").html(html);
                          getchoosed();
                         }else{
                        	 $("#activity-box").find("ul").html("<li>没有内容</li>");	
                         }  
             	   }
             	});
                break;
            case "ke":
                $("#dialogtitle").html("选择课程");
                $.ajax({
             	   type: "POST",
             	   url: basepath+"/mgr/activity/courselist.json",
             	   data: "current_page=1&page_size=20",
             	   success: function(msg){
             		  if(msg.courselist.length>0){
                          for(var i=0;i<msg.courselist.length;i++)
                              {
                                html=html+'<li class="one-a" t="'+msg.courselist[i].id+'" k="'+msg.courselist[i].name+'" g="course">';
                                html=html+' <div class="one-active">';
                                html=html+'<span class="otheractive-title">'+msg.courselist[i].name+'</span>';
                                html=html+'<span class="otheractive-time">'+getFormatDateByLong(msg.courselist[i].createTime,"yyyy-MM-dd")+'</span>';
                                html=html+' <img class="otheractive-poster" src="'+path+msg.courselist[i].imagePath+'">';
                                html=html+' <span class="otheractive-jianjie">'+msg.courselist[i].remark+'</span>';
                                html=html+'</div>';
                                html=html+'<div class="select-active hidexbox" onclick="chooseselect(this);">';
                                html=html+'<i class="glyphicon glyphicon-ok"></i>';
                                html=html+'</div>';
                                html=html+'</li>';
                              } 
                          $("#activity-box").find("ul").html(html);
                          getchoosed();
                         }else{
                        	 $("#activity-box").find("ul").html("<li>没有内容</li>");	
                         }  
             	   }
             	});
                break;
            case "kao":
                $("#dialogtitle").html("选择考试");
                $.ajax({
             	   type: "POST",
             	   url: basepath+"/mgr/activity/examinationlist.json",
             	   data: "current_page=1&page_size=20",
             	   success: function(msg){
             		  if(msg.examinationlist.length>0){
                          for(var i=0;i<msg.examinationlist.length;i++)
                              {
                                html=html+'<li class="one-a" t="'+msg.examinationlist[i].id+'" k="'+msg.examinationlist[i].examName+'" g="examination">';
                                html=html+' <div class="one-active">';
                                html=html+'<span class="otheractive-title">'+msg.examinationlist[i].examName+'</span>';
                                html=html+'<span class="otheractive-time">'+getFormatDateByLong(msg.examinationlist[i].startTime,"yyyy-MM-dd")+'</span>';
                                html=html+' <img class="otheractive-poster" src="${basepath}/static/img/examption.png">';
                                html=html+' <span class="otheractive-jianjie">'+msg.examinationlist[i].content+'</span>';
                                html=html+'</div>';
                                html=html+'<div class="select-active hidexbox" onclick="chooseselect(this);">';
                                html=html+'<i class="glyphicon glyphicon-ok"></i>';
                                html=html+'</div>';
                                html=html+'</li>';
                              } 
                          $("#activity-box").find("ul").html(html);
                          getchoosed();
                         }else{
                        	 $("#activity-box").find("ul").html("<li>没有内容</li>");	
                         }  
             	   }
             	});
                break;
            case "xun":
                $("#dialogtitle").html("选择资讯");
                $.ajax({
             	   type: "POST",
             	   url: basepath+"/mgr/activity/fodderlist.json",
             	   data: "current_page=1&page_size=20",
             	   success: function(msg){
             		  if(msg.fodderlist.length>0){
                          for(var i=0;i<msg.fodderlist.length;i++)
                              {
                                html=html+'<li class="one-a" t="'+msg.fodderlist[i].id+'" k="'+msg.fodderlist[i].title+'" g="fodder">';
                                html=html+' <div class="one-active">';
                                html=html+'<span class="otheractive-title">'+msg.fodderlist[i].title+'</span>';
                                html=html+'<span class="otheractive-time">'+getFormatDateByLong(msg.fodderlist[i].modifyTime,"yyyy-MM-dd")+'</span>';
                                html=html+' <img class="otheractive-poster" src="'+msg.fodderlist[i].coverPath+'">';
                                html=html+' <span class="otheractive-jianjie">'+msg.fodderlist[i].summary+'</span>';
                                html=html+'</div>';
                                html=html+'<div class="select-active hidexbox" onclick="chooseselect(this);">';
                                html=html+'<i class="glyphicon glyphicon-ok"></i>';
                                html=html+'</div>';
                                html=html+'</li>';
                              } 
                          $("#activity-box").find("ul").html(html);
                          getchoosed();
                         }else{
                        	 $("#activity-box").find("ul").html("<li>没有内容</li>");	
                         }  
             	   }
             	});
                break;
            case "lan":
            	 $("#dialogtitle").html("选择栏目");
            	 $.ajax({
               	   type: "POST",
               	   url: basepath+"/mgr/channel/channellist.json",
               	   data: "current_page=1&page_size=20",
               	   success: function(msg){
               		  if(msg.length>0){
                            for(var i=0;i<msg.length;i++)
                                {
                                  html=html+'<li class="one-a" t="'+msg[i].id+'" k="'+msg[i].title+'" g="channel">';
                                  html=html+' <div class="one-active">';
                                  html=html+'<span class="otheractive-title">'+msg[i].title+'</span>';
                                  html=html+'<span class="otheractive-time">'+getFormatDateByLong(msg[i].createtime,"yyyy-MM-dd")+'</span>';
                                  if(msg[i].cover!=null && msg[i].cover!=""){
                                  html=html+' <img class="otheractive-poster" src="'+path+msg[i].cover+'">';
                                      }else{
                                  html=html+' <img class="otheractive-poster" src="${basepath}/static/img/lm.png">'; 
                                      }
                                  html=html+' <span class="otheractive-jianjie">'+msg[i].remark+'</span>';
                                  html=html+'</div>';
                                  html=html+'<div class="select-active hidexbox" onclick="chooseselect(this);">';
                                  html=html+'<i class="glyphicon glyphicon-ok"></i>';
                                  html=html+'</div>';
                                  html=html+'</li>';
                                } 
                            $("#activity-box").find("ul").html(html);
                            getchoosed();
                           }else{
                          	 $("#activity-box").find("ul").html("<li>没有内容</li>");	
                           }  
               	   }
               	});
                break;
        }
        easyDialog.open({
            container:"easyDialogWrapper",
            fixed:true
        });
    }
    function showback(){
        $("#activity-box").find(".cactive").each(function(){
            var html = [];
            html.push($(this).clone());
            $("#selectedbox").children("ul").append(html);
            $("#selectedbox").find(".select-active").each(function(){
                $(this).removeAttr("onclick");
                $(this).parents("li").removeClass("cactive");
                $(this).find("i").removeClass().addClass("glyphicon glyphicon-remove")
                $(this).attr("onclick","removethis(this)");
            })
        })
        easyDialog.close();
    }
    function removethis(o){
      var id=$(o).parents("li").attr("h");
      $.ajax({
    	   type: "POST",
    	   url: basepath+"/mgr/activity/deletelink.json",
    	   data: "id="+id,
    	   success: function(msg){
        	   if(msg){
        		   $(o).parents("li").remove();
        	   }else{
                     alert("删除失败");
            	   }
        	   
    	   }
      });
    }

    function getchoosed(){
    	  var sarray=new Array();
          var unarray=new Array();
          //得到已选择的列表id
          $("#selectedbox").find("li").each(function(){
                 sarray.push($(this).attr("f")); 
              });                                  
          //得到未选择列表id
          $("#activity-box").find("li").each(function(){
                 unarray.push($(this).attr("t"));
              });
          for(var i=0;i<unarray.length;i++)
              {
              for(var j=0;j<sarray.length;j++)
                  {
                    if(unarray[i]==sarray[j]){
                        $("#activity-box").find("li").each(function(){
                            if($(this).attr("t")==unarray[i]){
                                  $(this).addClass("cactive");
                                }
                            });
                        }
                  }
              } 
    }



    
</script>

	
</body>
</html>
