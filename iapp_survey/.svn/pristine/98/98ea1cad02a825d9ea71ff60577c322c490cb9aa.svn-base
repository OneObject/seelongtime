<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>仪表盘</title>
<meta name="menu_path" content="home"/>
 <link rel="stylesheet" media="screen" href="${basepath}/static/public/stylesheets/index.css">
	<!-- Important Owl stylesheet -->
<link rel="stylesheet" href="${basepath}/static/public/carousel/owl-carousel/owl.carousel.css">
	<!-- Default Theme -->
	<link rel="stylesheet" href="${basepath}/static/public/carousel/owl-carousel/owl.theme.css">
</head>
<body>
 <!-- BEGIN PAGE HEADER-->
         <div class="row">
            <div class="col-md-12">
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
               <ul class="page-breadcrumb breadcrumb">
                  <li>
                     <i class="icon-home"></i>
                     <a href="javascript:void(0);">仪表盘</a> 
                    <!-- <i class="icon-angle-right"></i>-->
                  </li>
                  <!--<li><a href="#">Dashboard</a></li>
                  <li class="pull-right">
                     <div id="dashboard-report-range" class="dashboard-date-range tooltips" data-placement="top" data-original-title="Change dashboard date range">
                        <i class="icon-calendar"></i>
                        <span></span>
                        <i class="icon-angle-down"></i>
                     </div>
                  </li>-->
               </ul>
               <!-- END PAGE TITLE & BREADCRUMB-->
            </div>
         </div>
         <!-- END PAGE HEADER-->
         <!-- BEGIN DASHBOARD STATS 第一行的数据：消息，人数，考试通过率，学习时长 -->
         <div class="row">
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
               <div class="dashboard-stat blue">
                  <div class="visual">
                     <i class="icon-comments"></i>
                  </div>
                  <div class="details">
                     <div class="number">
                        1349
                     </div>
                     <div class="desc">                           
                                                                    新消息
                     </div>
                  </div>
                  <a class="more" href="#">
                                                    查看更多<i class="m-icon-swapright m-icon-white"></i>
                  </a>                 
               </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
               <div class="dashboard-stat green">
                  <div class="visual">
                     <span class="study-person"></span>
                  </div>
                  <div class="details">
                     <div class="number">549</div>
                     <div class="desc">学习人数</div>
                  </div>
                  <a class="more" href="#">
                                                           查看更多 <i class="m-icon-swapright m-icon-white"></i>
                  </a>                 
               </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
               <div class="dashboard-stat purple">
                  <div class="visual">
                     <i class="pass-rate"></i>
                  </div>
                  <div class="details">
                     <div class="number">89%</div>
                     <div class="desc">考试通过率</div>
                  </div>
                  <a class="more" href="#">
                                                      查看更多 <i class="m-icon-swapright m-icon-white"></i>
                  </a>                 
               </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
               <div class="dashboard-stat yellow">
                  <div class="visual">
                     <i class="study-time"></i>
                  </div>
                  <div class="details">
                     <div class="number">12小时</div>
                     <div class="desc">学习时长</div>
                  </div>
                  <a class="more" href="#">
                                                        查看更多 <i class="m-icon-swapright m-icon-white"></i>
                  </a>                 
               </div>
            </div>
         </div>
         <!-- END DASHBOARD STATS -->
         <div class="clearfix">
         </div>
         <div class="row">
            <div class="col-md-6 col-sm-6">
               <!-- BEGIN PORTLET-->
               <div class="portlet solid bordered light-grey">
                  <div class="portlet-title">
                     <div class="caption"><i class="icon-bar-chart"></i>网站活跃度</div>
                   <!--   <div class="tools">
                        <div class="btn-group" data-toggle="buttons">
                           <label class="btn default btn-sm active">
                           <input type="radio" name="options" class="toggle" id="option1">Users
                           </label>
                           <label class="btn default btn-sm">
                           <input type="radio" name="options" class="toggle" id="option2">Feedbacks
                           </label>
                        </div>
                     </div>-->
                  </div>
                  <div class="portlet-body">
                     <div id="site_statistics_loading">
                        <img src="${basepath}/static/public/metronic.bootstrap/assets/img/loading.gif" alt="loading"/>
                     </div>
                     <div id="site_statistics_content" class="display-none">
                        <div id="site_statistics" class="chart">
                        </div>
                     </div>
                  </div>
               </div>
               <!-- END PORTLET-->
            </div>
            <div class="col-md-6 col-sm-6">
               <!-- BEGIN PORTLET-->
               <div class="portlet solid light-grey bordered">
                  <div class="portlet-title">
                     <div class="caption">
                       <i class="icon-bullhorn">
                        </i>学习课程数量
                     </div>
                    <div class="tools" style="display:none;">
                        <div class="btn-group pull-right" data-toggle="buttons">
                           <a href="javascript:void(0)" class="btn blue btn-sm active">学习课程数量</a>
                           <a href="javascript:void(0)" class="btn blue btn-sm">学习课程次数</a>
                        </div>
                     </div>
                  </div>
                  <div class="portlet-body">
                   <!--  <div id="site_activities_loading">
                        <img src="${basepath}/static//public/metronic.bootstrap/assets/img/loading.gif" alt="loading"/>
                     </div>
                     <div id="site_activities_content" class="display-none">
                        <div id="site_activities" style="height: 100px;"></div>
                     </div>-->
                     <div id="studynumber">
                         <!--显示图表位置  学习课程数量-->
                     </div>
                  </div>
               </div>
               <!-- END PORTLET-->
               <!-- BEGIN PORTLET-->
               <div class="portlet solid bordered light-grey">
                  <div class="portlet-title">
                     <div class="caption">
                        <i class="icon-signal">
                        </i>系统负载
                      </div>
                     <!--<div class="tools">
                        <div class="btn-group pull-right" data-toggle="buttons">
                           <a href="#" class="btn red btn-sm active">Database</a>
                           <a href="#" class="btn red btn-sm">Web</a>
                        </div>
                     </div>-->
                  </div>
                  <div class="portlet-body">
                     <div id="load_statistics_loading">
                        <img src="${basepath}/static//public/metronic.bootstrap/assets/img/loading.gif" alt="loading" />
                     </div>
                     <div id="load_statistics_content" class="display-none">
                        <div id="load_statistics" style="height: 108px;">
                        </div>
                     </div>
                  </div>
               </div>
               <!-- END PORTLET-->
            </div>
         </div>
         <div class="clearfix">
         </div>
         <div class="row ">
            <div class="col-md-6 col-sm-6">
               <div class="portlet box blue">
                  <div class="portlet-title">
                     <div class="caption">
                     <i class="icon-bell">
                     </i>新闻资讯</div>
                     <!--<div class="actions">
                        <div class="btn-group">
                           <a class="btn btn-sm default" href="#" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                           Filter By
                           <i class="icon-angle-down"></i>
                           </a>
                           <div class="dropdown-menu hold-on-click dropdown-checkboxes pull-right">
                              <label><input type="checkbox" /> Finance</label>
                              <label><input type="checkbox" checked="" /> Membership</label>
                              <label><input type="checkbox" /> Customer Support</label>
                              <label><input type="checkbox" checked="" /> HR</label>
                              <label><input type="checkbox" /> System</label>
                           </div>
                        </div>
                     </div>-->
                  </div>
                  <div class="portlet-body">
                     <div class="scroller" style="height: 300px;" data-always-visible="1" data-rail-visible="0">
                        <ul class="feeds">
                           <li>
                              <div class="col1">
                                 <div class="cont">
                                    <div class="cont-col1">
                                       <div class="label label-sm label-info">                        
                                          <i class="icon-check">
                                          </i>
                                       </div>
                                    </div>
                                    <div class="cont-col2">
                                       <div class="desc">
                                          梅德韦杰夫：作为国家领导人申报个人财产很正常
                                         <span class="label label-sm label-warning ">
                                          点击数：30
                                          <i class="icon-long-arrow-up"></i>
                                          </span>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div class="col2">
                                 <div class="date">
                                    一分钟前
                                 </div>
                              </div>
                           </li>
                           <li>
                              <a href="#">
                                 <div class="col1">
                                    <div class="cont">
                                       <div class="cont-col1">
                                          <div class="label label-sm label-success">                        
                                             <i class="icon-bar-chart">
                                             </i>
                                          </div>
                                       </div>
                                       <div class="cont-col2">
                                          <div class="desc">
                                             最高检:5年立案侦查32名省部级以上官员   
                                             <span class="label label-sm label-danger ">
                                          点击数：304
                                          <i class="icon-long-arrow-down"></i>
                                          </span>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 <div class="col2">
                                    <div class="date">
                                       20 分钟前
                                    </div>
                                 </div>
                              </a>
                           </li>
                           <li>
                              <div class="col1">
                                 <div class="cont">
                                    <div class="cont-col1">
                                       <div class="label label-sm label-danger">                      
                                          <i class="icon-user">
                                          </i>
                                       </div>
                                    </div>
                                    <div class="cont-col2">
                                       <div class="desc">
                                          人社部：希望参保者能自愿延长养老保险缴费                   <span class="label label-sm label-danger ">
                                          点击数：304
                                          <i class="icon-long-arrow-down"></i>
                                          </span>    
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div class="col2">
                                 <div class="date">
                                    24 分钟前
                                 </div>
                              </div>
                           </li>
                           <li>
                              <div class="col1">
                                 <div class="cont">
                                    <div class="cont-col1">
                                       <div class="label label-sm label-info">                        
                                          <i class="icon-shopping-cart">
                                          </i>
                                       </div>
                                    </div>
                                    <div class="cont-col2">
                                       <div class="desc">
                                          9月份北上广深房价同比上涨均超20% 
                                          <span class="label label-sm label-warning ">
                                          点击数：30
                                          <i class="icon-long-arrow-up"></i>
                                          </span>            
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div class="col2">
                                 <div class="date">
                                    30 分钟前
                                 </div>
                              </div>
                           </li>
                           <li>
                              <div class="col1">
                                 <div class="cont">
                                    <div class="cont-col1">
                                       <div class="label label-sm label-success">                      
                                          <i class="icon-user">
                                          </i>
                                       </div>
                                    </div>
                                    <div class="cont-col2">
                                       <div class="desc">
                                          中国发达地区消费者死亡赔偿有望超200万元           <span class="label label-sm label-success ">
                                          点击数：30
                                          <i class="icon-long-arrow-up"></i>
                                          </span>            
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div class="col2">
                                 <div class="date">
                                    24 分钟前
                                 </div>
                              </div>
                           </li>
                           <li>
                              <div class="col1">
                                 <div class="cont">
                                    <div class="cont-col1">
                                       <div class="label label-sm label-default">                        
                                          <i class="icon-bell-alt">
                                          </i>
                                       </div>
                                    </div>
                                    <div class="cont-col2">
                                       <div class="desc">
                                          内地高考状元香港遇车祸死亡 千人点赞称其为"蝗虫" <span class="label label-sm label-success ">
                                          点击数：30
                                          <i class="icon-long-arrow-up"></i>
                                          </span>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div class="col2">
                                 <div class="date">
                                    2 小时前
                                 </div>
                              </div>
                           </li>
                           <li>
                              <a href="#">
                                 <div class="col1">
                                    <div class="cont">
                                       <div class="cont-col1">
                                          <div class="label label-sm label-default">                        
                                             <i class="icon-briefcase">
                                             </i>
                                          </div>
                                       </div>
                                       <div class="cont-col2">
                                          <div class="desc">
                                            聂树斌律师要求查阅卷宗 河北高院未做书面回复   
                                            <span class="label label-sm label-warning ">
                                          点击数：30
                                          <i class="icon-long-arrow-up"></i>
                                          </span>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 <div class="col2">
                                    <div class="date">
                                       40 分钟前
                                    </div>
                                 </div>
                              </a>
                           </li>
                           <li>
                              <div class="col1">
                                 <div class="cont">
                                    <div class="cont-col1">
                                       <div class="label label-sm label-info">                        
                                          <i class="icon-check">
                                          </i>
                                       </div>
                                    </div>
                                    <div class="cont-col2">
                                       <div class="desc">
                                          什邡重提"钼铜项目"称"永不再建"有前提条件
                                         <span class="label label-sm label-warning ">
                                          点击数：30
                                          <i class="icon-long-arrow-up"></i>
                                          </span>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div class="col2">
                                 <div class="date">
                                    5小时前
                                 </div>
                              </div>
                           </li>
                           <li>
                              <a href="#">
                                 <div class="col1">
                                    <div class="cont">
                                       <div class="cont-col1">
                                          <div class="label label-sm label-danger">                        
                                             <i class="icon-bar-chart">
                                             </i>
                                          </div>
                                       </div>
                                       <div class="cont-col2">
                                          <div class="desc">
                                             网购7日无理由退货将增加限制 运费需自付  <span class="label label-sm label-success ">
                                          点击数：30
                                          <i class="icon-long-arrow-up"></i>
                                          </span>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 <div class="col2">
                                    <div class="date">
                                       20 小时前
                                    </div>
                                 </div>
                              </a>
                           </li>
                           <li>
                              <div class="col1">
                                 <div class="cont">
                                    <div class="cont-col1">
                                       <div class="label label-sm label-default">                      
                                          <i class="icon-user">
                                          </i>
                                       </div>
                                    </div>
                                    <div class="cont-col2">
                                       <div class="desc">
                                          中铁建8亿招待费处理66人 网友追问谁花的花在哪         <span class="label label-sm label-warning ">
                                          点击数：30
                                          <i class="icon-long-arrow-up"></i>
                                          </span>             
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div class="col2">
                                 <div class="date">
                                    一天前
                                 </div>
                              </div>
                           </li>
                           <li>
                              <div class="col1">
                                 <div class="cont">
                                    <div class="cont-col1">
                                       <div class="label label-sm label-info">                        
                                          <i class="icon-shopping-cart">
                                          </i>
                                       </div>
                                    </div>
                                    <div class="cont-col2">
                                       <div class="desc">
                                          李开复发布微博称淋巴癌化疗后结果不理想 
                                         <span class="label label-sm label-success ">
                                          点击数：30
                                          <i class="icon-long-arrow-up"></i>
                                          </span>      
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div class="col2">
                                 <div class="date">
                                    3天前
                                 </div>
                              </div>
                           </li>
                           <li>
                              <div class="col1">
                                 <div class="cont">
                                    <div class="cont-col1">
                                       <div class="label label-sm label-info">                        
                                          <i class="icon-shopping-cart">
                                          </i>
                                       </div>
                                    </div>
                                    <div class="cont-col2">
                                       <div class="desc">
                                          李开复发布微博称淋巴癌化疗后结果不理想 
                                         <span class="label label-sm label-success ">
                                          点击数：30
                                          <i class="icon-long-arrow-up"></i>
                                          </span>     
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div class="col2">
                                 <div class="date">
                                    3天前
                                 </div>
                              </div>
                           </li>
                           <li>
                              <div class="col1">
                                 <div class="cont">
                                    <div class="cont-col1">
                                       <div class="label label-sm label-info">                        
                                          <i class="icon-shopping-cart">
                                          </i>
                                       </div>
                                    </div>
                                    <div class="cont-col2">
                                       <div class="desc">
                                          李开复发布微博称淋巴癌化疗后结果不理想 
                                          <span class="label label-sm label-success">点击数：300 
                                          <i class="icon-long-arrow-up"></i></span>             
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div class="col2">
                                 <div class="date">
                                    3天前
                                 </div>
                              </div>
                           </li>
                           <li>
                              <div class="col1">
                                 <div class="cont">
                                    <div class="cont-col1">
                                       <div class="label label-sm label-info">                        
                                          <i class="icon-shopping-cart">
                                          </i>
                                       </div>
                                    </div>
                                    <div class="cont-col2">
                                       <div class="desc">
                                          李开复发布微博称淋巴癌化疗后结果不理想 
                                          <span class="label label-sm label-success">点击数：300 
                                          <i class="icon-long-arrow-up"></i></span>          
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div class="col2">
                                 <div class="date">
                                    3天前
                                 </div>
                              </div>
                           </li>
                           
                        </ul>
                     </div>
                     <div class="scroller-footer">
                        <div class="pull-right">
                           <a href="#">查看更多<i class="m-icon-swapright m-icon-gray">
                           </i></a> &nbsp;
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="col-md-6 col-sm-6">
               <div class="portlet box green tasks-widget">
                  <div class="portlet-title">
                     <div class="caption"><i class="icon-check">
                     </i>近期考试</div>
                    <!-- <div class="tools">
                        <a href="#portlet-config" data-toggle="modal" class="config"></a>
                        <a href="#" class="reload"></a>
                     </div>
                     <div class="actions">
                        <div class="btn-group">
                           <a class="btn default btn-xs" href="#" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                           More
                           <i class="icon-angle-down"></i>
                           </a>
                           <ul class="dropdown-menu pull-right">
                              <li><a href="#"><i class="i"></i> All Project</a></li>
                              <li class="divider"></li>
                              <li><a href="#">AirAsia</a></li>
                              <li><a href="#">Cruise</a></li>
                              <li><a href="#">HSBC</a></li>
                              <li class="divider"></li>
                              <li><a href="#">Pending <span class="badge badge-important">4</span></a></li>
                              <li><a href="#">Completed <span class="badge badge-success">12</span></a></li>
                              <li><a href="#">Overdue <span class="badge badge-warning">9</span></a></li>
                           </ul>
                        </div>
                     </div>-->
                  </div>
                  <div class="portlet-body">
                       <table class="table table-striped table-hover">
                        <thead>
                           <tr>
                                <td>考试名称</td>
                                <td>已报名人数</td>
                                <td>已参考人数</td>
                                <td>通过人数</td>
                                <td>未通过人数</td>
                           </tr>
                        </thead>
                        <tbody>
                           <tr>
                              <td>十八大中心思想自学考试</td>
                              <td>320</td>
                              <td>289</td>
                              <td >230</td>
                              <td>59</td>
                           </tr>
                           <tr>
                              <td>十八大中心思想自学考试</td>
                              <td>320</td>
                              <td>289</td>
                              <td >230</td>
                              <td>59</td>
                           </tr>
                           <tr>
                              <td>十八大中心思想自学考试</td>
                              <td>320</td>
                              <td>289</td>
                              <td >230</td>
                              <td>59</td>
                           </tr>
                           <tr>
                              <td>十八大中心思想自学考试</td>
                              <td>320</td>
                              <td>289</td>
                              <td >230</td>
                              <td>59</td>
                           </tr>
                           <tr>
                              <td>十八大中心思想自学考试</td>
                              <td>320</td>
                              <td>289</td>
                              <td >230</td>
                              <td>59</td>
                           </tr>
                           <tr>
                              <td>十八大中心思想自学考试</td>
                              <td>320</td>
                              <td>289</td>
                              <td >230</td>
                              <td>59</td>
                           </tr>
                           <tr>
                              <td>十八大中心思想自学考试</td>
                              <td>320</td>
                              <td>289</td>
                              <td >230</td>
                              <td>59</td>
                           </tr>
                        </tbody>
                     </table>
                   
                     <div class="task-footer">
                        <span class="pull-right">
                        <a href="#">查看更多<i class="m-icon-swapright m-icon-gray"></i></a> &nbsp;
                        </span>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <div class="clearfix">
         </div>
         <!------------------------------------------------------------------------------------------------------->
         <div class="row ">
             <!--*****************************************************-->
            <div class="col-md-6 col-sm-6">
                <!--排片表和课程表-->
                <div class="portlet box purple live_telecast">
                      <div class="portlet-title">
                         <div class="caption"><i class="icon-calendar"></i>直播排期表</div>
                      </div>
                      <div class="portlet-body" style="padding:0px;">
                          <div class="prev">
                            <i class="icon-chevron-left">
                               <!--左边的箭头-->
                            </i>
                          </div>
                          <div class="live_box">
                             <div id="owl-demo" class="owl-carousel owl-theme">
                                  <div class="item first">
                                      <table class="item_table">
                                          <tr><td class="time">14:00--16:00</td></tr>
                                          <tr><td class="date">10月22日</td></tr>
                                          <tr><td class="week">星期二</td></tr>
                                          <tr><td class="title">联络员在线培训</td></tr>
                                      </table>
                                  </div>
                                  <div class="item second">
                                      <table class="item_table">
                                          <tr><td class="time">14:00--16:00</td></tr>
                                          <tr><td class="date">10月22日</td></tr>
                                          <tr><td class="week">星期二</td></tr>
                                          <tr><td class="title">联络员在线培训</td></tr>
                                      </table>
                                  </div>
                                  <div class="item third">
                                       <table class="item_table">
                                          <tr><td class="time">14:00--16:00</td></tr>
                                          <tr><td class="date">10月22日</td></tr>
                                          <tr><td class="week">星期二</td></tr>
                                          <tr><td class="title">联络员在线培训</td></tr>
                                      </table>
                                  </div>
                                  <div class="item fourth">
                                      <table class="item_table">
                                          <tr><td class="time">14:00--16:00</td></tr>
                                          <tr><td class="date">10月22日</td></tr>
                                          <tr><td class="week">星期二</td></tr>
                                          <tr><td class="title">联络员在线培训</td></tr>
                                      </table>
                                  </div>
                                  <div class="item first">
                                      <table class="item_table">
                                          <tr><td class="time">14:00--16:00</td></tr>
                                          <tr><td class="date">10月22日</td></tr>
                                          <tr><td class="week">星期二</td></tr>
                                          <tr><td class="title">联络员在线培训</td></tr>
                                      </table>
                                  </div>
                                  <div class="item second">
                                      <table class="item_table">
                                          <tr><td class="time">14:00--16:00</td></tr>
                                          <tr><td class="date">10月22日</td></tr>
                                          <tr><td class="week">星期二</td></tr>
                                          <tr><td class="title">联络员在线培训</td></tr>
                                      </table>
                                  </div>
                                  <div class="item third">
                                       <table class="item_table">
                                          <tr><td class="time">14:00--16:00</td></tr>
                                          <tr><td class="date">10月22日</td></tr>
                                          <tr><td class="week">星期二</td></tr>
                                          <tr><td class="title">联络员在线培训</td></tr>
                                      </table>
                                  </div>
                                  <div class="item fourth">
                                      <table class="item_table">
                                          <tr><td class="time">14:00--16:00</td></tr>
                                          <tr><td class="date">10月22日</td></tr>
                                          <tr><td class="week">星期二</td></tr>
                                          <tr><td class="title">联络员在线培训</td></tr>
                                      </table>
                                  </div>
                                  <div class="item first">
                                      <table class="item_table">
                                          <tr><td class="time">14:00--16:00</td></tr>
                                          <tr><td class="date">10月22日</td></tr>
                                          <tr><td class="week">星期二</td></tr>
                                          <tr><td class="title">联络员在线培训</td></tr>
                                      </table>
                                  </div>
                                  <div class="item second">
                                      <table class="item_table">
                                          <tr><td class="time">14:00--16:00</td></tr>
                                          <tr><td class="date">10月22日</td></tr>
                                          <tr><td class="week">星期二</td></tr>
                                          <tr><td class="title">联络员在线培训</td></tr>
                                      </table>
                                  </div>
                                  <div class="item third">
                                       <table class="item_table">
                                          <tr><td class="time">14:00--16:00</td></tr>
                                          <tr><td class="date">10月22日</td></tr>
                                          <tr><td class="week">星期二</td></tr>
                                          <tr><td class="title">联络员在线培训</td></tr>
                                      </table>
                                  </div>
                                  <div class="item fourth">
                                      <table class="item_table">
                                          <tr><td class="time">14:00--16:00</td></tr>
                                          <tr><td class="date">10月22日</td></tr>
                                          <tr><td class="week">星期二</td></tr>
                                          <tr><td class="title">联络员在线培训</td></tr>
                                      </table>
                                  </div>
                            </div>
                           <!-- <div class="customNavigation">
                              <a class="btn prev">Previous</a>
                              <a class="btn next">Next</a>
                              <a class="btn play">Autoplay</a>
                              <a class="btn stop">Stop</a>
                            </div>-->
                        </div>
                        <div class="next">
                            <i class="icon-chevron-right">
                            <!--右边的箭头-->
                            </i>
                        </div>
                    </div>
                </div>
            </div>
         <!--*****************************************************-->           
            <!--右边列-->
            <div class="col-md-6 col-sm-6">
               <!-- BEGIN SAMPLE TABLE PORTLET-->           
               <div class="portlet">
                  <div class="portlet-title">
                     <div class="caption"><i class=" icon-list"></i>课程列表</div>
                    <!-- <div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                        <a href="#portlet-config" data-toggle="modal" class="config"></a>
                        <a href="javascript:;" class="reload"></a>
                        <a href="javascript:;" class="remove"></a>
                     </div>-->
                  </div>
                  <div class="portlet-body">
                     <table class="table table-striped table-bordered table-advance table-hover">
                        <thead>
                           <tr>
                              <th><i class="icon-tags"></i>课程名称</th>
                              <th class="hidden-xs"><i class="icon-th"></i> 已报名人数</th>
                              <th><i class="icon-pencil"></i> 已学习人数</th>
                              <th><i class="icon-bookmark"></i> 已通过人数</th>
                           </tr>
                        </thead>
                        <tbody>
                           <tr>
                              <td><a href="#">沟通的意义</a></td>
                              <td class="hidden-xs">230</td>
                              <td>130</td>
                              <td><a href="#" class="btn default btn-xs green-stripe">90</a></td>
                           </tr>
                           <tr>
                              <td>
                                 <a href="#">
                                 沟通在项目开发过程中的重要程度
                                 </a>  
                              </td>
                              <td class="hidden-xs">230</td>
                              <td>130</td>
                              <td><a href="#" class="btn default btn-xs blue-stripe">90</a></td>
                           </tr>
                           <tr>
                              <td>
                                 <a href="#">
                                 2014年国家公务员考试行测备考指南
                                 </a>
                              </td>
                              <td class="hidden-xs">290</td>
                              <td>140</td>
                              <td><a href="#" class="btn default btn-xs blue-stripe">99</a></td>
                           </tr>
                           <tr>
                              <td>
                                 <a href="#">
                                 儿童心理解读与教养行为引导
                                 </a>
                              </td>
                              <td class="hidden-xs">290</td>
                              <td>140</td>
                              <td><a href="#" class="btn default btn-xs red-stripe">99</a></td>
                           </tr>
                           <tr>
                              <td><a href="#">沟通的意义</a></td>
                              <td class="hidden-xs">230</td>
                              <td>130</td>
                              <td><a href="#" class="btn default btn-xs green-stripe">90</a></td>
                           </tr>
                           <tr>
                              <td>
                                 <a href="#">
                                 沟通在项目开发过程中的重要程度
                                 </a>  
                              </td>
                              <td class="hidden-xs">230</td>
                              <td>130</td>
                              <td><a href="#" class="btn default btn-xs blue-stripe">90</a></td>
                           </tr>
                           <tr>
                              <td>
                                 <a href="#">
                                 2014年国家公务员考试行测备考指南
                                 </a>
                              </td>
                              <td class="hidden-xs">290</td>
                              <td>140</td>
                              <td><a href="#" class="btn default btn-xs blue-stripe">99</a></td>
                           </tr>
                           <tr>
                              <td>
                                 <a href="#">
                                 儿童心理解读与教养行为引导
                                 </a>
                              </td>
                              <td class="hidden-xs">290</td>
                              <td>140</td>
                              <td><a href="#" class="btn default btn-xs red-stripe">99</a></td>
                           </tr>
                        </tbody>
                     </table>
                  </div>
               </div>
               <!-- END SAMPLE TABLE PORTLET-->
            </div>
           <!--右边列结束-->
         </div>
         <!------------------------------------------------------------------------------------------------------->
         <div class="clearfix">
         </div>
         <div class="row ">
            <div class="col-md-6 col-sm-6">
              <!--放饼状图-->
            </div>
            <div class="col-md-6 col-sm-6">
               <!-- BEGIN PORTLET-->
               <div class="portlet">
                  <div class="portlet-title line">
                     <div class="caption"><i class="icon-comments"></i>微博</div>
                    <div class="timeCheck">
                        <a href="javascript:void(0)" >本月</a>
                        <a href="javascript:void(0)" class="active">本周</a>
                        <a href="javascript:void(0)" >今天</a>
                     </div>
                     <!-- 根据时间来选择内容 -->
                    <!--  <div class="timeCheck">
                     	<ul>
                     		<li>
                     			<span>昨天</span>
                     		</li>
                     		<li>
                     			<span>今天</span>
                     		</li>
                     	</ul>
                     </div> -->
                  </div>
                  <div class="portlet-body" id="chats">
                     <div class="scroller" style="height: 435px;" data-always-visible="1" data-rail-visible1="1">
                        <ul class="chats">
                           <li class="in">
                              <img class="avatar img-responsive" alt="" src="${basepath}/static//public/metronic.bootstrap/assets/img/avatar1.jpg" />
                              <div class="message">
                                 <span class="arrow"></span>
                                 <a href="#" class="name">薛成博</a>
                                 <span class="datetime">2013-11-11 11:11:11</span>
                                 <span class="body">
                                 logo的问题纠结了很久了，希望大家给点建议，尽快解决这个问题。
                                 </span>
                              </div>
                           </li>
                           <li class="in">
                              <img class="avatar img-responsive" alt="" src="${basepath}/static//public/metronic.bootstrap/assets/img/avatar2.jpg" />
                              <div class="message">
                                 <span class="arrow"></span>
                                 <a href="#" class="name">阮瑞娜</a>
                                 <span class="datetime">2013-11-12 15:12:45</span>
                                 <span class="body">
                                 虹口工商的新的需求计划表出来了，这个需求计划表基本上再也不会有太大的变更，希望开发设计部门尽快给出设计图稿。
                                 </span>
                              </div>
                           </li>
                           <li class="in">
                              <img class="avatar img-responsive" alt="" src="${basepath}/static//public/metronic.bootstrap/assets/img/avatar1.jpg" />
                              <div class="message">
                                 <span class="arrow"></span>
                                 <a href="#" class="name">薛成博</a>
                                 <span class="datetime">2013-11-14 09:23:44</span>
                                 <span class="body">
                                 手机端微站的界面已经设计出来了，包括学习列表的，考试列表的，还有微站首页的，两个列表页的样式差不多，一个有图片一个没有图片，这样的设计效果是参照了小米商场的商品展示效果，唯一的缺点就是这样的设计
                                 十分的费流量，基本上都是图片，但是现在使用这些东西的时候基本上都是使用wifi所以流量的问题就暂时没有考虑。
                                 </span>
                              </div>
                           </li>
                           <li class="in">
                              <img class="avatar img-responsive" alt="" src="${basepath}/static//public/metronic.bootstrap/assets/img/avatar3.jpg" />
                              <div class="message">
                                 <span class="arrow"></span>
                                 <a href="#" class="name">陈科峰</a>
                                 <span class="datetime">2013-11-14 19:23:44</span>
                                 <span class="body">
                                 安卓开发真难弄啊，不想学···不想学···不想学···不想学···
                                 </span>
                              </div>
                           </li>
                           <li class="in">
                              <img class="avatar img-responsive" alt="" src="${basepath}/static//public/metronic.bootstrap/assets/img/avatar3.jpg" />
                              <div class="message">
                                 <span class="arrow"></span>
                                 <a href="#" class="name">陈科峰</a>
                                 <span class="datetime">2013-11-15 09:33:34</span>
                                 <span class="body">
                                 哈哈，虹口移动安卓端的开发迭代版本如期完成了！
                                 </span>
                              </div>
                           </li>
                           <li class="in">
                              <img class="avatar img-responsive" alt="" src="${basepath}/static//public/metronic.bootstrap/assets/img/avatar1.jpg" />
                              <div class="message">
                                 <span class="arrow"></span>
                                 <a href="#" class="name">薛成博</a>
                                 <span class="datetime">2013-11-15 13:13:14</span>
                                 <span class="body">
                                 移动端的图标设计完成了！
                                 </span>
                              </div>
                           </li>
                           <li class="in">
                              <img class="avatar img-responsive" alt="" src="${basepath}/static//public/metronic.bootstrap/assets/img/avatar3.jpg" />
                              <div class="message">
                                 <span class="arrow"></span>
                                 <a href="#" class="name">陈科峰</a>
                                 <span class="datetime">2013-11-16 19:23:13</span>
                                 <span class="body">
                                 新华社莫斯科11月17日电(记者刘怡然) 俄罗斯鞑靼斯坦航空公司一架波音737客机于当地时间17日晚间在俄中西部城市喀山坠毁，机上50人全部遇难。
                                 </span>
                              </div>
                           </li>
                           <li class="in">
                              <img class="avatar img-responsive" alt="" src="${basepath}/static//public/metronic.bootstrap/assets/img/avatar1.jpg" />
                              <div class="message">
                                 <span class="arrow"></span>
                                 <a href="#" class="name">陈科峰</a>
                                 <span class="datetime">2013-11-15 09:33:34</span>
                                 <span class="body">
                                 俄罗斯鞑靼斯坦共和国紧急情况总局提供的消息说，这架客机于莫斯科时间19时25分(北京时间23时25分)在喀山机场降落时坠毁，机上44名乘客和6名机组人员全部遇难，救援人员已经找到全部尸体。
                                 </span>
                              </div>
                           </li>
                        </ul>
                     </div>
                     <!-- 对话框发送消息区域 -->
                     <!-- <div class="chat-form">
                        <div class="input-cont">   
                           <input class="form-control" type="text" placeholder="Type a message here..." />
                        </div>
                        <div class="btn-cont"> 
                           <span class="arrow"></span>
                           <a href="#" class="btn blue icn-only"><i class="icon-ok icon-white"></i></a>
                        </div>
                     </div> -->
                  </div>
               </div>
               <!-- END PORTLET-->
            </div>
         </div>
