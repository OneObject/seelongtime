<%@page import="com.longtime.common.utils.LoginSessionHelper"%>
<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<%@page language="java" import="com.longtime.app.config.Constants"%>
<%
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","No-cache"); 
response.setDateHeader("Expires", -1); 
response.setHeader("Cache-Control", "No-store");
%>
<!DOCTYPE html>
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<head>
<title>栏目管理</title>
<meta name="menu_path" content="ixin.menu_channel" />
<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
  <link rel="stylesheet" href="${basepath}/static/public/easydialog-v2.0/easydialog.css">
  <link rel="stylesheet" href="${basepath}/static/css/active.css">
  <script src="${basepath}/static/public/easydialog-v2.0/easydialog.min.js"></script>
  <script type="text/javascript" src="${basepath}/js/page.js"></script>
  <script type="text/javascript">

   var resourceids=new Array();
   var covers=new Array();
   var titles=new Array();
   var removes=new Array();
   var map=new Array();
   
   function listAllResource(id){
	   location.href="${basepath}/mgr/channelresource/toSortResource.xhtml?id="+id;     
   }
   
   $(document).ready(function(){
       $("#back").click(function(){
              location.href="${basepath}/mgr/channel/index.xhtml";           
           });
       $("#typechoice").change(function(){
           linklist(1);
        });
       linklist(1);
	   });

       function linklist(i){
           var html="";
           var img_download=$("#hid_imgdownload").val();
          //得到类型
           var type=$("#typechoice").val();
           var id=$("#hid_id").val();
           var searchContent = $("#searchContent").val();
           var currentpage
           if(id==null || id==""){
               alert("没有要关联的栏目");
               return;
               }
           $.ajax({
                type:"post",
                url:"${basepath}/mgr/channelresource/linkedresource.json",
                data:{"type":type,"channelid":id,"currentpage":i,"searchContent":searchContent},
                success:function(msg){
                    if(msg.list.length>0){
                    for(var i=0;i<msg.list.length;i++){
                         var channelresource=msg.list[i];
                         var mark="";
                         var markhtml="";
                         switch(channelresource.restype){
                                case 0:
                                    mark="素材";
                                    markhtml='<span class="label label-customer label-default ">'+mark+'</span>'
                                    break;
                                case 1:
                                    mark="调研";
                                    markhtml='<span class="label label-customer label-primary ">'+mark+'</span>'
                                    break;
                                case 2:
                                    mark="投票";
                                    markhtml='<span class="label label-customer label-success ">'+mark+'</span>';
                                    break;
                                case 3:
                                    mark="抽奖";
                                    markhtml='<span class="label label-customer label-info ">'+mark+'</span>';
                                    break;
                                case 4:
                                    mark="排行";
                                    markhtml='<span class="label label-customer label-warning ">'+mark+'</span>';
                                    break;
                                case 5:
                                    mark="课程";
                                    markhtml='<span class="label label-customer label-danger ">'+mark+'</span>';
                                    break;
                                case 6:
                                    mark="考试";
                                    markhtml='<span class="label label-customer label-danger ">'+mark+'</span>';
                                    break;
                                case 7:
                                    mark="活动";
                                    markhtml='<span class="label label-customer label-danger ">'+mark+'</span>';
                                    break;
                                case 8:
                                    mark="作业";
                                    markhtml='<span class="label label-customer label-danger ">'+mark+'</span>';
                                    break;
                         }
                         html=html+'<li class="one-a" style="margin-left:10px;" data-id="'+channelresource.id+'" data-resourceid="'+channelresource.resourceid+'">';
                         html=html+'<div class="one-active" style=" height:210px;">';
                         html=html+'<span class="otheractive-title">'+channelresource.resname+'</span>'+markhtml;
                         if(channelresource.rescover=="" || channelresource.rescover==null){
                             html=html+'<img class="otheractive-poster" src="${basepath}/static/img/lm.png">';
                             }else{
                            html=html+'<img class="otheractive-poster" src="'+img_download+channelresource.rescover+'">';
                             }
                         html=html+'</div>';
                         html=html+'<div class="select-active hidexbox" data-id="'+channelresource.id+'" onclick="removethis(this);" style="height:210px;">';
                         html=html+'<i class="glyphicon glyphicon-remove" style="line-height:210px;"></i>';
                         html=html+'</div>';
                         html=html+'</li>';
                        }
                     $("#selectedbox").find("ul").html(html);
                       
                    }else{
                     $("#pageinfo2").css("margin-top",0);
                    html=html+'<span style="padding: 20px 30px;display:block;text-align: center;border:1px solid #ccc;background-color:#eee;font-size:24px;color:#999;border-radius:5px!important; ">没有内容</span>'
                    $("#selectedbox").find("#selectedlist").html(html);
                    }
                   var restype=$("#hid_restype").val();
                   if(restype!=null && restype!=""){
                        $("#contentlist").find("li").find("a").each(function(){
                                if($(this).data("num")==restype){
                                      showMenu(this);
                                    }
                            });
                         contentlist(restype,1);
                       }
                }
               });
           }
       function page(i){
    	   var type=$("#contentlist").val();
           if(type==-1){
               return;
               }else{
             	  contentlist(type,i);
                   }
           }

       function contentlist(type,i){
          var url="";
          var param="";
          var name="";
          var search="";
          switch(type){
             case "9"://视频
              url="${basepath}/base/admin/media/list.list";
              param=0;
              name="视频素材";
              break;
             case "10"://音频
              url="${basepath}/base/admin/media/list.list";
              param=1;
              name="音频素材";
              break;
             case "0"://得到素材列表
            	 
              url="${basepath}/mgr/fodder/fodderlist.list";
              name="素材";
              param=$("#search").val();
              break;
             case "1"://得到调研列表
              url="${basepath}/mgr/vote/surveyorvotelist.list";
              param="{'surveyOrvote':1}";
              search=$("#search").val();
              name="调研";
              break;
             case "2"://得到投票列表
              url="${basepath}/mgr/vote/surveyorvotelist.list";
              param="{'surveyOrvote':0}";
              name="投票";
              search=$("#search").val();
              break;
             case "3"://得到抽奖列表
              name="抽奖";
              url="${basepath}/mgr/scratchcard/rewardlist.list";
              break;
             case "4"://得到排行榜列表
              name="排行榜";
              break;
             case "5"://得到课程列表
              name="课程";
              url="${basepath}/mgr/course/courselist.list";
              search=$("#search").val();
              break;
             case "6"://得到考试列表
              name="考试";
              url="${basepath}/mgr/itest/exam/examlist.list";
              search=$("#search").val();
              break;
             case "7"://得到活动列表
              name="活动";
              url="${basepath}/mgr/activity/activitylist.list";
              search=$("#search").val();
             break;
             case "8"://得到作业列表
              name="作业";
              url="${basepath}/mgr/task/tasklists.list";
          }
          if(type==9 || type == 10){
        	  ajaxExecute1(url,i,param,name);
          }else{
          	ajaxExecute(url,i,param,name,search);

          }

           
         }
         function ajaxExecute1(url,i,param,name){
             if(url==""){
                   return;
                 }
             
        	   $.ajax({
                   type:"POST",
                   url:url,
                   data:{"page":i,"max":10,"type":param},
                   success:function(data){
                         var html="";
                         var img_download=$("#hid_imgdownload").val();
                         $("#resourcelist").html(name+"列表");
                         if(data[0].type==0 || data[0].type=="0"){
                             $("#resource").show();
                        	 $("#createresource").html("创建"+name);
                         }else{
                             $("#resource").hide();
                             }
                         for(var i=0;i<data.length;i++){
                        	 html=html+'<li class="one-a" style="margin-left:40px;" >';
                             html=html+'<div class="one-active" >';
                             html=html+'<span class="otheractive-title">'+data[i].title+'</span>';
                             html=html+' <span class="otheractive-time">'+getFormatDateByLong(data[i].createtime,"yyyy-MM-dd")+'</span>';
                             if(data[i].cover=="" || data[i].cover==null){
                                 html=html+'<img class="otheractive-poster" src="${basepath}/static/img/lm.png">';
                                 }else{
                             html=html+'<img class="otheractive-poster" src="'+img_download+data[i].cover+'">';
                                 }
                             html=html+'</div>';
                             html=html+'<div class="select-active hidexbox"  data-cover="'+data[i].cover+'" data-title="'+data[i].title+'" data-resourceid="'+data[i].resourceid+'" onclick="chooseselect(this);" >';
                             html=html+'<i class="glyphicon glyphicon-ok"></i>';
                             html=html+'</div>';
                             html=html+'</li>';        
                             }
                         var resourceobj= $("#resourcecontent");
                         resourceobj.html(html);
                         $("#pageinfo").html("");
                         $("#hid_type").val(data[0].type);
                         var pageNumber =data[0].pager.current_page;
                         var pageSize =10;
                     	 var total =data[0].pager.total_size;
                     	 var totalPage=data[0].pager.total_page;
                 		 showPage(pageNumber,totalPage,pageSize,total,"page","pageinfo");    
                         getchoosed();
                         easyDialog.open({
                             container:"easyDialogWrapper",
                             fixed:true
                         });
                       }
                 });
             }
         function ajaxExecute(url,i,param,name,search){
            
        	 if(url==""){
                   return;
                 }
      
        	   $.ajax({
                   type:"POST",
                   url:url,
                   data:{"currentpage":i,"pagesize":10,"param":param,"search" : search},
                   success:function(data){
                         var html="";
                         var img_download=$("#hid_imgdownload").val();
                         $("#resourcelist").html(name+"列表");
                         if(data.length==0){
                        	 html='<span style="padding: 20px 30px;margin-top:40px;display:block;text-align: center;border:1px solid #ccc;background-color:#eee;font-size:24px;color:#999;border-radius:5px!important; ">没有内容</span>';
                        	 var resourceobj= $("#resourcecontent");
                             resourceobj.html(html);
                             $("#pageinfo").hide();
                       		alert("没有数据");
                       	}else{
                         if(data[0].type==0 || data[0].type=="0"){
                             $("#resource").show();
                        	 $("#createresource").html("创建"+name);
                         }else{
                             $("#resource").hide();
                             }
                       	
                         for(var i=0;i<data.length;i++){
                        	 html=html+'<li class="one-a" style="margin-left:40px;" >';
                             html=html+'<div class="one-active" >';
                             html=html+'<span class="otheractive-title">'+data[i].title+'</span>';
                             html=html+' <span class="otheractive-time">'+getFormatDateByLong(data[i].createtime,"yyyy-MM-dd")+'</span>';
                             if(data[i].cover=="" || data[i].cover==null){
                                 html=html+'<img class="otheractive-poster" src="${basepath}/static/img/lm.png">';
                                 }else{
                             html=html+'<img class="otheractive-poster" src="'+img_download+data[i].cover+'">';
                                 }
                             html=html+'</div>';
                             html=html+'<div class="select-active hidexbox"  data-cover="'+data[i].cover+'" data-title="'+data[i].title+'" data-resourceid="'+data[i].resourceid+'" onclick="chooseselect(this);" >';
                             html=html+'<i class="glyphicon glyphicon-ok"></i>';
                             html=html+'</div>';
                             html=html+'</li>';        
                             }
                         var resourceobj= $("#resourcecontent");
                         resourceobj.html(html);
                         $("#pageinfo").html("");
                         $("#hid_type").val(data[0].type);
                         var pageNumber =data[0].pager.current_page;
                         var pageSize =10;
                     	 var total =data[0].pager.total_size;
                     	 var totalPage=data[0].pager.total_page;
                 		 showPage(pageNumber,totalPage,pageSize,total,"page","pageinfo");    
                         getchoosed();
                         easyDialog.open({
                             container:"easyDialogWrapper",
                             fixed:true
                         });
                         param=$("#search").val();
                   }
                         
                       }
                   
                 });
             }
         
         function chooseselect(thi){
        	 if($(thi).parent("li").attr("class") == "one-a cactive" || $(thi).parent("li").attr("class") == "cactive one-a" ){
         	        $(thi).parent("li").removeClass("cactive");
                    var id=$(thi).data("resourceid");
                    
                    for(var i=0;i<=map.length;i++){
                          var strs=map[i].split("_");
                          if(id==strs[0]){
                               removes.push(map[i]);
                               break;
                              }else{
                                  continue;
                                  }
                        }

                    
                    for(var i=0;i<resourceids.length;i++){
                            if(id==resourceids[i]){
                                resourceids.splice(i,1);
                                }
                        }

                    var cover=$(thi).data("cover");
                    for(var i=0;i<covers.length;i++){
                             if(id==covers[i]){
                                 covers.splice(i,1);
                                 }
                        }

                    var title=$(thi).data("title");
                    for(var i=0;i<titles.length;i++){
                             if(id==titles[i]){
                            	 titles.splice(i,1);
                                 }
                        }
        	    }else{
        	        $(thi).parent("li").addClass("cactive");
        	        var id=$(thi).data("resourceid");
        	        resourceids.push(id);
        	        var cover=$(thi).data("cover");
        	        covers.push(cover);
        	        var title=$(thi).data("title");
        	        titles.push(title);
 
                     for(var i=0;i<removes.length;i++){
                         var strs=removes[i].split("_");
                          if(id==removes[0]){
                              removes.splice(i,1);
                              }
                         }
        	        
        	    }
             }

         function removethis(thi){
             if(confirm("确定要删除吗?")){
                 var id=$(thi).data("id");
               $(thi).parent("li").remove();
               
               //删除关联关系
               $.ajax({
                     type:"post",
                     url:"${basepath}/mgr/channelresource/deletelink.json",
                     data:{"id":id},
                     success:function(data){
                           if(data){
                        	   linklist(1);
                               }else{
                                   alert("删除失败");
                                   }
                         }
                   });
             }
             }
         function makesure(){
                var channelid=$("#hid_id").val();
                var resourceidstr=resourceids.join(",");
                resourceids.splice(0,resourceids.length);
                var coverstr=covers.join(",");
                covers.splice(0,covers.length);
                var titlestr=titles.join(",");
                titles.splice(0,titles.length);
                var removestr=removes.join(",");
                removes.splice(0,removes.length);
                var restype=$("#contentlist").val();
                //创建关联关系
                $.ajax({
                      type:"POST",
                      url:"${basepath}/mgr/channelresource/link.json",
                      data:{"channelid":channelid,"resourceidstr":resourceidstr,"restype":restype,"titlestr":titlestr,"coverstr":coverstr,"removestr":removestr},
                      success:function(data){
                          if(data){
                        	  easyDialog.close();
                        	  $("#btnSelect").html(' 关联更多<span class="caret"></span>');
                        	  $("#contentlist").val("-1");
                        	  $("#hid_restype").val("-1");
                        	  linklist(1);
                              }
                          }
                    });
             }
         
         function cancel(){
        	 resourceids.splice(0,resourceids.length);
        	 covers.splice(0,covers.length);
        	 titles.splice(0,titles.length);
        	 removes.splice(0,removes.length);
        	 easyDialog.close();
        	 $("#btnSelect").html(' 关联更多<span class="caret"></span>');
        	 $("#contentlist").val("-1");
        	 $("#hid_restype").val("-1");
             }
        function shutdown(){
        	resourceids.splice(0,resourceids.length);
        	 covers.splice(0,covers.length);
        	 titles.splice(0,titles.length);
        	 removes.splice(0,removes.length);
            easyDialog.close();
            $("#btnSelect").html(' 关联更多<span class="caret"></span>');
            $("#contentlist").val("-1");
            $("#hid_restype").val("-1");
            }
         function getchoosed(){
       	     var sarray=new Array();
             var unarray=new Array();
             map.splice(0,map.length);

             //得到已选择的列表id
             $("#selectedbox").find("li").each(function(){
                    sarray.push($(this).data("resourceid")); 
                    map.push($(this).data("resourceid")+"_"+$(this).data("id"));
                 });                                  
             //得到未选择列表id
             $("#activity-box").find("li").find(".hidexbox").each(function(){
                    unarray.push($(this).data("resourceid"));
                 });
             for(var i=0;i<unarray.length;i++)
                 {
                 for(var j=0;j<sarray.length;j++)
                     {
                       if(unarray[i]==sarray[j]){
                           $("#activity-box").find("li").find(".hidexbox").each(function(){
                               if($(this).data("resourceid")==unarray[i]){
                                     $(this).parent("li").addClass("cactive");
                                   }
                               });
                           }
                     }
                 } 
       }

      function createresource(){
          //得到类型
          var type=$("#hid_type").val();
          if(type==null || type==""){
              return;
              }
          var url="";
          var channelid=$("#hid_id").val();
        switch(type){
          case "0"://素材
              url="${basepath}/mgr/fodder/add.xhtml?restype="+type+"&channelid="+channelid;
              break;
          case "1"://调研
              url="${basepath}/mgr/vote/add.xhtml?restype="+type+"&channelid="+channelid;
              break;
          case "2"://投票
              break;
          case "3"://抽奖
              break;
          case "4"://排行榜
              break;
          case "5"://课程
              break;
          case "6"://考试
              break;
          case "7"://活动
              break;
          }
         window.location.href=url;
          }

      function showMenu(thi){
          var str=$(thi).html()+'<span class="caret"></span>';
          $("#btnSelect").html(str);
          $("#contentlist").val($(thi).data("num"));
          $("#search").val("");
          page(1);
          }

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

       
  </script>
