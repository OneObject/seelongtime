<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8">
<meta name="menu_path" content="bigdata.searchcredit"/>


<title>报表统计</title>


	<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
   	<link rel="stylesheet" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.css" />
	<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/video.css">
	<link rel="stylesheet" type="text/css" href="${basepath}/static/plugins/bootstrap-switch-master/docs/bootstrap-switch.css">
	<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
	<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/course.css">
	<link rel="stylesheet" href="${basepath}/static/public/JQuery zTree v3.5.15/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<link rel="stylesheet" type="text/css" href="${basepath }/static/ixin/css/uploadify.css">
	<link rel="stylesheet" type="text/css" href="${basepath}/static/css/active.css">
	<link rel="stylesheet" type="text/css" href="${basepath}/static/plugins/bootstrap-switch-master/docs/bootstrap-switch.css">


</head>
<body>

 		<div class="row">
            <div class="col-md-12">
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
               <ul class="page-breadcrumb breadcrumb">
                  <li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                  <li><a href="${basepath }/">报表统计</a></li>
               </ul>
               <!-- END PAGE TITLE & BREADCRUMB-->
            </div>
         </div>
         
         
         <!--tab 开始  -->
	<ul class="nav nav-tabs">
         
         <li class="tabLi active" data-id="areacredit"> <a href="#areacredit" data-toggle="tab">区域积分</a></li>
         <li class="tabLi" data-id="peoplecredit"> <a href="#peoplecredit" data-toggle="tab">人员积分</a></li>
         <li class="tabLi"  data-id="ourse" > <a href="#ourse"  data-toggle="tab">课程热度</a></li>
         
    </ul>
	<!--tab 结束 -->
         
        <div class="tab-content">
			
			
			<div class="tab-pane active"  id="areacredit"  data-id="areacredit" >
			
				 
         <div class="row" style="margin-bottom:10px;">
         	<div class="col-md-12">
         		<label style="display:inline-block;height:16px;width:2px;background:#428bca;float:left;position:relative;top:2px;margin-right:5px;"></label><span style="font-size:14px;">区域积分排行</span>
         	</div>
         </div>
        <div class="row" style="">
        <div class="col-md-12">
               <!-- BEGIN VALIDATION STATES-->
               <div class="portlet box" style="border:1px solid #eee;padding:12px 0 !important;">

                  <div class="portlet-body form">
                     <div class="form-body">
                     
					<form action="${basepath }/report/system/statistics.xhtml" method="post">
                             <label class="control-label col-md-1">部门<span class="required">*</span></label>
                              <div class="col-md-4">
                                 <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-tower"></i></span>
                                        <div class="input-group" onclick="open_dialog('','1','areacredit')">
                                            <input name="c_orgName" id="orgName_areacredit" readonly="readonly" type="text" class="form-control" value="组织结构">
                                            <input name="c_orgId" id="orgId_areacredit" type="hidden" value="${rootId}" >
                                            <div class="spinner-buttons input-group-btn">
                                                <button class="btn default" type="button">
                                                    <span id="choose_org_areacredit">选择部门</span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                              </div>


	                   
	                     	<input name="c_flag" type="hidden" value="false"   id="creditswitch"/>
	                  

					
						<input name="service" value="creditReportStatisticsService" type="hidden">

			       		<button type="submit" class="btn green" style="margin-left:100px;">统计</button>
			   
			   		</form>
			    	</div>
			     </div>
               
               
               
               </div>
               <!-- END EXAMPLE TABLE PORTLET-->
             </div>
        
        
         </div>
			
			</div>
			
			<div class="tab-pane"  id="peoplecredit"  data-id="peoplecredit" >
			
			 <div class="row" style="margin-bottom:10px;">
         	<div class="col-md-12">
         		<label style="display:inline-block;height:16px;width:2px;background:#428bca;float:left;position:relative;top:2px;margin-right:5px;"></label><span style="font-size:14px;">人员积分排行</span>
         	</div>
         </div>
        <div class="row" style="">
        <div class="col-md-12">
               <!-- BEGIN VALIDATION STATES-->
               <div class="portlet box" style="border:1px solid #eee;padding:12px 0 !important;">

                  <div class="portlet-body form">
                     <div class="form-body">
                     
					<form action="${basepath }/report/system/statistics.xhtml" method="post">
                             <label class="control-label col-md-1">部门<span class="required">*</span></label>
                              <div class="col-md-4">
                                 <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-tower"></i></span>
                                        <div class="input-group" onclick="open_dialog('','1','peoplecredit')">
                                            <input name="c_orgName" id="orgName_peoplecredit" readonly="readonly" type="text" class="form-control" value="组织结构">
                                            <input name="c_orgId" id="orgId_peoplecredit" type="hidden" value="${rootId}" >
                                            <div class="spinner-buttons input-group-btn">
                                                <button class="btn default" type="button">
                                                    <span id="choose_org_peoplecredit">选择部门</span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                              </div>


	                   
	                     	<input name="c_flag" type="hidden" value="true"   id="creditswitch"/>
	                  

					
						<input name="service" value="creditReportStatisticsService" type="hidden">

			       		<button type="submit" class="btn green" style="margin-left:100px;">统计</button>
			   
			   		</form>
			    	</div>
			     </div>
               </div>
               <!-- END EXAMPLE TABLE PORTLET-->
             </div>
         </div>
			
			</div>
			
			<div class="tab-pane"  id="ourse"  data-id="ourse" >
				 <div class="row" style="margin-bottom:10px;">
         	<div class="col-md-12">
         		<label style="display:inline-block;height:16px;width:2px;background:#428bca;float:left;position:relative;top:2px;margin-right:5px;"></label><span style="font-size:14px;">课程热度</span>
         	</div>
         </div>
        <div class="row" style="">
        <div class="col-md-12">
               <!-- BEGIN VALIDATION STATES-->
               <div class="portlet box" style="border:1px solid #eee;padding:12px 0 !important;">

                  <div class="portlet-body form">
                     <div class="form-body">

					<form action="${basepath }/report/system/statistics.xhtml" method="post">
					
						<input name="service" value="courseReportStatisticsService" type="hidden">
						
						<label class="control-label col-md-2 text-center">课程学习频率统计</label>

			       		<button type="submit" class="btn green">统计</button>
			       		
			   
			   		</form>
			   		
			    	</div>
			     </div>
               
               
               
               </div>
               <!-- END EXAMPLE TABLE PORTLET-->
             </div>
        
        
         </div>
			
			</div>
			
			
		</div>
           
        
         
        
         
                  
        
