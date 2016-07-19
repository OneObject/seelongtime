<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en" id="top" class="no-js">
<head>
<meta charset="utf-8">
<title>报表统计</title>

<meta name="menu_path" content="bigdata."/>

   	<link href="${basepath}/static/public/metronic.bootstrap/assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/testmanage.css">
		<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
   <link rel="stylesheet" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.css" />
   <script type="text/javascript" src="${basepath }/static/public/Highcharts-3.0.6/js/highcharts.js"></script>
   

</head>
<body>

<div class="row">
		<div class="col-md-12">
            <ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i> <a href="${basepath }">首页</a>
                    <i class="icon-angle-right"></i></li>
                <li><span href="#">报表统计</span></li>
            </ul>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>报表结果<c:if test="${!empty rs.remake }"> |${rs.remake }</c:if>
					</div>
				</div>
				<div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
					<table>
						<tbody>
							<c:forEach var="cond" items="${rs.echoConditions}">
								<tr>
									<td align="right">${cond.key} ：</td>
									<td align="left">${cond.value } </td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<%--图表 --%>
						<c:if test="${not empty rs.chartsMap['pie'] }">
							<div id="pie" style="min-width:500px;height:300px"></div>	
						</c:if>
						<c:if test="${not empty rs.chartsMap['column'] }">
							<div id="column" style="min-width:500px;height:300px"></div>	
						</c:if>
					
					
					
					<%-- 报表内容格式 --%>
                    <div class="mt10">
                    	<table class="table table-striped table-bordered table-hover table-full-width datatable" id="sample_2">
                    	
                    	
                    	<!-- 导出按钮 -->
                    	<c:if test="${!empty rs.excelArrayData }">
				    		<span class="btn btn-success table_add common_add"  onclick="javascript:doExportstatistics();" style="margin-right: 0px" >
					           <i class="glyphicon glyphicon-plus"></i>导出报表结果
					    	</span>
					    	
					    	<form id="report_form" name="report_form">
						    	<input type="hidden" name="service" value="${condition.service }"> 
								<c:forEach var="con" items="${condition.conditions}" varStatus="i">	
								<input type="hidden" name="c_${con.key}" value="${con.value }"> 
								</c:forEach>
					    	
					    	</form>
				    	</c:if>
					    <!-- 导出按钮结束 -->
						    <thead>
						       <tr>
								<c:forEach var="p" items="${rs.excelTitleLabels}" varStatus="i">
									
									<c:if test="${i.last }">
										<c:set value="${i.count }" var="l"/>
									</c:if>
									
											<th>${p}</th>
									
								</c:forEach>
								</tr>
						    </thead>
						    <tbody id="tbody">
						    	<c:if test="${empty rs.excelArrayData }">
						    		<tr>
						    			<td align="center" colspan="<c:out value='${l }'/>" >暂无数据</td>
						    		</tr>
						    	</c:if>
						   		<c:forEach var="item" items="${rs.excelArrayData}">
									<tr>
										<c:forEach var="value" items="${item}" varStatus="q">
											<c:choose>
												<c:when  test="${q.last }">
													<c:choose>
														<c:when test="${condition.service eq 'userGenderReportStatisticsService' or  condition.service eq 'dimissionRateReportStatisticsService'  }">
															<td><fmt:formatNumber value="${value}" type="percent" pattern="#0.00%"/></td>
														</c:when>
														<c:otherwise>
															<td>${value}</td>
														</c:otherwise>
													</c:choose>
												</c:when>
												<c:otherwise>
													<td>${value}</td>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</tr>
								</c:forEach>
						    </tbody>
						</table>
						                    
                    </div>
                 
	
				</div>
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
						<p style="margin-left: 88px">报表结果已导出，请下载</p>
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
<!-- 初始化窗口 -->
<script type="text/javascript">
	function doExportstatistics(){
		easyDialog.open({
			  container :'loading_img',
			  fixed : false,
			  overlay:true
			});
		$.ajax({
			type:"POST",
			url:basepath+"/report/system/export.json",
			data:$('#report_form').serialize(),
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



<c:if test="${not empty rs.chartsMap['pie'] }">
$(function () {
    $('#pie').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false
        },
        title: {
            text: "${rs.chartsMap['pie'].title}"
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.2f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.2f} %',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
                }
            }
        },
        series: ${rs.chartsMap['pie'].seriesJsonString}
    });
});

</c:if>
<c:if test="${not empty rs.chartsMap['column'] }">

$(function () {
    $('#column').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: "${rs.chartsMap['column'].title}"
        },
        subtitle: {
            text: ''
        },
        xAxis: {
            categories: ${rs.chartsMap['column'].categoriesJsonString},
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: '数量'
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                '<td style="padding:0"><b>{point.y} </b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: ${rs.chartsMap['column'].seriesJsonString}
    });
});


</c:if>
</script>
</content>
<content tag="pageInit">
</content> 	
 
