<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>自定义菜单</title>
<meta name="menu_path" content="ixin.menu_custommenu"/>
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.css" />
<link rel="stylesheet" type="text/css" href="${basepath }/static/public/easydialog-v2.0/easydialog.css">
<!-- END PAGE LEVEL STYLES -->
<!-- END PAGE LEVEL STYLES -->
<link rel="stylesheet" href="${basepath}/static/public/JQuery zTree v3.5.15/css/zTreeStyle/zTreeStyle.css" type="text/css">
<style type="text/css">
    .ztree li span.button.add {margin-left:2px; margin-right: -1px; background-position:-144px 0; vertical-align:top; *vertical-align:middle}
</style>
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/organization.css">

<script type="text/javascript">
	var zdata = ${tree};
</script>
</head>

<body>
<!-- BEGIN PAGE HEADER-->
         <div class="row" >
            <div class="col-md-12">
               <ul class="page-breadcrumb breadcrumb">
                  <li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                  <li><span href="javascript:void(0)">自定义菜单</span></li>
               </ul>
               <!-- END PAGE TITLE & BREADCRUMB-->
            </div>
         </div>
         <!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-md-12" id="changewith">
			<div class="portlet myblue box">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-cogs"> </i> <span>自定义菜单</span>
					</div>
					<div class="tools add_btn">
					</div>
				</div>
				<div class="portlet-body">
					<!--树状结构的显示-->
					<div class="zTreeDemoBackground left">
						<ul id="whole_tree" class="ztree"></ul>
						
					</div>
				</div>
			</div>
            <div class="btn_group_left">
                   <button type="button" class="btn btn-success"  id="releaseBtn" onclick="releaseMenu();" >发布菜单</button>
                   <button type="button" class="btn btn-success"  id="previewBtn" onclick="previewMenu();" >预览</button>
            </div>
		</div>
		
		<div class="col-md-8 control">
			<!-- 详情 -->
			<div class="portlet purple box " id="detail">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-leaf"> </i> <span>菜单详情</span><input type="hidden" name="perId" id="perId" value=""/>
						<input type="hidden" id="root" name="root" value=${tree } >
					</div>
					<div class="tools add_btn">
					</div>
				</div>
				
				<div class="portlet-body">
					<table class="org_table hidden" id="con_detail">
						<tr>
							<td>名称：</td>
							<td><span id="detail_name">根</span>
							     <input type="hidden" name="detail_leaf" id="detail_leaf" >
							     <input type="hidden" name="detail_depth" id="detail_depth" >
							     <input type="hidden" name="detail_childCount" id="detail_childCount" >
							</td>
						</tr>
						<tr class="leaf_data">
							<td>类型：</td>
							<td><span id="detail_type" style="overflow: hidden;"></span></td>
						</tr>
						<tr id="con_detail_keycode" class="leaf_data">
							<td>内容：</td>
							<td><span id="detail_keycode" style="overflow: hidden;"></span></td>
						</tr>
						<tr id="con_detail_url" class="leaf_data">
							<td>链接：</td>
							<td><span id="detail_url" style="overflow: hidden;"></span></td>
						</tr>
					</table>
                    <div class="hidden" id="con_tip">
                        <div class="col-md-4">
                            <span>一级菜单个数应为1~3个<br>二级菜单个数应为1~5个</span>
                        </div>
                    </div>
					<div class="btn_group_center ">
					   <div id="con_btn" class="hidden" >
							<span id="btn_add_node" class="btn btn-success" onclick="onAdd()">
								<i class="glyphicon glyphicon-plus"></i>&nbsp;增加子菜单
							</span>
							<span id="btn_update_node"  class="btn btn-warning" style="" onclick="onUpdate()">
								<i class="glyphicon glyphicon-edit"></i>&nbsp;修改
							</span>
							<span id="btn_delete_node" class="btn btn-danger" style="display: inline ;" onclick="onDelete()" >
								<i class="glyphicon glyphicon-remove"></i>&nbsp;删除
							</span>
					   </div>
					</div>
				</div>
			</div>
			
			<!-- 新增 -->
			<div class="portlet green box" id="add_node" style="display: none;">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-plus"> </i> <span>新增</span>
					</div>
					<div class="tools add_btn">
					</div>
				</div>
				<div class="portlet-body">
					<form action="${basepath }/mgr/ixin/custommenu/insert.xhtml" id="form_add" class="form-horizontal" onsubmit="return validateAdd()">
						<input type="hidden" name="add_contentType" id="add_contentType"/>
						<input type="hidden" name="add_content" id="add_content"/>
						<div class="form-group">
							<label class="control-label col-md-3">父节点<span
								class="required">*</span></label>
							<div class="col-md-4">
								<span class="parentname" id="parentName">节点1</span><input type="hidden" name="parentId" id="parentId" value=""/>
							</div>
						</div>
						<div class="form-group" id="add_name_con">
							<label class="control-label col-md-3">名称<span class="required">*</span></label>
							<div class="col-md-4">
								<!--<input type="text" name="name" data-required="1" class="form-control"/>-->
									<input type="text" name="name" id="add_name" onchange="v_add_name()" class="form-control" placeholder="">
							</div>
							<div class="col-md-4">
                                <span for="add_name" class="help-block" style="">注:一级菜单不多于5个汉字或<span id="max_name_3">10</span>个字母、二级菜单不多于7个汉字或<span id="max_name_4">14</span>个字母，多出来的部分将会以“...”代替。</span>
                              </div>
						</div>
						<div class="form-group leaf_data" id="add_type_con">
							<label class="control-label col-md-3">类型</label>
							<div class="col-md-4">
                                 <div class="radio-list" id="judge" >
                                     <!-- <label class="radio-inline">
                                         <input type="radio" name="type" id="add_type0" value="0" checked="checked" onclick="toggleAdd(this)">事件
                                     </label>  -->
                                     <label class="radio-inline">
                                         <input type="radio" name="type" id="add_type0" value="0" checked="checked" onclick="toggleAdd(this)">内容
                                     </label> 
                                     <label  class="radio-inline">
                                         <input type="radio" name="type" id="add_type1" value="1" onclick="toggleAdd(this)">链接
                                     </label>
                                 </div>
							</div>
                            <div class="col-md-4">
                                <span for="add_type_tip" class="help-block" style=""></span>
                              </div>
						</div>
						<!-- <div class="form-group leaf_data" id="add_keycode_con">
							<label class="control-label col-md-3">KEY<span class="required">*</span></label>
							<div class="col-md-4">
                                 <input type="text" class="form-control" name="keycode" id="add_keycode" onchange="v_add_keycode()" placeholder="">
							</div>
                            <div class="col-md-4">
                                <span for="add_keycode_tip" class="help-block" style="">不能为空</span>
                              </div>
						</div> -->
						<div class="form-group leaf_data" id="add_contentName_con">
							<label class="control-label col-md-3">内容<span class="required">*</span></label>
	                         <div class="col-md-4">
								<div class="input-group">
									<input type="text" class="form-control" onclick="page(1)" placeholder="请选择内容" readonly="readonly" name="add_contentName" id="add_contentName">
									<span class="input-group-addon choose_btn" onclick="page(1)">点击选择</span>
								</div>
							 </div>
							 <div class="col-md-4">
                                  <span id="tip_paperId" for="paperId" class="help-block " style="">不能为空</span>
                                </div>
						</div>
						<div class="form-group leaf_data hidden" id="add_url_con">
							<label class="control-label col-md-3">URL<span class="required">*</span></label>
							<div class="col-md-4">
                                <input type="text" class="form-control" name="url" id="add_url" onchange="v_add_url()" placeholder="">
							</div>
                            <div class="col-md-4">
                                <span for="add_url_tip" class="help-block" style="">不能为空</span>
                              </div>
						</div>
						<div class="form-actions fluid">
                              <div class="col-md-offset-3 col-md-9">
                                 <button type="submit" class="btn green"><i class="glyphicon glyphicon-plus"></i>&nbsp;确认新增</button>
                                 <button type="button" class="btn default" onclick="cancelAdd()"><i class="glyphicon glyphicon-default"></i>&nbsp;取消</button>                              
                              </div>
                           </div>
					</form>
					
				</div>
			</div>
			
			<!-- 编辑 -->
			<div class="portlet yellow box" id="update_node" style="display: none;" onsubmit="return validateUpdate()">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-edit"> </i> <span>修改</span>
					</div>
					<div class="tools add_btn">
					</div>
				</div>
				<div class="portlet-body">
					<form action="${basepath }/mgr/ixin/custommenu/update.xhtml" id="form_update" class="form-horizontal">
						<input type="hidden" name="update_contentType" id="update_contentType"/>
						<input type="hidden" name="update_content" id="update_content"/>
                        <div class="form-group" id="update_name_con">
                            <label class="control-label col-md-3">名称<span
                                class="required">*</span></label>
                            <div class="col-md-4">
                                <!--<input type="text" name="name" data-required="1" class="form-control"/>-->
                                    <input type="text" name="name" id="update_name" onchange="v_update_name()" class="form-control" placeholder=""><input type="hidden" id="update_parentId" name="update_parentId" value="">
                            </div>
                            <div class="col-md-4">
                                <span for="update_name" class="help-block" style="">注:一级菜单不多于5个汉字或10个字母、二级菜单不多于7个汉字或14个字母，多出来的部分将会以“...”代替。</span>
                            </div>
                        </div>
                        <div class="form-group leaf_data" id="update_type_con">
                            <label class="control-label col-md-3">类型</label>
                            <div class="col-md-4">
                                 <div class="radio-list" id="judge" >
                                     <label class="radio-inline">
                                         <input type="radio" name="type" id="update_type0" value="0" checked="checked" onclick="toggleUpdate(this)">内容
                                     </label> 
                                     <label  class="radio-inline">
                                         <input type="radio" name="type" id="update_type1" value="1" onclick="toggleUpdate(this)">链接
                                     </label>
                                 </div>
                            </div>
                            <div class="col-md-4">
                                <span for="update_type_tip" class="help-block" style=""></span>
                              </div>
                        </div>
                        <!-- <div class="form-group leaf_data" id="update_keycode_con">
                            <label class="control-label col-md-3">KEY<span class="required">*</span></label>
                            <div class="col-md-4">
                                 <input type="text" class="form-control" name="keycode" id="update_keycode" onchange="v_update_keycode()" placeholder="">
                            </div>
                            <div class="col-md-4">
                                <span for="update_keycode_tip" class="help-block" style="">不能为空</span>
                              </div>
                        </div> -->
                        <div class="form-group leaf_data" id="update_contentName_con">
							<label class="control-label col-md-3">内容<span class="required">*</span></label>
	                         <div class="col-md-4">
								<div class="input-group">
									<input type="text" class="form-control" onclick="page(1)" placeholder="请选择内容" readonly="readonly" name="update_contentName" id="update_contentName">
									<span class="input-group-addon choose_btn" onclick="page(1)">点击选择</span>
								</div>
							 </div>
							 <div class="col-md-4">
                                  <span id="tip_paperId" for="paperId" class="help-block " style="">不能为空</span>
                                </div>
						</div>
                        <div class="form-group leaf_data" id="update_url_con">
                            <label class="control-label col-md-3">URL<span class="required">*</span></label>
                            <div class="col-md-4">
                                <input type="text" class="form-control" name="url" id="update_url" onchange="v_update_url()" placeholder="">
                            </div>
                            <div class="col-md-4">
                                <span for="update_url_tip" class="help-block" style="">不能为空</span>
                              </div>
                        </div>
						<div class="form-actions fluid">
                              <div class="col-md-offset-3 col-md-9">
                                 <button type="submit" class="btn btn-warning"><i class="glyphicon glyphicon-edit"></i>&nbsp;确认修改</button>
                                 <button type="button" class="btn default" onclick="cancelUpdate()"><i class="glyphicon glyphicon-default"></i>&nbsp;取消</button>                              
                              </div>
                           </div>
					</form>
				</div>
			</div>
			
			<div>
				<form action="${basepath }/mgr/ixin/custommenu/delete.xhtml" id="form_delete" class="form-horizontal">
					<input type="hidden" name="delete_id" id="delete_id" value=""/>
					<input type="hidden" name="delete_parentId" id="delete_parentId" value=""/>
				</form>
			
			</div>
			
		</div>
	</div>
	
	<!-- 选择内容弹出层 开始 -->
	<div id="dialogBank" style="display: none;width:800px;height:700px;overflow: hidden;">
		<h4 class="easyDialog_title" id="easyDialogTitle">&nbsp;&nbsp;内容选择
			<a href="javascript:easyDialog.close();" title="关闭窗口" class="close_btn" style="float: right;"
				id="closeBtn">&times;&nbsp;&nbsp;</a>
		</h4>
		<div class="easyDialog_text" style="background-color: #fff;padding: 20px;overflow－x: hidden;overflow-y:scroll;height:500px;" id="easyDialogText">
            <table>
            	<tr>
            		<td>
            			<span>内容类型:</span>
                        <select class="" data-placeholder="选择" name="contentType" id="contentType" onchange="page(1)" >
                            <option value="1">内容列表</option>
                            <option value="2">选择活动</option>
                            <option value="3">选择投票</option>
                            <option value="4">选择抽奖</option>
                            <option value="5">关键词回复</option>
                            <option value="6">选择栏目</option>
                         </select>&nbsp;&nbsp;
            		</td>
            		<!-- <td>
            			<span>名称:</span> <input type="text" name="name" id="name">&nbsp;&nbsp;
            		</td>
            		<td>
            			<span class="btn yellow" onclick="page(1)" style="margin: 10px;"><i	class="icon-search"></i>检索</span>
            		</td> -->
            	</tr>
            </table>
            <!-- 表格 -->
            <div id="table_list" style="overflow: auto; width: 100%;"></div>
			
		  	<div class="easyDialog_footer">
		      <button class="btn default dialog-btn" onclick="easyDialog.close()" style="float: right;margin-right: 20px;margin-top: 20px;">关闭</button>
		      <button class="btn btn-success dialog-btn" onclick="addContent()"  style="float: right;margin-right: 20px;margin-top: 20px;">确定选择</button>
		    </div>
		</div>
	</div>
	<!-- 选择用户弹出层 结束 -->
	<!-- 菜单预览 start -->
		<div id="previewbox" class="previewbox" style="display: none;">
			<div class=" preview-header" onclick="easyDialog.close()">
				<i class="glyphicon glyphicon-remove"></i>
			</div>
			<div class=" preview-body">
			<!-- 说明：下面的li除了第一个，剩下的总共的宽度是208px，平均分，如果是三个就不用给syle，如果是两个或者一个的话，给第一个以后的每个加上一个style="width:104px;"或者 style="width:208px;"-->
				<ul >
					<li class = "keyboard">
						<img src="${basepath }/static/public/images/keyboard.png"  style="height:20px;" title="键盘输入">
					</li>
					<c:if test="${second eq 1}">
					<c:forEach items="${listCustom}" var="entity" varStatus="s">
						<c:if test="${rootId eq entity.pId}">
							<c:if test="${entity.isLeaf eq 0}">
							<li onclick="slideup(this)" style="width:208px; display:block;">
								<a href="javascript:void(0)" style="font-size:75%;">${entity.name}</a>&nbsp;<i class="glyphicon glyphicon-chevron-up" style="font-size:12px;color:#eaeaea;"></i>
								<div class="child-caidan" style="display: none;">
								<ul>								
									<c:forEach items="${listCustom}" var="entity1" varStatus="s1">
										<c:if test="${entity.id eq entity1.pId}">
											<li style="width:208px;">${entity1.name}</li>
										</c:if>
									</c:forEach>
								</ul>							
								</div>
							</li>
							</c:if>
							<c:if test="${entity.isLeaf eq 1}">
							<li style="width:208px; display:block;">
								<a href="javascript:void(0)">${entity.name}</a>
							</li>
							</c:if>
						</c:if>
					</c:forEach>		
					</c:if>
					<c:if test="${second eq 2}">
					<c:forEach items="${listCustom}" var="entity" varStatus="s">
						<c:if test="${rootId eq entity.pId}">
							<c:if test="${entity.isLeaf eq 0}">
							<li onclick="slideup(this)" style="width:104px; display:block;" >
								<a href="javascript:void(0)" style="font-size:75%;">${entity.name}</a>&nbsp;<i class="glyphicon glyphicon-chevron-up" style="font-size:12px;color:#eaeaea;"></i>
								<div class="child-caidan" style="display: none;">
								<ul>								
									<c:forEach items="${listCustom}" var="entity1" varStatus="s1">
										<c:if test="${entity.id eq entity1.pId}">
											<li style="width:104px;">${entity1.name}</li>
										</c:if>
									</c:forEach>
								</ul>							
								</div>
							</li>
							</c:if>
							<c:if test="${entity.isLeaf eq 1}">
							<li style="width:104px;">
								<a href="javascript:void(0)">${entity.name}</a>
							</li>
							</c:if>
						</c:if>
					</c:forEach>		
					</c:if>
					<c:if test="${second eq 3}">
					<c:forEach items="${listCustom}" var="entity" varStatus="s">
						<c:if test="${rootId eq entity.pId}">
							<c:if test="${entity.isLeaf eq 0}">
							<li onclick="slideup(this)" style="display:block;" >
								<a href="javascript:void(0)" style="font-size:75%;">${entity.name}</a>&nbsp;<i class="glyphicon glyphicon-chevron-up" style="font-size:12px;color:#eaeaea;"></i>
								<div class="child-caidan" style="display: none;">
								<ul>								
									<c:forEach items="${listCustom}" var="entity1" varStatus="s1">
										<c:if test="${entity.id eq entity1.pId}">
											<li>${entity1.name}</li>
										</c:if>
									</c:forEach>
								</ul>							
								</div>
							</li>
							</c:if>
							<c:if test="${entity.isLeaf eq 1}">
							<li>
								<a href="javascript:void(0)">${entity.name}</a>
							</li>
							</c:if>
						</c:if>
					</c:forEach>		
					</c:if>
					
					<!--  
					<li  onclick="slideup(this)" >
						<a href="javascript:void(0)">学习</a>&nbsp;<i class="glyphicon glyphicon-chevron-up" style="font-size:12px;color:#eaeaea;"></i>
						<div class="child-caidan" style="display: none">
							<ul>
								<li>考试</li>
								<li>上课</li>
								<li>作业</li>
							</ul>
						</div>
					</li>
					
					 <li onclick="slideup(this)">
						<a href="javascript:void(0)" >活动</a>&nbsp;<i class="glyphicon glyphicon-chevron-up" style="font-size:12px;color:#eaeaea;"></i>
						<div class="child-caidan" style="display: none">
							<ul>
								<li>考试</li>
								<li>上课学习</li>
								<li>作业</li>
							</ul>
						</div>
					</li>
					<li  onclick="slideup(this)">
						<a href="javascript:void(0)">课程</a>&nbsp;<i class="glyphicon glyphicon-chevron-up" style="font-size:12px;color:#eaeaea;"></i>
						<div class="child-caidan" style="display: none">
							<ul>
								<li>考试</li>
								<li>上课</li>
								<li>作业</li>
							</ul>
						</div>
					</li>
					-->
				</ul>
			</div>
		</div>
	<!-- 菜单预览 end -->
