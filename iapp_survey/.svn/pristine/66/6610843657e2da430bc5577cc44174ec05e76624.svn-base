<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<%@page language="java" import="com.longtime.app.config.Constants"%>
<!DOCTYPE html>
<!--[if IE 8]>
<html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]>
<html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>系统风格设置</title>
<meta name="menu_path" content="system.template" />
<link rel="stylesheet" href="${basepath}/static/css/active.css">
<link rel="stylesheet"  href="${basepath}/static/ixin/css/base.css" type="text/css">
<link rel="stylesheet" media="screen" href="${basepath}/static/ixin/css/ixin.css" type="text/css">
<link rel="stylesheet" media="screen" href="${basepath}/static/ixin/css/appmsg_edit.css" type="text/css">
<link rel="stylesheet" href="${basepath }/static/public/easydialog-v2.0/easydialog.css" type="text/css">
<script src="${basepath}/static/public/easydialog-v2.0/easydialog.min.js"></script>
</head>
<body>

	<!-- 页面顶部-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i> <a href="">系统管理</a><i class="icon-angle-right"></i></li>
				<li><span >系统风格设置</span></li>
			</ul>
			<!-- END PAGE TITLE & BREADCRUMB-->
		</div>
	</div>
	
<!-- END PAGE HEADER-->

	<ul class="nav nav-tabs">
	<%-- 
         <li class="tabLi ${tab eq 'system'?'active':''}" > <a href="#tenantbasic" data-toggle="tab">全局风格设置</a></li>
    --%> 
         <li class="tabLi ${tab eq 'module'?'active':''}" > <a href="#mgrsitebasic" id="tabAttFodder" data-toggle="tab">模块风格设置</a></li>
    
    </ul>
    <div class="tab-content">
      <!-- Tab panes -->
<div class="tab-pane  ${tab eq 'system'?'active':''}" id="tenantbasic">
</div>
      

<div class="tab-pane  ${tab eq 'module'?'active':''}" id="mgrsitebasic">

<c:if test="${ empty list }">
	<div>暂无可设置的模板</div>
</c:if>

<div class="portlet-body box" id="msgListBody">
<c:if test="${not empty list }">

<c:forEach items="${list}" var="info" >
 <div class="clo-lg-4 ixin_item " style="width:250px;">
	<div class="appmsg ">
		<div class="appmsg_content">
			<h4 class="appmsg_title">
				<a href="#" target="other">${info.moduleName }</a>
			</h4>
			
			<div class="appmsg_thumb_wrp" style="height:320px;">
					<c:if test="${ empty info.cover}">
				    <img src="<%=Constants.IMG_SERVER_DOWNLOAD%>default_course_cover" id="active-poster" class="appmsg_thumb"   >
				    </c:if>
				    <c:if test="${not empty info.cover}">
				     <img src="<%=Constants.IMG_SERVER_DOWNLOAD%>${info.cover}" id="active-poster" class="appmsg_thumb"  >
				    </c:if>
			</div>
			<p class="appmsg_desc">
				${info.name}
			</p>

		</div>

		<div class="appmsg_opr">
			<ul>
				<li class="appmsg_opr_item with2 no_extra"><a
					class="js_del no_extra" 
					href="javascript:void(0);" onclick="openTemplate('${info.mid}','${info.id }');">更改模板</a>
				</li>
			</ul>
		</div>
	</div>
  </div>
</c:forEach> 
  </c:if>
</div>

