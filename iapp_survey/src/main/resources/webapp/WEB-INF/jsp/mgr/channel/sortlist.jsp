<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>栏目资源排序</title>
	<meta name="menu_path" content="ixin.menu_channel"/>
	<link href="${basepath }/static/public/metronic.bootstrap/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="${basepath }/static/public/metronic.bootstrap/assets/css/style-metronic.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
   <link rel="stylesheet" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.css" />
	<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/course.css">
	<link rel="stylesheet" href="${basepath }/static/public/easydialog-v2.0/easydialog.css" type="text/css">
</head>
<body>
	<!-- 面包屑开始-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
                  <li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                  <li><span href="javascript:void(0)">栏目资源排序</span></li>
               </ul>
			<!-- END PAGE TITLE & BREADCRUMB-->
		</div>
	</div>
	<!-- 面包屑结束-->
         <div class="row">
              <div class="col-md-12">
               <!-- BEGIN EXAMPLE TABLE PORTLET-->
               <div class="portlet box blue">
                  <div class="portlet-title">
                     <div class="caption" ><i class="icon-globe"></i><span id="channeltitle">栏目资源列表</span></div>
                  </div>
                  <div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
                  
                      <%-- 表格内容 --%>
                     <label style="color:#666;font-size:13px;margin-bottom:0px;">排序按权重从大到小排序</label> 
                      <div id="table_list" style="margin-top:10px;"></div>
                    		<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
	<thead>
		<tr>
               
			   <th >名称</th>
			   <th >权重</th>
              
		</tr>
	</thead>
	<tbody id="channellist">
	<c:if test="${empty list }">
		<tr>
			<td colspan="6"style="text-align:center">
			暂无数据记录
			</td>
		</tr>
	</c:if>
	<c:forEach var="item" items="${list}" varStatus="vs">
		<tr>
			
			<td style="width:50%;" >
			<input type="hidden" id="rid_${vs.index }" value="${item.id }">
            	${ltfun:html2Text(item.resname,20)}
			</td>
			<td>
			<div class="form-group " id="weight_tip_${vs.index }">
				<div style="width:100%">
				<input style="width:100%;" type="text" class="form-control " id="weight_${vs.index }" data-required="1"  value="${item.weight}" placeholder="必须为大于等于0的整数" />
				</div>
			</div>
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
	<div class="row">
		<div class="col-md-offset-3 col-md-9" style="margin-top:28px;margin-left: 80%;">
			
			<span  onclick="save()" class="btn green">保存</span>
		</div>
	</div>
                  </div>
               </div>
               <!-- END EXAMPLE TABLE PORTLET-->
             </div>
         </div>

</body>
</html>
<content tag="pageCore">
<script type="text/javascript" src="${basepath }/static/public/easydialog-v2.0/easydialog.min.js"></script>
<script type="text/javascript">
var num = '${num}';


function addError(id){
	$("#weight_tip_"+id).addClass("has-error");
	$("#weight_"+id).focus();

}
function removeError(id){
	$("#weight_tip_"+id).removeClass("has-error");
	
}

function save(){
	
	var resources = getResources();
	
	var reg = new RegExp("^[0-9]*$");

	for(var i = 0 ; i < resources.length ; i++){
		
		var weight = resources[i].weightStr;
		
		if(isBlank(weight) || !reg.test(weight) ){
			addError(i);
			return;
		}else{
			removeError(i);
		}
		
	}
	
	
	var btnFn = function(){
		var url="${basepath}/mgr/channelresource/savesort.json";
	    $.ajax({
	          type:"post",
	          url:url,
	          data: {list:JSON.stringify(resources)},
	          success:function(data){
	              if(data){
	            	  showDialogMessage("保存成功");
	            	  setTimeout(function(){
	            		  window.location.href="${basepath}/mgr/channelresource/tolink.xhtml?id=${id}";
	                	},1000);
	                  }else{
	                	  showDialogMessage("保存失败");
	                  }
	              }
	         
	        });
	};
	
	
	
	var html = '<div style="width:280px;height:40px;text-align:center;">是否确定保存？</div>';
	easyDialog.open({
   	 	container : {
    	header : '提示',
    	content : html,
    	yesFn : btnFn,
    	noFn : true
   		}
   		
	});
	
	
	
}

function getResources(){
	var resources = new Array();
	for(var i = 0 ;i < num ;i++){
		var resource = new Object();
		resource.id = $("#rid_"+i).val();
		resource.weightStr = $("#weight_"+i).val();
		resources[i] = resource;
	}
	
	return resources;
	
	
	
}

function showDialogMessage(text){
	var html = '<div style="width:280px;height:40px;text-align:center;">'+text+'</div>';
	easyDialog.open({
   	 	container : {
    	header : '提示',
    	content : html
   		},
   		autoClose : 2000
	});
}


</script>
</content>
<content tag="pageInit">
</content>  
