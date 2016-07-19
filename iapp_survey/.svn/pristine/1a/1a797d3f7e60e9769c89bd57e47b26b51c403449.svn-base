<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta name="menu_path" content="course.courseManage"/>
<title>课程管理</title>
 <script type="text/javascript" src="${basepath }/static/public/Highcharts-3.0.6/js/highcharts.js"></script>

</head>
<body>
	<!-- 面包屑开始-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i> <a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
				<li><span href="#">课程管理</span></li>
			</ul>
			<!-- END PAGE TITLE & BREADCRUMB-->
		</div>
	</div>
	<!-- 面包屑结束-->
	<!--tab 开始  -->
	<ul class="nav nav-tabs">
         <li class="active tabLi" > <a href="#tenantCourse" onclick="tenantCourse();"  data-toggle="tab">商户课程</a></li>
         <!-- <li class="tabLi" > <a href="#serialCourse" id="tabSerialCourse" onclick="serialCourse();" data-toggle="tab">系列课程</a></li> -->
         <%--
         <li class="tabLi" > <a href="#platformCourses" id="tabPlatformCourse" onclick="platformCourse();" data-toggle="tab">平台课程</a></li>
          --%>
    </ul>
	<!--tab 结束 -->
    <div class="tab-content">
    <!-- 商户课程 -->
      <div class="tab-pane  active" id="tenantCourse">
	
         </div>
         <!-- 商户课程结束 -->
         <!-- 系列课程开始 -->
          <div class="tab-pane" id="serialCourse">
          </div>
         <!-- 系列课程结束 -->
        
         <!-- 平台课程开始 -->
         <div class="tab-pane" id="platformCourses">
         </div>
         <!-- 平台课程结束 -->         
   </div>
   
   		<div class="easyDialog_wrapper" id="result">
			<div class="easyDialog_content">
				<h4 class="easyDialog_title" id="easyDialogTitle">
					<a href="javascript:void(0)" title="关闭窗口" class="close_btn"
						 onclick="easyDialog.close()">&times;</a><span id="content">课程访问量</span><span style="margin-left:100px;">历史访问量：<span id="history"></span></span>
				</h4>
				<div id="containerr" style="min-width:700px;height:400px"></div>
			</div>
		</div>
		
</body>
</html>
<content tag="pageCore">
<script type="text/javascript">
$(document).ready(function(){
	$("#tenantCourse").load("${basepath}/base/admin/course/course/course.list?readsession=${readsession}",function(){
	});
});

function serialCourse(){
    $("#tenantCourse").html("");
    $("#platformCourse").html("");
	var url="${basepath}/base/admin/course/package/index.list";
	$("#serialCourse").load(url,function(){
		});
}
function platformCourse(){
	$("#serialCourse").html("");
	$("#tenantCourse").html("");
	var url="${basepath}/base/admin/course/course/platform.list";
	$("#platformCourses").load(url,function(){
		});
}
function tenantCourse(){
	$("#serialCourse").html("");
	$("#platformCourse").html("");
	var url="${basepath}/base/admin/course/course/course.list";
	$("#tenantCourse").load(url,function(){
	});
}
/**
 * 单个发布/取消发布
 * @param id
 */
