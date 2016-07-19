<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>添加规则</title>
<meta name="menu_path" content="system.usergroup"/>
<!-- Important Owl stylesheet -->
   <!-- BEGIN PAGE LEVEL STYLES -->
   <link rel="stylesheet" type="text/css" href="${basepath}/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
   <!-- END PAGE LEVEL STYLES -->
   <!-- BEGIN THEME STYLES --> 
   <link href="${basepath}/static/public/metronic.bootstrap/assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
   <link href="${basepath}/static/public/metronic.bootstrap/assets/css/style.css" rel="stylesheet" type="text/css"/>
   <link href="${basepath}/static/public/metronic.bootstrap/assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
   <link href="${basepath}/static/public/metronic.bootstrap/assets/css/plugins.css" rel="stylesheet" type="text/css"/>
   <link href="${basepath}/static/public/metronic.bootstrap/assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
   <link href="${basepath}/static/public/metronic.bootstrap/assets/css/custom.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="${basepath}/static/public/carousel/owl-carousel/owl.carousel.css">
	<!-- Default Theme -->
	<link rel="stylesheet" href="${basepath}/static/public/carousel/owl-carousel/owl.theme.css">
	<link rel="stylesheet" href="${basepath}/static/public/JQuery zTree v3.5.15/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<link rel="stylesheet" media="screen" href="${basepath}/static/public/stylesheets/usermanage.css">
</head>
<body>

       <!-- BEGIN PAGE HEADER-->
         <div class="row" >
            <div class="col-md-12">
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
               <ul class="page-breadcrumb breadcrumb">
                  <%-- <li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
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
               <div class="portlet box green">
                  <div class="portlet-title">
                     <div class="caption"><i class="icon-reorder"></i><span>新增规则</span></div>
                  </div>
                  <div class="portlet-body form">
                     <div class="form-body">
                        <!-- BEGIN FORM-->
                        <form action="#" id="form_sample_1" class="form-horizontal" method="post" >
                           <div class="form-group" id="userName_con">
                              <label class="control-label col-md-3">过滤类型</label>
                              <div class="col-md-4">
                                 <select name="ruletype" id="ruletype" onchange="getPropertyName();"  class="form-control" data-placeholder="请选择">
                                 </select>
                              </div>
                           </div>
                           
                           <div class="form-group" id="name_con">
                              <label class="control-label col-md-3">过滤属性</label>
                              <div class="col-md-4">
                                 <select name="ruleproperty" id="ruleproperty" onchange="getRuleMethod();"  class="form-control " data-placeholder="请选择">
                                 </select>
                              </div>
                           </div>
                           
                           <div class="form-group" id="mobile_con">
                              <label class="control-label col-md-3">过滤方式</label>
                                <div class="col-md-4">
                                 <select name="rulemethod" id="rulemethod" class="form-control " data-placeholder="请选择">
                                 </select>
                              </div>
                           </div>
                           
                           <div class="form-group">
                              <label class="control-label col-md-3">过滤的值或范围</label>
                              <div class="col-md-4">
                                 <input name="rulevalues" id="rulevalues" onfocus="getvalues();" class="form-control"  />
                              </div>
                              <div class="col-md-4">
                                <span id="value_tip" for="rulevalues" class="help-block" style="">过滤方式是between时用逗号隔开(a,b)</span>
                              </div>
                           </div>
                           
                           <div class="form-actions fluid">
                              <div class="col-md-offset-3 col-md-9">
                                 <input type="hidden" id="hid_id" name="hid_id" value="${id}">
                                 <button type="button" class="btn green" onclick="ruleadd();">提交</button>
                                 <button type="button" class="btn default" onclick="backToList();">返回</button>                              
                              </div>
                           </div>
                        </form>
                     </div>
                  </div>
                  <!-- END VALIDATION STATES-->
               </div>
            </div>
    </div>
    
     <div id="add_member_dialog" style="display: none;width:800px;height:700px;overflow-x: hidden;overflow-y:auto;">
					        <h4 class="easyDialog_title" id="easyDialogTitle">&nbsp;&nbsp;选择用户
					            <a href="javascript:void(0)" title="关闭窗口" class="close_btn"
					                id="closeBtn" onclick="easyDialog.close();" style="float: right;">&times;&nbsp;&nbsp;</a>
					        </h4>
					        <div class="easyDialog_text" style="background-color: #fff;padding:10px;">
					        <input type="hidden" name="userids" id="userids"
											value="${userids }" />
					            <table>
					                <tr>
					                    <td>
					                        <span>用户名:</span> <input type="text" name="susername" id="susername"><br>
					                    </td>
					                    <td>
					                        <span class="btn yellow" onclick="userlist(1)" style="margin: 10px;"><i class="icon-search"></i>检索</span>
					                    </td>
					                </tr>
					            </table>
					            <!-- 表格 -->
					            <div id="table_list2" style="overflow: auto;width: 100%;"></div>
					            
					            <div class="easyDialog_footer" style="display: block;text-align: right;">
					              <button class="btn default dialog-btn" onclick="easyDialog.close()">关闭</button>
					              <button class="btn btn-success dialog-btn" onclick="useradd()">确定添加</button>
					            </div>
					        </div>
		</div>
    
    
    
