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
	<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
   <link rel="stylesheet" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.css" />
   <!-- END PAGE LEVEL STYLES --><%-- 
	<link rel="stylesheet" media="screen" href="${basepath }/static/public/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css"> --%>
	<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/course.css">
	
</head>
<body>
<script type="text/javascript">
	var pageindex = "${page}";
	var pagesize = "${pagesize}"; 
	var name = "${name}";
	var startTime = "${startTime}";
	var endTime = "${endTime}";
	var releaseStatus = "${releaseStatus}";
	var orderField = "${orderField}";
	var orderDirection = "${orderDirection}";
</script>
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
                           <input type="hidden" id="status" name="status" value="" >
                            <input type="text" class="form-control" value="${name}" id="searchContent" name="searchContent" placeholder="输入课程名进行搜索"> <span
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
	<div class="row" >
		<div class="col-md-12">
			<div class="search_condition">
				<div class="row" style="margin-bottom:10px;">
					<!--选择时间段-->
					<div class="left_lable" style="margin-top:3px; margin-right:-38px;">
						<span class="condition_title">创建时间</span>
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
				
					<div class="left_lable" style="margin-left:50px;margin-top:3px; margin-right:-38px;">
						<span class="condition_title">发布状态</span>
					</div>
					<div class="left_condition">
						<div class="col-md-4">
                            <select class="form-control select2me" data-placeholder="选择" name="releaseStatus" id="releaseStatus" onchange="page(1)" >
                                <option value="">---请选择---</option>
                                <c:forEach items="${statusMap }" var="qt" varStatus="st">
                                    <option <c:if test="${releaseStatus eq qt.key }"> selected="selected"</c:if>  value="${qt.key }" id="type_${qt.key }" >${qt.value }</option>
                                </c:forEach>
                            </select>
						</div>
					</div>
				</div>
				
				

				 <div class="row">
                        <!-- 课程分类 -->
                        <span class="condition_title">课程分类</span>
						<input type="hidden"  id="orgRootId" value="${parentId }">
                        <input type="hidden" name="orgId" id="orgId" value="${parentId }" >
                        <div class="eve_checked " style="width:86%;" >
                            <ul class="condition_item" id="clear_org_con">
	                            <li  class="check_item item_checked" id="clear_org" onclick="clearOrg(this,'${parentId}')">
	                                <span >不限</span>
	                            </li>
                            </ul>
                            <span id="my_showMore" style="display:inline-block;float:right;height:31px;line-height:31px;padding:5pxpx;border: none;color:#529bea;cursor:pointer;display:none;padding-right:50px;">展开<i class='i icon-sort-down' style="position:relative;left:2px;top:-4px;"></i></span>
                            <%--<span id="my_showMore" style="display:inline-block;float:right;height:31px;line-height:19px;padding:5px 15px;border: 1px solid #AFAFAF;color:#fff;background:#EA6161;cursor:pointer;display:none;">显示全部</span> --%>
                        </div>
                        
                        
                        <ul  style="height:30px;overflow:hidden;margin-left:35px;" class="condition_item bumen" id="li_con">
                            <c:forEach var="entity" items="${list }" varStatus="orgIndex">
		                           <li class="check_item" style="margin-bottom:10px;" onclick="check_obj(this, '${parentId }', '${entity.id }', '${entity.name }', ${entity.isLeaf })">
		                               <span>${entity.name }</span>
		                           </li>
                            </c:forEach>
                        </ul>
                    </div>
			</div>
		</div>
	</div>
	<!-- 页面头部结束-->
         <div class="row" >
              <div class="col-md-12">
               <!-- BEGIN EXAMPLE TABLE PORTLET-->
               <div class="portlet box blue">
                  <div class="portlet-title">
                     <div class="caption" ><i class="icon-globe"></i>课程列表</div>
                  </div>
                  <div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
                      <div class="row">
                            <span class="btn btn-danger table_add" onclick="updateReleaseStatus(0)">
                               <i class="icon-ban-circle"></i>取消发布</span>
                            <span class="btn btn-success table_add" onclick="updateReleaseStatus(1)">
                               <i class="icon-ok-circle"></i>发布课程</span>
                            <span class="btn btn-success table_add"  onclick="insertEntity();">
                               <i class="glyphicon glyphicon-plus"></i>添加课程</span>
                            <span class="btn btn-success table_add "  onclick="authorizeGroup();">
                               <i class="glyphicon "></i>批量授权</span>
                      </div>
                      
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

<script type="text/javascript" src="${basepath }/static/public/javascripts/course/course.js" charset="UTF-8"></script>    
</content>
<content tag="pageInit">
   <script type="text/javascript">
	$(function(){
				$("#my_showMore").show();
				$("#my_showMore").click(function(){
					var v=$(this).text();
				
					if(v=="展开"){
						$("#my_showMore").html("收缩<i class='i icon-sort-up' style='position:relative;left:2px;top:5px;'></i>");
						$("#li_con").css({"height":"auto","overflow":"auto"});				
					}else if(v=="收缩"){
						$("#my_showMore").html("展开<i class='i icon-sort-down' style='position:relative;left:2px;top:-4px;'></i>");
						$("#li_con").css({"height":"30px","overflow":"hidden"});				
					}	
				});	

			});	
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
