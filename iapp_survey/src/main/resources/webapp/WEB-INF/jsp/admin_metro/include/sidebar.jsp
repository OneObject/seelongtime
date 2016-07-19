<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<!-- BEGIN SIDEBAR -->
<div class="page-sidebar navbar-collapse collapse">
    <!-- BEGIN SIDEBAR MENU -->
    <ul class="page-sidebar-menu">
        <li>
            <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
            <div class="sidebar-toggler hidden-phone"></div>
            <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
        </li>
        <li>
            <!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
            <form class="sidebar-search" action="#" method="POST">
                <div class="form-container">
                    <div class="input-box">
                        <a href="javascript:;" class="remove"></a>
                        <input type="text" placeholder="Search..."/>
                        <input type="button" class="submit" value=" "/>
                    </div>
                </div>
            </form>
            <!-- END RESPONSIVE QUICK SEARCH FORM -->
        </li>
        <li class="start active">
            <a href="javascript:tourl('index');"> <i class="icon-home"></i> <span class="title">仪表盘</span> <span class="selected"></span> </a>
        </li>
        <li class="couseManage">
            <a href="javascript:;"> <i class="icon-book"></i> <span class="title">课程管理</span> <span class="arrow"></span> </a>
            <ul class="sub-menu">
                <li id="trainingFree">
                    <a href="javascript:void(0);" onclick="tourl('trainingFeeManage');">课程分类管理</a>
                </li>
                <li >
                    <a href="javascript:void(0);">课件管理</a>
                </li>
                <li >
                    <a href="javascript:void(0);">课程管理</a>
                </li>
                <li >
                    <a href="javascript:void(0);">课程发布管理</a>
                </li>
                <li >
                    <a href="javascript:void(0);">课程审核管理</a>
                </li>
                <li >
                    <a href="javascript:void(0);">课程授权管理</a>
                </li>
                <li >
                    <a href="javascript:void(0);">学习进度管理</a>
                </li>
            </ul>

        </li>
        <!-- <li class="tooltips" data-placement="left" data-original-title="Frontend&nbsp;Theme For&nbsp;Metronic&nbsp;Admin">
        <a href="http://keenthemes.com/preview/index.php?theme=metronic_frontend" target="_blank">
        <i class="icon-gift"></i>
        <span class="title">Frontend Theme</span>
        </a>
        </li>-->
        <li class="systemmanage">
            <a href="javascript:;"> <i class="icon-bookmark-empty"></i> <span class="title">系统管理</span> <span class="arrow "></span> </a>
            <ul class="sub-menu">
                <li id="usermanage">
                    <a href="javascript:void(0);" id="b_user" onclick="javascript:tourl('usermanage');"> 用户管理</a>
                </li>
                <li id="organization">
                    <a href="javascript:void(0);"  onclick="javascript:tourl('organization');"> 组织管理</a>
                </li>
                <li >
                    <a href="ui_typography.html"> 系统角色管理</a>
                </li>
            </ul>
        </li>
        <li class="">
            <a href="javascript:;"> <i class="icon-bookmark-empty"></i> <span class="title">积分规则管理</span> <span class="arrow "></span> </a>
            <ul class="sub-menu">
                <li >
                    <a href="ui_general.html"> 积分日志管理</a>
                </li>
                <li >
                    <a href="ui_buttons.html"> 积分规则管理</a>
                </li>
            </ul>
        </li>
        <li class="">
            <a href="javascript:;"> <i class="icon-bookmark-empty"></i> <span class="title">消息管理</span> <span class="arrow "></span> </a>
            <ul class="sub-menu">
                <li >
                    <a href="ui_general.html"> 通知发送日志</a>
                </li>
                <li >
                    <a href="ui_buttons.html"> 通知屏蔽设置</a>
                </li>
                <li >
                    <a href="ui_buttons.html"> 消息清理</a>
                </li>
            </ul>
        </li>

        <li class="">
            <a href="javascript:;"> <i class="icon-table"></i> <span class="title">Form Stuff</span> <span class="arrow "></span> </a>
            <ul class="sub-menu">
                <li >
                    <a href="form_controls.html"> Form Controls</a>
                </li>
                <li >
                    <a href="form_layouts.html"> Form Layouts</a>
                </li>
                <li >
                    <a href="form_component.html"> Form Components</a>
                </li>
                <li >
                    <a href="form_editable.html"> <span class="badge badge-roundless badge-warning">new</span>Form X-editable</a>
                </li>
                <li >
                    <a href="form_wizard.html"> Form Wizard</a>
                </li>
                <li >
                    <a href="form_validation.html"> Form Validation</a>
                </li>
                <li >
                    <a href="form_image_crop.html"> <span class="badge badge-roundless badge-important">new</span>Image Cropping</a>
                </li>
                <li >
                    <a href="form_fileupload.html"> Multiple File Upload</a>
                </li>
                <li >
                    <a href="form_dropzone.html"> Dropzone File Upload</a>
                </li>
            </ul>
        </li>
        <li class="">
            <a href="javascript:;"> <i class="icon-sitemap"></i> <span class="title">Pages</span> <span class="arrow "></span> </a>
            <ul class="sub-menu">
                <li >
                    <a href="page_portfolio.html"> <i class="icon-briefcase"></i> <span class="badge badge-warning badge-roundless">new</span>Portfolio</a>
                </li>
                <li >
                    <a href="page_timeline.html"> <i class="icon-time"></i> <span class="badge badge-info">4</span>Timeline</a>
                </li>
                <li >
                    <a href="page_coming_soon.html"> <i class="icon-cogs"></i> Coming Soon</a>
                </li>
                <li >
                    <a href="page_blog.html"> <i class="icon-comments"></i> Blog</a>
                </li>
                <li >
                    <a href="page_blog_item.html"> <i class="icon-font"></i> Blog Post</a>
                </li>
                <li >
                    <a href="page_news.html"> <i class="icon-coffee"></i> <span class="badge badge-success">9</span>News</a>
                </li>
                <li >
                    <a href="page_news_item.html"> <i class="icon-bell"></i> News View</a>
                </li>
                <li >
                    <a href="page_about.html"> <i class="icon-group"></i> About Us</a>
                </li>
                <li >
                    <a href="page_contact.html"> <i class="icon-envelope-alt"></i> Contact Us</a>
                </li>
                <li >
                    <a href="page_calendar.html"> <i class="icon-calendar"></i> <span class="badge badge-important">14</span>Calendar</a>
                </li>
            </ul>
        </li>
        <li class="">
            <a href="javascript:;"> <i class="icon-gift"></i> <span class="title">Extra</span> <span class="arrow "></span> </a>
            <ul class="sub-menu">
                <li >
                    <a href="extra_profile.html"> User Profile</a>
                </li>
                <li >
                    <a href="extra_lock.html"> Lock Screen</a>
                </li>
                <li >
                    <a href="extra_faq.html"> FAQ</a>
                </li>
                <li >
                    <a href="inbox.html"> <span class="badge badge-important">4</span>Inbox</a>
                </li>
                <li >
                    <a href="extra_search.html"> Search Results</a>
                </li>
                <li >
                    <a href="extra_invoice.html"> Invoice</a>
                </li>
                <li >
                    <a href="extra_pricing_table.html"> Pricing Tables</a>
                </li>
                <li >
                    <a href="extra_404_option1.html"> 404 Page Option 1</a>
                </li>
                <li >
                    <a href="extra_404_option2.html"> 404 Page Option 2</a>
                </li>
                <li >
                    <a href="extra_404_option3.html"> 404 Page Option 3</a>
                </li>
                <li >
                    <a href="extra_500_option1.html"> 500 Page Option 1</a>
                </li>
                <li >
                    <a href="extra_500_option2.html"> 500 Page Option 2</a>
                </li>
            </ul>
        </li>
        <li>
            <a class="active" href="javascript:;"> <i class="icon-leaf"></i> <span class="title">3 Level Menu</span> <span class="arrow "></span> </a>
            <ul class="sub-menu">
                <li>
                    <a href="javascript:;"> Item 1 <span class="arrow"></span> </a>
                    <ul class="sub-menu">
                        <li>
                            <a href="#">Sample Link 1</a>
                        </li>
                        <li>
                            <a href="#">Sample Link 2</a>
                        </li>
                        <li>
                            <a href="#">Sample Link 3</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="javascript:;"> Item 1 <span class="arrow"></span> </a>
                    <ul class="sub-menu">
                        <li>
                            <a href="#">Sample Link 1</a>
                        </li>
                        <li>
                            <a href="#">Sample Link 1</a>
                        </li>
                        <li>
                            <a href="#">Sample Link 1</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#"> Item 3 </a>
                </li>
            </ul>
        </li>
        <li>
            <a href="javascript:;"> <i class="icon-folder-open"></i> <span class="title">4 Level Menu</span> <span class="arrow "></span> </a>
            <ul class="sub-menu">
                <li>
                    <a href="javascript:;"> <i class="icon-cogs"></i> Item 1 <span class="arrow"></span> </a>
                    <ul class="sub-menu">
                        <li>
                            <a href="javascript:;"> <i class="icon-user"></i> Sample Link 1 <span class="arrow"></span> </a>
                            <ul class="sub-menu">
                                <li>
                                    <a href="#"><i class="icon-remove"></i> Sample Link 1</a>
                                </li>
                                <li>
                                    <a href="#"><i class="icon-pencil"></i> Sample Link 1</a>
                                </li>
                                <li>
                                    <a href="#"><i class="icon-edit"></i> Sample Link 1</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#"><i class="icon-user"></i> Sample Link 1</a>
                        </li>
                        <li>
                            <a href="#"><i class="icon-external-link"></i> Sample Link 2</a>
                        </li>
                        <li>
                            <a href="#"><i class="icon-bell"></i> Sample Link 3</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="javascript:;"> <i class="icon-globe"></i> Item 2 <span class="arrow"></span> </a>
                    <ul class="sub-menu">
                        <li>
                            <a href="#"><i class="icon-user"></i> Sample Link 1</a>
                        </li>
                        <li>
                            <a href="#"><i class="icon-external-link"></i> Sample Link 1</a>
                        </li>
                        <li>
                            <a href="#"><i class="icon-bell"></i> Sample Link 1</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#"> <i class="icon-folder-open"></i> Item 3 </a>
                </li>
            </ul>
        </li>
        <li class="">
            <a href="javascript:;"> <i class="icon-user"></i> <span class="title">Login Options</span> <span class="arrow "></span> </a>
            <ul class="sub-menu">
                <li >
                    <a href="login.html"> Login Form 1</a>
                </li>
                <li >
                    <a href="login_soft.html"> Login Form 2</a>
                </li>
            </ul>
        </li>
        <li class="">
            <a href="javascript:;"> <i class="icon-th"></i> <span class="title">Data Tables</span> <span class="arrow "></span> </a>
            <ul class="sub-menu">
                <li >
                    <a href="table_basic.html"> Basic Tables</a>
                </li>
                <li >
                    <a href="table_responsive.html"> Responsive Tables</a>
                </li>
                <li >
                    <a href="table_managed.html"> Managed Tables</a>
                </li>
                <li >
                    <a href="table_editable.html"> Editable Tables</a>
                </li>
                <li >
                    <a href="table_advanced.html"> Advanced Tables</a>
                </li>
            </ul>
        </li>
        <li class="">
            <a href="javascript:;"> <i class="icon-file-text"></i> <span class="title">Portlets</span> <span class="arrow "></span> </a>
            <ul class="sub-menu">
                <li >
                    <a href="portlet_general.html"> General Portlets</a>
                </li>
                <li >
                    <a href="portlet_draggable.html"> Draggable Portlets</a>
                </li>
            </ul>
        </li>
        <li class="">
            <a href="javascript:;"> <i class="icon-map-marker"></i> <span class="title">Maps</span> <span class="arrow "></span> </a>
            <ul class="sub-menu">
                <li >
                    <a href="maps_google.html"> Google Maps</a>
                </li>
                <li >
                    <a href="maps_vector.html"> Vector Maps</a>
                </li>
            </ul>
        </li>
        <li class="last ">
            <a href="charts.html"> <i class="icon-bar-chart"></i> <span class="title">Visual Charts</span> </a>
        </li>
    </ul>
    <!-- END SIDEBAR MENU -->
