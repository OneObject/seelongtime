<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta name="menu_path" content="course.courseAccredit"/>
<title>课程授权管理</title>
	<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
   <!-- END PAGE LEVEL STYLES --><%-- 
	<link rel="stylesheet" media="screen" href="${basepath }/static/public/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css"> --%>
	<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/course.css">
	
</head>
<body>
	<!-- 面包屑开始-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
            <ul class="page-breadcrumb breadcrumb">
                <li><i class="icon-home"></i> <a href="${basepath }">首页</a>
                    <i class="icon-angle-right"></i></li>
                <%-- <li><a href="${basepath }/base/admin/course/course/course.xhtml">课程管理</a>
                    <i class="icon-angle-right"></i></li> --%>
                <li><span href="#">课程授权管理</span></li>
            </ul>
			<!-- END PAGE TITLE & BREADCRUMB-->
		</div>
	</div>
	<!-- 面包屑结束-->
	<!-- 搜索 -->
         <div class="row">
            <div class="col-md-12">
               <!--search box-->
              <div class="col-md-12 search_box">
                  <div class="col-md-12">
                   <!--全局搜索框-->
                   <div class="col-md-6 search_container">
                       <div class="input-group">
                          <!-- <input type="text" class="form-control">
                          <span class="input-group-btn">
                           <button class="btn btn-danger" type="button">
                              <i class="icon-search"></i>
                           </button>
                          </span> -->
                            <input type="hidden" id="status" name="status" value="" >
                            <input type="text" class="form-control" id="searchContent" name="searchContent" placeholder="输入课程名进行搜索"> <span
                                class="input-group-btn" >
                                <button class="btn btn-danger" type="button" onclick="page(1)">
                                    <i class="icon-search"></i>
                                </button>
                            </span>
                        </div>
                              <!-- /input-group -->
                        </div>                  
                  </div>
              </div>
            </div>
         </div>
         <!--条件选择-->
	<div class="row">
		<div class="col-md-12">
			<div class="search_condition">
				<div class="row">
					<!--选择时间段-->
					<div class="left_lable">
						<span class="condition_title">创建时间</span>
					</div>
					<div class="col-md-4">
                        <input type="text" id="startTime" name="startTime" value="${nowtime }" 
                         onfocus="WdatePicker({dateFmt:'yyyy-MM-dd', maxDate:'#F{$dp.$D(\'endTime\')}'})" class="form-control Wdate"/>
						<%-- <div class="input-append date time_box" id="datetimepicker_start"
							data-date="${nowTime }" data-date-format="yyyy-mm-dd">
							<input type="text" value="${nowTime }" name="startTime" id="startTime"> <span
								class="add-on"><i class="icon-calendar"></i></span>
						</div> --%>
						<span class="time_zhi">&nbsp;&nbsp;至&nbsp;&nbsp;</span>
                        <input type="text" id="endTime" name="endTime" value="" 
                         onfocus="WdatePicker({dateFmt:'yyyy-MM-dd', minDate:'#F{$dp.$D(\'startTime\')}'})" class="form-control Wdate"/>
						<%-- <div class="input-append date  time_box" id="datetimepicker_end"
							data-date="" data-date-format="yyyy-mm-dd">
							<input class="span2" type="text" value="" name="endTime" id="endTime"> <span
								class="add-on"><i class="icon-calendar"></i></span>
						</div> --%>
					</div>

					<!--选择时间段结束-->
				</div>
			</div>
		</div>
	</div>
	<!-- 页面头部结束-->
         <div class="row">
              <div class="col-md-12">
               <!-- BEGIN EXAMPLE TABLE PORTLET-->
               <div class="portlet box blue">
                  <div class="portlet-title">
                     <div class="caption"><i class="icon-globe"></i>课程列表</div>
                  </div>
                  <div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
                  
                    <%-- 表格内容 --%>
                    <div id="table_list" style="margin-top:10px;"></div>
                    
                  </div>
               </div>
               <!-- END EXAMPLE TABLE PORTLET-->
             </div>
         </div>
</body>
</html>
<content tag="pageCore">
 <!-- END PAGE LEVEL PLUGINS -->
 <script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/jquery.dataTables.min.js"></script>

<!-- BEGIN PAGE LEVEL PLUGINS -->
   <script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
   <script type="text/javascript" src="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.js"></script>
 <script src="${basepath}/static/public/metronic.bootstrap/assets/scripts/app.js" type="text/javascript"></script><%-- 
<script type="text/javascript" src="${basepath }/static/public/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${basepath }/static/public/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script> --%>
<script language="javascript" type="text/javascript" src="${basepath }/static/public/My97DatePicker/WdatePicker.js"></script>

<script type="text/javascript" src="${basepath }/static/public/javascripts/course/courseauthorize.js" charset="UTF-8"></script>    
</content>
<content tag="pageInit">
   <%-- <script type="text/javascript">
      $(document).ready(function() {
         $('#datetimepicker_start').datetimepicker({language: 'zh-CN',pickerPosition:'bottom-left',autoclose:true,minView:2});
         $('#datetimepicker_end').datetimepicker({language: 'zh-CN',pickerPosition:'bottom-left',autoclose:true,minView:2});
      });
</script> --%>
</content>  
