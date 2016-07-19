function saveUserPermission(){
	var treeObj = $.fn.zTree.getZTreeObj("all_permission");
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
	$("#idstr").val(perIds);
	$("#saveRolePermission").submit();
}

//设置字体样式
function setFontCss() {
	return {color:"#000000",size:"14px",height: "28px",family:"微软雅黑"};
};

var zTreeOnClick = function (event, treeId, treeNode){
	treeNode.checked = !treeNode.checked;
	$.fn.zTree.getZTreeObj(treeId).updateNode(treeNode, true);
} 
//var dbClick = function(event, treeId, node){
//	$.fn.zTree.getZTreeObj(treeId).expand(true);
//}

var setting = {
	data: {
		simpleData: {
			enable: true
		}
		,key: {
			title: "title"
		}
	},
	check: {
		enable: true,
		//nocheckInherit: false,
		autoCheckTrigger:false,
		chkStyle: "checkbox"
//		,chkboxType: { "Y": "s", "N": "s" }
	},
	callback: {
		onClick: zTreeOnClick
//		,onDbClick: dbClick
	},
	view:{
		dblClickExpand: false,
		fontCss: setFontCss
	}
};

       /* var settingclick = {
        		data: {
        			simpleData: {
        				enable: true
        			}
        		}
        	};*/

        /*var code;		

        function showCode(str) {
        	if (!code) code = $("#code");
        	code.empty();
        	code.append("<li>"+str+"</li>");
        }*/

        /*var btnFn = function(){
        	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
        	var selectNodes = treeObj.getSelectedNodes();
        	$("#perId").val(selectNodes[0].id);
        	$("#perName").val(selectNodes[0].name);
        	$("#getPermissions").attr("onclick", "getPermissions('"+selectNodes[0].id+"','1')");
        	easyDialog.close();
        };*/


        /*var btnMulti = function(){
        	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
        	var selectNodes = treeObj.getCheckedNodes();
        	var perIds="";
        	var perNames="";
        	for(var i=0;i<selectNodes.length;i++){
        		var node = selectNodes[i];
        		if(i!=selectNodes.length-1){
        			perIds = perIds + node.id +",";
        			perNames = perNames +node.name +",";
        		}
        		else{
        			perIds = perIds + node.id;
        			perNames = perNames +node.name;
        		}
        	}
        	$("#perId").val(perIds);
        	$("#perName").val(perNames);
        	$("#getPermissions").attr("onclick", "getPermissions('"+perIds+"','2')");
        	easyDialog.close();
        };*/

        /*function getPermissions(nodeId, type){
        	var url = basepath+"/base/admin/permission/getPermissions.xhtml";
        	$.ajax({
        		url:url,
        		type:"POST",
        		data:{"treeId":nodeId,"type":type},
        		//contentType: "application/json; charset=utf-8",
        		success:function(data){
        			zdata = data;
        			var str='<div id="dialog_bumen" style="width:400px;"><div class="zTreeDemoBackground"><ul id="treeDemo" class="ztree"></ul></div></div>';

        			if(type=="1"){
        				easyDialog.open({
        					  container : {
        						    header : '选择权限',
        						    content :str,
        						    yesFn : btnFn,
        						    noFn : true
        						  },
        					  fixed : false
        					});
        				$.fn.zTree.init($("#treeDemo"), settingclick, zdata);
        				 $("#treeDemo").find("a[onclick='true']").click();
        			}
        			else{
        				easyDialog.open({
        					  container : {
        						    header : '选择权限',
        						    content :str,
        						    yesFn : btnMulti,
        						    noFn : true
        						  },
        					  fixed : false,
        					  follow : "getPermissions",
        					  followX : -400,
        					  followY : -50
        					});
        				$.fn.zTree.init($("#treeDemo"), setting, zdata);
        			}
        			
        			
        			var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
        			if(nodeId != null && nodeId != ""){
        				//TODO 以后这里要传入id
        			}
        		}
        	});
        	
        }		*/
