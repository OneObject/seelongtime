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
    <meta name="menu_path" content="ixin.menu_matter"/>
    <link rel="stylesheet" media="screen" href="${basepath}/static/ixin/css/ixin.css" type="text/css">
    <link rel="stylesheet"  href="${basepath}/static/ixin/css/base.css" type="text/css">
    <link rel="stylesheet"  href="${basepath}/static/ixin/css/media.css" type="text/css">
    <link rel="stylesheet" href="${basepath}/static/ixin/css/media_list.css" type="text/css">
    <link rel="stylesheet" href="${basepath }/static/public/easydialog-v2.0/easydialog.css" type="text/css">
    <link rel="stylesheet" id="changeList" href="${basepath}/static/ixin/css/fodder.css" type="text/css">
    <style type="text/css">
    	.ixin_item .appmsg_desc{padding-bottom:0px;}
        .ixin_item .appmsg_readNum{padding:5px 0 8px 0;color:#999;}
        .changeListModel{float:right;margin-right:100px;}
        .changeListModel span{margin-right:25px;float:right;font-size:14px;cursor:pointer;}
        .changeListModel span i{color:#fff;margin-right:4px;}
        .editBoxPen{position:absolute;right:30px;top:8px;color:#fff;}
        .editBoxPen i{color:#fff;margin-right:4px;}
        

    </style>
    
     <style type="text/css">
    	#qrcodeTable table{margin-left:48px;}
    </style>
</head>
<body>

<!-- 页面顶部-->
<div class="row">
    <div class="col-md-12">
        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
        <ul class="page-breadcrumb breadcrumb">
            <li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
            <li><span href="javascript:void(0)">素材管理</span></li>
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
            <a href="${basepath }/mgr/fodder/add.xhtml"  style="margin-top:35px;"><i class="icon_appmsg_create"></i><strong>单图文消息</strong></a>
            <!-- <a href="javascript:void(0);"><i class="icon_appmsg_create multi"></i><strong>多图文消息</strong></a> -->
            <!--</span>-->
        </span>
    </div>
</div>

        <div class="row">
            <div class="col-md-12">
               <!--search box-->
              <div class="col-md-12 search_box">
                  <div class="col-md-12">
                   <!--全局搜索框-->
                   <div class="col-md-6 search_container">
                       <div class="input-group">
                          <input type="text" class="form-control" id="searchContent" placeholder="输入素材标题">
                          <span class="input-group-btn">
                           <button onclick="page(1)" class="btn btn-danger" type="button">
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
         
<div class="row">
    <div class="col-lg-12">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-reorder"></i><span>素材管理</span>
                </div>
                <div class="changeListModel">
                	<span onclick="showPicList()"><i class="fa fa-th-large"></i>大图</span>
                	<span onclick="showTextList()"><i class="fa fa-th-list"></i>列表</span>
                </div>
                <div class="editBoxPen">
                	<i class="icon18_common edit_gray"></i><a href="${basepath }/mgr/fodder/draffindex.xhtml" style="color:#fff;">进入草稿箱</a>
                </div>
            </div>
            <div class="portlet-body box" id="msgListBody">
            
            </div>
        </div>
    </div>
</div>
	<div  id="qrcodeTablebox" style="display:none; width: 380px;">
			<div id="qrcodeTable" class="qrcodeTable" style="margin: 0px auto 15px;"></div>
			<div id="url" style="word-break:break-all;width: 380px;"></div>
			<div class="copy-btn" style="cursor: pointer;text-align:center;color:#529bea;line-height:32px;width:150px;margin:0 auto;"> 点击复制URL</div>
		</div>
</body>
</html>
<content tag="pageCore">
<script type="text/javascript" src="${basepath }/static/public/easydialog-v2.0/easydialog.min.js"></script>
<script type="text/javascript" src="${basepath }/static/js/jquery.qrcode.min.js"></script>
<script type="text/javascript" src="${basepath }/static/js/jquery.zclip.js"></script>
<script type="text/javascript">
//复制到剪切板js代码

function showPicList() {
	document.body.className = "page-header-fixed";
}
function showTextList() {
	document.body.className = "page-header-fixed changeListShow";
}
page(1);
function page(i){
	var searchContent = $.trim($("#searchContent").val());
	$('#msgListBody').load("${basepath}/mgr/include/fodderlist.xhtml?currPage="+i+"&searchcontent="+searchContent);
}
var m = "";
var btnFn = function(){
	$.ajax({
		type: "POST",
		url:  basepath+"/mgr/fodder/del.xhtml",
		data: {"id":m},
		success:function(data){
			
			if(data.state=='defeated'){
				alert("删除失败，素材被课程  ["+data.course+"] 占用！");
			}else if(data.state=='success'){
				alert("删除成功！");
				page(1);
				return true;
			}
			/* for (var prop in data) {  
				  if (data.hasOwnProperty("defeated")) {   
				  // or if (Object.prototype.hasOwnProperty.call(obj,prop)) for safety...  
				  	if(data[prop]=='defeated'){
				  		
				  	}  
				  alert("prop: " + prop + " value: " + data[prop])  
				  }  
				}  */
			
			/* if(date.state=="success"){
				
			page(1);
			return true;
			} */
		},
		error: function(data){
			alert('删除失败');
		}
	});
	
};
function del(id){
	m = id;
	var html = '<div style="width:256px;height:70px;text-align:center;"><br><h4>您确定要删除该素材吗?<h4></div>';
	easyDialog.open({
	    container : {
	    	header : '提示',
	    	content : html,
	    	yesFn : btnFn,
	    	noFn : true
	    }
	});
}
function detail(id){
	location = "${basepath}/mgr/fodder/update.xhtml?id="+id;
}


function qrcode(url){
	$('#qrcodeTable').html("");
	jQuery('#qrcodeTable').qrcode({
		render	: "table",
		text	: url
	});	
	$("#url").html(url);
	easyDialog.open({
		  container : {
		    header : '使用微信扫描二维码',
		    content : $('#qrcodeTablebox').html()
		    //noFn : true
		  }
		});
	$(".copy-btn").zclip({
		path: "${basepath }/static/js/ZeroClipboard.swf",
		copy: function(){
			var str = $('#url').html().replace(/(&amp;)/g, '&');
			return str;
		},
 		afterCopy:function(){/* 复制成功后的操作 */
			var html="<div style='width:300px;text-align:center;'>复制成功！</div>";
			easyDialog.open({
				container : {
					header : '提示',
					content : html
				},
	
			});
	    }
	});	
	$('.qrcodeTable').find("table").removeAttr("style");
}
</script>
</content>
<content tag="pageInit">
    <!-- 初始化窗口 -->
</content>