</div>
</div>

 <div class="easyDialog_wrapper" id="easyDialogWrapper" style="width: 710px;">
            <div class="easyDialog_content" style="height: 620px;">
                <h4 class="easyDialog_title" id="easyDialogTitle">
                    <a href="javascript:void(0)" title="关闭窗口" class="close_btn" onclick="easyDialog.close()">&times;</a>
                    <span id="dialogtitle"></span>
                </h4>
                <div class="easyDialog_text" style="display: block;overflow: hidden;width: 710px;height: 530px;overflow-x: hidden;overflow-y: auto;">
                    <div id="activity-box" class="activity-box" style="margin-top:-20px; margin-left:-10px; position: absolute;width: 693px;height: 530px;overflow-x: hidden;overflow-y: auto;">
                        <ul style="margin-left: -9px; margin-top: -5px">
                        </ul>
                    </div>
                </div>
                <div class="easyDialog_footer" style="position: absolute;margin-top: 20px;width: 97%;">
                    <button class="btn_highlight" id="easyDialogYesBtn">确定</button>
                </div>
            </div>
   </div>
 <div class="easyDialog_wrapper" id="showmessage" style="width: 320px;">
            <div class="easyDialog_content" style="height: 120px;">
                <h4 class="easyDialog_title" style="background-color: #4aadfb;">
                	 <a href="javascript:void(0)" title="关闭窗口" class="close_btn" onclick="easyDialog.close()">&times;</a>
                    <span id="title">提示</span>
                </h4>
                <div id="message" class="easyDialog_text" style="text-align:center; display: block;overflow: hidden;width: 320px;height: 60px;">
                    
                </div>
                
            </div>
   </div>
   
  <input id="path" type="hidden"  value="<%=Constants.IMG_SERVER_DOWNLOAD%>">
  <input id="tid" type="hidden"  value="">
  <input id="mid" type="hidden"  value="">
</body>
</html>
<content tag="pageCore"> 
<script type="text/javascript">
function openTemplate(mid,tid){
        var html="";
        $("#tid").val(tid);
        $("#mid").val(mid);
        var path=$("#path").val();
		$("#dialogtitle").html("选择模板");
		$.ajax({
				type: "POST",
				url: basepath+"/base/admin/template/todetail.list",
				data: {mid:mid},
				success: function(list){
					var tid = $("#tid").val();
					if(list.length>0){
						for(var i=0;i<list.length;i++){
							if(list[i].id==tid){
								html=html+'<li class="one-a cactive" style="margin-left: 8px;">';
							}else{
								html=html+'<li class="one-a" style="margin-left: 8px;">';
							}
							html=html+' <div class="one-active" style="width: 210px;height:360px;">';
							html=html+'<span class="otheractive-title" style="width: 195px;margin-left:-16px;">'+list[i].name+'</span>';
							html=html+' <img style="border: 1px solid #CCCCCC; height:325px;width: 205px;margin-left:-18px;" class="otheractive-poster" src="'+path+list[i].cover+'">';
							html=html+'</div>';
							html=html+'<div class="select-active hidexbox" style="width: 210px;height:360px;" onclick="chooseselect(this,'+list[i].id+');" >';
							html=html+'<i class="glyphicon glyphicon-ok" style="height:360px;line-height: 340px;"></i>';
							html=html+'</div>';
							html=html+'</li>';
						}
						$("#activity-box").find("ul").html(html);
					}else{
						$("#activity-box").find("ul").html("<li>没有内容</li>");	
					} 
					easyDialog.open({
						container:"easyDialogWrapper",
						fixed:true
					});
				},
				error:function(data){
					showMsgDialog("系统异常，请刷新后重新尝试。");
				}
				
		});
}



function chooseselect(thi,id){    	
	 	$("#activity-box").find("li").each(function(){
             $(this).removeClass("cactive");
    	});
    	$("#tid").val(id);
        $(thi).parent("li").addClass("cactive");
}

$("#easyDialogYesBtn").click(function(){
	
	var mid = $('#mid').val();
	var tid = $("#tid").val();
    if(mid=="" || mid==null||tid=="" || tid==null){
   		easyDialog.close(); 
    }

	$.ajax({
 	   type: "POST",
 	   url: basepath+"/base/admin/template/modify.json",
 	   data: {mid:mid,tid:tid},
 	   success: function(msg){
 	  	  if(msg){
 	  		showMsgDialog("修改成功！");
 	  		setTimeout(function(){
 	  			window.location.href=basepath+"/base/admin/template/templateindex.xhtml?tab=module";
 	 	  	},2000);
 	  		
 	  	  }else{
 	  		showMsgDialog("修改失败！");
 	  	  }
 	   },
 	  error:function(data){
			showMsgDialog("系统异常，请刷新后重新尝试。");
		}
	 });
});

function showMsgDialog(text){
	$("#message").html(text);
	easyDialog.open({
        container:"showmessage",
        autoClose:2000
    });
}

</script>
</content>