</div>
<!-- END SIDEBAR -->
<!-- BEGIN SIDEBAR -->

<div class="page-sidebar nav-collapse collapse">

    <!-- BEGIN SIDEBAR MENU -->

    <ul class="page-sidebar-menu">

        <li>

            <!-- BEGIN SIDEBAR TOGGLER BUTTON -->

            <div class="sidebar-toggler hidden-phone"></div>

            <!-- BEGIN SIDEBAR TOGGLER BUTTON -->

        </li>

        <li>

            <!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->

            <form class="sidebar-search">

                <div class="input-box">

                    <a href="javascript:;" class="remove"></a>

                    <input type="text" placeholder="Search..." />

                    <input type="button" class="submit" value=" " />

                </div>

            </form>

            <!-- END RESPONSIVE QUICK SEARCH FORM -->

        </li>

        <li class="start active ">

            <a href="index.html"> <i class="icon-home"></i> <span class="title">Dashboard</span> <span class="selected"></span> </a>

        </li>

        <li class="">

            <a href="javascript:;"> <i class="icon-bookmark-empty"></i> <span class="title">考试管理</span> <span class="arrow "></span> </a>

            <ul class="sub-menu">

                <li >
                    <a href="ui_general.html"></a>
                </li>
                <li >
                    <a href="ui_buttons.html"> Buttons</a>
                </li>

                <li >

                    <a href="ui_modals.html"> Enhanced Modals</a>

                </li>

                <li >

                    <a href="ui_tabs_accordions.html"> Tabs & Accordions</a>

                </li>

                <li >

                    <a href="ui_jqueryui.html"> jQuery UI Components</a>

                </li>

                <li >

                    <a href="ui_sliders.html"> Sliders</a>

                </li>

                <li >

                    <a href="ui_tiles.html"> Tiles</a>

                </li>

                <li >

                    <a href="ui_typography.html"> Typography</a>

                </li>

                <li >

                    <a href="ui_tree.html"> Tree View</a>

                </li>

                <li >

                    <a href="ui_nestable.html"> Nestable List</a>

                </li>

            </ul>

        </li>

        <li class="">

            <a href="javascript:;"> <i class="icon-table"></i> <span class="title">Form Stuff</span> <span class="arrow "></span> </a>

            <ul class="sub-menu">

                <li >

                    <a href="form_layout.html"> Form Layouts</a>

                </li>

                <li >

                    <a href="form_samples.html"> Advance Form Samples</a>

                </li>

                <li >

                    <a href="form_component.html"> Form Components</a>

                </li>

                <li >

                    <a href="form_wizard.html"> Form Wizard</a>

                </li>

                <li >

                    <a href="form_validation.html"> Form Validation</a>

                </li>

                <li >

                    <a href="form_fileupload.html"> Multiple File Upload</a>

                </li>

                <li >

                    <a href="form_dropzone.html"> Dropzone File Upload</a>

                </li>

            </ul>

        </li>

        <li class="">

            <a href="javascript:;"> <i class="icon-briefcase"></i> <span class="title">Pages</span> <span class="arrow "></span> </a>

            <ul class="sub-menu">

                <li >

                    <a href="page_timeline.html"> <i class="icon-time"></i> Timeline</a>

                </li>

                <li >

                    <a href="page_coming_soon.html"> <i class="icon-cogs"></i> Coming Soon</a>

                </li>

                <li >

                    <a href="page_blog.html"> <i class="icon-comments"></i> Blog</a>

                </li>

                <li >

                    <a href="page_blog_item.html"> <i class="icon-font"></i> Blog Post</a>

                </li>

                <li >

                    <a href="page_news.html"> <i class="icon-coffee"></i> News</a>

                </li>

                <li >

                    <a href="page_news_item.html"> <i class="icon-bell"></i> News View</a>

                </li>

                <li >

                    <a href="page_about.html"> <i class="icon-group"></i> About Us</a>

                </li>

                <li >

                    <a href="page_contact.html"> <i class="icon-envelope-alt"></i> Contact Us</a>

                </li>

                <li >

                    <a href="page_calendar.html"> <i class="icon-calendar"></i> Calendar</a>

                </li>

            </ul>

        </li>

        <li class="">

            <a href="javascript:;"> <i class="icon-gift"></i> <span class="title">Extra</span> <span class="arrow "></span> </a>

            <ul class="sub-menu">

                <li >

                    <a href="extra_profile.html"> User Profile</a>

                </li>

                <li >

                    <a href="extra_lock.html"> Lock Screen</a>

                </li>

                <li >

                    <a href="extra_faq.html"> FAQ</a>

                </li>

                <li >

                    <a href="inbox.html"> Inbox</a>

                </li>

                <li >

                    <a href="extra_search.html"> Search Results</a>

                </li>

                <li >

                    <a href="extra_invoice.html"> Invoice</a>

                </li>

                <li >

                    <a href="extra_pricing_table.html"> Pricing Tables</a>

                </li>

                <li >

                    <a href="extra_image_manager.html"> Image Manager</a>

                </li>

                <li >

                    <a href="extra_404_option1.html"> 404 Page Option 1</a>

                </li>

                <li >

                    <a href="extra_404_option2.html"> 404 Page Option 2</a>

                </li>

                <li >

                    <a href="extra_404_option3.html"> 404 Page Option 3</a>

                </li>

                <li >

                    <a href="extra_500_option1.html"> 500 Page Option 1</a>

                </li>

                <li >

                    <a href="extra_500_option2.html"> 500 Page Option 2</a>

                </li>

            </ul>

        </li>

        <li>

            <a class="active" href="javascript:;"> <i class="icon-sitemap"></i> <span class="title">3 Level Menu</span> <span class="arrow "></span> </a>

            <ul class="sub-menu">

                <li>

                    <a href="javascript:;"> Item 1 <span class="arrow"></span> </a>

                    <ul class="sub-menu">

                        <li>
                            <a href="#">Sample Link 1</a>
                        </li>

                        <li>
                            <a href="#">Sample Link 2</a>
                        </li>

                        <li>
                            <a href="#">Sample Link 3</a>
                        </li>

                    </ul>

                </li>

                <li>

                    <a href="javascript:;"> Item 1 <span class="arrow"></span> </a>

                    <ul class="sub-menu">

                        <li>
                            <a href="#">Sample Link 1</a>
                        </li>

                        <li>
                            <a href="#">Sample Link 1</a>
                        </li>

                        <li>
                            <a href="#">Sample Link 1</a>
                        </li>

                    </ul>

                </li>

                <li>

                    <a href="#"> Item 3 </a>

                </li>

            </ul>

        </li>

        <li>

            <a href="javascript:;"> <i class="icon-folder-open"></i> <span class="title">4 Level Menu</span> <span class="arrow "></span> </a>

            <ul class="sub-menu">

                <li>

                    <a href="javascript:;"> <i class="icon-cogs"></i> Item 1 <span class="arrow"></span> </a>

                    <ul class="sub-menu">

                        <li>

                            <a href="javascript:;"> <i class="icon-user"></i> Sample Link 1 <span class="arrow"></span> </a>

                            <ul class="sub-menu">

                                <li>
                                    <a href="#"><i class="icon-remove"></i> Sample Link 1</a>
                                </li>

                                <li>
                                    <a href="#"><i class="icon-pencil"></i> Sample Link 1</a>
                                </li>

                                <li>
                                    <a href="#"><i class="icon-edit"></i> Sample Link 1</a>
                                </li>

                            </ul>

                        </li>

                        <li>
                            <a href="#"><i class="icon-user"></i> Sample Link 1</a>
                        </li>

                        <li>
                            <a href="#"><i class="icon-external-link"></i> Sample Link 2</a>
                        </li>

                        <li>
                            <a href="#"><i class="icon-bell"></i> Sample Link 3</a>
                        </li>

                    </ul>

                </li>

                <li>

                    <a href="javascript:;"> <i class="icon-globe"></i> Item 2 <span class="arrow"></span> </a>

                    <ul class="sub-menu">

                        <li>
                            <a href="#"><i class="icon-user"></i> Sample Link 1</a>
                        </li>

                        <li>
                            <a href="#"><i class="icon-external-link"></i> Sample Link 1</a>
                        </li>

                        <li>
                            <a href="#"><i class="icon-bell"></i> Sample Link 1</a>
                        </li>

                    </ul>

                </li>

                <li>

                    <a href="#"> <i class="icon-folder-open"></i> Item 3 </a>

                </li>

            </ul>

        </li>

        <li class="">

            <a href="javascript:;"> <i class="icon-user"></i> <span class="title">Login Options</span> <span class="arrow "></span> </a>

            <ul class="sub-menu">

                <li >

                    <a href="login.html"> Login Form 1</a>

                </li>

                <li >

                    <a href="login_soft.html"> Login Form 2</a>

                </li>

            </ul>

        </li>

        <li class="">

            <a href="javascript:;"> <i class="icon-th"></i> <span class="title">Data Tables</span> <span class="arrow "></span> </a>

            <ul class="sub-menu">

                <li >

                    <a href="table_basic.html"> Basic Tables</a>

                </li>

                <li >

                    <a href="table_responsive.html"> Responsive Tables</a>

                </li>

                <li >

                    <a href="table_managed.html"> Managed Tables</a>

                </li>

                <li >

                    <a href="table_editable.html"> Editable Tables</a>

                </li>

                <li >

                    <a href="table_advanced.html"> Advanced Tables</a>

                </li>

            </ul>

        </li>

        <li class="">

            <a href="javascript:;"> <i class="icon-file-text"></i> <span class="title">Portlets</span> <span class="arrow "></span> </a>

            <ul class="sub-menu">

                <li >

                    <a href="portlet_general.html"> General Portlets</a>

                </li>

                <li >

                    <a href="portlet_draggable.html"> Draggable Portlets</a>

                </li>

            </ul>

        </li>

        <li class="">

            <a href="javascript:;"> <i class="icon-map-marker"></i> <span class="title">Maps</span> <span class="arrow "></span> </a>

            <ul class="sub-menu">

                <li >

                    <a href="maps_google.html"> Google Maps</a>

                </li>

                <li >

                    <a href="maps_vector.html"> Vector Maps</a>

                </li>

            </ul>

        </li>

        <li class="last ">

            <a href="charts.html"> <i class="icon-bar-chart"></i> <span class="title">Visual Charts</span> </a>

        </li>

    </ul>

    <!-- END SIDEBAR MENU -->

</div>

<!-- END SIDEBAR -->