</body>
</html>
<content tag="pageCore">
   <script type="text/javascript" src="${basepath}/static/public/metronic.bootstrap/assets/plugins/select2/select2.min.js"></script>
     <script src="${basepath}/static/public/metronic.bootstrap/assets/scripts/app.js"></script>
   <script src="${basepath}/static/public/metronic.bootstrap/assets/scripts/form-components.js"></script>
   <script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.core-3.5.js" type="text/javascript"></script>
     <script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.excheck-3.5.js" type="text/javascript"></script>
     <script src="${basepath }/static/public/JQuery zTree v3.5.15/js/jquery.ztree.exedit-3.5.js" type="text/javascript"></script>
     

</content>
<content tag="pageInit">
<!-- 初始化窗口 -->
<script type="text/javascript">

var rulelist="";
getRuleConfig();
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

//设置字体样式
function setFontCss() {
    return {color:"#000000",size:"14px",height: "28px",family:"微软雅黑"};
};

var zTreeOnClick = function (event, treeId, treeNode){
    treeNode.checked = !treeNode.checked;
    $.fn.zTree.getZTreeObj(treeId).updateNode(treeNode, true);
} 

	
function　getRuleConfig(){
    $.ajax({
         type:"post",
         url:"${basepath}/base/admin/grouprule/getruleconfig.json",
         success:function(msg){
              if(msg!=null &&　msg.list.length>0){
                    rulelist=msg.grouplist;
                    var html="";
                    html+='<option value="-1">请选择</option>';
                    for(var i=0;i<msg.list.length;i++){
                          var name=msg.list[i];
                          if(name=="user"){
                          html+='<option value="0">用户</option>';
                          }else if(name=="org"){
                              html+='<option value="1">组织</option>';
                              }else if(name=="joblevel"){
                                 html+='<option value="2">职级</option>'
                                  }
                          $("#ruletype").html(html);
                        }
                  }
             }
        });
 }



function getPropertyName(){
     var ruletype=$("#ruletype").val();
     var msg="";
     if(ruletype=="0"){
         msg="user";
         }else if(ruletype=="1"){
             msg="org";
                 }else if(ruletype=="2"){
                     msg="joblevel";
                     }
     if(ruletype=="-1"){
           return;
         }
     if(rulelist!="" && rulelist.length>0){
         $("#ruleproperty").html("");
    	 $("#ruleproperty").append('<option value="-1">请选择</option>');
           for(var i=0;i<rulelist.length;i++){
               if(rulelist[i].entityname==msg){
              	  $("#ruleproperty").append('<option value="'+rulelist[i].propertyname+'" data-type="'+rulelist[i].type+'"  >'+rulelist[i].propertyname+'</option>');
                   }
               }
         }
}

function  getRuleMethod(){
    var type=$("#ruleproperty").find("option:selected").data("type");
    var html="";
    if(type==0){//数值型
        html+='<option value="0">=</option>';
        html+='<option value="1">></option>';
        html+='<option value="2"><</option>';
        }else if(type==1){//字符型
            html+='<option value="0">=</option>';
            html+='<option value="4">like</option>';
        }else if(type==2){//范围型
             html+='<option value="3">between</option>';
            }else if(type==3 || type==4 || type==5){
                html+='<option value="5">in</option>';
            }
     $("#rulemethod").html(html);         
  }

//保存规则信息
function ruleadd(){
	 var type=$("#ruleproperty").find("option:selected").data("type");

    var gid=$("#hid_id").val();

    var ruletype=$("#ruletype").val();

    var rulename=$("#ruleproperty").val();

    var rulemethod=$("#rulemethod").val();

    var rulevalues=$("#rulevalues").val();

    if(type==0 || type==1 || type==2){//数值型和字符型
        if(rulevalues==null || rulevalues==""){
             alert("值不能为空");
             $("#rulevalues").focus();
             return;
            }
        }

    $.ajax({
          type:"post",
          url:"${basepath}/base/admin/grouprule/ruleadd.json",
          data:{"rulevalues":rulevalues,"ruletype":ruletype,"rulename":rulename,"rulemethod":rulemethod,"gid":gid},
          success:function(data){
              if(data){
                  showMsgDialog("添加成功");
                  window.location.href="${basepath}/base/admin/usergroup/usergroup.xhtml?id="+gid;
                  }
              }
        });

    }
    
