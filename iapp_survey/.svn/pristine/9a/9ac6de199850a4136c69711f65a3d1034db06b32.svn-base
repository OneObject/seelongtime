<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>

	    <input id="idstr" name="idstr" value=${idstr } type="hidden">
	<div class="col-md-6" id="add_premission" style="margin-top:15px;padding-left:0px;">
	    <div class="col-md-5">
	        <div class="zTreeDemoBackground left">
	            <ul id="all_permission" class="ztree">
	            </ul>
	        </div>
	    </div>
	    <%-- 
	    <div class="col-md-7">
	    </div>
	    --%>
	</div>


<script type="text/javascript">
   var zNodes = ${idstr};

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