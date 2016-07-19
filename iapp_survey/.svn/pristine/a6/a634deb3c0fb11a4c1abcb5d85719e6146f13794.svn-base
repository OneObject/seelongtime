<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>课程评论导出</title>
<meta name="menu_path" content="bigdata.comment"/>
<!-- Important Owl stylesheet -->
   <!-- BEGIN PAGE LEVEL STYLES -->
   <link rel="stylesheet" type="text/css" href="${basepath}/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
   <!-- END PAGE LEVEL STYLES -->
   <!-- BEGIN THEME STYLES --> 
   <link href="${basepath}/static/public/metronic.bootstrap/assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
   <link href="${basepath}/static/public/metronic.bootstrap/assets/css/style.css" rel="stylesheet" type="text/css"/>
   <link href="${basepath}/static/public/metronic.bootstrap/assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
   <link href="${basepath}/static/public/metronic.bootstrap/assets/css/plugins.css" rel="stylesheet" type="text/css"/>
   <link href="${basepath}/static/public/metronic.bootstrap/assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
   <link href="${basepath}/static/public/metronic.bootstrap/assets/css/custom.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="${basepath}/static/public/carousel/owl-carousel/owl.carousel.css">
	<!-- Default Theme -->
	<link rel="stylesheet" href="${basepath}/static/public/carousel/owl-carousel/owl.theme.css">
	<link rel="stylesheet" href="${basepath}/static/public/JQuery zTree v3.5.15/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<link rel="stylesheet" media="screen" href="${basepath}/static/public/stylesheets/usermanage.css">
</head>
<body>

       <!-- BEGIN PAGE HEADER-->
         <div class="row" >
            <div class="col-md-12">
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
               <ul class="page-breadcrumb breadcrumb">
                  <li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                  <li><span>课程评论导出</span></li>
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
                     <div class="caption"><i class="icon-reorder"></i><span>课程评论导出</span></div>
                  </div>
                  <div class="portlet-body form">
                     <div class="form-body">
                        <!-- BEGIN FORM-->
                        <form  id="form_sample_1" class="form-horizontal" method="post" >
                           
                           
                          
                           
                        
                           
                           <div class="form-group" id="orgId_con">
                              <label class="control-label col-md-3">部门<span class="required">*</span></label>
                              <div class="col-md-4">
                                 <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-tower"></i></span>
                                        <div class="input-group" onclick="open_dialog('','1')">
                                            <input name="orgName" id="orgName" readonly="readonly" type="text" class="form-control" value="组织结构">
                                            <input name="orgId" id="orgId" type="hidden" value="${rootId}" >
                                            <div class="spinner-buttons input-group-btn">
                                                <button class="btn default" type="button">
                                                    <span id="choose_org">选择部门</span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                              </div>
                              <div class="col-md-4">
                                <span id="orgId_tip" for="orgId" class="help-block " style="">包含子部门</span>
                              </div>
                           </div>
        
                           <div class="form-actions fluid">
                              <div class="col-md-offset-3 col-md-9">
                              <span class="btn btn-success "  onclick="exportStudyDetail(2);"  >
           						导出课程评论
   							 </span>
                              </div>
                           </div>
                        </form>
                        <!-- END FORM-->
                     </div>
                  </div>
                  <!-- END VALIDATION STATES-->
               </div>
            </div>
    </div>
 
    <!-- 弹出下载界面 -->
		<div class="easyDialog_wrapper" id="easyDialogWrapperww">
			<div class="easyDialog_content">
				<h4 class="easyDialog_title" id="easyDialogTitle">
					<a href="javascript:void(0)" title="关闭窗口" class="close_btn"
						 onclick="easyDialog.close()">&times;</a><span id="content">下载</span>
				</h4>
				<div class="easyDialog_text" style="width:360px;height:120px;display:block;overflow-x:hidden;overflow-y:scroll;">
					<!-- Tab panes -->
					<div class="tab-content" id="errorMsg">
						<p style="margin-left: 88px">课程评论已导出，请下载</p>
					  	 <a href="" target="new_blank" class="btn btn-success table_add" id="exportUrl" style="width: 128px;margin-right: 100px; margin-top: 15px;" onclick="easyDialog.close()" >
                              <i class="glyphicon glyphicon-plus"></i>点击下载
                         </a>
					</div>
				</div>
			</div>
		</div>
