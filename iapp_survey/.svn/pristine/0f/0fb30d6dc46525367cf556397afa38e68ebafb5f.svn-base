<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>添加课程</title>
<meta name="menu_path" content="course.courseManage"/>
<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet" type="text/css" href="${basepath}/static/css/active.css">
<link rel="stylesheet" href="${basepath}/static/public/easydialog-v2.0/easydialog.css">
	<script src="${basepath}/static/public/easydialog-v2.0/easydialog.min.js"></script>
	<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/role.css">
	<link rel="stylesheet" href="${basepath}/static/public/JQuery zTree v3.5.15/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="${basepath }/static/public/javascripts/userchoicelist.js" charset="gbk"></script>
	<script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.core-3.5.js" type="text/javascript"></script>
	<script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.excheck-3.5.js" type="text/javascript"></script>
	<script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.exedit-3.5.js" type="text/javascript"></script>
	<script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
</head>
<body>
         <div class="row" >
            <div class="col-md-12">
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
               <ul class="page-breadcrumb breadcrumb">
                     <li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                  <li><a href="${basepath }/base/admin/course/course/coursemanage.xhtml">课程管理</a><i class="icon-angle-right"></i></li>
                   <li><span>课程批量授权</span></li>
               </ul>
               <!-- END PAGE TITLE & BREADCRUMB-->
            </div>
         </div>
         <!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN VALIDATION STATES-->
			<div class="portlet box green">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-reorder"></i><span>课程批量授权</span>
					</div>
				</div>
				<div class="portlet-body form box_box">
				<div class="col-md-12" id="course_info">
				 <div class="preview-style">
				     <div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
			                	<input type="hidden" name="rcategory" id="rcategory" value="${rcategory}" >
		                        <input type="hidden" name="rid" id="rid" value=${ids} >
		                        <input type="hidden" name="scategory" id="scategory" value="${scategory}">
		                        <input type="hidden" name="biaoji" id="biaoji" value="${biaoji}">
			                    <div class="row">
				                    <!-- 用户组织选择 -->
				                    <div class="col-md-12">
				                       <ul class="nav nav-tabs">
				                             <li class="<c:out value='${scategory==1 ? "active":"" }' />" ><a href="#panel1" onclick="authUser()" id="authUser" data-toggle="tab">用户授权</a></li>
				                             <li class="<c:out value='${scategory==2 ? "active":"" }' />"><a href="#panel2" onclick="authOrg()" id="authOrg" data-toggle="tab">组织授权</a></li>
				                             <li class="<c:out value='${scategory==4 ? "active":"" }' />"><a href="#panel4" onclick="authJobLevel()" id="authJobLevel" data-toggle="tab">职级授权</a></li>
				                        </ul>
				                    </div>
				                    <div class="tab-content">
				                         <!-- 用户授权 -->
				                         <div class="tab-pane <c:out value='${scategory==1 ? "active":"" }' />" id="panel1">
				                           <div class="row" style="margin: 10px;">
				                                <div class="col-md-12">
				                                        <!-- 添加用户的按钮 -->
				                                    <span class="btn btn-success add_role" onclick="openAdd()"><i class="icon-plus"></i>添加用户</span>
				                                </div>
				                           </div>
					                       <div class="row" style="margin: 10px 5px;">
					                          <div class="col-md-12">
			
			                                        <input type="hidden" name="userids" id="userids" value="${userids }"/>
				                                    <!-- 表格内容 -->
				                                    <div id="table_list" >
				                                    </div>
				                                </div>
					                       </div>		                        
				                         </div>
				                         
			                             <!-- 组织授权 -->
				                         <div class="tab-pane  <c:out value='${scategory==2 ? "active":"" }' />" id="panel2">
			                                <div class="col-md-12">
			                                    <!-- 表格内容 -->
			                                    <div id="table_list3" >
			                                    </div>
			                                </div>
				                         </div>
				                         
				                          <!-- 职级授权 -->
				                         <div class="tab-pane  <c:out value='${scategory==4 ? "active":"" }' />" id="panel4">
			                                <div class="col-md-12">
			                                    <div id="table_list4" >
			                                    </div>
			                                </div>
				                         </div>
				                         
				                         
				                         
				                    </div>
			                        
			                    </div>
			                </div>
			           </div>
			      </div>
			 </div>
		</div>
	 </div>
</div>

