<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>排行榜管理</title>
<meta name="menu_path" content="active.menu_rank" />
	<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
   <link rel="stylesheet" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.css" />
	<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/course.css">
	<style type="text/css">
		#qrcodeTable table{margin-left:48px;}
	</style>
</head>
<body>
	<!-- 面包屑开始-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
				<li><span href="#">排行榜管理</span></li>
			</ul>
			<!-- END PAGE TITLE & BREADCRUMB-->
		</div>
	</div>
	<!-- 面包屑结束-->
	<!--tab 开始  -->
	<ul class="nav nav-tabs">
         <li class="tabLi" data-id="custom" > <a href="#custom" onclick="loadCustom()"  data-toggle="tab">自定义</a></li>
         <li class="tabLi" data-id="credit"> <a href="#credit" onclick="loadCredit()" data-toggle="tab">积分</a></li>
         <li class="tabLi" data-id="fodder"> <a href="#fodder" onclick="loadFodder()" data-toggle="tab">素材</a></li>
         <li class="tabLi" data-id="course"> <a href="#course" onclick="loadCourse()" data-toggle="tab">课程</a></li>
         <%--
         <li class="tabLi" > <a href="#platformCourses" id="tabPlatformCourse" onclick="platformCourse();" data-toggle="tab">平台课程</a></li>
          --%>
    </ul>
	<!--tab 结束 -->
	<!-- tab主体 -->
	<div class="tab-content">
		<div class="tab-pane" id="custom"  data-id="custom" >
			<div class="row">
	              <div class="col-md-12">
	               <!-- BEGIN EXAMPLE TABLE PORTLET-->
	               <div class="portlet box blue">
	                  <div class="portlet-title">
	                     <div class="caption"><i class="icon-globe"></i>排行榜列表</div>
	                  </div>
	                  <div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
	                      <div class="row">
	                            <span class="btn btn-success table_add"  onclick="viewpaihang(0);">
	                               <i class="glyphicon glyphicon-plus"></i>新建排行榜</span>
	                      </div>
	                      
	                      <%-- 表格内容 --%>
	                      <div id="table_list" style="margin-top:10px;"></div>
	                    
	                  </div>
	               </div>
	               <!-- END EXAMPLE TABLE PORTLET-->
	             </div>
	         </div>
		</div>
		<div class="tab-pane"  id="credit" data-id="credit">
			<div class="row">
	              <div class="col-md-12">
	               <!-- BEGIN EXAMPLE TABLE PORTLET-->
	               <div class="portlet box blue">
	                  <div class="portlet-title">
	                     <div class="caption"><i class="icon-globe"></i>积分排行榜列表</div>
	                  </div>
	                  <div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
	                      <div class="row">
	                            <span class="btn btn-success table_add"  onclick="viewpaihang(1);">
	                               <i class="glyphicon glyphicon-plus"></i>新建积分排行榜</span>
	                      </div>
	                      
	                      <%-- 表格内容 --%>
	                      <div id="table_list1" style="margin-top:10px;"></div>
	                    
	                  </div>
	               </div>
	               <!-- END EXAMPLE TABLE PORTLET-->
	             </div>
	         </div>
		</div>
		<div class="tab-pane"  id="fodder" data-id="fodder">
		<div class="row">
	              <div class="col-md-12">
	               <!-- BEGIN EXAMPLE TABLE PORTLET-->
	               <div class="portlet box blue">
	                  <div class="portlet-title">
	                     <div class="caption"><i class="icon-globe"></i>素材排行榜列表</div>
	                  </div>
	                  <div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
	                      <div class="row">
	                            <span class="btn btn-success table_add"  onclick="viewpaihang(2);">
	                               <i class="glyphicon glyphicon-plus"></i>新建素材排行榜</span>
	                      </div>
	                      
	                      <%-- 表格内容 --%>
	                      <div id="table_list2" style="margin-top:10px;"></div>
	                    
	                  </div>
	               </div>
	               <!-- END EXAMPLE TABLE PORTLET-->
	             </div>
	         </div>
		</div>
		
		<div class="tab-pane"  id="course" data-id="course">
		<div class="row">
	              <div class="col-md-12">
	               <!-- BEGIN EXAMPLE TABLE PORTLET-->
	               <div class="portlet box blue">
	                  <div class="portlet-title">
	                     <div class="caption"><i class="icon-globe"></i>课程排行榜列表</div>
	                  </div>
	                  <div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
	                      <div class="row">
	                            <span class="btn btn-success table_add"  onclick="viewpaihang(3);">
	                               <i class="glyphicon glyphicon-plus"></i>新建课程排行榜</span>
	                      </div>
	                      
	                      <%-- 表格内容 --%>
	                      <div id="table_list3" style="margin-top:10px;"></div>
	                    
	                  </div>
	               </div>
	               <!-- END EXAMPLE TABLE PORTLET-->
	             </div>
	         </div>
		</div>
		

	</div>
	
		<div  id="qrcodeTablebox" style="display:none; width: 380px;">
			<div id="qrcodeTable" class="qrcodeTable" style="margin: 0px auto;"></div>
			<div id="url" style="word-break:break-all;width: 380px;"></div>
			<div class="copy-btn" style="cursor: pointer;text-align:center;color:#529bea;line-height:32px;width:150px;margin:0 auto;"> 点击复制URL</div>
		</div>
	
	
	
</body>
</html>
<content tag="pageCore">
<script type="text/javascript" src="${basepath }/static/js/jquery.qrcode.min.js"></script>
<script type="text/javascript" src="${basepath }/static/js/jquery.zclip.js"></script>
</content>
<content tag="pageInit">
<script type="text/javascript">
    $(document).ready(function(){
    	var model = "${param.model}";
    	if(model==null || model ==""){
			model = 0;
        }
    		var tempList;
    		if (model == 0 ) {
    			tempList = $("[data-id='custom']");
    		} else if (model == 1) {
    			tempList = $("[data-id='credit']");
    		} else if (model == 2) {
    			tempList = $("[data-id='fodder']");
    		} else if (model == 3) {
    			tempList = $("[data-id='course']");
    		}  
    		else {
    			tempList = $("[data-id='custom']");
    		}
    		tempList.addClass('active');
    		page(1,model);
          
        });
    function loadCustom(){
    	var model = 0;
    	page(1,model);
    }
    
    function loadCredit(){
    	var model = 1;
    	page(1,model);
    }
    
    function loadFodder(){
    	var model = 2;
    	page(1,model);
    }
    
    function loadCourse(){
    	var model = 3;
    	page(1,3);
    }
    
    
	   function page(i,model){
        var max=$("#table_list #page_max").val();
        var page=i;
        var r=Math.random();
        var url="${basepath}/mgr/rank/ranklist.list";
        var data={"page":page,"max":max,"r":r,"model":model};
        $("#table_list").load(encodeURI(url), data, function(res){
            	$("#table_list1, #table_list2, #table_list3").html(res);
            }); 
        }
       
    	function viewpaihang(model){
        	window.location.href="${basepath }/mgr/rank/doadd.xhtml?model="+model;
        } 


    	function showPicList() {
    		document.body.className = "page-header-fixed";
    	}
    	function showTextList() {
    		document.body.className = "page-header-fixed changeListShow";
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
    					autoClose : 1000
    				});
    		    }
    		});	
    		$('.qrcodeTable').find("table").removeAttr("style");
    	}


    	
        
</script>
</content>  
