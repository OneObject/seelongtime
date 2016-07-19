<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.session.SessionHelper"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%><%--需重再一次导入 --%>
<!DOCTYPE html>
<%
	String uid= SessionHelper.getCurrentUid();
	String domain = SessionHelper.getCurrentDomain();
	boolean isShowExam = false;
	if("chtwm".equals(domain)){
		isShowExam = true;
	}
	pageContext.setAttribute("isShowExam", isShowExam);
%>
<html>
<head>
<title><fmt:message key="menu.usercenter" bundle="${bundle}"/></title>
<meta name="menu_usercenter" content="usercenter"><%--当前菜单选中设置 --%>
<style type="text/css">
.condition_title{display: block;float: left;text-align: right;background-color: #eee;border: 1px solid #afafaf;padding: 5px 10px;color:#999;}
.condition_item{float: left;margin-left: -40px;}
.condition_item>li{float: left;list-style: none;cursor: pointer;}
.condition_item>.check_item{padding: 5px 10px;display: block;margin-left: 5px;border: 1px solid #AFAFAF;}
.item_checked{background-color: #EA6161;color: #FFFFFF;}
</style>
</head>
<body>
<section class="main-home">
	
	<ol class="breadcrumb">
    <li><a href="${basepath}/"><fmt:message key="menu.home" bundle="${bundle}"/></a></li>
    <li class="active"><fmt:message key="menu.usercenter" bundle="${bundle}"/></li>
</ol>
	
    <div class="user-info">
        <!--左边用户的头像以及信息-->
        <!--onmousemove="$('#bianji-box').fadeIn()"  onmouseout="$('#bianji-box').fadeOut()"-->
        <div class="user-info-photo" >
        	
        	<c:if test="${empty user.avatar}">
        		<img src="${basepath}/static/img/user/avatar.png"/>
        	</c:if>
        	<c:if test="${not empty user.avatar}">
        		<img src="${imgpath}/${user.avatar}" title="<fmt:message key="ucenter.img_loading" bundle="${bundle}"/>">
        	</c:if>
           <div id="bianji-box">
               <span class="bianjitouxiangbg"></span>
               <span class="edit-span" onclick="window.location.href='${basepath}/user/avatar.xhtml'"><i class="fa fa-edit"></i>&nbsp;<fmt:message key="ucenter.edit_avatar" bundle="${bundle}"/></span>
           </div>
        </div>
         
        <div class="user-info-fans">
            <ul>
            <%--
                <li>
                    <span>--</span>
                    <span>关注</span>
                </li>
                <li>
                    <span>--</span>
                    <span>粉丝</span>
                </li>
             --%>
               <%--  <li style="display: block;width:100%;">
                    <span style="display: block;height:100%;width:100%;text-align:center;font-size:14px;line-height:49px;">${ajy:creditTotal(user.id) }&nbsp;&nbsp;积分</span>
                </li> --%>
            </ul>
        </div>
       
    </div>
    <div class="user-detail">
        <!--用户具体信息-->
        <div class="user-detail-line1">
            <div class="user-detail-name">
                <span>${user.name}</span>
            </div>
            <div class="user-detail-sex">
                <span class="edit-name" onclick="$('#nickname-box').toggle()" ><i class="fa fa-edit"></i></span>
            </div>
            <!--<div class="user-detail-sex">-->
                <!--<img src="../../../static/img/user/lady.png">&lt;!&ndash;男的是：men.png&ndash;&gt;-->
            <!--</div>-->
            <div class="user-detail-time">
                <span><fmt:message key="ucenter.register_time" bundle="${bundle}"/>：${ltfun:dateLongToStringFormat(user.createtime,"yyyy-MM-dd")}</span>
            </div>
        </div>
        <div class="user-detail-line2">
            <form id="nickname-box"  role="form" action="${basepath}/user/edit.xhtml" method="post" style="display: none">
                <div class="form-group">
                  <div class="col-md-5">
                       <input type="text" class="form-control" id="name" name="name" placeholder="<fmt:message key="ucenter.name" bundle="${bundle}"/>" value="${user.name }">
                     <input type="hidden" id="action" name="action" value="base">
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-md-5">
                        <input name="labels" id="labels" class="form-control" value="${user.labels }"  placeholder="<fmt:message key="ucenter.label_tip" bundle="${bundle}"/>" title="<fmt:message key="ucenter.label_tip" bundle="${bundle}"/>">
                  </div>
                </div>
                <button type="submit" class="btn btn-danger"><fmt:message key="ucenter.save" bundle="${bundle}"/></button>
            </form>

           <!--  <span class="user-detail-level">Lv:初来乍到</span>--> 
        </div>
        <div class="user-detail-line3">
           <div class="user-detail-info">
                <span><fmt:message key="ucenter.email" bundle="${bundle}"/>：${user.email}</span>
                <span><fmt:message key="ucenter.mobile" bundle="${bundle}"/>：${user.mobile}</span>
                <span><fmt:message key="ucenter.label" bundle="${bundle}"/>：${user.labels}</span>
            </div>
        </div>
    </div>
    
    
    
    
    
    <!-- 列表 -->
    <ul class="nav nav-tabs" style="margin-top:20px;">
         <li class="tabLi active" data-id="#mycourse"> <a href="#mycourse" onclick="" data-toggle="tab"><fmt:message key="ucenter.mysurvey" bundle="${bundle}"/></a></li>
        <%--  <li class="tabLi" data-id="#myexam"> <a href="#myexam" onclick="" data-toggle="tab">我的考试</a></li>
         <li class="tabLi" data-id="#mycomment"> <a href="#mycomment" onclick="" data-toggle="tab">我的评论</a></li> --%>
    </ul>
    
    
    <div class="tab-content" style="overflow: hidden;border:1px solid #eee;border-top:0;padding-bottom:15px;">
    
    
    	<div class="tab-pane active" id="mycourse"  data-id="mycourse" >
        <section class="col-xs-12 col-sm-12 col-md-12">
            <!--已经添加的课程 start-->
	            <div class="table-box">
	            <%--
	                <div class="table-header">
	                    <span class="table-title"><i class="fa fa-book"></i>&nbsp;&nbsp;我的课程</span>
	                </div>
	             --%>
	                <div style="width:80px;height:80px;margin:40px auto;" id="courseloading"><img style="width:80px;height:80px;display:block;" src="${basepath }/static/img/loading.gif" /></div>
	                <div class="table-body" id="courserecord" style="display: none">
	                	<table class="table table-bordered table-hover table-striped">
	                		<thead>
	                			<tr>
	                				<th width="120px"><fmt:message key="ucenter.th.no" bundle="${bundle}"/></th>
	                				<th ><fmt:message key="ucenter.th.name" bundle="${bundle}"/></th>
	                				<th style="text-align: center;"  width="150px"><fmt:message key="ucenter.th.starttime" bundle="${bundle}"/></th>
	                				<th style="text-align: center;" align="center" width="150px"><fmt:message key="ucenter.th.endtime" bundle="${bundle}"/></th>
	                				<th style="text-align: center;" align="center" width="200px"><fmt:message key="ucenter.th.option" bundle="${bundle}"/></th>
	                			</tr>
	                		</thead>
	                		<tbody id="coursedata">
		                		
		                		
	                		</tbody>
	                	</table>
	                	  <div id="pageinfo1" class="fenye"></div>
	            </div>
            <!--已经添加的课程 end-->
        </section>
   		</div>
    </div>
    
</section>


 <input type="hidden" value="<%=Constant.ADMIN_ROOT %>" id="adminRoot">

<!--下面是页面使用的js-->
<script type="text/javascript" src="${basepath}/static/js/page.js"></script>
 <!--start 分页信息 -->
 <script type="text/javascript">
 	
 		var page_size = 10;
    
    		$(function(){
    			courseData(1);
        })
		function gotoPage1(num,size){
			courseData(num);
		  }   

		function courseData(i){
			$.ajax({
                type: "POST",
                url:"${basepath}/survey/mysurvey.list",
                data:{'page':i,"size":page_size},
                error: function(rs) {
	                	$("#courseloading").show();
	                	$("#courserecord").hide();
                },
                success: function(data) {
	                	$("#courseloading").hide();
	                	$("#coursedata").html(data);
	                	$("#courserecord").show();
                }
            });
		}  
		  
		function showResult(tid) {
			var uid = "<%=uid%>";
			var adminRoot = $("#adminRoot").val();
			window.open(adminRoot
					+ "/student/itest/examination/showResult.xhtml?tid=" + tid
					+ "&uid=" + uid ,"new1");
		}

		
		var restype = 1;

		function commentData(i){
			$.ajax({
                type: "POST",
                url:"${basepath}/comment/record.list",
                data:{'current_page':i,page_size:page_size,restype:restype},
                error: function(rs) {
                	$("#commentloading").show();
                	$("#commentrecord").hide();
                	
                },
                success: function(data) {
                	
                	$("#commentloading").hide();
                	$("#commentdata").html(data);
                	$("#commentrecord").show();
                	
                }
            });
		}
		
		function deletecomment(id){
			$.ajax({
                type: "POST",
                url:"${basepath}/comment/delete.json",
                data:{id:id},
                error: function(rs) {
                	
                },
                success: function(data) {
                	commentData(1);
                }
            });
		}


		function itemselect1(thi){
			var type=$(thi).attr("t")
			$(thi).removeClass("item_checked");
			$(thi).addClass("item_checked");
			$("#course").removeClass("item_checked");
			$("#answer").removeClass("item_checked");
			restype=type;
			commentData(1);
		}

		function itemselect2(thi){
			var type=$(thi).attr("t")
			$(thi).removeClass("item_checked");
			$(thi).addClass("item_checked");
			console.log($("#topics").attr("class"))
			$("#topics").removeClass("item_checked");
			$("#answer").removeClass("item_checked");
			restype=type;
			commentData(1);
		}

		function itemselect3(thi){
			var type=$(thi).attr("t")
			$(thi).removeClass("item_checked");
			$(thi).addClass("item_checked");
			$("#topics").removeClass("item_checked");
			$("#course").removeClass("item_checked");
			restype=type;
			commentData(1);
		}

		
		
    </script>



</body>
</html>