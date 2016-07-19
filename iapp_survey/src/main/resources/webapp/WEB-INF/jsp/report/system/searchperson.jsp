<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8">
<meta name="menu_path" content="bigdata.searchperson"/>


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

<!-- 面包屑开始 -->
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
         <!-- 面包屑结束 -->
         
         
         <!--tab 开始  -->
	<ul class="nav nav-tabs">
         <li class="tabLi active"  data-id="userGender"> <a href="#userGender" data-toggle="tab">性别分布</a></li>
         <li class="tabLi" data-id="ageDistribution"> <a href="#ageDistribution"  data-toggle="tab">年龄分布</a></li>
         <li class="tabLi" data-id="dimissionRate"> <a href="#dimissionRate" data-toggle="tab">离职率</a></li>
    </ul>
	<!--tab 结束 -->
	
	<div class="tab-content">
		<div class="tab-pane active"  id="userGender"  data-id="userGender" >
			
	             
	             	 
         <div class="row" style="margin-bottom:10px;">
         	<div class="col-md-12">
         		<label style="display:inline-block;height:16px;width:2px;background:#428bca;float:left;position:relative;top:2px;margin-right:5px;"></label><span style="font-size:14px;">性别分布</span>
         	</div>
         </div>
        <div class="row" style="">
        <div class="col-md-12">
               <!-- BEGIN VALIDATION STATES-->
               <div class="portlet box" style="border:1px solid #eee;padding:12px 0 !important;">

                  <div class="portlet-body form">
                     <div class="form-body">

					<form action="${basepath }/report/system/statistics.xhtml" method="post">
					<input name="service" value="userGenderReportStatisticsService" type="hidden">
				
                              <label class="control-label col-md-1">部门<span class="required">*</span></label>
                              <div class="col-md-4">
                                 <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-tower"></i></span>
                                        <div class="input-group" onclick="open_dialog('','1','sex')">
                                            <input name="c_orgName" id="orgName" readonly="readonly" type="text" class="form-control" value="组织结构">
                                            <input name="c_orgId" id="orgId" type="hidden" value="${rootId}" >
                                            <div class="spinner-buttons input-group-btn">
                                                <button class="btn default" type="button">
                                                    <span id="choose_org">选择部门</span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                              </div>

	                     <label class="col-md-2 control-label" >包含下级部门：</label>
                     <div class="col-md-2">
	                     <div class="switch ">
	                     	<input name="c_flag" type="checkbox" value="true" checked  id="myswitch"/>
	                     </div>          
                     </div>

			        <button type="submit" class="btn green" style="margin-left:100px;">统计</button>
			   
			   			</form>
			    	</div>
			     </div>
               </div>
               <!-- END EXAMPLE TABLE PORTLET-->
             </div>
           	 </div>
		</div>
		
		<div class="tab-pane" id="ageDistribution"  data-id="ageDistribution" >
			
	             
	               <div class="row" style="margin-bottom:10px;">
         	<div class="col-md-12">
         		<label style="display:inline-block;height:16px;width:2px;background:#428bca;float:left;position:relative;top:2px;margin-right:5px;"></label><span style="font-size:14px;">年龄分布</span>
         	</div>
         </div>
        <div class="row" style="">
        <div class="col-md-12">
               <!-- BEGIN VALIDATION STATES-->
               <div class="portlet box" style="border:1px solid #eee;padding:12px 0 !important;">

                  <div class="portlet-body form">
                     <div class="form-body">

					<form action="${basepath }/report/system/statistics.xhtml" method="post">
					
						<input name="service" value="ageDistributionReportStatisticsService" type="hidden">
							<div class="col-md-12" style="margin-bottom:20px;overflow:hidden;">
								<span class="col-md-1" style="margin-top: 6px;">起始年龄:</span>
								<div class="col-md-3">
								<input class="form-control" name="c_startage" placeholder="请填入正整数,默认18" />
								</div>
								<span class="col-md-1" style="margin-top: 6px;">截止年龄:</span>
								<div class="col-md-3">
								<input class="form-control" name="c_endage" placeholder="请填入正整数,默认65" />
								</div>
								<span class="col-md-1" style="margin-top: 6px;">年龄分隔:</span>
								<div class="col-md-3">
								<input class="form-control col-md-3" name="c_interval" placeholder="请填入正整数,默认5" />
								</div>
							</div>
			
							<div class="col-md-12">
				
                              <label class="control-label col-md-1">部门<span class="required">*</span></label>
                              <div class="col-md-4">
                                 <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-tower"></i></span>
                                        <div class="input-group" onclick="open_dialog('','1','age')">
                                            <input name="c_orgName" id="orgName_age" readonly="readonly" type="text" class="form-control" value="组织结构">
                                            <input name="c_orgId" id="orgId_age" type="hidden" value="${rootId}" >
                                            <div class="spinner-buttons input-group-btn">
                                                <button class="btn default" type="button">
                                                    <span id="choose_org_age">选择部门</span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                              </div>


	                     <label class="col-md-2 control-label" >包含下级部门：</label>
                     <div class="col-md-2">
	                     <div class="switch ">
	                     	<input name="c_flag" type="checkbox" value="true" checked  id="ageswitch"/>
	                     </div>          
                     </div>
					</div>
						<button type="submit" class="btn green" style="margin-left:100px;">统计</button>
			   
			   		</form>
			    	</div>
			     </div>
               </div>
               <!-- END EXAMPLE TABLE PORTLET-->
             </div>
         </div>
		</div>
		
		<div class="tab-pane" id="dimissionRate"  data-id="dimissionRate" >
			
	             
	             <div class="row" style="margin-bottom:10px;">
         	<div class="col-md-12">
         		<label style="display:inline-block;height:16px;width:2px;background:#428bca;float:left;position:relative;top:2px;margin-right:5px;"></label><span style="font-size:14px;">离职率统计</span>
         	</div>
         </div>
        <div class="row" style="">
        <div class="col-md-12">
               <!-- BEGIN VALIDATION STATES-->
               <div class="portlet box" style="border:1px solid #eee;padding:12px 0 !important;float:left;">

                  <div class="portlet-body form"  style="float:left;">
                     <div class="form-body"  style="float:left;">

					<form action="${basepath }/report/system/statistics.xhtml" method="post">
					<input name="service" value="dimissionRateReportStatisticsService" type="hidden">
				
				<div class="col-md-12">
				
                              <label class="control-label col-md-1">部门<span class="required">*</span></label>
                              <div class="col-md-5">
                                 <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-tower"></i></span>
                                        <div class="input-group" onclick="open_dialog('','1','dimission')">
                                            <input name="c_orgName" id="orgName_dimission" readonly="readonly" type="text" class="form-control" value="组织结构">
                                            <input name="c_orgId" id="orgId_dimission" type="hidden" value="${rootId}" >
                                            <div class="spinner-buttons input-group-btn">
                                                <button class="btn default" type="button">
                                                    <span id="choose_org_dimission">选择部门</span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                              </div>

	                     <label class="col-md-2 control-label" >包含下级部门：</label>
                     <div class="col-md-2">
	                     <div class="switch ">
	                     	<input name="c_flag" type="checkbox" value="true" checked  id="dimissionswitch"/>
	                     </div>          
                     </div>
				</div>


						<div class="col-md-12" style="float:left;clear:both;margin-top:25px;" >
                              <label class="control-label col-md-1">开始日期</label>
                              <div class="col-md-2">
                                  <input type="text" id="effictivestart" name="c_start" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd', maxDate:'#F{$dp.$D(\'effictiveend\')}' })" class="form-control Wdate" readonly="readonly"/>
                              </div>
                              <label class="control-label col-md-1" style="width:30px;text-align:center;padding-left:2px;padding-right:2px;">至</label>
                              <div class="col-md-2">
                                  <input type="text" id="effictiveend" name="c_end" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd' , minDate:'#F{$dp.$D(\'effictivestart\')}'})" class="form-control Wdate" readonly="readonly"/>
                              </div>
                               <div class="col-md-5">
                               <span class="help-block">空表示不限制，开始日期为1970.01.01至当前时间</span>
                              </div>
                              
                           </div>
			
			     <button type="submit" class="col-md-1 btn green" style="margin-right:150px;float:right;margin-top:10px;">统计</button>
			   
			   			</form>
			    	</div>
			     </div>
               </div>
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
$(function () {
	
	
	$("#myswitch").bootstrapSwitch({
		onText:"是",
		offText:"否"
		});
	
	$("#myswitch").on('switchChange.bootstrapSwitch', function(event, state) {
		if(state.value){
			$(this).val('true');
		} else {
			$(this).val('false');
		}
	});
	
	$("#dimissionswitch").bootstrapSwitch({
		onText:"是",
		offText:"否"
		});

	$("#dimissionswitch").on('switchChange.bootstrapSwitch', function(event, state) {
		if(state.value){
			$(this).val('true');
		} else {
			$(this).val('false');
		}
	});

	$("#ageswitch").bootstrapSwitch({
		onText:"是",
		offText:"否"
	});
	
	$("#ageswitch").on('switchChange.bootstrapSwitch', function(event, state) {
		if(state.value){
			$(this).val('true');
		} else {
			$(this).val('false');
		}
	});

});

