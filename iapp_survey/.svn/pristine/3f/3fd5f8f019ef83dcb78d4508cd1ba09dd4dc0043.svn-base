<%@page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp" %>
<!DOCTYPE html>
<!--[if IE 8]>
<html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]>
<html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <title>素材管理</title>
    <meta name="menu_path" content=""/>
    <link rel="stylesheet" media="screen" href="${basepath}/static/ixin/css/ixin.css" type="text/css">
    <link rel="stylesheet"  href="${basepath}/static/ixin/css/base.css" type="text/css">
    <link rel="stylesheet"  href="${basepath}/static/ixin/css/media.css" type="text/css">
    <link rel="stylesheet" href="${basepath}/static/ixin/css/media_list.css" type="text/css">
</head>
<body>

<!-- 页面顶部-->
<div class="row">
    <div class="col-md-12">
        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
        <ul class="page-breadcrumb breadcrumb">
            <li>
                <i class="icon-home">
                </i>
                <a href="javascript:;">爱微站</a>
                <i class="icon-angle-right">
                </i>
            </li>
            <li>
                <a href="javascript:;">素材管理</a>
                <i class="icon-angle-right">
                </i>
            </li>
            <li><span>单图文消息</span></li>
        </ul>
        <!-- END PAGE TITLE & BREADCRUMB-->
    </div>
</div>
<!-- END PAGE HEADER-->
<!---->
<div class="row">
    <div class="col-lg-12">
		<span class="create_access">
		    <i class="icon42_common add_gray"></i>
            <!-- <span class="enter">-->
            <a href="${basepath }/mgr/ixin/singlemsg.xhtml"><i class="icon_appmsg_create"></i><strong>单图文消息</strong></a>
            <a href="${basepath }/mgr/ixin/mulmsg.xhtml"><i class="icon_appmsg_create multi"></i><strong>多图文消息</strong></a>
            <!--</span>-->
        </span>
    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-reorder"></i><span>素材管理</span>
                </div>
            </div>
            <div class="portlet-body box" id="msgListBody">
            
            </div>
        </div>
    </div>
</div>
</body>
</html>
<content tag="pageCore">
<script type="text/javascript">
page(1);
function page(i){
	$('#msgListBody').load("${basepath}/mgr/ixinnofilter/msglist.xhtml?currpage="+i);
}
</script>
</content>
<content tag="pageInit">
    <!-- 初始化窗口 -->
</content>