</body>
</html>
<content tag="pageCore">
<!-- BEGIN PAGE LEVEL PLUGINS -->
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/fuelux/js/spinner.min.js"></script>
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/ckeditor/ckeditor.js"></script>  
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/bootstrap-fileupload/bootstrap-fileupload.js"></script>
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script> 
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>
 
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/jquery-inputmask/jquery.inputmask.bundle.min.js"></script>   
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/jquery.input-ip-address-control-1.0.min.js"></script>
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/jquery-multi-select/js/jquery.multi-select.js"></script>
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/jquery-multi-select/js/jquery.quicksearch.js"></script>   
   <script src="${basepath}/static/public/metronic.bootstrap/assets/plugins/jquery.pwstrength.bootstrap/src/pwstrength.js" type="text/javascript" ></script>
   <script src="${basepath}/static/public/metronic.bootstrap/assets/plugins/bootstrap-switch/static/js/bootstrap-switch.min.js" type="text/javascript" ></script>
   <script src="${basepath}/static/public/metronic.bootstrap/assets/plugins/jquery-tags-input/jquery.tagsinput.min.js" type="text/javascript" ></script>
   <!-- END PAGE LEVEL PLUGINS -->
     <script src="${basepath}/static/public/metronic.bootstrap/assets/scripts/app.js"></script>
   <script src="${basepath}/static/public/metronic.bootstrap/assets/scripts/form-components.js"></script>
   <script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.core-3.5.js" type="text/javascript"></script>
     <script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.excheck-3.5.js" type="text/javascript"></script>
     <script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.exedit-3.5.js" type="text/javascript"></script>
     <script type="text/javascript">
	function open_dialog(nodeId,type){
		var url = basepath+"/base/admin/organization/getorgs.xhtml";
		$.ajax({
			url:url,
			type:"POST",
			data:{"treeId":nodeId,"type":type},
			//contentType: "application/json; charset=utf-8",
			success:function(data){
				zdata = data;
				var str='<div id="dialog_bumen"><div class="zTreeDemoBackground"><ul id="treeDemo" class="ztree"></ul></div></div>';
				

				if(type=="1"){
					easyDialog.open({
						  container : {
							    header : '选择部门',
							    content :str,
							    yesFn : btnFn,
							    noFn : true
							  },
						  fixed : false
						  , callback : orgIdValidate_calback
						});
					$.fn.zTree.init($("#treeDemo"), settingclick, zdata);
					 $("#treeDemo").find("a[onclick='true']").click();
				}
				else{
					easyDialog.open({
						  container : {
							    header : '选择部门',
							    content :str,
							    yesFn : btnMulti,
							    noFn : true
							  },
						  fixed : false
						  , callback : orgIdValidate_calback
						});
					$.fn.zTree.init($("#treeDemo"), setting, zdata);
				}
				
				
				var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
				if(nodeId != null && nodeId != ""){
					//TODO 以后这里要传入id
				}
			}
		});
	}


	var btnFn = function(){
		var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
		var selectNodes = treeObj.getSelectedNodes();
		$("#orgId").val(selectNodes[0].id);
		$("#orgName").val(selectNodes[0].name);
		$("#choose_org").attr("onclick", "open_dialog('"+selectNodes[0].id+"','1')");
		easyDialog.close();
	};


	var orgIdValidate_calback = function(){
		orgIdValidate();
	}

	/** 组织验证 */
	function orgIdValidate(){
		var id = "orgId"
		var obj = $("#"+id);
		var value = $.trim(obj.val());
		if(isNotBlank(value)){
			removeError(id);
			return true;
		} else {
			addError(id);
			return false;
		}
	}

	var settingclick = {
			view: {
				showLine: false,
				fontCss: setFontCss
			},
			data: {
				simpleData: {
					enable: true
				}
				,key: {
					title: "title"
				}
			}
		};

	function setFontCss() {
		return {color:"#000000",size:"20px",height: "24px",family:"微软雅黑"};
	};

	function addError(id){
		$("#"+id+"_con").addClass("has-error");
		$("#"+id).focus();
	}
	function removeError(id){
		$("#"+id+"_con").removeClass("has-error");
	}







	function exportStudyDetail(type){
		var isAll = $("#isall").attr("checked"); //导出是否包含子节点
		var orgname = $('.item_checked > span').html();
	
		easyDialog.open({
  		  container :'loading_img',
  		  fixed : false,
  		  overlay:true
  		});
		$.ajax({
			type:"POST",
			url:basepath+"/base/admin/report/appoint/comment/export.json",
			data:{"orgId":$("#orgId").val()},
			success:function(data){
				if(data.flag)
				{	
				    //easyDialog.close();
					$("#exportUrl").attr("href",basepath+"/"+data.relativepath);
					$("#content").html("提示");
					easyDialog.open({
				    	container :"easyDialogWrapperww"
				    });
				}
				else
				{
					showMsgDialog(data.message);
				}	
			},
			error:function(data){
				showMsgDialog("系统异常，请刷新后重新尝试。");
			}
		});
	}
	
	function showMsgDialog(content){
		easyDialog.open({
	        container : {
	            header : '提示',
	            content : '<div style="background-color: #ffffff;width:320px;height:60px;text-align:center;">'+content+'</div>'
	        },
	        autoClose:2000
	    });
	}
	</script>
	
	
	
 

</content>
<content tag="pageInit">

</content>	