function open_dialog(nodeId,type,from){
	var url = basepath+"/base/admin/organization/getorgs.xhtml";
	$.ajax({
		url:url,
		type:"POST",
		data:{"treeId":nodeId,"type":type},
		success:function(data){
			zdata = data;
			var str='<div id="dialog_bumen" style="width:300px;height:500px;overflow:auto;"><div class="zTreeDemoBackground"><ul id="treeDemo" class="ztree"></ul></div></div>';
			var btn = btnFn;
			if('sex' == from){
				 btn = btnFn;
			}else if('dimission' == from){
				 btn = dimissionBtnFn;
			}else if('age' == from){
				 btn = ageBtnFn;
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
//性别
var btnFn = function(){
	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	var selectNodes = treeObj.getSelectedNodes();
	$("#orgId").val(selectNodes[0].id);
	$("#orgName").val(selectNodes[0].name);
	$("#choose_org").attr("onclick", "open_dialog('"+selectNodes[0].id+"','1')");
	easyDialog.close();
};

//dimission
var dimissionBtnFn = function(){
	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	var selectNodes = treeObj.getSelectedNodes();
	$("#orgId_dimission").val(selectNodes[0].id);
	$("#orgName_dimission").val(selectNodes[0].name);
	$("#choose_org_dimission").attr("onclick", "open_dialog('"+selectNodes[0].id+"','1')");
	easyDialog.close();
};

//age年龄分布
var ageBtnFn = function(){
	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	var selectNodes = treeObj.getSelectedNodes();
	$("#orgId_age").val(selectNodes[0].id);
	$("#orgName_age").val(selectNodes[0].name);
	$("#choose_org_age").attr("onclick", "open_dialog('"+selectNodes[0].id+"','1')");
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