</body>
</html>
<content tag="pageCore">
 <!-- END PAGE LEVEL PLUGINS -->
 <script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/jquery.dataTables.min.js"></script>

	<script type="text/javascript" src="${basepath}/static/plugins/bootstrap-switch-master/docs/bootstrap-switch.js" ></script>
<!-- BEGIN PAGE LEVEL PLUGINS -->
   <script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
   <script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.js"></script>
 <script src="${basepath}/static/public/metronic.bootstrap/assets/scripts/app.js" type="text/javascript"></script>
<script type="text/javascript" src="${basepath }/static/public/My97DatePicker/WdatePicker.js"></script>
 <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/fuelux/js/spinner.min.js"></script>
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/ckeditor/ckeditor.js"></script>  
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/bootstrap-fileupload/bootstrap-fileupload.js"></script>
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script> 
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script><%-- 
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
   <script src="${basepath }/static/public/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js" type="text/javascript"></script>
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/clockface/js/clockface.js"></script>
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/bootstrap-daterangepicker/moment.min.js"></script>
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script> 
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>  
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/bootstrap-timepicker/js/bootstrap-timepicker.js"></script> --%>
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/jquery-inputmask/jquery.inputmask.bundle.min.js"></script>   
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/jquery.input-ip-address-control-1.0.min.js"></script>
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/jquery-multi-select/js/jquery.multi-select.js"></script>
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/jquery-multi-select/js/jquery.quicksearch.js"></script>   
   <script src="${basepath}/static/public/metronic.bootstrap/assets/plugins/jquery.pwstrength.bootstrap/src/pwstrength.js" type="text/javascript" ></script>
   
   <script src="${basepath}/static/public/metronic.bootstrap/assets/plugins/jquery-tags-input/jquery.tagsinput.min.js" type="text/javascript" ></script>
   <!-- END PAGE LEVEL PLUGINS -->
     <script src="${basepath}/static/public/metronic.bootstrap/assets/scripts/app.js"></script>
     
     
     
   <script src="${basepath}/static/public/metronic.bootstrap/assets/scripts/form-components.js"></script>
   <script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.core-3.5.js" type="text/javascript"></script>
     <script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.excheck-3.5.js" type="text/javascript"></script>
     <script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.exedit-3.5.js" type="text/javascript"></script>
   
</content>
<content tag="pageInit">
<!-- 初始化窗口 -->
<script type="text/javascript">
var zdata ="${tree}";

function open_dialog(nodeId,type,from){
	var url = basepath+"/base/admin/organization/getorgs.xhtml";
	$.ajax({
		url:url,
		type:"POST",
		data:{"treeId":nodeId,"type":type},
		success:function(data){
			zdata = data;
			var str='<div id="dialog_bumen" style="width:300px;height:500px;overflow:auto;"><div class="zTreeDemoBackground"><ul id="treeDemo" class="ztree"></ul></div></div>';
			var btn ;
			if('areacredit' == from){
				 btn = areacreditBtnFn;
			}else if('peoplecredit' == from){
				 btn = peoplecreditBtnFn;
			}

			if(type=="1"){
				easyDialog.open({
					  container : {
						    header : '选择部门',
						    content :str,
						    yesFn : btn,
						    noFn : true
						  },
					  fixed : false
					  , callback : orgIdValidate_calback
					});
				$.fn.zTree.init($("#treeDemo"), settingclick, zdata);
				 $("#treeDemo").find("a[onclick='true']").click();
			}
			
			
			var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
			if(nodeId != null && nodeId != ""){
				//TODO 以后这里要传入id
			}
		}
	});
	
}

//credit
var areacreditBtnFn = function(){
	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	var selectNodes = treeObj.getSelectedNodes();
	$("#orgId_areacredit").val(selectNodes[0].id);
	$("#orgName_areacredit").val(selectNodes[0].name);
	$("#choose_org_areacredit").attr("onclick", "open_dialog('"+selectNodes[0].id+"','1')");
	easyDialog.close();
};
var peoplecreditBtnFn = function(){
	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	var selectNodes = treeObj.getSelectedNodes();
	$("#orgId_peoplecredit").val(selectNodes[0].id);
	$("#orgName_peoplecredit").val(selectNodes[0].name);
	$("#choose_org_peoplecredit").attr("onclick", "open_dialog('"+selectNodes[0].id+"','1')");
	easyDialog.close();
};


var orgIdValidate_calback = function(){
		orgIdValidate();
};


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
var setting = {
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
	},
	check: {
		enable: true,
		//nocheckInherit: false,
		autoCheckTrigger:false,
		chkStyle: "checkbox",
		chkboxType: { "Y": "", "N": "" }
	},
};

function removeError(id){
	$("#"+id+"_con").removeClass("has-error");
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
</script>
</content>