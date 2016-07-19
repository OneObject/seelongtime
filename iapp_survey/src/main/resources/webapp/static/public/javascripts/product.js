var cidrecord=new Array();
$(function (){
	var data_page = $("#data_page").val();
	if(data_page==null){
		data_page=1;
	}
	// check_obj("#8639d1a6-5182-4d29-b1aa-062891059f61", "domain_ajy", "8639d1a6-5182-4d29-b1aa-062891059f61", "第一层", false);

	page(data_page);
});

/**
 * 分页+搜索
 */
function page(i, fieldId) {
	var divId = "table_list";
	
	var order = getOrder(divId, fieldId);
	var max = $("#"+divId+" #page_max").val()
	
	//AJAX提示
	loading(divId);
	var data = {"page":i, "max":max, "r":Math.random(),"cid":$("#orgId").val(), "cidrecord":cidrecord,
			"searchContent":$("#searchContent").val() };
	var url = basepath+"/base/admin/product/list.list";
	$("#"+divId).load(encodeURI(url), data, function(){
		App.initUniform();
	});
}


function toadd(){
	window.location.href=basepath+"/base/admin/product/tosave.xhtml";
}
function update(id){
	window.location.href=basepath+"/base/admin/product/tosave.xhtml?id="+id;
}
function tohistory(id){
	window.location.href=basepath+"/base/admin/product/tohistory.xhtml?id="+id;
}

function deleteEntity(id){
	var tempFn = function(){
		$.ajax({
			type:"POST",
	   	 	url:basepath+"/base/admin/product/delete.json",
	   	 	data:{id:id},
	   	 	success:function(data){
	   	 		page(1);
	   	 	}
		});
	};
	var html="<div style='width:300px;height:50px;text-align:center;'>你确定要删除吗！</div>";
	easyDialog.open({
		container : {
		    header : '提示',
		    content : html,
		    yesFn : tempFn,
		    noFn : true
		}
	});
}

function release(id,status){
	var tempFn = function(){
		$.ajax({
			type:"POST",
			url:basepath+"/base/admin/product/release.json",
			data:{id:id,status:status},
			success:function(data){
				page(1);
			}
		});
	};
	var value = "";
	if(status == 1){
		value = "你确定要发布吗？";
	}else if(status == 0){
		value = "你确定要取消发布吗？";
	}
	var html="<div style='width:300px;height:50px;text-align:center;'>"+value+"</div>";
	easyDialog.open({
		container : {
			header : '提示',
			content : html,
			yesFn : tempFn,
			noFn : true
		}
	});
}


/** 用户选中选择查找课程分类 */
function check_obj(obj, fatherOrgId, id, name, isLeaf){
	$(obj).attr("click", "");
	$("#orgId").val(id);

	page(1);
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
      		url: basepath+"/base/admin/product/getChildProductCategory.json",
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
	
	
	
	getcidobj(fatherOrgId, id, name, isLeaf);
	         
}

function getcidobj(fatherOrgId, id, name, isLeaf){
	var cidobj = {"obj" : "#"+id ,"fatherOrgId" : fatherOrgId, "id" : id, "name" :name, "isLeaf" : isLeaf};
	cidrecord.push(cidobj);
	console.log(cidrecord);
}

/** 清空课程分类选择 */
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
 		url: basepath+"/base/admin/product/getChildProductCategory.json",
 		data: {"id":rootId},
 		dataType:"json",
 		success: function(data){
 			li_con.find("li").remove();
 			var list = data;
 			for(var i = 0;i < list.length;i++){
 				html='<li class="check_item" style="margin-bottom:10px;" onclick="check_obj(this, \''+rootId+'\', \''+list[i].id+'\',\''+list[i].name+'\' ,'+list[i].isLeaf+')">';
 				html+="<span>"+list[i].name+"</span></li>";
 				
 				li_con.append(html);
 			}
 			
 		}
 		
 	});

    getRootChildren(rootId);
}



/** 下拉菜单查找root节点用户，更新课程分类列表*/
function getRootChildren(fatherOrgId){
	var id = fatherOrgId;
	$("#orgId").val(id);
	page(1);

}



