function showMsgDialog(content){
	easyDialog.open({
        container : {
            header : '提示',
            content : '<div style="background-color: #ffffff;width:260px;height:20px;text-align:center;">'+content+'</div>'
        },
        autoClose:1400
    });
}

//用户列表
function userlist(i)
{ 
	var pagesize = $("#table_list2 #page_max").val();
    var userids=$("#userids").val();
    var data={"currentpage":i,"pagesize":pagesize,"r":Math.random(),"username":$("#susername").val(),"pageFn":"userlist","userids":userids};

    var url="${basepath}/base/admin/usergroup/userlist.list";
    
    $("#table_list2").load(encodeURI(url),data,function(){

          var arrays=$("#rulevalues").val();
          var array=arrays.split(",");
        
    	 $("#table_list2").find("input[name='ids']").each(function(){
             for(var i=0;i<array.length;i++){
                   if($(this).val()==array[i])
                       {
                       $(this).attr("checked","checked");
                       }
                 }
           });
        });
    }


 function getvalues(){
	 var type=$("#ruleproperty").find("option:selected").data("type");
	 var ruletype=$("#ruletype").val();
     var typename="";
     if(ruletype=="0"){
    	 typename="组织";
         }
     //弹出框弹出列表
     if( type==4){
    	 userlist(1);
         easyDialog.open({
			  container : 'add_member_dialog',
			  fixed : false
			});
         }
     //弹出树
     if(type==5){
	    $.ajax({
              url:"${basepath}/base/admin/grouprule/gettreelist.json",
              type:"post",
              data:{"ruletype":ruletype},
              datatype:"json",
              success:function(msg){
                  if(msg!=null && msg!=""){
            	  var zdata = JSON.parse(msg);
            	  var str='<div id="dialog" style="display:block;overflow:hidden;"><div class="zTreeDemoBackground" style="width:400px;"><ul id="treeDemo" class="ztree"></ul></div>';
          		  str=str+'<div class="easyDialog_footer" style="float:right;margin-top:10px;">'
                  str=str+'<button class="btn default dialog-btn" onclick="easyDialog.close()">关闭</button>';
                  str=str+'<button class="btn btn-success dialog-btn" onclick="addtree();"  >确定添加</button>';
          		  str=str+'</div></div>';
	          	  easyDialog.open({
	          			  container : {
	          				    header : '选择'+typename,
	          				    content :str,
	          				  }
	          			});
            	  $.fn.zTree.init($("#treeDemo"),setting, zdata);
  				  var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
  				  treeObj.expandAll(true);

                  //回显
                  var rulevalues=$("#rulevalues").val();
                  if(rulevalues!=null && rulevalues!=""){
                         var rulevalue=rulevalues.split(",");
                         if(rulevalue.length>0){

                        	  var nodes=treeObj.getCheckedNodes(false);
                              for(var i=0;i<nodes.length;i++){
                                  for(var j=0;j<rulevalue.length;j++){
                               	   if(nodes[i].id==rulevalue[j]){
                                   	    nodes[i].checked=true;
                                   	    treeObj.updateNode(nodes[i]);
                                   	   }
                                      }
                                  }
                             }
                      }
                  }
              }
	    });
         }
	 }

    function addtree(){
    	var array=new Array();
	    //获得已选中的树节点
	    var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	    var selectNodes = treeObj.getCheckedNodes();
	    for(var i=0;i<selectNodes.length;i++){
              var node=selectNodes[i];
              array.push(node.id);
		    }
         $("#rulevalues").val(array.join(","));
         easyDialog.close();
        }
    function useradd(){
    	var result = $("#userids").val(); 
 /**   	 var ids=new Array();
  	   $("#table_list2").find("input:checked").each(function(){
  		     ids.push($(this).val());
  		   });
*/
	  	  $("#rulevalues").val(result); 
	  	  easyDialog.close();
	}
    
    function checked_all(obj){
	/**	if($(obj).attr("checked") == "checked"){
			$("input[name='ids']").each(function(){
				$(this).attr("checked","checked");
				$(this).parent().addClass("checked");
			});
		}else{
			$("input[name='ids']").each(function(){
				$(this).removeAttr("checked");
				$(this).parent().removeClass("checked");
			});
		}*/
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

    //返回
    function backToList(){
        window.history.go(-1);
        }



</script>
</content>	
