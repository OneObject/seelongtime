<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>


<form action="${basepath }/base/admin/permission/saveRolePermission.xhtml" method="post" id="saveRolePermission">
	    <input id="joblevelstr" name="joblevelstr" value="${joblevelstr}" type="hidden">
	<div class="col-md-6" id="add_premission">
	    <div class="col-md-5">
	        <div class="zTreeDemoBackground left">
	            <ul id="all_permission2" class="ztree">
	            </ul>
	        </div>
	       <ltacl:checkAcl resourceId="111">
	        <span class="btn btn-success add_role" onclick="saveJobLevel();"><i class="icon-plus"></i>保存授权设置</span>
	          </ltacl:checkAcl>
	    </div>
	    <!-- 
	    <div class="col-md-7">
	    </div>
	     -->
	</div>
</form>

<script type="text/javascript">
   var zNodes2 = ${joblevelstr};

   function jobLevelAdd(){
	   var treeObj =  $.fn.zTree.getZTreeObj("all_permission2");
	    var selectNodes = treeObj.getCheckedNodes();
	    if(selectNodes.length<=0){
		    alert("至少要选中一项");
		    return;
		    }
	    var perIds="";
	    for(var i=0;i<selectNodes.length;i++){
	        var node = selectNodes[i];
	        if(i!=selectNodes.length-1){
	            perIds = perIds + node.id +",";
	        }
	        else{
	            perIds = perIds + node.id;
	        }
	    }
	    $("#joblevelstr").val(perIds);

	    $.ajax({
            type:"post",
            url:"${basepath}/base/admin/authorize/authorizes.json",
            data:{"joblevels":perIds,"rcategory":$("#rcategory").val(),"ids":$("#rid").val(),"scategory":$("#scategory").val()},
            success:function(msg){
                if(msg){
                    alert("授权成功");
                    }else{
                     alert("授权失败");
                        }
                }
          });
	    
	   }



   
  function saveJobLevel(){
	  var biaoji=$("#biaoji").val();
      if(biaoji!=null && biaoji!="" && biaoji=="piliang"){
    	  jobLevelAdd();
           return;
          }
	    var treeObj =  $.fn.zTree.getZTreeObj("all_permission2");
	    var selectNodes = treeObj.getCheckedNodes();
	    var perIds="";
	    for(var i=0;i<selectNodes.length;i++){
	        var node = selectNodes[i];
	        if(i!=selectNodes.length-1){
	            perIds = perIds + node.id +",";
	        }
	        else{
	            perIds = perIds + node.id;
	        }
	    }
	    $("#joblevelstr").val(perIds);

	    var items = $("#joblevelstr, #rcategory, #rid, #scategory");
	    $.post(basepath+"/base/admin/authorize/savejoblevel.xhtml", $.param(items), function (ret){
            if(ret.flag){
                var html="<div style='width:300px;text-align:center;'>"+ret.message+"</div>";
                easyDialog.open({
                    container : {
                        header : '提示',
                        content : html
                    },
                    autoClose : success_time,
                    callback : function(){}
                });
            } else{
                var html="<div style='width:300px;text-align:center;'>"+ret.message+"</div>";
                easyDialog.open({
                    container : {
                        header : '提示',
                        content : html
                    },
                    autoClose : fail_time
                });
            }
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

	var setting = {
	    data: {
	        simpleData: {
	            enable: true
	        }
	    },
	    check: {
	        enable: true,
	        //nocheckInherit: false,
	        autoCheckTrigger:false,
	        chkStyle: "checkbox"
	      ,chkboxType: { "Y": "ns", "N": "s" }
	    },
	    callback: {
	        onClick: zTreeOnClick
	    },
	    view:{
	        dblClickExpand: false,
	        fontCss: setFontCss
	    }
	};
</script>