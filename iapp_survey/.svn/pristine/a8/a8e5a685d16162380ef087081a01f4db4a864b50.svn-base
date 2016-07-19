<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>关联信息</title>
<meta name="menu_path" content="system.usergroup"/>
<!-- Important Owl stylesheet -->
   <!-- BEGIN PAGE LEVEL STYLES -->
   <link rel="stylesheet" type="text/css" href="${basepath}/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
   <!-- END PAGE LEVEL STYLES -->
   <!-- BEGIN THEME STYLES -->
   <link rel="stylesheet" href="${basepath}/static/public/easydialog-v2.0/easydialog.css">

	<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/role.css">
   <link href="${basepath}/static/public/metronic.bootstrap/assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
   <link href="${basepath}/static/public/metronic.bootstrap/assets/css/style.css" rel="stylesheet" type="text/css"/>
   <link href="${basepath}/static/public/metronic.bootstrap/assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
   <link href="${basepath}/static/public/metronic.bootstrap/assets/css/plugins.css" rel="stylesheet" type="text/css"/>
   <link href="${basepath}/static/public/metronic.bootstrap/assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
   <link href="${basepath}/static/public/metronic.bootstrap/assets/css/custom.css" rel="stylesheet" type="text/css"/>
	<!-- Default Theme -->
	<link rel="stylesheet" href="${basepath}/static/public/JQuery zTree v3.5.15/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<link rel="stylesheet" media="screen"  href="${basepath}/static/public/stylesheets/usergroup.css">
	<script src="${basepath}/static/public/easydialog-v2.0/easydialog.min.js"></script> 
	<script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.all-3.5.min.js" type="text/javascript"></script>
	<script type="text/javascript">
	//初始化树配置
    var setting = {
		    data: {
		        simpleData: {
		            enable: true
		        }
		    },
		    check: {
		        enable: true,
		        autoCheckTrigger:false,
		        chkStyle: "checkbox",
		        chkboxType: { "Y": "ns", "N": "s" }
		    },
		    callback: {
		        onClick: zTreeOnClick
		    },
		    view:{
		        dblClickExpand: false,
		        fontCss: setFontCss
		    }
		};
	var submit = 0;
    //用户列表
    function userlist(i)
    { 
    	var pagesize = $("#table_list2 #page_max").val();
    	var userids=$("#userids").val();
        var data={"currentpage":i,"pagesize":pagesize,"r":Math.random(),"username":$("#susername").val(),"addusername":$("#addusername").val(),"pageFn":"userlist", "userids":userids};

        var url="${basepath}/base/admin/usergroup/userlist.list";
        $("#table_list2").load(encodeURI(url),data,function(){
        	  //将已选中的打勾
            var selectuser=new Array();
            $("#selectuser").find(".usergroupitem").each(function(){
                 var id=$(this).data("resourceid");
                 selectuser.push(id);
                });
            $("#table_list2").find("input[name='ids']").each(function(){
                  for(var i=0;i<selectuser.length;i++){
                        if($(this).val()==selectuser[i])
                            {
                            $(this).attr("checked","checked");
                            }
                      }
                });
            });
        }

