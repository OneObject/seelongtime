<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>用户组管理</title>
	<meta name="menu_path" content="system.usergroup"/>
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
                 <%--  <li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                   --%><li><a href="${basepath }/base/admin/user/usermanage.xhtml">用户管理</a><i class="icon-angle-right"></i></li>
                  <li><span>用户组管理</span></li>
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
                          <input type="text" class="form-control" id="searchContent" placeholder="按名称">
                          <span class="input-group-btn">
                           <button  onclick="page(1);" class="btn btn-danger" type="button">
                              <i class="icon-search"></i>
                           </button>
                          </span>
                        </div>
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
                     <div class="caption" ><i class="icon-globe"></i><span id="usergroup">用户组列表</span></div>
                  </div>
                  <div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
                  <div class="row">
                            <span class="btn btn-success table_add" onclick="batchdel()">
                               <i class="glyphicon glyphicon-remove"></i>批量删除
                            </span>
                            <span class="btn btn-success table_add" onclick="add()">
                               <i class="glyphicon glyphicon-plus"></i>新增
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
<script type="text/javascript">
 $(document).ready(function(){
	 page(1);
	 });
 //得到列表
 function page(i)
 {
	 var pagesize=20;

     var searchcontent=$.trim($("#searchContent").val());

     var data={"currentpage":i,"pagesize":pagesize,"searchcontent":searchcontent};

     var url="${basepath}/base/admin/usergroup/list.list";
     $("#table_list").load(encodeURI(url),data,function(){
            
         });
	 
	 }
  function add(){
	  var str='<div id="dialog_add"><div style="width:400px;height:100px;"><ul id="treeDemo">'
		  str+='<label><span class="inputname">名称:</span><input type="text" id="groupname" class="form-control" style="float:right;width: 200px;"/></label>';
		  str+='</ul></div>';
		 str=str+'<div class="easyDialog_footer">'
         str=str+'<button class="btn default dialog-btn" onclick="easyDialog.close()">关闭</button>';
         str=str+'<button class="btn btn-success dialog-btn" onclick="makesure();">确定添加</button>';
		str=str+'</div></div>';
		easyDialog.open({
			  container : {
				    header : '新增用户组',
				    content :str,
				  },
			  fixed : false
			});
	  }

  function makesure(){
       var groupname=$.trim($("#groupname").val());

       if(groupname==null || groupname==""){
           alert("名称不能为空");
           return;
           }
       $.ajax({
             type:"post",
             url:"${basepath}/base/admin/usergroup/addgroup.json",
             data:{"groupname":groupname},
             success:function(msg){
                  if(msg.flag){
                      window.location.href="${basepath}/base/admin/usergroup/usergroup.xhtml?id="+msg.msg;
                      }else{
                          alert(msg.msg);
                          }
                 }
           });
	  }

  function del(id){
       if(id==null || id=="" ){
          return;
           }
       if(confirm("确定要删除吗？")){
             $.ajax({
                  type:"post",
                  url:"${basepath}/base/admin/usergroup/del.json",
                  data:{"id":id},
                  success:function(msg){
                      if(msg){
                          alert("删除成功");
                          page(1);
                          }else{
                              alert("删除失败");
                              }
                      }
                 });
           }
	  
	  }

  function batchdel(){
      var ids="";
      var i=0;
      $("input:checked").each(function(){
          ids+=$(this).val()+",";
          i++;
          });
      if(ids.length>0){
           if(confirm("确定要删除这"+i+"项吗？")){
        	   $.ajax({
                   type:"post",
                   url:"${basepath}/base/admin/usergroup/batchdel.json",
                   data:{"ids":ids},
                   success:function(msg){
                       if(msg){
                           alert("删除成功");
                          	  page(1);
                           }else{
                               alert("删除失败");
                           }
                       }
                  });
               }
          } else{
        	  var html="<div style='width:300px;text-align:center;'>您没有选中任何记录！</div>";
      		easyDialog.open({
      			container : {
      			    header : '提示',
      				content : html
      			},
      			autoClose : 1000
      		});
          }
      

	  
	  }

  

</script>
</content>
<content tag="pageInit">
</content>  
