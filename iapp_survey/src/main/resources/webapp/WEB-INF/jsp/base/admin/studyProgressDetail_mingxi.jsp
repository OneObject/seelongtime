<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta name="menu_path" content="course.studyProgress"/>
<title>学习进度详情</title>
<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/studyprogress.css">
</head>
<body>
 <!-- BEGIN 页头-->
         <div class="row">
             <div class="col-md-12">
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
               <h3 class="page-title">
                  学习进度管理 <small>学习进度明细</small>
               </h3>
               <ul class="page-breadcrumb breadcrumb">
                  <li>
                     <i class="icon-home"></i>
                     <a href="javascript:void(0);">学习进度管理</a> 
                    <i class="icon-angle-right"></i>
                  </li>
                  <li><a href="#">学习进度详情</a>
                  	<i class="icon-angle-right"></i>
                  </li>
                  <li><a href="#">学习进度明细</a>
                  </li>
                  <!--<li class="pull-right">
                     <div id="dashboard-report-range" 

class="dashboard-date-range tooltips" data-placement="top" data-

original-title="Change dashboard date range">
                        <i class="icon-calendar"></i>
                        <span></span>
                        <i class="icon-angle-down"></i>
                     </div>
                  </li>-->
               </ul>
               <!-- END PAGE TITLE & BREADCRUMB-->
            </div>
         </div>
         <!-- END 页头-->
         <div class="row">
         	<div class="col-md-12">
         	 <!-- BEGIN SAMPLE TABLE PORTLET-->
               <div class="portlet box purple">
                  <div class="portlet-title">
                     <div class="caption"><i class="icon-tasks"></i>学习进度详情</div>
                  </div>
                  <div class="portlet-body">
                     <table class="table table-striped table-hover study_detail">
                        <tbody>
                           <tr>
                              <td class="study_detail_title">课程名称</td>
                              <td>Mark</td>
                           </tr>
                           <tr>
                              <td class="study_detail_title">学习总时间</td>
                              <td>Mark</td>
                           </tr>
                           <tr>
                              <td class="study_detail_title">开始学习时间</td>
                              <td>Mark</td>
                           </tr>
                           <tr>
                              <td class="study_detail_title">用户</td>
                              <td>Mark</td>
                           </tr>
                           <tr>
                              <td class="study_detail_title">课程状态</td>
                              <td>Mark</td>
                           </tr>
                           <tr>
                              <td class="study_detail_title">上次学习时间</td>
                              <td>Mark</td>
                           </tr>
                        </tbody>
                     </table>
                     <h3>课程学习信息</h3>
                     <table class="table table-bordered table-hover">
                        <thead>
                           <tr>
                              <th>序号</th>
                              <th>章节名称</th>
                              <th>学习总时间</th>
                              <th>开始学习时间</th>
                              <th >上次学习时间</th>
                              <th>当前分数</th>
                              <th>详情</th>
                           </tr>
                        </thead>
                        <tbody>
                           <tr>
                              <td rowspan="2">1</td>
                              <td>Mark</td>
                              <td>Otto</td>
                              <td >makr124</td>
                              <td>Approved</td>
                              <td >makr124</td>
                              <td>Approved</td>
                           </tr>
                        </tbody>
                     </table>
                    <div class="btn_group_center">
                     	<span class="btn default"><i class="icon-list-alt"></i>&nbsp;&nbsp;返回</span>
					</div>
                     
                  </div>
               </div>
               <!-- END SAMPLE TABLE PORTLET-->
             </div>
         </div>
</body>
</html>
<content tag="pageCore">
<!-- 引用核心js包 -->
</content>
<content tag="pageInit">
<!-- 初始化窗口 -->
</content>	