</body>
</html>
<content tag="pageCore">
<!-- 页面必须引入的js -->
         <!-- BEGIN PAGE LEVEL PLUGINS -->
   <%-- <script src="${basepath}/static/public/metronic.bootstrap/assets/plugins/jqvmap/jqvmap/jquery.vmap.js" type="text/javascript"></script>   
   <script src="${basepath}/static/public/metronic.bootstrap/assets/plugins/jqvmap/jqvmap/maps/jquery.vmap.russia.js" type="text/javascript"></script>
   <script src="${basepath}/static/public/metronic.bootstrap/assets/plugins/jqvmap/jqvmap/maps/jquery.vmap.world.js" type="text/javascript"></script>
   <script src="${basepath}/static/public/metronic.bootstrap/assets/plugins/jqvmap/jqvmap/maps/jquery.vmap.europe.js" type="text/javascript"></script>
   <script src="${basepath}/static/public/metronic.bootstrap/assets/plugins/jqvmap/jqvmap/maps/jquery.vmap.germany.js" type="text/javascript"></script>
   <script src="${basepath}/static/public/metronic.bootstrap/assets/plugins/jqvmap/jqvmap/maps/jquery.vmap.usa.js" type="text/javascript"></script>
   <script src="${basepath}/static/public/metronic.bootstrap/assets/plugins/jqvmap/jqvmap/data/jquery.vmap.sampledata.js" type="text/javascript"></script> --%>  
   <script src="${basepath}/static/public/metronic.bootstrap/assets/plugins/flot/jquery.flot.js" type="text/javascript"></script>
   <script src="${basepath}/static/public/metronic.bootstrap/assets/plugins/flot/jquery.flot.resize.js" type="text/javascript"></script>
   <script src="${basepath}/static/public/metronic.bootstrap/assets/plugins/jquery.pulsate.min.js" type="text/javascript"></script>
   <script src="${basepath}/static/public/metronic.bootstrap/assets/plugins/bootstrap-daterangepicker/moment.min.js" type="text/javascript"></script>
   <script src="${basepath}/static/public/metronic.bootstrap/assets/plugins/bootstrap-daterangepicker/daterangepicker.js" type="text/javascript"></script>     
   <script src="${basepath}/static/public/metronic.bootstrap/assets/plugins/gritter/js/jquery.gritter.js" type="text/javascript"></script>
   <!-- IMPORTANT! fullcalendar depends on jquery-ui-1.10.3.custom.min.js for drag & drop support -->
   <script src="${basepath}/static/public/metronic.bootstrap/assets/plugins/fullcalendar/fullcalendar/fullcalendar.min.js" type="text/javascript"></script>
   <script src="${basepath}/static/public/metronic.bootstrap/assets/plugins/jquery-easy-pie-chart/jquery.easy-pie-chart.js" type="text/javascript"></script>
   <script src="${basepath}/static/public/metronic.bootstrap/assets/plugins/jquery.sparkline.min.js" type="text/javascript"></script>  
   <!-- END PAGE LEVEL PLUGINS -->
   <!--学习课程数量图表   start-->
   <script src="${basepath}/static/public/Highcharts-3.0.6/js/highcharts.js"></script>
