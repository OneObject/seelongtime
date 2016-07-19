<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp" %>
<!DOCTYPE html>
<!--[if IE 8]>
<html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]>
<html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <title>预约管理</title>
    <c:choose>
    	<c:when test="${param.from eq 4 }">
    		<meta name="menu_path" content="bigdata.studysituation"/>
    	</c:when>
    	<c:when test="${param.from eq 3 }">
    		<meta name="menu_path" content="bigdata.study"/>
    	</c:when>
    	<c:when test="${param.from eq 2 }">
    		<meta name="menu_path" content="bigdata.traffic"/>
    	</c:when>
    	<c:when test="${param.from eq 9  }">
    		<meta name="menu_path" content="course.courseManage"/>
    	</c:when>
    	<c:otherwise>
    		<meta name="menu_path" content="bigdata.detail"/>
    	</c:otherwise>
    </c:choose>
    <link rel="stylesheet" media="screen" href="${basepath}/static/ixin/css/ixin.css" type="text/css">
    <link rel="stylesheet"  href="${basepath}/static/ixin/css/base.css" type="text/css">
    <link rel="stylesheet"  href="${basepath}/static/ixin/css/media.css" type="text/css">
    <link rel="stylesheet" href="${basepath}/static/ixin/css/media_list.css" type="text/css">
    <link rel="stylesheet" href="${basepath }/static/public/easydialog-v2.0/easydialog.css" type="text/css">
    <link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/testmanage.css">
    <link rel="stylesheet" href="${basepath}/static/public/JQuery zTree v3.5.15/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <style type="text/css">
    #qrcodeTable table{margin-left:72px;}
    </style>
</head>
<body>

<div class="row">
    <div class="col-md-12">
        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
        <ul class="page-breadcrumb breadcrumb">
            <li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
				<c:choose>
					<c:when test="${param.from eq 4 }">
						<li><a
							href="${basepath }/base/admin/report/appoint/studysituation/index.xhtml">学习情况管理</a><i
							class="icon-angle-right"></i></li>
						<li><span href="javascript:void(0)">
							<c:choose>
								<c:when test="${model eq 'coursestudy' }">
								课程学习情况
								</c:when>
								<c:otherwise>
								组织学习情况
								</c:otherwise>
							</c:choose>	
								
								
						</span></li>
					</c:when>
					<c:when test="${param.from eq 3  }">
						<li><a
							href="${basepath }/base/admin/report/appoint/study/index.xhtml">学习成绩管理</a><i
							class="icon-angle-right"></i></li>
						<li><span href="javascript:void(0)">
							<c:choose>
								<c:when test="${model eq 'areastudy' }">
								学习成绩区域排行
								</c:when>
								<c:when test="${model eq 'coursepercent' }">
								课程学习率
								</c:when>
								<c:when test="${model eq 'cpthreeamonth' }">
								大区课程学习率
								</c:when>
								<c:otherwise>
								学习成绩人员排行
								</c:otherwise>
							</c:choose>	
								
								
						</span></li>
					</c:when>
					<c:when test="${param.from eq 9  }">
						<li><span href="javascript:void(0)">课程学习率</span></li>
					</c:when>
					<c:when test="${param.from eq 2 }">
						<li><a
							href="${basepath }/base/admin/report/appoint/traffic/index.xhtml">访问量统计管理</a><i
							class="icon-angle-right"></i></li>
						<li><span href="javascript:void(0)">
							<c:choose>
								<c:when test="${model eq 'categorystudy' }">
								各分类微课学习情况
								</c:when>
								<c:when test="${model eq 'joblevelstudy' }">
								各职级微课学习情况
								</c:when>
								<c:when test="${model eq 'dailystudy' }">
								每日微课学习情况
								</c:when>
								<c:when test="${model eq 'monthstudy' }">
								每月微课学习情况
								</c:when>
								<c:otherwise>
								每日访问量统计
								</c:otherwise>
							</c:choose>	
								
								
						</span></li>
					</c:when>
					<c:otherwise>
						<li><a
							href="${basepath }/base/admin/report/appoint/detail/index.xhtml">报表模块管理</a><i
							class="icon-angle-right"></i></li>
						<li><span href="javascript:void(0)">${model eq
								'survey' ?'调研':model eq 'fodder'?'素材':'课程' }预约管理</span></li>
					</c:otherwise>
				</c:choose>

			</ul>
        <!-- END PAGE TITLE & BREADCRUMB-->
    </div>