function updateReleaseStatusSingle(id, status){
	var msg = "";
	if(status == 1){
		msg = "确定要发布吗？";
	} else{
		msg = "确定要取消发布吗？";
	}
	var tempFn = function (){
    	$.post(basepath+"/base/admin/course/course/updatereleasestatus.xhtml", {"ids":id, "status":status }, function (ret){
    		if(ret.flag){
    			var html="<div style='width:300px;text-align:center;'>"+ret.message+"</div>";
    			easyDialog.open({
    				container : {
    				    header : '提示',
    					content : html
    				},
    				autoClose : success_time,
    				callback : function(){page(1);}
    			});
    		} else{
    			mySureDialog(ret.message);
    		}
    	});
	}
	var html="<div style='width:300px;height:50px;text-align:center;'>"+msg+"</div>";
	easyDialog.open({
		container : {
		    header : '提示',
		    content : html,
		    yesFn : tempFn,
		    noFn : true
		}
	});
}
/**
 * 课程访问量统计
 */
 function showResult(id){
		var endDay = new Date().getTime();
		var startDay = endDay-6*24*60*60*1000;
		$("#loading_img").ajaxStart(function(){
			easyDialog.open({
				  container :'loading_img',
				  fixed : false,
				  overlay:true
			});
		});
		
		$.ajax({
			type:"POST",
			url:basepath+"/report/system/visit.json",
			data:{"startDay":startDay,"endDay":endDay,"rid":id,"model":"course"},
			success:function(data){
				easyDialog.open({
					container :"result"
				});

				$("#history").html(data.history);
				$('#containerr').highcharts({
		        	title: {
		           		text: '课程访问量',
		            	x: -20 //center
		        	},
		        	xAxis: {
		           		categories: data.days
		        	},	
		        	yAxis: {
		            	title: {
		                	text: '访问量'
		            	},
		            	min:0,
		            	plotLines: [{
		                	value: 0,
		                	width: 1,
		                	color: '#808080'
		            	}]
		        	},
		        	tooltip: {
		            	valueSuffix: '个'
		        	},
		        	legend: {
		            	layout: 'vertical',
		            	align: 'right',
		            	verticalAlign: 'middle',
		            	borderWidth: 0
		        	},
		        	series: [{
		            	name: '访问量',
		            	data: data.pageView
		        	}]
		    	});
			},
			error:function(data){
				showMsgDialog("系统异常，请刷新后重新尝试。");
			}
			
		});
	}

	function showMsgDialog(text){
		easyDialog.open({
	        container : {
	            header : '提示',
	            content : '<div style="background-color: #ffffff;width:320px;height:60px;text-align:center;">'+text+'</div>'
	        },
	        autoClose:2000
	    });
	}

/**
 * 批量发布/取消发布
 */
function updateReleaseStatus(status){
	var msg = "";
	var filter = 1-status;
	var ids = $("input[name='ids'][alt="+filter+"]:checked")
	if(status == 1){
		msg = "确定要发布"+ids.length+"门课程吗";
	} else{
		msg = "确定要取消发布"+ids.length+"门课程吗";
	}
	
	$("#status").val(status);
	var items = $("input[name='ids']:checked, #status");
	var tempFn = function (){
		$.post(basepath+"/base/admin/course/course/updatereleasestatus.xhtml", $.param(items), function (ret){
			if(ret.flag){
				var html="<div style='width:300px;text-align:center;'>"+ret.message+"</div>";
				easyDialog.open({
					container : {
					    header : '提示',
						content : html
					},
					autoClose : success_time,
					callback : function(){
						page(1);
					}
				});
			}
			else{
				var html="<div style='width:400px;text-align:center;'>"+ret.message;
				var failNames = "";
				for(var i=0;i<ret.failList.length;i++){
					var s = ret.failList[i];
					if(i!=ret.failList.length-1){
						failNames+= $("#name_"+s).text()+"<br>";
					} else{
						failNames+= $("#name_"+s).text();
					}
				}
				html += failNames+"</div>";
				easyDialog.open({
    				container : {
    				    header : '提示',
    					content : html
    					,yesFn : function (){
    						if(ret.sucNO > 0){
    							page(1);
    						}
    						return true;
    					}
    				}
//    				,autoClose : fail_msg_time
				});
			}
		});
	}
	
	if(ids.length == 0){
		var html="<div style='width:300px;text-align:center;'>您没有选中任何记录或是你选中的记录都已经发布！</div>";
		easyDialog.open({
			container : {
			    header : '提示',
				content : html
			},
			autoClose : success_time
		});
	} else{
		var html="<div style='width:300px;height:50px;text-align:center;'>"+msg+"</div>";
		easyDialog.open({
			container : {
			    header : '提示',
			    content : html,
			    yesFn : tempFn,
			    noFn : true
			}
		});
	}

}
</script>
</content>