</head>
<body>

       <!-- BEGIN PAGE HEADER-->
         <div class="row" >
            <div class="col-md-12">
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
               <ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
				<li><span href="#">栏目管理</span></li>
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
						<i class="fa fa-bookmark-o"></i><span>添加子栏目</span>
					</div>
				</div>
				<div class="portlet-body form box_box">
				 
                 
           <div class="col-md-12" id="course_info">
           <div style="padding:10px 0px;margin-bottom:10px;float:left;width:100%;">
             	<input type="hidden" id="hid_id" name="hid_id" value="${id}">
             	<input type="hidden" id="hid_restype" name="hid_restype" value="${restype}">
             	<input type="hidden" id="hid_imgdownload" name="hid_imgdownload" value="<%=Constants.IMG_SERVER_DOWNLOAD %>">
 <%
 	String domain = LoginSessionHelper.getCurrentDomain(request);
 %>
 		<c:set var="domain" value="<%=domain %>"></c:set>
 			<c:if test="${domain eq 'fujixerox' }">
 				<select id="typechoice" class="form-control" style="height: 36px;margin-bottom:10px;display:none;">
                     <option value="-1" selected="selected">类型筛选</option>
	                     <option value="0">素材</option>   
                 </select>
 			</c:if>
 			<c:if test="${domain ne 'fujixerox' }">
            <div class="col-md-2" class="input-group"style="float: left;height: 36px;">
                       <select id="typechoice" class="form-control" style="height: 36px;margin-bottom:10px;">
                     <option value="-1" selected="selected">类型筛选</option>
	                     <option value="0">素材</option>   
	                     <option value="1">调研</option>   
	                     <option value="2">投票</option>   
	                     <option value="3">抽奖</option>   
	                     <!-- <option value="4">排行榜</option>    -->
	                     <option value="5">课程</option>   
	                     <option value="6">考试</option>
	                     <option value="7">活动</option>
	                     <!-- <option value="8">作业</option> -->
                 </select>
            </div>
            </c:if>
            
              <div class="col-md-4 input-group">
                          <input type="text" class="form-control" id="searchContent" placeholder="输入资源名">
                          <span class="input-group-btn">
                           <button onclick="linklist(1)" class="btn btn-danger" type="button">
                              <i class="icon-search"></i>
                           </button>
                          </span>
              </div>
              <div class="btn-group" style="float: right;width:200px;height: 36px;">
                    <input type="hidden" id="contentlist" name="contentlist" value="${empty restype ? '-1' : restype }" >
					<button type="button" class="btn btn-default dropdown-toggle" id="btnSelect" data-toggle="dropdown" style="height: 36px;width:92px;margin-left:80px;">
					 关联更多<span class="caret"></span>
					</button>
					<ul class="dropdown-menu" role="menu" style="position:relative;left:13px;top:1px;" >
					  <c:if test="${domain eq 'fujixerox' }">
					  	  <li><a href="#" data-num="0" onclick="showMenu(this);">图文素材</a></li>
					  	  <!-- 
					  	  <li><a href="#" data-num="9" onclick="showMenu(this);">视频素材</a></li>
					  	  <li><a href="#" data-num="10" onclick="showMenu(this);">音频素材</a></li>
					  	   -->
					  </c:if>
					  <c:if test="${domain ne 'fujixerox' }">
					  	  <li><a href="#" data-num="0" onclick="showMenu(this);">素材</a></li>
						  <li><a href="#" data-num="1" onclick="showMenu(this);">调研</a></li>
						  <li><a href="#" data-num="2" onclick="showMenu(this);">投票</a></li>
						  <li><a href="#" data-num="3" onclick="showMenu(this);">抽奖</a></li>
						  <li><a href="#" data-num="5" onclick="showMenu(this);">课程</a></li>
						  <li><a href="#" data-num="6" onclick="showMenu(this);">考试</a></li>
						  <li><a href="#" data-num="7" onclick="showMenu(this);">活动</a></li>
						 <!--  <li><a href="#" data-num="8" onclick="showMenu(this);">作业</a></li> -->
					  </c:if>
					</ul>
              </div>
              
            	   <div class="col-md-2 row" style="float:right;width:100px;position:relative;right:-20px;">
                       <span class="btn btn-success table_add" onclick="listAllResource('${id}')" > 
                               <i class="fa fa-sort-amount-desc"></i>排序设置                    
                       </span>
                      </div>
            
             
                <!--  <div class="input-group" style="float: right;width:200px;height: 36px;">
					  <span class="input-group-addon">关联更多:</span>
					 <select id="contentlist" class="form-control" style="height: 36px;">
                     <option value="-1" id="content" selected="selected">选择资源</option>
                     <option value="0">素材</option>   
                     <option value="1">调研</option>   
                     <option value="2">投票</option>   
                     <option value="3">抽奖</option>   
                     <option value="4">排行榜</option>
                     <option value="5">课程</option>   
                     <option value="6">考试</option>
                     <option value="7">活动</option>  
                 </select>
                 </div>-->
               </div>
            <div class="preview-style" style="width:100%;clear:left;margin-top:10px;">
                <div id="selectedbox" class="selectedbox" style="clear:both;margin-top: 10px;">
                    <ul id="selectedlist">
                    </ul>
                    <div id="pageinfo2" style="margin-top:320px;float:left;"></div>
                </div>
                <div class="form-group" style="text-align: right;margin-top: 10px; clear:both">
                    <span class="btn btn-success" id="back"><i class="glyphicon glyphicon-backward"></i>&nbsp;&nbsp;返回</span>
                 </div>
            </div>
	</div>	
                 
			</div>
		</div>
      
	</div>
      <div class="easyDialog_wrapper" id="easyDialogWrapper" style="width: 800px;">
            <div class="easyDialog_content" style="height: 460px; width:800px;">
                <h4 class="easyDialog_title" id="easyDialogTitle">
                    <a href="javascript:void(0)" title="关闭窗口" class="close_btn" onclick="shutdown()">&times;</a>
                    <span id="dialogtitle"></span>
                </h4>
                <ul class="nav nav-tabs">
		        <li class="active tabLi" > <a href="#resourcelist" id="resourcelist"  data-toggle="tab">资源列表</a></li>
		       <li class="tabLi" style="display:none;" id="resource" > <a href="#" onclick="createresource();" id="createresource"  data-toggle="tab">创建资源</a></li> 
              </ul>
		   <div class="tab-content">
		     <div class="tab-pane  active" id="resourcelist">
		            <div class="easyDialog_text" style="display: block;overflow: hidden;width: 780px;height: 320px;overflow-x: hidden;overflow-y: auto;">
                    <div id="activity-box" class="activity-box" style="position: absolute;width: 780px;height: 320px;overflow-x: hidden;overflow-y: auto;">
                    <input type="hidden" id="hid_type" name="hid_type" >
                  <table style="margin-bottom:20px;">
					                <tbody><tr>
					                    <td>
					                      <input type="text" name="search" id="search">
					                    </td>
					                    <td>
					                        <button class="btn btn-success dialog-btn" style="margin:0 !important;" onclick="page(1)">搜索</button>
					                    </td>

					                </tr>
					            </tbody></table>
                        <ul id="resourcecontent">
                             <li>没有内容</li>
                        </ul>
                          <div id="pageinfo"></div>
                    </div>
                </div>
              
                <div class="easyDialog_footer" style="position: absolute;margin-left:40px;margin-top:30px;width: 90%;">
                    <button class="btn_normal" onclick="cancel()" >取消</button>
                    <button class="btn_highlight" onclick="makesure()">确定</button>
                </div>
                
		     </div>
		     
		     <div class="tab-pane " id="addresource">
		     
		     </div>
		     
		  </div>
            </div>
        </div>

</body>
</html>