</div>
	<ul class="nav nav-tabs">
			<c:choose>
					<c:when test="${param.from eq 4 }">
						<li class="active tabLi" id="li_yuyue"><a href="#yuyue" onclick="topage(this);" data-toggle="tab">
							<c:choose>
								<c:when test="${model eq 'coursestudy' }">
									课程学习情况
								</c:when>
								<c:otherwise>
									组织学习情况
								</c:otherwise>
							</c:choose>	
						</a></li>
					</c:when>
					<c:when test="${param.from eq 3  }">
						<li class="active tabLi" id="li_yuyue"><a href="#yuyue" onclick="topage(this);" data-toggle="tab">
							<c:choose>
								<c:when test="${model eq 'areastudy' }">
								学习成绩区域排行
								</c:when>
								<c:when test="${model eq 'coursepercent' }">
								课程学习率
								</c:when>
								<c:when test="${model eq 'cpthreeamonth' }">
								大区课程学习率
								</c:when>
								<c:otherwise>
								学习成绩人员排行
								</c:otherwise>
							</c:choose>	
						</a></li>
					</c:when>
					<c:when test="${param.from eq 9  }">
						<li class="active tabLi" id="li_yuyue"><a href="javascript:void(0)" data-toggle="tab">课程学习率</a></li>
					</c:when>
					<c:when test="${param.from eq 2 }">
						<li class="active tabLi" id="li_yuyue"><a href="#yuyue" onclick="topage(this);" data-toggle="tab">
							<c:choose>
								<c:when test="${model eq 'categorystudy' }">
								各分类微课学习情况预约
								</c:when>
								<c:when test="${model eq 'joblevelstudy' }">
								各职级微课学习情况预约
								</c:when>
								<c:when test="${model eq 'dailystudy' }">
								每日微课学习情况预约
								</c:when>
								<c:when test="${model eq 'monthstudy' }">
								每月微课学习情况预约
								</c:when>
								<c:otherwise>
								每日访问量统计预约
								</c:otherwise>
							</c:choose>	
						</a></li>
					</c:when>
					<c:otherwise>
						<li class="active tabLi" id="li_yuyue"><a href="#yuyue" onclick="topage(this);" data-toggle="tab">${model eq 'survey' ?'调研':model eq 'fodder'?'素材':'课程' }预约</a></li>
					</c:otherwise>
				</c:choose>
		
		<!-- 
			<li class="tabLi" id="li_yinpin"><a href="#yinpin" onclick="topage(this);" data-toggle="tab">音频</a></li>
		 -->
</ul>

<div class="tab-content">
		<!-- Tab panes -->
<c:if test="${model ne 'cpthreeamonth' and (param.from eq '3' or  model eq 'organizationstudy') }">
		<div class="row">
        <div class="col-md-12">
               <!-- BEGIN VALIDATION STATES-->
               <div class="portlet box" style="border:1px solid #eee;padding:12px 0 !important;">

                  <div class="portlet-body form">
                     <div class="form-body">
				

                              <label class="control-label col-md-1  col-md-offset-3">部门<span class="required">*</span></label>
                              <div class="col-md-4">
                                 <div class="input-group">
                                        <div class="input-group" onclick="open_dialog('','1')">
                                            <input name="c_orgName" id="orgName" readonly="readonly" type="text" class="form-control" value="组织结构">
                                            <input name="c_orgId" id="orgId" type="hidden" value="${rootId}" >
                                            <div class="spinner-buttons input-group-btn">
                                                <button class="btn btn-success table_add pull-right" type="button">
                                                    <span id="choose_org">选择部门</span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                              </div>

			    	</div>
			    	
			    		<span class="btn btn-success table_add pull-right"
											style="position: relative; top: -5px; left: -20px;"
											onclick="toAddStudyAppoint();"> 创建预约 </span>
			     </div>
               
               
               
               </div>
             </div>
        </div>

