<%@page import="com.longtime.common.utils.LoginSessionHelper"%>
<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<%
// TODO 临时for mercer 一个账号只有课程管理菜单
boolean bool_mercer_mcg_admin = "ff8080814af0880b014b0bab95e60413".equals(LoginSessionHelper.getCurrentUserId(request));

// robam 管理员账号区别
boolean showUV = true;
boolean showCourseUV = true;
String domainTmp = LoginSessionHelper.getCurrentDomain(request);
if("robam".equalsIgnoreCase(domainTmp)){
	String uidTmp  = LoginSessionHelper.getCurrentUserId(request);
	if(!"ff8080814b80e46c014b874bf1aa0048".equals(uidTmp)){ //username not robam
		showUV = false;
		showCourseUV = false;
	}
}
pageContext.setAttribute("showuv",showUV);
pageContext.setAttribute("showcourseuv",showCourseUV);
%>
<head>
<title>管理端</title>
<%--<meta name="menu_path" content="ixin.menu_bind" /> --%>
<link rel="stylesheet" href="${basepath}/static/ixin/css/base.css"
	type="text/css">
<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/ixin.css" type="text/css">
<%-- <link rel="stylesheet" href="${basepath }/static/public/easydialog-v2.0/easydialog.css" type="text/css"> --%>
<link
	href="${basepath}/static/public/metronic.bootstrap/assets/css/style-metronic.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" media="screen"
	href="${basepath }/static/public/stylesheets/testmanage.css">
	<link rel="stylesheet" media="screen"
	href="${basepath }/static/public/stylesheets/mgrindex.css">
  <script type="text/javascript" src="${basepath }/static/public/Highcharts-3.0.6/js/highcharts.js"></script>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i> 首页</li>
			</ul>
		</div>
	</div>
	
<%
if(!bool_mercer_mcg_admin) 
{
%>	
	
 <%
 	String domain = LoginSessionHelper.getCurrentDomain(request);
 %>
 		<c:set var="domain" value="<%=domain %>"></c:set>	
	
<ltacl:res resourceId="100" ctl="false">
<ltacl:checkAcl resourceId="100"> 
<div class="row" style="margin-top:30px;">
	<div class="col-md-12">
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
						<i class="glyphicon glyphicon-fire"></i>快捷入口
					</div>
				</div>
				<div class="portlet-body quickenterlist">
					<ul>
						<%-- <ltacl:res resourceId="120" ctl="false">
						<ltacl:checkAcl resourceId="120">
						<li>
							<a href="${basepath }/mgr/vote/index.xhtml?surveyOrvote=0" style="color: white; text-decoration: none;">
								<div class="quickenter enter-small color3">
									投票
								</div>
							</a>
						</li>
						</ltacl:checkAcl>
						</ltacl:res> --%>
						
						
						<ltacl:res resourceId="130" ctl="false">
						<ltacl:checkAcl resourceId="130"> 
						<li>
							<a href="${basepath }/mgr/vote/index.xhtml?surveyOrvote=1" style="color: white; text-decoration: none;">
								<div class="quickenter enter-small color4">
									调研
								</div>
							</a>
						</li>
						</ltacl:checkAcl>
						</ltacl:res>
						
						<li>
							<div class="quickenter enter-small color5" style="font-size:72px;">
								<i class= " fa fa-plus" style="margin-top: 17px;"></i>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

</ltacl:checkAcl>
</ltacl:res>
	
	<ltacl:res resourceId="700" ctl="false">
	<ltacl:checkAcl resourceId="700">
	<div class="row" style="margin-top:30px;">
		<div class="col-md-12">
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
						<i class="glyphicon glyphicon-subtitles"></i>访问量/访问人数
					</div>
				</div>
				<div class="portlet-body quickenterlist">
					<div id="container" style="min-width:700px;height:400px"></div>
				</div>
			</div>
		</div>
	</div>
	</ltacl:checkAcl>
	</ltacl:res>
<%
}
%>	
	
	
	<script type="text/javascript">
	$(function () {
		system();
		var domain = "${domain}";
	});
	function course(){
		var endDay = new Date().getTime()-24*60*60*1000;
		var startDay = endDay-7*24*60*60*1000;
		$.ajax({
			type:"POST",
			url:basepath+"/report/system/visit.json",
			data:{"startDay":startDay,"endDay":endDay,"model":"course"},
			success:function(data){
				$('#course').highcharts({
			        title: {
			            text: '课程访问总量',
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
			}
		});
	}


	function system(){
		var endDay = new Date().getTime()-24*60*60*1000;
		var startDay = endDay-7*24*60*60*1000;
		$.ajax({
			type:"POST",
			url:basepath+"/report/system/visittime.json",
			data:{"startDay":startDay,"endDay":endDay,"showuv":${showuv}},
			success:function(data){
				$('#container').highcharts({
			        title: {
			            text: '系统访问量、访问人数',
			            x: -20 //center
			        },
			        xAxis: {
			            categories: data.days
			        },
			        yAxis: {
			            title: {
			                text: '访问量/访问人数'
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
			        }, {
			            name: '访问人数',
			            data: data.userView
			        }]
			    });
			}
		});
	}
	</script>
</body>

</html>