</body>
</html>
<content tag="pageCore">
<!-- 引用核心js包 -->
 <!-- END PAGE CONTENT-->
     <script src="${basepath }/static/public/easydialog-v2.0/easydialog.min.js" type="text/javascript"></script>
     <script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.core-3.5.js" type="text/javascript"></script>
     <script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.excheck-3.5.js" type="text/javascript"></script>
     <script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.exedit-3.5.js" type="text/javascript"></script>
     <script src="${basepath }/static/ixin/js/custommenu.js" type="text/javascript"></script> 
</content>
<content tag="pageInit">
<!-- 初始化窗口 -->
<script type="text/javascript">
      $(document).ready(function() { 
        $.fn.zTree.init($("#whole_tree"), setting, zNodes);
        $("#whole_tree").find("a[onclick='true']").click();
      });
      function previewMenu(){
    	  easyDialog.open({
    		  container : 'previewbox',
    		  fixed : true
    		});
      }
      function slideup(o){
          var num = $(o).find("li");
          $(o).find("ul").attr("style","margin-top:-"+40*(num.length+1)+"px;");
          $(o).find(".child-caidan").find("li").each(function(){
        	  $(this).parent().width($(this).parent().parent().parent().width());
              //$(this).width($(this).parent().parent().parent().width());
             	});
    	  $(o).parent().find(".child-caidan").each(function(){
    		  if($(this).is(":visible")){
    			  $(this).slideUp("fast");
    			  $(this).removeAttr("flag");
    		  }else{
    			  $(this).attr("flag","true");
    		  }
    	  });
    	  if($(o).find(".child-caidan").attr("flag")){
    		  $(o).find(".child-caidan").slideDown("fast");
    	  }else{
    		  $(o).find(".child-caidan").slideUp("fast");
    	  }
			
      }
</script>
   
   
  
</content>	