</c:if>
<c:if test="${model eq 'coursepercent' }">
		<div class="row">
        <div class="col-md-12">
               <!-- BEGIN VALIDATION STATES-->
               <div class="portlet box" style="border:1px solid #eee;padding:12px 0 !important;">

                  <div class="portlet-body form">
                     <div class="form-body">
				

                              <label class="control-label col-md-1  col-md-offset-3">课程:</label>
                              <div class="col-md-4">
                                 <div class="input-group">
                                        <div class="input-group">
                                            <span>${course.name }</span>
                                            <input type="hidden" id="courseid" value="${course.id }">
                                            <input type="hidden" id="coursename" value="${course.name }">
                                        </div>
                                    </div>
                              </div>

			    	</div>
			    	
			    		<a class="btn default table_add pull-right"
											style="position: relative; top: -5px; left: -20px;"
											href="javascript:window.history.go(-1);"> 返回 </a>
			    		<span class="btn btn-success table_add pull-right"
											style="position: relative; top: -5px; left: -20px;"
											onclick="toAddStudyAppoint();"> 创建预约 </span>
			     </div>
               
               
               
               </div>
             </div>
        </div>

</c:if>

<div class="tab-pane active" id="yuyue" style="position:relative;">
	<c:if test="${model ne 'cpthreeamonth' }">
		<div  style="position:absolute;left:14px;top:12px;font-size:14px;z-index:5;color:#999;">当天预约的报表会在第二天凌晨进行批处理，请在第二天早上下载报表。</div>
	</c:if>
			<div class="row">
				<div class="col-lg-12">
					<div class="portlet box blue"
						style="border-top: 1px solid #b4cef8;">
						<div class="portlet-body box">
							<div class="row">
									<c:if test="${param.from ne 3 && param.from ne 4 && param.from ne 9 }">
										<span class="btn btn-success table_add pull-right"
											style="position: relative; top: -5px; left: -20px;"
											onclick="toAddAppoint();"> 创建预约 </span>
									</c:if>
									
									<c:if test="${model eq 'coursestudy' }">
										<span class="btn btn-success table_add pull-right"
											style="position: relative; top: -5px; left: -20px;"
											onclick="toAddStudyAppoint();"> 创建预约 </span>
									</c:if>
							</div>
							<div id="yuyue_list" ${param.from eq 3 or param.from eq 9 or model eq 'organizationstudy'?'style="margin-top: 25px;"':'' }></div>
						</div>
					</div>
				</div>
			</div>
</div>




</div>

<input type="hidden" value="${model }" id="model">
<input type="hidden" value="${time }" id="time">
<!-- 弹出层 开始 -->
    <div class="easyDialog_wrapper" id="dialogbank" style="display: none;">
        <div class="easyDialog_content">
            <h4 class="easyDialog_title" id="easyDialogTitle">选择要导出报表的开始时间和结束时间
                <a href="javascript:void(0)" title="关闭窗口" class="close_btn"
                    id="closeBtn">&times;</a> <span id="dialog_title"></span>
            </h4>
            <div class="easyDialog_text">
                <div style="width:400px;" class="form-horizontal ">
		            <div class="form-group" id="con_start">
		                <label class="control-label col-md-3"  style="margin-left:50px;" >开始时间：</label>
		                <div class="col-md-6">
		                    <input type="text" class="form-control" id="start" onClick="WdatePicker({dateFmt:'yyyy-MM-dd', maxDate:'#F{$dp.$D(\'end\')}',minDate:'%y-%M-#\{%d-30\}'})">
		                    <span id="tip_start" class="help-block hidden">不能为空！</span>
		                </div>
		            </div>
		            <div class="form-group" id="con_end">
		                <label class="control-label col-md-3"  style="margin-left:50px;">结束时间：</label>
		                <div class="col-md-6">
		                    <input type="text" class="form-control" id="end" onClick="WdatePicker({dateFmt:'yyyy-MM-dd', minDate:'#F{$dp.$D(\'start\')}',maxDate:'%y-%M-%d'})">
		                    <span id="tip_end" class="help-block hidden">不能为空！</span>
		                </div>
		            </div>
                </div>
		        <div class="form-group" style="margin:25px 0px 5px;">
		            <div id="btn_con" class="col-md-5" style="margin:0 auto;float:none;text-align:center;">
		                <span id="btn_add" class="btn btn-success" onclick="submit_add()" style="padding:0px 18px;">提交</span>
		                <span id="btn_cancel" class="btn default" onclick="easyDialog.close()"  style="padding:0px 18px;">取消</span>
		            </div>
		        </div>
            </div>
        </div>
    </div>


