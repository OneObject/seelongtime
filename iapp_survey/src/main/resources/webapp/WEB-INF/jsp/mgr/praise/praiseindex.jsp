<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>赞管理</title>
    <c:if test="${restype eq 2 && not empty meta}">
	<meta name="menu_path" content="active.menu_activity"/>
	</c:if>
	<c:if test="${restype eq 2 && empty meta }">
	<meta name="menu_path" content="system.topic"/>
	</c:if>
	<c:if test="${empty entity }">
	<meta name="menu_path" content="system.praise"/>
	</c:if>
	<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
   <link rel="stylesheet" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.css" />
	<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/course.css">
	<link rel="stylesheet" href="${basepath }/static/public/easydialog-v2.0/easydialog.css" type="text/css">
</head>
<body>
	<!-- 面包屑开始-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
                  <li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                  <c:if test="${restype eq 2 && not empty meta}">
					<li><a href="${basepath }/mgr/activity/index.xhtml">活动管理</a><i class="icon-angle-right"></i></li>
					<li><span>话题管理</span><i class="icon-angle-right"></i></li>
				  </c:if>
				  <c:if test="${restype eq 2 && empty meta}">
					<li><a href="${basepath }/mgr/topic/topicindex.xhtml">话题管理</a><i class="icon-angle-right"></i></li>
				  </c:if>
                  <li><span href="javascript:void(0)">赞管理</span></li>
               </ul>
			<!-- END PAGE TITLE & BREADCRUMB-->
		</div>
	</div>
	<!-- 面包屑结束-->
	  <!-- 页头-->
         <div class="row">
            <div class="col-md-12">
               <!--search box-->
              <div class="col-md-12 search_box">
                  <div class="col-md-12">
                   <!--全局搜索框-->
                   <div class="col-md-6 search_container">
                       <div class="input-group">
                          <input type="text" class="form-control" id="searchContent" placeholder="赞的人/赞的对象名称">
                          <span class="input-group-btn">
                           <button  onclick="search1();" class="btn btn-danger" type="button">
                              <i class="icon-search"></i>
                           </button>
                          </span>
                        </div>
                        </div>                  
                  </div>
              </div>
            </div>
         </div>
         
        <div class="row" id="search2">
              <div class="col-md-12">
                <div class="search_condition">
                    <div class="row">
                        <span class="condition_title">类别</span>
                        <ul class="condition_item ">
                            <li class="check_item item_checked" id="topics" onclick="itemselect1(this);" t="2">
                                <span >话题</span>
                            </li>
                             <li class="check_item" id="course" t="1" onclick="itemselect2(this);">
                                <span>课程</span>
                            </li>
                        </ul>
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
                     <div class="caption" ><i class="icon-globe"></i><span id="praisetitle">赞<c:if test="${not empty entity}">(<c:if test="${restype eq 1 }">${ltfun:html2Text(entity.name,20)}</c:if><c:if test="${restype eq 2 }">${ltfun:html2Text(entity.content,20)}</c:if>)</c:if>列表</span></div>
                  </div>
                  <div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
                  	 <c:if test="${restype eq 2}">
	                  	  <div class="row">
	                   			<span class="btn btn-success table_add" onclick="javascript:history.back();">
	                               返回
	                            </span>
	                      </div>
                      </c:if>
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
<script type="text/javascript" src="${basepath }/static/public/easydialog-v2.0/easydialog.min.js"></script>
<script type="text/javascript" src="${basepath}/static/qqface/jquery.qqFace-huati.js"></script>
<script type="text/javascript">
var html = replace_em($("#praisetitle").html().toString());
$("#praisetitle").html(html);
var restype="${restype}";
if(restype=="" || restype==null){
}else{
   $("#search2").hide();
}
page(1);
function page(i){
	restype=$("#search2").find(".item_checked").attr("t");
	
    var params="currPage="+i+"&resid=${resid}&restype="+restype;

    var searchval=$.trim($("#searchContent").val());

    if(searchval==null || searchval==""){
           
        }else{
               params=params+"&searchval="+searchval;
            }
	
	$('#table_list').load("${basepath}/mgr/praise/praiselist.list?"+params,function(){
		replace_one();
	});
}


/*将表情符转意过来*/
function replace_em(str){
    //str = str.replace(/\</g,'<；');
    //str = str.replace(/\>/g,'>；');
   // str = str.replace(/\n/g,'<；br/>；');
    str = str.replace(/\[em_([0-9]*)\]/g,'<img src="${basepath}/static/qqface/face/$1.gif" border="0"  style="width:24px;height:24px"/>');
    return str;
}
//逐个转意的方法
function replace_one(){
	$("#praiselist").find(".contanttext").each(function(){
		var html = replace_em($(this).html().toString());
		$(this).html(html);
	});
}

function showMsgDialog(content){
	easyDialog.open({
        container : {
            header : '提示',
            content : '<div style="background-color: #ffffff;width:260px;height:20px;text-align:center;">'+content+'</div>'
        },
        autoClose:1200
    });
}

function itemselect1(thi){
	var type=$(thi).attr("t")
	$(thi).removeClass("item_checked");
	$(thi).addClass("item_checked");
	$("#course").removeClass("item_checked");
	page(1);
}
function itemselect2(thi){
	var type=$(thi).attr("t")
	$(thi).removeClass("item_checked");
	$(thi).addClass("item_checked");
	$("#topics").removeClass("item_checked");
	page(1);
}

function search1(){
	page(1);
	}

</script>
</content>
<content tag="pageInit">
</content>  