<script src="${basepath}/static/public/Highcharts-3.0.6/js/modules/exporting.js"></script>

<!--学习课程数量图表   end-->
 <!-- BEGIN PAGE LEVEL SCRIPTS -->
   <%-- <script src="${basepath}/static/public/metronic.bootstrap/assets/scripts/app.js" type="text/javascript"></script> --%>
   <script src="${basepath}/static/public/metronic.bootstrap/assets/scripts/index.js" type="text/javascript"></script>
   
   <script src="${basepath}/static/public/metronic.bootstrap/assets/scripts/tasks.js" type="text/javascript"></script>   
   <!-- END PAGE LEVEL SCRIPTS -->  
      <!-- 排片表等 -->
<script src="${basepath}/static/public/carousel/owl-carousel/owl.carousel.js"></script>
<script src="${basepath}/static/public/javascripts/index.js" type="text/javascript"></script>
</content>
<content tag="pageInit">
<!-- 页面初始化 -->
 <script type="text/javascript">
      $(document).ready(function() {
         Index.init();
        // Index.initJQVMAP(); // init index page's custom scripts
         Index.initCalendar(); // init index page's custom scripts
         Index.initCharts(); // init index page's custom scripts
         //Index.initChat();
         Index.initMiniCharts();
         Index.initDashboardDaterange();
        // Index.initIntro();
         Tasks.initDashboardWidget();
        //begin
         var owl = $("#owl-demo");
      owl.owlCarousel({
          items : 3, //10 items above 1000px browser width
          itemsDesktop : [1000,5], //5 items between 1000px and 901px
          itemsDesktopSmall : [900,2], // betweem 900px and 601px
          itemsTablet: [600,1], //2 items between 600 and 0
          itemsMobile : true // itemsMobile disabled - inherit from itemsTablet option
      });
     $(".live_box").find(".owl-item").each(function(){
         $(this).attr("style","width:202px;");
     });
      // Custom Navigation Events
      $(".next").click(function(){
        owl.trigger('owl.next');
      });
      $(".prev").click(function(){
        owl.trigger('owl.prev');
      });
      $(".play").click(function(){
        owl.trigger('owl.play',1000); //owl.play event accept autoPlay speed as second parameter
      });
      $(".stop").click(function(){
        owl.trigger('owl.stop');
      });
      //end
      });
         
</script>
 </content>