</body>
</html>
<content tag="pageCore">
<script type="text/javascript" src="${basepath }/static/public/easydialog-v2.0/easydialog.min.js"></script>
<script type="text/javascript" src="${basepath }/static/js/jquery.qrcode.min.js"></script>
<script type="text/javascript" src="${basepath }/static/public/javascripts/reportappointindex.js"></script>
<script type="text/javascript" src="${basepath }/static/public/javascripts/reportappoint.js"></script>
<script language="javascript" type="text/javascript" src="${basepath }/static/public/My97DatePicker/WdatePicker.js"></script>

  
     
   <script src="${basepath}/static/public/metronic.bootstrap/assets/scripts/form-components.js"></script>
   <script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.core-3.5.js" type="text/javascript"></script>
     <script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.excheck-3.5.js" type="text/javascript"></script>
     <script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.exedit-3.5.js" type="text/javascript"></script>


<script type="text/javascript">

var zdata ="${tree}";

$(function(){

	page(1);
	
});

function topage(thi){
	index = $(thi).parent().attr("id"); 
	page(1);
}


function toAddAppoint(){
	$("#start").val("");
	$("#end").val("");
	easyDialog.open({
		container : 'dialogbank',
		fixed : false
	});
}



function toAddStudyAppoint(){
	
	var param = new Object();
	param.orgName=$("#orgName").val();
	param.orgId=$("#orgId").val();
	param.courseName=$("#coursename").val();
	param.courseId=$("#courseid").val();
	var model = $("#model").val();
	var title = "";
	var remark = "";
	var resid = "";
	var category = "1";
	if(model=='areastudy'){
		title = "学习成绩区域排行";
		remark = title+"（"+param.orgName+"）"; 
	}else if(model=='personstudy'){
		title = "学习成绩人员排行";
		remark = title+"（"+param.orgName+"）"; 
	}else if(model=='coursestudy'){
		title = "课程学习情况";
		remark = title+"（"+$("#time").val()+"）"; 
	}else if(model=='organizationstudy'){
		title = "组织学习情况";
		remark = title+"（"+param.orgName+"）"; 
	}else if(model=='coursepercent'){
		title = "课程学习率";
		remark = title+"（"+param.courseName+"）"; 
		resid = $("#courseid").val();
	}
	addAppoint("${model}",category,title,param,remark,resid);
	
}

function submit_add(){
	var start = $("#start").val();
	var end = $("#end").val();
	if(isBlank($("#start").val())){
		addError("start");
		return;
	} else{
		removeError("start");
	}
	if(isBlank($("#end").val())){
		addError("end");
		return;
	} else{
		removeError("end");
	}

	var param = new Object();
	param.start=start;
	param.end=end;
	var model = $("#model").val();
	var title = "";
	var resid = "";

	if(model=='course'){
		title = "课程明细报表";
	}else if(model=='survey'){
		title = "调研（投票）明细报表";
	}else if(model=='fodder'){
		title = "素材明细报表";
	}else if(model=='categorystudy'){
		title = "各分类微课学习情况";
	}else if(model=='joblevelstudy'){
		title = "各职级微课学习情况";
	}else if(model=='dailystudy'){
		title = "每日微课学习情况";
	}else if(model=='monthstudy'){
		title = "每月微课学习情况";
	}else{
		title = "每日访问量统计";
	}
	
	addAppoint("${model}","1",title,param,title+"（"+start+"~"+end+"）",resid);

	
}

function addError(id){
	$("#con_"+id).addClass("has-error");
	$("#tip_"+id).removeClass("hidden");
}
function removeError(id){
	$("#con_"+id).removeClass("has-error");
	$("#tip_"+id).addClass("hidden");
}


function open_dialog(nodeId,type){
	var url = basepath+"/base/admin/organization/getorgs.xhtml";
	$.ajax({
		url:url,
		type:"POST",
		data:{"treeId":nodeId,"type":type},
		success:function(data){
			zdata = data;
			var str='<div id="dialog_bumen" style="width:300px;height:500px;overflow:auto;"><div class="zTreeDemoBackground"><ul id="treeDemo" class="ztree"></ul></div></div>';
			var btn = btnFn;
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
<content tag="pageInit">
    <!-- 初始化窗口 -->
</content>