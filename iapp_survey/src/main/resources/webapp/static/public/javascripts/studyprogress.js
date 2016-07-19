$(function (){
	page(1);
});

/**
 * 分页+搜索
 */
function page(i,isPart,fieldId) {
	var divId = "table_list";
	
	var order = getOrder(divId, fieldId);
	var max = $("#"+divId+" #page_max").val()
	var isAll = $("#isall").attr("checked"); //导出是否包含子节点
	var cname = $.trim($("#searchContent").val());
	if($.trim($("#searchContent").val())=="输入课程名/用户名进行搜索"){
		cname="";
	};
	//AJAX提示
	loading(divId);
	var data = {"page":i, "max":max, "r":Math.random(), "cname":cname,
			"orgId":$("#orgId").val(),
			"uname":$("#uname").val(),
			"isAll": isAll,
			"orderField":order.orderField, "orderDirection":order.orderDirection };
	
	var url = basepath+"/base/admin/coursetrace/list.list";
	$("#"+divId).load(encodeURI(url), data, function(){
		App.initUniform();
		if(isPart&&(($("#searchContent").val())!=''))//isPart  按条件导出时导出按钮的样式
		{
			//alert(($("#searchContent").val())=='');
			$(".common_add").html('<i class="glyphicon glyphicon-plus">'+'</i>按条件导出课程学习进度 ');
		}
		if($("#orgId").val()!=$("#orgRootId").val())
		{
			$(".common_add").html('<i class="glyphicon glyphicon-plus">'+'</i>按条件导出课程学习进度 ');
		}
	});
	
}

/** 清空部门选择 */
function clearOrg(obj,rootId){
	$(obj).addClass("item_checked");
	var org_con = $("#clear_org_con");
	var li_con = $("#li_con");
	var index = $(obj).index();
	org_con.find("li").each(function(){
		if($(this).index()>index){
			$(this).remove();
		}
	});
	li_con.find("li").each(function(){
		$(this).removeClass("item_checked");
	});
	var html = null;
	$.ajax({
 		type: "POST",
 		url: basepath+"/base/admin/user/getChildOrg.json",
 		data: {"id":rootId},
 		dataType:"json",
 		success: function(data){
 			li_con.find("li").remove();
 			var list = data;
 			for(var i = 0;i < list.length;i++){
 				html='<li class="check_item" onclick="check_obj(this, \''+rootId+'\', \''+list[i].id+'\',\''+list[i].name+'\' ,'+list[i].isLeaf+')">';
 				html+="<span>"+list[i].name+"</span></li>";
 				li_con.append(html);
 			}
 			
 		}
 		
 	});

    getRootChildren(rootId);
}

/** 下拉菜单查找root节点用户，更新span组织列表*/
function getRootChildren(fatherOrgId){
	var id = fatherOrgId;
	$("#orgId").val(id);
	page(1,true);

}



function check_obj(obj, fatherOrgId, id, name, isLeaf){
	$(obj).attr("click", "");//点击之后把该元素的点击事件置空
	$("#orgId").val(id);
	page(1,true);
	var _this = $(obj);
	var org_con = $("#clear_org_con");
	if(!isLeaf){
		org_con.find("li").each(function(){
			$(this).removeClass("item_checked");
		});
		 var html = '<li class="check_item item_checked"  onclick="clearOrg(this,\''+id+'\')"><span >'+name+'</span></li>';
         org_con.append(html); 
         var li_con = $("#li_con");
         $.ajax({
     		type: "POST",
     		url: basepath+"/base/admin/user/getChildOrg.json",
     		data: {"id":id},
     		dataType:"json",
     		success: function(data){
     			li_con.find("li").remove();
     			var list = data;
     			for(var i = 0;i < list.length;i++){
     				html='<li class="check_item" onclick="check_obj(this, \''+id+'\', \''+list[i].id+'\',\''+list[i].name+'\' ,'+list[i].isLeaf+')">';
     				html+="<span>"+list[i].name+"</span></li>";
     				li_con.append(html);
     			}
     			
     		}
     		
     	});
	} else{
		$("#clear_org_con").find("li").each(function(){
			$(this).removeClass("item_checked");
		});
		_this.parent().find("li").removeClass("item_checked");
		_this.addClass("item_checked");
		//$("#clear_org").removeClass("item_checked");
	}
	
}
/**

function clearJobLevel(obj,jobLevelRootID)
{
	$(obj).addClass("item_checked");//change class
	var JobLevel_org_con = $("#JobLevel_org"); //buxian
	var JobLevel_li_con = $("#JobLevel_con");//li
	var index = $(obj).index();
	JobLevel_org_con.find("li").each(function(){
		if($(this).index()>index)
			{
				$(this).remove();
			}
	});
	JobLevel_li_con.find("li").each(function(){
		$(this).removeClass("item_checked");
	});
	var html = null;
	$.ajax({
		type:POST,
		url:basepath +"",
		dataType:"json",
		success :function(data){
			JobLevel_li_con.find("li").remove();
			var list = data;
			for(var i = 0;i<list.length;i++)
				{
					html = '<li class="check_item" >';
					html+="<span>"+list[i].name+"</span></li>";
					JobLevel_li_con.append(html);
				}
		}
		
	});
	
	
}

 */







