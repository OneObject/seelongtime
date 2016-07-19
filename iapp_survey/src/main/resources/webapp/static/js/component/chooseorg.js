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
	
//设置字体样式
function setFontCss() {
    return {color:"#000000",size:"14px",height: "28px",family:"微软雅黑"};
};

var zTreeOnClick = function (event, treeId, treeNode){
    treeNode.checked = !treeNode.checked;
    $.fn.zTree.getZTreeObj(treeId).updateNode(treeNode, true);
} 
var orgsubmit = 0;	
	
function chooseOrg(){
   var url = basepath+"/base/admin/comp/orglist.list";
	$.ajax({
		url:url,
		type:"POST",
		datatype:"json",
		success:function(data){
			var zdata = JSON.parse(data);
			easyDialog.open({
			  container : 'choose_org_dialog',
			  fixed : false
			});
			$.fn.zTree.init($("#treeDemo"),setting,zdata);
			var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
		    
			//已选中的打勾 
            var oids = $("#oids").val();
            if(oids != null && oids != ""){
            	var orgselect = oids.split(",");
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
		}
	});
}
	
function confirmChooseOrg(){
    if(orgsubmit == 1){
	   return;
    }
    orgsubmit = 1;
    var orgData = new Array();
    //获得已选中的树节点
    var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
    var selectNodes = treeObj.getCheckedNodes();
    var oids = "";
    for(var i=0;i<selectNodes.length;i++){
           var node=selectNodes[i];
           var item = new Object();
           item.id=node.id;
           item.name=node.name;
           orgData.push(item);
           oids = oids + node.id + ",";
	 }
	 $("#oids").val(oids);
	 afterComfirmChooseOrg(orgData);
     easyDialog.close();
     orgsubmit = 0;
}