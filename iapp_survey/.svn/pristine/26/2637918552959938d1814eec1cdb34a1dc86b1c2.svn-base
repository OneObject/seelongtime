<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>动态管理</title>
	<meta name="menu_path" content="system.feed"/>
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
                  <li><span href="javascript:void(0)">动态管理</span></li>
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
                          <input type="text" class="form-control" id="searchContent" placeholder="动态内容">
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
	<!-- 页面头部结束-->
         <div class="row">
              <div class="col-md-12">
               <!-- BEGIN EXAMPLE TABLE PORTLET-->
               <div class="portlet box blue">
                  <div class="portlet-title">
                     <div class="caption" ><i class="icon-globe"></i><span id="commenttitle">动态列表</span></div>
                  </div>
                  <div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
                    <div class="row">
                            <span class="btn btn-success table_add" onclick="batchdel()">
                               <i class="glyphicon glyphicon-remove"></i>批量删除
                            </span>
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
<script type="text/javascript" src="${basepath }/static/public/easydialog-v2.0/easydialog.min.js"></script>
<script type="text/javascript" src="${basepath}/static/qqface/jquery.qqFace-huati.js"></script>
<script type="text/javascript">
page(1);
function page(i){
    var params="currPage="+i;

    var searchval=$.trim($("#searchContent").val());

    if(searchval==null || searchval==""){
           
        }else{
               params=params+"&searchval="+searchval;
            }
	
	$('#table_list').load("${basepath}/base/admin/feed/feedlist.list?"+params,function(){
		replace_one();
	});
}

function del(id){
	easyDialog.open({
        container : {
            header : '提示',
            content : '<div style="background-color: #ffffff;width:260px;height:20px;text-align:center;">'+'确定删除吗？'+'</div>',
            yesFn : function (){
            	$.ajax({
     	           type:"post",
     	           url:basepath+"/base/admin/feed/delfeed.json",
     	           data:{"feedid":id},           
     	           success:function(data){
     	                 if(data){
     	                	 showMsgDialog("删除成功");
     	                     page(1);
     	                     }else{
     	                    	 showMsgDialog("删除失败");
     	                         }
     	              }
     			});
                },
    	    noFn : true
        },
    });
}


function batchdel(){
	var items=$("input[name='ids']:checked");
    var ids="";
    $("input[name='ids']:checked").each(function(){
    	ids=ids+$(this).val()+",";
        });
	if(items.length==0){
		showMsgDialog("您还没有选中任何选项");
		return;
		}else{
            easyDialog.open({
                container : {
                    header : '提示',
                    content : '<div style="background-color: #ffffff;width:260px;height:20px;text-align:center;">'+'您确定要删除这'+items.length+'条记录吗？'+'</div>',
                    yesFn : function (){
                    	 $.ajax({
                             type:"POST",
                             url:basepath+"/base/admin/feed/batchdelfeed.json",
                             data:{"ids":ids},
                             success:function(data){
                                  if(data){
                                	  showMsgDialog("删除成功");
                                      page(1);
                                      }else{
                                    	  showMsgDialog("删除失败");
                                         }
                                 }
                          });
                        },
            	    noFn : true
                },
            });
            
			}
}



/*将表情符转意过来*/
function replace_em(str){
    //str = str.replace(/\</g,'<；');
    //str = str.replace(/\>/g,'>；');
   //str = str.replace(/\n/g,'<；br/>；');
    str = str.replace(/\[em_([0-9]*)\]/g,'<img src="${basepath}/static/qqface/face/$1.gif" border="0"  style="width:24px;height:24px"/>');
    return str;
}
//逐个转意的方法
function replace_one(){
	$("#feedlist").find(".contanttext").each(function(){
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


</script>
</content>
<content tag="pageInit">
</content>  