/*点击复选框事件*/
    function onSave() {
        var items = document.getElementsByName("ids");
        var userids=$("#userids").val();
        for(var i=0;i <items.length;i++){
            if(items[i].checked==true){
                if(saveCheck(items[i].value)==false){
                	userids += items[i].value+",";
                }
            }
            else{
                if(saveCheck(items[i].value)==true){
                   if(userids.indexOf(items[i].value) >= 0){
                	   userids = userids.replace(items[i].value+",", "");
                   }
                }
            } 
        }
        $("#userids").val(userids);
    }
    function saveCheck(insertValue){
        var userids=$("#userids").val();
        var data = userids.split(",");
        for(var i=0;i<data.length;i++){
            if(data[i]==insertValue){
                return true;
            }
        }
        return false;
    }
    
    /** 添加用户弹出框 */
   function adduser()
   { 
	   userlist(1);
	   easyDialog.open({
			  container : 'add_member_dialog',
			  fixed : false
			});
	   }
 
   //确认添加用户
   function useradd()
   {   
	   if(submit == 1){
		   return;
	   }
	   submit = 1;
		var result = $("#userids").val(); 
		if(isBlank(result)){
			mySureDialog("您没有选择任何用户！");
			submit = 0;
			return ;
		}

		/* clearUser(); */
		 $.ajax({
	            type:"post",
	            url:"${basepath}/base/admin/usergroup/userlink.json",
	            data:{"ids":result,"gid":$("#hid_id").val()},
	            success:function(msg){
	                if(msg){
	            	  easyDialog.close();
	            	  submit = 0;
	            	  linkedInfo();
	                }
	             },
	             error:function(){
	            	 submit = 0;
	             }
	      });
		
/**	   var ids=new Array();
	   $("#table_list2").find("input:checked").each(function(){
		   if($(this).data("name")!="all"){
		     ids.push($(this).val());
		   }
		   });
       clearUser();
       $.ajax({
            type:"post",
            url:"${basepath}/base/admin/usergroup/userlink.json",
            data:{"ids":ids.join(","),"gid":$("#hid_id").val()},
            success:function(msg){
                if(msg){
            	  easyDialog.close();
            	  linkedInfo();
                }
                }
                
           });
   */  
	   }
   function linkedInfo(){
	    window.location.href="${basepath}/base/admin/usergroup/usergroup.xhtml?id="+$("#hid_id").val();
	   }
   function orgadd()
   { 
	   if(submit == 1){
		   return;
	   }
	   submit = 1;
	    var orgids=new Array();
	    //获得已选中的树节点
	    var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	    var selectNodes = treeObj.getCheckedNodes();
	    for(var i=0;i<selectNodes.length;i++){
               var node=selectNodes[i];
               orgids.push(node.id);
		    }
       /*  clearOrg(); */
        $.ajax({
            type:"post",
            url:"${basepath}/base/admin/usergroup/orglink.json",
            data:{"orgids":orgids.join(","),"gid":$("#hid_id").val()},
            success:function(msg){
                if(msg){
            	  easyDialog.close();
            	  submit=0;
            	  linkedInfo();
                }
                },
                error:function(){
                	submit=0;
                }
                
           });
	   }


   
   function addorg()
   {
	   var url ="${basepath}/base/admin/usergroup/orglist.list";
		$.ajax({
			url:url,
			type:"POST",
			datatype:"json",
			success:function(data){
				var zdata = JSON.parse(data);
				var str='<div id="dialog_bumen" ><div class="zTreeDemoBackground left" style="width:400px;"><ul id="treeDemo" class="ztree"></ul></div>';
                str=str+'<div class="easyDialog_footer">'
                str=str+'<button class="btn default dialog-btn" onclick="easyDialog.close()">关闭</button>';
	            str=str+'<button class="btn btn-success dialog-btn" onclick="orgadd();">确定添加</button>';
				str=str+'</div></div>';
				easyDialog.open({
					  container : {
						    header : '选择部门',
						    content :str,
						  },
					  fixed : false
					});
				$.fn.zTree.init($("#treeDemo"),setting,zdata);
				var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
			      treeObj.expandAll(true);

               //已选中的打勾 
	           var orgselect=new Array();
	           $("#selectorg").find(".usergroupitem").each(function(){
		              orgselect.push($(this).data("resourceid"));
		           });
               var nodes=treeObj.getCheckedNodes(false);
               for(var i=0;i<nodes.length;i++){
                   for(var j=0;j<orgselect.length;j++){
                	   if(nodes[i].id==orgselect[j]){
                    	    nodes[i].checked=true;
                    	    treeObj.updateNode(nodes[i]);
                    	   }
                       }
                   }
			}
		});
   }

   function jobleveladd(){
	   if(submit == 1){
		   return;
	   }
	   submit = 1;
	   var joblevels=new Array();
	    //获得已选中的树节点
	    var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	    var selectNodes = treeObj.getCheckedNodes();
	    for(var i=0;i<selectNodes.length;i++){
              var node=selectNodes[i];
              joblevels.push(node.id);
		    }
	    /* clearJoblevel(); */
       $.ajax({
           type:"post",
           url:"${basepath}/base/admin/usergroup/joblevellink.json",
           data:{"joblevels":joblevels.join(","),"gid":$("#hid_id").val()},
           success:function(msg){
               if(msg){
           	  easyDialog.close();
           	  submit=0;
           	 linkedInfo();
               }
               },
               error:function(){
            	   submit = 0;
               }
               
          });
	   }



   
   function addjoblevel()
   {
	   var url ="${basepath}/base/admin/usergroup/joblevellist.list";
		$.ajax({
			url:url,
			type:"POST",
			datatype:"json",
			success:function(data){
				var zdata = JSON.parse(data);
				var str='<div id="dialog_zhiji"><div class="zTreeDemoBackground" style="width:400px;"><ul id="treeDemo" class="ztree"></ul></div>';
				 str=str+'<div class="easyDialog_footer">'
                str=str+'<button class="btn default dialog-btn" onclick="easyDialog.close()">关闭</button>';
	            str=str+'<button class="btn btn-success dialog-btn" onclick="jobleveladd();">确定添加</button>';
				str=str+'</div></div>';
				easyDialog.open({
					  container : {
						    header : '选择职级',
						    content :str,
						  },
					  fixed : false
					});
				$.fn.zTree.init($("#treeDemo"),setting, zdata);
				var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
				 treeObj.expandAll(true);

				  //已选中的打勾 
		           var joblevelselect=new Array();
		           $("#selectjoblevel").find(".usergroupitem").each(function(){
		        	    joblevelselect.push($(this).data("resourceid"));
			           });
	               var nodes=treeObj.getCheckedNodes(false);
	               for(var i=0;i<nodes.length;i++){
	                   for(var j=0;j<joblevelselect.length;j++){
	                	   if(nodes[i].id==joblevelselect[j]){
	                    	    nodes[i].checked=true;
	                    	    treeObj.updateNode(nodes[i]);
	                    	   }
	                       }
	                   }
			}
		});
	   }


      function rulelist(i){
    	  var pagesize = $("#table_list #page_max").val();

          var data={"currentpage":i,"pagesize":pagesize,"r":Math.random(),"propertyname":$("#propertyname").val(),"pageFn":"rulelist"};

          var url="${basepath}/base/admin/grouprule/rulelist.list";
          $("#table_list").load(encodeURI(url),data,function(){
          	  //将已选中的打勾
              var selectrule=new Array();
              $("#selectrule").find(".usergroupitem").each(function(){
                   var id=$(this).data("resourceid");
                   selectrule.push(id);
                  });
              $("#table_list").find("input[name='ids']").each(function(){
                    for(var i=0;i<selectrule.length;i++){
                          if($(this).val()==selectrule[i])
                              {
                              $(this).attr("checked","checked");
                              }
                        }
                  });
              });
          }


      
     function addrule(){
    	 rulelist(1);
  	   easyDialog.open({
  			  container : 'add_member_dialog2',
  			  fixed : false
  			});
  	   }

	 function ruleadd(){
		 if(submit == 1){
			   return;
		   }
		   submit = 1;
		 var ids=new Array();
		   $("#table_list").find("input:checked").each(function(){
			   if($(this).data("name")!="all"){
			     ids.push($(this).val());
			   }
			   });

	       /* clearRule(); */
	       $.ajax({
	            type:"post",
	            url:"${basepath}/base/admin/usergroup/rulelink.json",
	            data:{"ids":ids.join(","),"gid":$("#hid_id").val()},
	            success:function(msg){
	                if(msg){
	            	  easyDialog.close();
	            	  submit = 0;
	            	  linkedInfo();
	                }
	                },
	                error:function(){
	                	submit = 0;
	                }
	                
	           });
		 }

	/**删除单个用户*/
	 function singledeluser(ruleid){
		var result = $("#userids").val(); 
		 var sitem = $("#"+ruleid);
		 var id=sitem.parent().data("id");
	     $.ajax({
		       type:"post",
		       url:"${basepath}/base/admin/usergroup/dellink.json",
		       data:{"id":id},
		       success:function(msg){
			         if(msg){
			        	 sitem.parent().remove(); 
			        	 result = result.replace(ruleid,""); 
			        	 $("#userids").val(result); 
				     }else{
				    	 showMsgDialog("清空失败");
					 }
			       }
		     });
	   }



   function singledel(ruleid){
		 var sitem = $("#"+ruleid);
		 var id=sitem.parent().data("id");
	     $.ajax({
		       type:"post",
		       url:"${basepath}/base/admin/usergroup/dellink.json",
		       data:{"id":id},
		       success:function(msg){
			         if(msg){
			        	 sitem.parent().remove();
				     }else{
				  //  	 showMsgDialog("清空失败");
					 }
			       }
		     });
	   }

   function clearUser(){
	   var ids=new Array();
      $("#selectuser").find(".usergroupitem").each(function(){
           ids.push($(this).data("id"));
          });
      if(ids.length>0){
      $.ajax({
            type:"post",
            url:"${basepath}/base/admin/usergroup/clearuser.json",
            data:{"ids":ids.join(",")},
            success:function(msg){
                if(msg){
                	 $("#selectuser").html("");
                	 $("#userids").val("");
                    }else{
                    	showMsgDialog("清空失败");
                        }
                }
          });
      }
	   }
   function clearOrg(){

      var orgids=new Array();

      $("#selectorg").find(".usergroupitem").each(function(){
          orgids.push($(this).data("id"));
          });
      if(orgids.length>0){
      $.ajax({
          type:"post",
          url:"${basepath}/base/admin/usergroup/clearorg.json",
          data:{"orgids":orgids.join(",")},
          success:function(msg){
              if(msg){
            	  $("#selectorg").html("");
                  }else{
                	  showMsgDialog("清空失败");
                      }
              }
        });
      }
	   }
   function clearJoblevel(){
	   var joblevels=new Array();

	      $("#selectjoblevel").find(".usergroupitem").each(function(){
	    	  joblevels.push($(this).data("id"));
	          });
	      if(joblevels.length>0){
	      $.ajax({
	          type:"post",
	          url:"${basepath}/base/admin/usergroup/clearjoblevel.json",
	          data:{"joblevels":joblevels.join(",")},
	          success:function(msg){
	              if(msg){
	            	  $("#selectjoblevel").html("");
	                  }else{
	                	  showMsgDialog("清空失败");
	                      }
	              }
	        });
	      }
	   }

   function clearRule(){
	     var rule=new Array();

	     $("#selectrule").find(".usergroupitem").each(function(){
	    	    rule.push($(this).data("id"));
	          });
	      if(rule.length>0){
	      $.ajax({
	          type:"post",
	          url:"${basepath}/base/admin/usergroup/clearrule.json",
	          data:{"rule":rule.join(",")},
	          success:function(msg){
	              if(msg){
	            	  $("#selectrule").html("");
	                  }else{
	                      showMsgDialog("清空失败");
	                      }
	              }
	        });
	      }
	   }

   function delrule(ruleid){
	  if(confirm("您确定要删除吗?")){
          $.ajax({
               type:"post",
               url:"${basepath}/base/admin/grouprule/del.json",
               data:{"id":ruleid},
               success:function(data){
                   if(data){
                       showMsgDialog("删除成功");
                       //rulelist(1);
                       singledel(ruleid);
                       }else{
                           showMsgDialog("删除失败");
                       }
                   }
              });
	  }
	   }
   
   function showMsgDialog(content){
		easyDialog.open({
	        container : {
	            header : '提示',
	            content : '<div style="background-color: #ffffff;width:260px;height:20px;text-align:center;">'+content+'</div>'
	        },
	        autoClose:1000
	    });
	}

 //设置字体样式
	function setFontCss() {
	    return {color:"#000000",size:"14px",height: "28px",family:"微软雅黑"};
	};

	var zTreeOnClick = function (event, treeId, treeNode){
	    treeNode.checked = !treeNode.checked;
	    $.fn.zTree.getZTreeObj(treeId).updateNode(treeNode, true);
	} 


