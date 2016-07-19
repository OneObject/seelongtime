<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>作业管理</title>
<meta name="menu_path" content="ixin.menu_task" />
	<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
   <link rel="stylesheet" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.css" />
	<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/course.css">
	 <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
</head>
<body>
	<!-- 面包屑开始-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
				<li>
					<a href="${basepath}/mgr/task/taskindex.xhtml">作业管理</a>
					<i class="icon-angle-right"></i>
				</li>
				
				<li><span href="#">作业批改</span></li>
			</ul>
			<!-- END PAGE TITLE & BREADCRUMB-->
		</div>
	</div>
	<!-- 面包屑结束-->
	<!-- 搜索 -->
	<!-- 页面头部结束-->
         <div class="row">
              <div class="col-md-12">
               <!-- BEGIN EXAMPLE TABLE PORTLET-->
               <div class="search_condition">
				<div class="row mt10">
					<!-- 组织/经销商 start-->
					<div class="left_lable">
						<span class="condition_title">作业状态</span>
					</div>
					<!-- 组织/经销商 end-->
					<div class="left_condition">
						<div class="col-md-4">
						<select  id="releaseStatus" name="releaseStatus" data-placeholder="选择" class="form-control select2me select2-offscreen" tabindex="-1" onchange="page(1)">
                                <option id="type_-1" value="" >---全部---</option>
                                
                                    <option id="type_0" value="0" >未提交</option>
                                
                                    <option id="type_1" value="1">未批改</option>
                                    
                                    <option id="type_2" value="2">未通过</option>
                                    <option id="type_3" value="3">已通过</option>
                            </select>
						</div>
					</div>
				</div>
			</div>
               <div class="portlet box blue">
                  <div class="portlet-title">
                     <div class="caption"><i class="icon-globe"></i>学员作业列表</div>
                  </div>
                  <div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
                     
                      <%-- 表格内容 --%>
                      <div id="table_list" style="margin-top:10px;">
                      </div>
                    
                  </div>
               </div>
               <!-- END EXAMPLE TABLE PORTLET-->
             </div>
         </div>
</body>
</html>
<content tag="pageCore">
</content>
<content tag="pageInit">
  
<script type="text/javascript">
    var id="${id}";
    var status1="${status}";
    if(status1=="" || status1==null){
          $("#type_-1").attr("selected","selected");
        }else if(status1==0){
             $("#type_0").attr("selected","selected");
            }else if(status1==1){
            	 $("#type_1").attr("selected","selected");
                }else if(status1==2){
                	$("#type_2").attr("selected","selected");
                    }else if(status1==3){
                       $("#type_3").attr("selected","selected");
                        }
    $(document).ready(function(){
          page(1);
        });
    function page(i){
        var status=$("#releaseStatus").val();
        var max=$("#table_list #page_max").val();
        var page=i;
        var r=Math.random();
        var url="${basepath}/mgr/task/usertasklist.list";
        var data={"page":page,"max":max,"r":r,"id":id,"status":status};
        $("#table_list").load(encodeURI(url), data, function(){
            
            }); 
        }
</script>
</content>  
