<%@page import="com.longtime.common.utils.DateUtils"%>
<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>用户管理</title>
	<meta name="menu_path" content="system.user"/>
	<!-- BEGIN PAGE LEVEL STYLES -->
   <link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
   <!-- END PAGE LEVEL STYLES -->
	<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/usermanage.css">
	<style type="text/css">
	.condition_item > .check_item{margin-bottom:10px;}
	
	<c:if test="${!isQY }">
		.qywx{display: none;}
	</c:if>
	<c:if test="${isQY }">
		.notqywx{display: none;}
	</c:if>
	
	</style>
</head>  
<body>
<!-- BEGIN PAGE HEADER-->
         <div class="row" >
            <div class="col-md-12">
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
               <ul class="page-breadcrumb breadcrumb">
                 <%--  <li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                   --%><li><span>用户管理</span></li>
               </ul>
               <!-- END PAGE TITLE & BREADCRUMB-->
            </div>
         </div>
         <!-- END PAGE HEADER-->
         <!-- 页头-->
         <div class="row">
            <div class="col-md-12">
               <!--search box-->
              <div class="col-md-12 search_box">
                  <div class="col-md-12">
                   <!--全局搜索框-->
                   <div class="col-md-6 search_container">
                       <div class="input-group">
                          <input type="text" class="form-control" id="searchContent" placeholder="输入用户名/真实姓名/昵称/邮箱地址/手机">
                          <span class="input-group-btn">
                           <button onclick="page(1,true)" class="btn btn-danger" type="button">
                              <i class="icon-search"></i>
                           </button>
                          </span>
                        </div>
                              <!-- /input-group -->
                        </div>                  
                  </div>
              </div>
            </div>
         </div>
         <!--条件选择-->
         <div class="row">
              <div class="col-md-12">
                <div class="search_condition">
                	
               <%-- <c:if test="${!isQY }">
                	  <div class="row">
                        <span class="condition_title">绑定状态</span>
                        <input type="hidden" name="banding" id="banding"  value="-1" >
                        <ul class="condition_item band" onclick="page(1,true)">
                            <li class="check_item item_checked">
                                <span >不限<input type="hidden" value="-1" /></span>
                            </li>
                            <li class="check_item">
                                <span>未绑定<input type="hidden" value="0" /></span>
                            </li>
                             <li class="check_item">
                                <span>已绑定<input type="hidden" value="1" /></span>
                            </li>
                        </ul>
                    </div> 
                </c:if>
                
                <c:if test="${isQY }">
                	  <div class="row">
                        <span class="condition_title">关注状态</span>
                        <input type="hidden" name="attentionstatus" id="attentionstatus"  value="-100" >
                        <ul class="condition_item attentionstatus" onclick="page(1,true)">
                            <li class="check_item item_checked">
                                <span >不限<input type="hidden" value="-100" /></span>
                            </li>
                            <li class="check_item">
                                <span>未邀请<input type="hidden" value="0" /></span>
                            </li>
                            <li class="check_item">
                                <span>已邀请<input type="hidden" value="1" /></span>
                            </li>
                            <li class="check_item">
                                <span>邀请失败<input type="hidden" value="-1" /></span>
                            </li>
                            <li class="check_item">
                                <span>已关注<input type="hidden" value="2" /></span>
                            </li>
                            <li class="check_item">
                                <span>取消关注<input type="hidden" value="3" /></span>
                            </li>
                        </ul>
                    </div> 
                </c:if> --%>
                
                
                    <div class="row">
                        <!--性别-->
                        <span class="condition_title">性别</span>
                        <input type="hidden" name="gender" id="gender"  >
                        <ul class="condition_item sex" onclick="page(1,true)">
                            <li class="check_item item_checked">
                                <span >不限</span>
                            </li>
                           <c:forEach var="gender_item" items="${genderMap }">
                             <li class="check_item">
                                <span>${gender_item.value }<input type="hidden" value="${gender_item.key }" /></span>
                            </li>
                           </c:forEach>
                        </ul>
                        <!--性别结束-->
                    </div>                 
                
                    <div class="row">
                        <!-- 部门 -->
                        <span class="condition_title">部门</span>
						<input type="hidden"  id="orgRootId" value="${rootId }">
                        <input type="hidden" name="orgId" id="orgId" value="${rootId }" >
                        <div class="eve_checked " style="width:90%;" >
                            <ul class="condition_item" id="clear_org_con">
	                            <li  class="check_item item_checked" id="clear_org" onclick="clearOrg(this,'${rootId}')">
	                                <span >不限</span>
	                            </li>
                            </ul>
                            <span id="my_showMore" style="display:inline-block;float:right;height:31px;line-height:31px;padding:5pxpx;border: none;color:#529bea;cursor:pointer;display:none;">展开<i class='i icon-sort-down' style="position:relative;left:2px;top:-4px;"></i></span>
                            <%--<span id="my_showMore" style="display:inline-block;float:right;height:31px;line-height:19px;padding:5px 15px;border: 1px solid #AFAFAF;color:#fff;background:#EA6161;cursor:pointer;display:none;">显示全部</span> --%>
                        </div>
                        
                        
                        <ul class="condition_item bumen" id="li_con"  style="height:40px;overflow:hidden">
                            <c:forEach var="org" items="${orgList }" varStatus="orgIndex">
		                           <li class="check_item" style="margin-bottom:10px;" onclick="check_obj(this, '${rootId }', '${org.id }', '${org.name }', ${org.isLeaf })">
		                               <span>${org.name }</span>
		                           </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
              </div>
         </div>
         <!-- 页面头部结束-->
         <div class="row">
              <div class="col-md-12">
               <!-- BEGIN EXAMPLE TABLE PORTLET-->
               <div class="portlet box blue">
                  <div class="portlet-title">
                     <div class="caption"><i class="icon-globe"></i>用户列表</div>
                     <!-- <div class="actions">
                        <div class="btn-group">
                           <a href="#" data-toggle="dropdown">
                               <i class="glyphicon glyphicon-align-justify" style="color:#fff;"></i>
                           </a>
                           <div id="sample_2_column_toggler" class="dropdown-menu hold-on-click dropdown-checkboxes pull-right">
                              <label><input type="checkbox" checked data-column="1">复选框</label>
                              <label><input type="checkbox" checked data-column="2">序号</label>
                              <label><input type="checkbox" checked data-column="3">用户名</label>
                              <label><input type="checkbox" checked data-column="4">姓名</label> 
                              <label><input type="checkbox" checked data-column="5">邮箱</label>
                              <label><input type="checkbox" checked data-column="6">手机</label>
                              <label><input type="checkbox"   data-column="7">昵称</label>
                              <label><input type="checkbox"  checked data-column="8">部门</label>
                              <label><input type="checkbox"  checked data-column="9">职级</label>
                              <label><input type="checkbox"  data-column="10">工作电话</label>
                              <label><input type="checkbox"  data-column="11">证件类型</label>
                              <label><input type="checkbox"  data-column="12">证件号码</label>
                              <label><input type="checkbox" checked data-column="13">性别</label>
                              <label><input type="checkbox"  data-column="14">生日</label>
                              <label><input type="checkbox" checked data-column="3">姓名</label> 
                              <label><input type="checkbox" checked data-column="4">邮箱</label>
                              <label><input type="checkbox" checked data-column="5">手机</label>
                              <label><input type="checkbox"   data-column="6">昵称</label>
                              <label><input type="checkbox"  checked data-column="7">部门</label>
                              <label><input type="checkbox"  data-column="8">工作电话</label>
                              <label><input type="checkbox"  data-column="9">证件类型</label>
                              <label><input type="checkbox"  data-column="10">证件号码</label>
                              <label><input type="checkbox" checked data-column="11">性别</label>
                              <label><input type="checkbox"  data-column="12">生日</label>
                              <label><input type="checkbox" checked data-column="13">操作</label>
                           </div>
                        </div>
                     </div> -->
                  </div>
                  <div class="portlet-body" style="overflow: hidden;">
                      <div class="row">
                        <ltacl:res resourceId="711" ctl="true" >
                        	<ltacl:checkAcl resourceId="711">
                            <span class="btn btn-success table_add" onclick = "sendEmail();">
                               <i class="glyphicon glyphicon-envelope"></i>
                                                                                   账号开通邮件通知
                           </span>
                           </ltacl:checkAcl>
                        </ltacl:res>
                       <span class="btn btn-success table_add common_add" onclick="exportUser();">
                               <i class="glyphicon glyphicon-export"></i>
                                                                                 导出所有用户信息                                      
                       </span>
                       <span class="btn btn-success table_add" onclick="batchUser();">
                               <i class="glyphicon glyphicon-import"></i>
                                                                                 批量导入用户                                                   
                       </span>
                       
              <c:if test="${isQY }">           
                          <span class="btn btn-success table_add" onclick="attend();">
                               <i class="glyphicon glyphicon-plus"></i>
                                                                                    邀请关注
                           </span>
             </c:if>           
                       
                        
                          <span class="btn btn-success table_add" onclick="addUser();">
                               <i class="glyphicon glyphicon-plus"></i>
                                                                                    新增用户
                           </span>
                       
                     
                       
                            <span class="btn btn-danger table_add" onclick = "deleteGroup();">
                               <i class="glyphicon glyphicon-trash"></i>
                                                                                    删除用户
                           </span>
                      
                       
                        
                      
                      </div>
                    
                    <%-- 分页内容 --%>
                    <div id="table_list" class="mt10"></div>
                      
                  </div>
               </div>
               <!-- END EXAMPLE TABLE PORTLET-->
             </div>
         </div>
         	 <!-- 弹出层 开始 -->
    <div class="easyDialog_wrapper" id="dialogbank" style="display: none;">
        <div class="easyDialog_content">
            <h4 class="easyDialog_title" id="easyDialogTitle">
                <a href="javascript:void(0)" title="关闭窗口" class="close_btn"
                    id="closeBtn">&times;</a> <span id="dialog_title"></span>
            </h4>
            <div class="easyDialog_text" style="padding-bottom:12px;">
                <div style="width:300px;text-align:center;" class="form-horizontal " id="easyDialogcontent">
		            
		           
                </div>
                 <div class="easyDialog_footer" style="clear:both;margin-top:20px;text-align:center;">
	          		<button class="btn default dialog-btn btn-sm" onclick="easyDialog.close()">关闭</button>
	          		
	       		 </div>
	       		 <div style="clear:both;margin-bottom:-10px; text-align:right;">
		         <a href="${basepath}/mgr/email/index.xhtml;">查看历史通知</a>
		        </div>
            </div>
        </div>
    </div>
    
        <div class="easyDialog_wrapper" id="timedialog" style="display: none;">
        <div class="easyDialog_content">
            <h4 class="easyDialog_title" id="easyDialogTitle">选择通知时间
                <a href="javascript:easyDialog.close()" title="关闭窗口" class="close_btn"
                    id="closeBtn">&times;</a> <span id="dialog_title"></span>
            </h4>
            <div class="easyDialog_text">
                <div style="width:400px;" class="form-horizontal ">
		            <div class="form-group" id="con_sendtime">
		                <label class="control-label col-md-3"  style="margin-left:50px;" >发送时间：</label>
		                <div class="col-md-6">
		                    <input type="text" class="form-control" id="sendtime" value="<%= DateUtils.longToString(System.currentTimeMillis(),DateUtils.DATE_FORMAT_TIME) %>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',minDate:'%y-%M-%d %H:%m'})">
		                    <span id="tip_sendtime" class="help-block hidden">不能为空！</span>
		                </div>
		            </div>
		           
                </div>
		        <div class="form-group" style="margin:25px 0px 5px;">
		            <div id="btn_con" class="col-md-5" style="margin:0 auto;float:none;text-align:center;">
	          		<button class="btn btn-success dialog-btn btn-sm"  onclick="addEmail();">提交</button>
		            <button class="btn default dialog-btn btn-sm" onclick="easyDialog.close()">关闭</button>
		            </div>
		        </div>
		        <div class="easyDialog_footer" style="clear:both;margin-bottom:-20px; text-align:right;">
		         <a href="${basepath}/mgr/email/index.xhtml;">查看历史通知</a>
		        </div>
            </div>
        </div>
    </div>
    
    
    
    
         <script type="text/javascript">
			$(function(){
		/**		var h=$("#li_con").height();
				$("#my_showMore").hide();
				if(h>40){
					$("#my_showMore").show();
					$("#li_con").css({"height":"40px","overflow":"hidden"});
				}*/
				$("#my_showMore").show();
				$("#my_showMore").click(function(){
					var v=$(this).text();
				/**	if(v=="显示全部"){
						$("#my_showMore").text("显示部分");
						$("#li_con").css({"height":"100%","overflow":"auto"});				
					}else if(v=="显示部分"){
						$("#my_showMore").text("显示全部");
						$("#li_con").css({"height":"40px","overflow":"hidden"});				
					}	*/
					if(v=="展开"){
						$("#my_showMore").html("收缩<i class='i icon-sort-up' style='position:relative;left:2px;top:5px;'></i>");
						$("#li_con").css({"height":"100%","overflow":"auto"});				
					}else if(v=="收缩"){
						$("#my_showMore").html("展开<i class='i icon-sort-down' style='position:relative;left:2px;top:-4px;'></i>");
						$("#li_con").css({"height":"40px","overflow":"hidden"});				
					}	
				});	

			});	
		</script>
</body>




</html>
<content tag="pageCore">
 <!-- END PAGE LEVEL PLUGINS -->
 <script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/jquery.dataTables.js"></script>

<!-- BEGIN PAGE LEVEL PLUGINS -->
    <script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
    <script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.js"></script>
	<script src="${basepath}/static/public/metronic.bootstrap/assets/scripts/app.js" type="text/javascript"></script>
	<script src="${basepath }/static/public/javascripts/cutPage.1.0.js" type="text/javascript"></script>
	<script src="${basepath }/static/public/javascripts/usermanage.js?v=1" type="text/javascript"></script>
	<script src="${basepath }/static/public/javascripts/dateUtil.js" type="text/javascript"></script>
	<script language="javascript" type="text/javascript" src="${basepath }/static/public/My97DatePicker/WdatePicker.js"></script>
	
	

</content>
<content tag="pageInit">



</content>  

  