/**	function checked_all(obj){
		if($(obj).attr("checked") == "checked"){
			$("input[name='ids']").each(function(){
				$(this).attr("checked","checked");
				$(this).parent().addClass("checked");
			});
		}else{
			$("input[name='ids']").each(function(){
				$(this).removeAttr("checked");
				$(this).parent().removeClass("checked");
			});
		}
		}
*/

function checked_all(obj){
    var itemSelectAll = $(obj);
    var items = document.getElementsByName("ids");
    if($(obj).attr("checked") == "checked"){
        for(var i=0;i <items.length;i++){
            items[i].checked=true;
        }
    }else{
        for(var i=0;i <items.length;i++){
            items[i].checked=false;
        }
    }
    onSave();
}

	 $(document).ready(function(){
        $("#groupname").click(function(){
        	$("#groupname").attr("readonly",false);
     	    $("#groupname").focus();
            });

        $("#groupname").blur(function(){
        	  var id=$("#hid_id").val();
       	      var name=$.trim($("#groupname").val());
              if( name==null || name==""){
                    $("#groupname").val("${basegroup.name}");
                     return;
                  }
              if(id==null || id==""){
                  return;
                  }

              $.ajax({
                     type:"post",
                     url:"${basepath}/base/admin/usergroup/updategroup.json",
                     data:{"id":id,"groupname":name},
                     success:function(data){
                         
                         }
                  });
            });
     });
    
