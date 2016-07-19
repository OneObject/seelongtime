<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta name="menu_path" content="course.platformCourse"/>
<title>平台课程</title>
	<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
   <link rel="stylesheet" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.css" />
   <!-- END PAGE LEVEL STYLES --><%-- 
	<link rel="stylesheet" media="screen" href="${basepath }/static/public/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css"> --%>
	<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/course.css">
	
</head>
<body>
	<!-- 面包屑开始-->
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
						<span class="">创建时间</span>
					</div>
					<div class="col-md-4">
                        <table>
                        	<tr>
                        		<td>
                        			<input type="text" id="startTime" name="startTime" value="${startTime }" 
                         onfocus="WdatePicker({dateFmt:'yyyy-MM-dd', maxDate:'#F{$dp.$D(\'endTime\')}'})" class="form-control "/>
                        		</td>
                        		<td>
                        			<span class="time_zhi">&nbsp;&nbsp;至&nbsp;&nbsp;</span>
                        		</td>
                        		<td>
                        			 <input type="text" id="endTime" name="endTime" value="${endTime }" 
                         onfocus="WdatePicker({dateFmt:'yyyy-MM-dd', minDate:'#F{$dp.$D(\'startTime\')}'})" class="form-control"/>
                        		</td>
                        	</tr>
                        </table>
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

<script type="text/javascript" src="${basepath }/static/public/javascripts/course/platformcourse.js" charset="UTF-8"></script>    
</content>
<content tag="pageInit">
   <script type="text/javascript">
	$(document).ready(function(){
		   $("#searchContent").keydown(function(e){
		       var curKey = e.which;
		          if(curKey == 13){
		           page(1);
		               return false;
		          }
		  });
			});
      /* $(document).ready(function() {
         $('#datetimepicker_start').datetimepicker({language: 'zh-CN',pickerPosition:'bottom-left',autoclose:true,minView:2});
         $('#datetimepicker_end').datetimepicker({language: 'zh-CN',pickerPosition:'bottom-left',autoclose:true,minView:2});
      }); */
</script>
</content>  