<!-- 选择用户弹出层 开始 -->
					    <div id="add_member_dialog" style="display: none;width:800px;height:700px;overflow-x: hidden;overflow-y:auto;">
					        <h4 class="easyDialog_title" id="easyDialogTitle">&nbsp;&nbsp;选择用户
					            <a href="javascript:void(0)" title="关闭窗口" class="close_btn"
					                id="closeBtn">&times;&nbsp;&nbsp;</a>
					        </h4>
					        <div class="easyDialog_text">
					            <table>
					                <tr>
					                    <td>
					                        <span>用户名:</span> <input type="text" name="susername" id="susername"><br>
					                    </td>
					                    <td>
					                        <span>部门:</span> <input type="text" name="orgname" id="orgname"> 
					                    </td>
					                    <td>
					                        <span class="btn yellow" onclick="pageUser(1)" style="margin: 10px;"><i class="icon-search"></i>检索</span>
					                    </td>
					                </tr>
					            </table>
					            <!-- <span>姓名:</span> <input type="text" name="username" id="username"><br>
					            <span>部门:</span> <input type="text" name="orgname" id="orgname">
					            <span class="btn yellow" onclick="pageUser(1)"><i   class="icon-search"></i>检索</span> -->
					            
					            <!-- 表格 -->
					            <div id="table_list2" style="overflow: auto;width: 100%;"></div>
					            
					            <div class="easyDialog_footer">
					              <button class="btn default dialog-btn" onclick="easyDialog.close()">关闭</button>
					              <button class="btn btn-success dialog-btn" onclick="userAdd()">确定添加</button>
					            </div>
					        </div>
					    </div>
    <!-- 选择用户弹出层 结束 -->
    <script type="text/javascript">
	  	if($("#scategory").val() == 1){
			authUser();
		} else if($("#scategory").val() == 2){
			authOrg();
		}else if($("#scategory").val()==4){
			authJobLevel();
		}
		
		function resizeheightforedite(o){
		    $(".edite-img").height($(o).height());
		    $(".edite-img").attr("style","margin-top:-"+$(o).height()+"px;height:"+$(o).height()+"px;line-height:"+$(o).height()+"px;");
		}
		function showother(){
		    $(".othermsg").slideToggle("fast");
		    $(".moremsg").slideToggle("fast");
		    $(".moremsg-up").slideToggle("fast");
		}

		function page(i) {
			var max = $("#table_list #page_max").val()
			var data = {"scategory":$("#scategory").val()};
			var url = basepath+"/base/admin/authorize/detailgroup.list";
			$("#table_list").load(encodeURI(url), data, function(){
				App.initUniform();//加载复选框样式
			});
		}
        function authUser(){
        	$("#scategory").val(1);
        	//page(1);
            }
        function authOrg(){
        	$("#scategory").val(2);
        	var data = {"rcategory":$("#rcategory").val(),"scategory":$("#scategory").val()};
        	var url = basepath+"/base/admin/authorize/detailgroup.list";
        	$("#table_list3").load(encodeURI(url), data, function(){
        	      $.fn.zTree.init($("#all_permission"), setting, zNodes);
        	      var treeObj = $.fn.zTree.getZTreeObj("all_permission");
        	      treeObj.expandAll(true);
        	});
            }
       function authJobLevel(){
    	   $("#scategory").val(4);
    		var data={"scategory":$("#scategory").val()};
    		var url=basepath+"/base/admin/authorize/detailgroup.list";
    		$("#table_list4").load(encodeURI(url),data,function(){
    			 $.fn.zTree.init($("#all_permission2"), setting, zNodes2);
    		      var treeObj2 = $.fn.zTree.getZTreeObj("all_permission2");
    		      treeObj2.expandAll(true);
    		});
           }
      function userAdd(){
    	  var result = $("#userids").val();
    		if(result!="" && result!=null && result.size<=0){
    			alert("您没有选择任何用户！");
    			return ;
    		}
    		var url = basepath+"/base/admin/authorize/authorizes.xhtml";
    		$.ajax({
        		  type:"post",
        		  url:url,
        		  data:{"userids":$("#userids").val(),"rcategory":$("#rcategory").val(),"ids":$("#rid").val(),"scategory":$("#scategory").val()},
        		  success:function(msg){
            		  if(msg){
            			  easyDialog.close();
            			  alert("用户授权成功");
                		  }
            		  }
        		});
    		
          }

        /** 添加用户弹出框 */
        function openAdd(){
        	pageUser(1);
        	easyDialog.open({
        		  container : 'add_member_dialog',
        		  fixed : false
        		});
        }

       /**
        * 未授权用户：分页
        */
       function pageUser(i, fieldId) {
       	var divId = "table_list2";
       	
       	var order = getOrder(divId, fieldId);
       	var max = $("#"+divId+" #page_max").val()

       	var data = {"page":i, "max":max, "r":Math.random(), "username":$("#susername").val(),
       			"orgname":$("#orgname").val(), "userids":$("#userids").val(), "rcategory":$("#rcategory").val(),
       			"rid":$("#rid").val(), "scategory":$("#scategory").val(), 
       			"orderField":order.orderField, "orderDirection":order.orderDirection };
       	var url = basepath+"/base/admin/authorize/chooseuser.list";
       	$("#"+divId).load(encodeURI(url), data, function(){
       	});
       }


        
	</script>
</body>
</html>			 