</script>
</head>
<body>
<!-- BEGIN PAGE HEADER-->
         <div class="row" >
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
         <!-- END PAGE HEADER-->
         <div class="row">
        <div class="col-md-12">
               <!-- BEGIN VALIDATION STATES-->
               <div class="portlet box blue">
                  <div class="portlet-title">
                     <div class="caption"><i class="fa fa-users"></i><span>用户组管理</span></div>
                     <!--<div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                        <a href="#portlet-config" data-toggle="modal" class="config"></a>
                        <a href="javascript:;" class="reload"></a>
                        <a href="javascript:;" class="remove"></a>
                     </div>-->
                  </div>
                  <div class="portlet-body form">
                     <div class="form-body">
                     	<div>
                     		<label>
                     		    <input type="hidden" id="hid_id" name="hid_id" value="${basegroup.id}"/>
                     			<span class="inputname">名称:</span><input type="text" id="groupname" readonly="readonly" value="${basegroup.name}" class="form-control" style="float: left;width: 200px;"/>
                     			<span class="usergroupaddbtn" onclick="adduser();"><i class="fa fa-plus"></i>&nbsp;&nbsp;添加用户</span>
                     			<span class="usergroupaddbtn" onclick="addorg();"><i class="fa fa-plus"></i>&nbsp;&nbsp;添加组织</span>
                     			<span class="usergroupaddbtn" onclick="addjoblevel();"><i class="fa fa-plus"></i>&nbsp;&nbsp;添加职级</span>
                     			<span class="usergroupaddbtn" onclick="window.location.href='${basepath}/base/admin/usergroup/loadindex.xhtml?gid=${basegroup.id}'"><i class="fa fa-plus"></i>&nbsp;&nbsp;批量导入用户</span>
                     			<span class="usergroupaddbtn" onclick="addrule();" style="display:none;"><i class="fa fa-plus" ></i>&nbsp;&nbsp;添加规则</span>
                     		</label>
                     	</div>
                     	<div class="controllerbox">
							<!-- 用户 -->
							<div class="usergroupitems">
								<h1 class="divname">已选用户</h1>
								<div class="itemsbox" id="selectuser">
							     <c:forEach var="item" items="${userlist}">
									<span class="usergroupitem" data-id="${item.id}" data-resourceid="${item.resourceid}">${item.name}&nbsp;&nbsp;<i class="fa fa-times"  id="${item.resourceid}" onclick='singledeluser("${item.resourceid}");'></i></span> 
								 </c:forEach>
								</div>
								<span class = "clearall" onclick="clearUser();">清空全部</span>
							</div>
							<!-- 组织 -->
							<div class="usergroupitems">
								<h1 class="divname">已选组织</h1>
								<div class="itemsbox" id="selectorg">
								    <c:forEach var="item" items="${orglist}">
									<span class="usergroupitem" data-id="${item.id}" data-resourceid="${item.resourceid}">${item.name}&nbsp;&nbsp;<i class="fa fa-times" id="${item.resourceid}" onclick='singledel("${item.resourceid}");'></i></span> 
								     </c:forEach>
								</div>
								<span class = "clearall" onclick="clearOrg();">清空全部</span>
							</div>
							<!-- 职级 -->
							<div class="usergroupitems">
								<h1 class="divname">已选职级</h1>
								<div class="itemsbox" id="selectjoblevel">
								    <c:forEach var="item" items="${joblevels}">
									<span class="usergroupitem" data-id="${item.id}" data-resourceid="${item.resourceid}">${item.name}&nbsp;&nbsp;<i class="fa fa-times" id="${item.resourceid}" onclick='singledel("${item.resourceid}");'></i></span> 
								     </c:forEach>
								</div>
								<span class = "clearall" onclick="clearJoblevel();">清空全部</span>
							</div>
							<!-- 规则 -->
							<div class="usergroupitems" style="display: none;">
								<h1 class="divname">已选规则</h1>
								<div class="itemsbox" id="selectrule">
								  <c:forEach var="item" items="${rulelist}">
									<span class="usergroupitem" data-id="${item.id}" data-resourceid="${item.resourceid}">${item.name}&nbsp;&nbsp;<i class="fa fa-times" id="${item.resourceid}" onclick='singledel("${item.resourceid}");'></i></span> 
								  </c:forEach>
								</div>
								<span class = "clearall" onclick="clearRule();">清空全部</span>
							</div>
							
                     	</div>
                     	  <input type="hidden" id="hid_id" name="hid_id" value=""/>
                     </div>
                  </div>
                  <!-- END VALIDATION STATES-->
               </div>
            </div>
    </div>
    <!-- 弹出层显示树状结构的部门 -->
     <div id="add_member_dialog" style="display: none;width:800px;height:700px;overflow-x: hidden;overflow-y:auto;">
					        <h4 class="easyDialog_title" id="easyDialogTitle">&nbsp;&nbsp;选择用户
					            <a href="javascript:void(0)" title="关闭窗口" class="close_btn"
					                id="closeBtn" onclick="easyDialog.close();">&times;&nbsp;&nbsp;</a>
					        </h4>
					        <div class="easyDialog_text">
					        	<input type="hidden" name="userids" id="userids"
											value="${userids }" />
					            <table>
					                <tr>
					                    <td>
					                        <span>用户名:</span> <input type="text" name="susername" id="susername"><br>
					                    </td>
					                    <td>
					                        <span>姓名:</span> <input type="text" name="addusername" id="addusername"><br>
					                    </td>
					                    <td>
					                        <span class="btn yellow" onclick="userlist(1)" style="margin: 10px;"><i class="icon-search"></i>检索</span>
					                    </td>
					                </tr>
					            </table>
					            <!-- 表格 -->
					            <div id="table_list2" style="overflow: auto;width: 100%;"></div>
					            
					            <div class="easyDialog_footer">
					              <button class="btn default dialog-btn" onclick="easyDialog.close()">关闭</button>
					              <button class="btn btn-success dialog-btn" onclick="useradd()">确定添加</button>
					            </div>
					        </div>
		</div>
		
		 <div id="add_member_dialog2" style="display: none;width:800px;height:700px;overflow-x: hidden;overflow-y:auto;">
					        <h4 class="easyDialog_title" id="easyDialogTitle">&nbsp;&nbsp;选择规则
					            <a href="javascript:void(0)" title="关闭窗口" class="close_btn"
					                id="closeBtn" onclick = "easyDialog.close();">&times;&nbsp;&nbsp;</a>
					        </h4>
					        <div class="easyDialog_text" style="background-color: #fff;">
					            <table>
					                <tr>
					                    <td>
					                        <span>属性名称:</span> <input type="text" name="propertyname" id="propertyname"><br>
					                    </td>
					                    <td>
					                        <span class="btn yellow" onclick="rulelist(1)" style="margin: 10px;"><i class="icon-search"></i>检索</span>
					                    </td>
					                    <td>
                                            <span><a href="${basepath}/base/admin/grouprule/toadd.xhtml?id=${basegroup.id}" style="margin-left:40px;" >创建规则</a></span>                                            					                    
					                    </td>
					                </tr>
					            </table>
					            <!-- 表格 -->
					            <div id="table_list" style="overflow: auto;width: 100%;"></div>
					            
					            <div class="easyDialog_footer">
					              <button class="btn default dialog-btn" onclick="easyDialog.close()">关闭</button>
					              <button class="btn btn-success dialog-btn" onclick="ruleadd()">确定添加</button>
					            </div>
					        </div>
		</div>
		
</body>
</html>