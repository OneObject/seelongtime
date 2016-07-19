
$(function (){
	page(1);
	bind_hidden();
});

var flag = true;
/**
 * 分页+搜索
 */
function page(i,isPart, fieldId) {
	flag = true;
	var divId = "table_list";
	var banding = $("#banding").val();
	var order = getOrder(divId, fieldId);
	var max = $("#"+divId+" #page_max").val();
	//if(banding ==1){
	//	banding = "banding";
	//}else if(banding == 2){
	//	banding = "not_banding";
	//}
	//AJAX提示
	loading(divId);

	var data = {"gender":$("#gender").val(), "orgId":$("#orgId").val(), 
			"searchContent":$("#searchContent").val(),
			"page":i, "max":max, "r":Math.random(),"banding":banding,
			"orderField":order.orderField, "orderDirection":order.orderDirection };
	var url = basepath+"/base/admin/xeroxuser/list.list";
	$("#"+divId).load(encodeURI(url), data, function(){
		//reinit_datatables();
		App.initUniform();
		if(isPart&&(($("#searchContent").val())!=''))//isPart  按条件导出时导出按钮的样式
		{
			
			
			$(".common_add").html('<i class="glyphicon glyphicon-plus">'+'</i>按条件导出用户信息 ');
		}
		else if($("#orgId").val()!=$("#orgRootId").val())
		{
			$(".common_add").html('<i class="glyphicon glyphicon-plus">'+'</i>按条件导出用户信息');
		}else{
			$(".common_add").html('<i class="glyphicon glyphicon-plus">'+'</i>导出所有用户信息');
		}
	});
}

/**
 * 用户管理界面javascripts
 */

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
 		url: basepath+"/base/admin/xeroxuser/getChildOrg.json",
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



/** 用户选中选择查找部门 */
function check_obj(obj, fatherOrgId, id, name, isLeaf){
	$(obj).attr("click", "");
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
     		url: basepath+"/base/admin/xeroxuser/getChildOrg.json",
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
 * 用户取消选择条件
 */
function remove_obj(o){
	var _this = $(o).parent();
	_this.removeClass("item_checked");
//	$(o).remove();
}
/**
 * 取消绑定
 * @param id
 */
function cancelBind(id){
  if(confirm("确定要取消绑定吗？")){
	$.ajax({
		  type:"POST",
		  url:basepath+"/base/admin/xeroxuser/cancelbind.json",
		  data:{"id":id},
		  success:function(data){
			  if(data){
				  var html="<div style='width:300px;text-align:center;'>取消绑定成功</div>";
	    			easyDialog.open({
	    				container : {
	    				    header : '提示',
	    					content : html
	    				},
	    				autoClose : 1000
	    			});
	    			 var i=$(".pagination").find(".active").find("a").text();
                     page(i);
			  }else{
				  var html="<div style='width:300px;text-align:center;'>取消绑定失败</div>";
	    			easyDialog.open({
	    				container : {
	    				    header : '提示',
	    					content : html
	    				},
	    				autoClose : 1000
	    			});
			  }
		  }
	});
  }
}
/**
 * 禁用账号
 * @param id
 */
function forbiddenAccount(id){
	 if(confirm("确定要禁用账号吗？")){
			$.ajax({
				  type:"POST",
				  url:basepath+"/base/admin/xeroxuser/forbidaccount.json",
				  data:{"uid":id},
				  success:function(data){
					  if(data){
						  var html="<div style='width:300px;text-align:center;'>禁用账号成功</div>";
			    			easyDialog.open({
			    				container : {
			    				    header : '提示',
			    					content : html
			    				},
			    				autoClose : 1000
			    			});
			    			 var i=$(".pagination").find(".active").find("a").text();
		                     page(i);
					  }else{
						  var html="<div style='width:300px;text-align:center;'>禁用账号失败</div>";
			    			easyDialog.open({
			    				container : {
			    				    header : '提示',
			    					content : html
			    				},
			    				autoClose : 1000
			    			});
					  }
				  }
			});
		  }
	
}
/**
 * 启用账号
 * @param id
 */
function enableAccount(id){
	 if(confirm("确定要启用该账号吗？")){
			$.ajax({
				  type:"POST",
				  url:basepath+"/base/admin/xeroxuser/enableaccount.json",
				  data:{"uid":id},
				  success:function(data){
					  if(data){
						  var html="<div style='width:300px;text-align:center;'>启用账号成功</div>";
			    			easyDialog.open({
			    				container : {
			    				    header : '提示',
			    					content : html
			    				},
			    				autoClose : 1000
			    			});
			    			 var i=$(".pagination").find(".active").find("a").text();
		                     page(i);
					  }else{
						  var html="<div style='width:300px;text-align:center;'>启用账号失败</div>";
			    			easyDialog.open({
			    				container : {
			    				    header : '提示',
			    					content : html
			    				},
			    				autoClose : 1000
			    			});
					  }
				  }
			});
		  }
}
/**
 * 修改用户
 */
function updateUser(id){
	window.location.href = basepath+"/base/admin/xeroxuser/updateuser.xhtml?id="+id;
}
/**
 * 新增用户
 */
function addUser(){
	window.location.href = basepath+"/base/admin/xeroxuser/adduser.xhtml";
}

/**
 * 批量导入用户
 */
function batchUser(){
	window.location.href=basepath+"/base/admin/xeroxuser/loadindex.xhtml";
}

/**
 * 返回列表页
 */
function backToList(){
	window.location.href = basepath + "/base/admin/xeroxuser/usermanage.xhtml";
}

/**
 * 删除用户
 * @param id
 */
function deleteSingleInDetail(id){
	var tempFn = function (){
    	$.post(basepath+"/base/admin/xeroxuser/delete.xhtml", {ids:id }, function (ret){
    		if(ret.flag){
    			var html="<div style='width:300px;text-align:center;'>删除成功！</div>";
    			easyDialog.open({
    				container : {
    				    header : '提示',
    					content : html
    				},
    				autoClose : 1000,
    				callback : function(){window.location.href = basepath+"/base/admin/xeroxuser/usermanage.xhtml";}
    			});
    		} else{
    			var html="<div style='width:300px;text-align:center;'>删除失败！失败原因："+ret.message+"</div>";
    			easyDialog.open({
    				container : {
    				    header : '提示',
    					content : html
    				},
    				autoClose : 1000
    			});
    			return false;
    		}
    	});
	}
	var html="<div style='width:300px;height:50px;text-align:center;'>确定要删除吗？</div>";
	easyDialog.open({
		container : {
		    header : '提示',
		    content : html,
		    yesFn : tempFn,
		    noFn : true
		}
	});
}
	
function deleteSingle(id){
	var tempFn = function (){
    	$.post(basepath+"/base/admin/xeroxuser/delete.xhtml", {ids:id }, function (ret){
    		if(ret.flag){
    			var html="<div style='width:300px;text-align:center;'>删除成功！</div>";
    			easyDialog.open({
    				container : {
    				    header : '提示',
    					content : html
    				},
    				autoClose : 1000,
    				callback : function(){page(1);}
    			});
    		} else{
    			var html="<div style='width:300px;text-align:center;'>删除失败！失败原因："+ret.message+"</div>";
    			easyDialog.open({
    				container : {
    				    header : '提示',
    					content : html
    				},
    				autoClose : 1000
    			});
    			return false;
    		}
    	});
	}
	var html="<div style='width:300px;height:50px;text-align:center;'>确定要删除吗？</div>";
	easyDialog.open({
		container : {
		    header : '提示',
		    content : html,
		    yesFn : tempFn,
		    noFn : true
		}
	});
}

/**
 * 仅限：性别
 */
$(".sex").find(".check_item").each(function(){
	$(this).click(function (){
		$(this).parent().find("li").removeClass("item_checked");
		$(this).addClass("item_checked");
		$("#gender").val($(this).find("input").val());
	});
});

/**
 * 仅限：绑定状态
 */
$(".band").find(".check_item").each(function(){
	$(this).click(function (){
		$(this).parent().find("li").removeClass("item_checked");
		$(this).addClass("item_checked");
		$("#banding").val($(this).find("input").val());
	});
});

/**
 * 全部选中
 */
//var flag = true;//没有选中的情况下是true
function checked_all(o){
	if(flag){
		$("input[name='ids']").each(function(){
			$(this).attr("checked","checked");
			$(this).parent().addClass("checked");
		});
		flag = false;
	}else{
		$("input[name='ids']").each(function(){
			$(this).removeAttr("checked");
			$(this).parent().removeClass("checked");
		});
		flag = true;
	}
	
}

/**
 * 批量删除用户
 */
function deleteGroup(){
	var items = $("input[name='ids']:checked");
	var tempFn = function (){
		$.post(basepath+"/base/admin/xeroxuser/delete.xhtml", $.param(items), function (ret){
			if(ret.flag){
				flag = true;
    			var html="<div style='width:300px;text-align:center;'>删除成功！</div>";
    			easyDialog.open({
					container : {
					    header : '提示',
						content : html
					},
					autoClose : success_time,
					callback : function(){
						flag = true;
						page(1);
					}
				});
			} else{
    			var html="<div style='width:300px;text-align:center;'>删除失败！失败原因："+ret.message+"</div>";
    			easyDialog.open({
    				container : {
    				    header : '提示',
    					content : html
    				},
					autoClose : 1000
				});
			}
		});
	}
	
	if(items.length == 0){
		var html="<div style='width:300px;text-align:center;'>您没有选中任何记录！</div>";
		easyDialog.open({
			container : {
			    header : '提示',
				content : html
			},
			autoClose : 1000
		});
	} else{
		var html="<div style='width:300px;height:50px;text-align:center;'>确定要删除"+items.length+"条记录吗？</div>";
		easyDialog.open({
			container : {
			    header : '提示',
			    content : html,
			    yesFn : tempFn,
			    noFn : true
			}
		});
	}

}

function attend(){
	var items = $("input[name='ids']:checked");
	if($.param(items)=="" || $.param(items) == null){
		return;
	}
	var tempFn = function (){
		$.post(basepath+"/base/admin/xeroxuser/attend.xhtml", $.param(items), function (ret){
			if(ret.flag){
				flag = true;
				var html="<div style='width:300px;text-align:center;'>发送邀请成功！</div>";
				easyDialog.open({
					container : {
						header : '提示',
						content : html
					},
					autoClose : success_time,
					callback : function(){
						flag = true;
						page(1);
					}
				});
			} else{
				var html="<div style='width:300px;text-align:center;'>发送邀请失败！</div>";
				easyDialog.open({
					container : {
						header : '提示',
						content : html
					},
					autoClose : 1000
				});
			}
		});
	}
	
	if(items.length == 0){
		var html="<div style='width:300px;text-align:center;'>您没有选中任何记录！</div>";
		easyDialog.open({
			container : {
				header : '提示',
				content : html
			},
			autoClose : 1000
		});
	} else{
		var html="<div style='width:300px;height:50px;text-align:center;'>确定要邀请吗？</div>";
		easyDialog.open({
			container : {
				header : '提示',
				content : html,
				yesFn : tempFn,
				noFn : true
			}
		});
	}
	
}
/*var TableAdvanced = function () {
     var initTable2 = function() {
        var oTable = $('#sample_2').dataTable( {
        	 "bFilter": false,
        	 "bLengthChange": false,
        	 "bInfo":false,
        	 "aoColumnDefs": [ { "bSortable": false, "aTargets": [ 0] } ,
//        	                   { "bSortable": true, "aTargets": [ 1] } ,
//        	                   { "bSortable": true, "aTargets": [ 2] } ,
//        	                   { "bSortable": true, "aTargets": [ 3] } ,
//        	                   { "bSortable": false, "aTargets": [ 4] } ,
//        	                   { "bSortable": true, "bVisible": false, "aTargets": [ 5] } ,
//        	                   { "bSortable": true, "aTargets": [ 6] } ,
//        	                   { "bSortable": true, "bVisible": false, "aTargets": [ 7] } ,
//        	                   { "bSortable": true, "aTargets": [ 8] } ,
//        	                   { "bSortable": true, "aTargets": [ 9] } ,
//        	                   { "bSortable": true, "bVisible": false, "aTargets": [ 10] } ,
//        	                   { "bSortable": true, "bVisible": false, "aTargets": [ 11] } ,
//        	                   { "bSortable": true, "bVisible": false, "aTargets": [ 12] } ,
        	                   { "bSortable": false, "aTargets": [ 13] } 
        	 ],
            "aaSorting": [[1, 'asc']],
            "bPaginate":false,
//            "bStateSave": true,
//            "iDisplayLength": 10
//            ,"bStateSave": true
//            ,"aLengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]]
//            ,"fnServerData": myServiceData
            //"bProcessing": true,
//            "bServerSide": true,
//            "sPaginationType": "full_numbers",

//            "sAjaxSource": basepath + "/base/admin/user/list.xhtml",
           // "sAjaxSource": basepath + "/base/admin/user/list.xhtml",
            如果加上下面这段内容，则使用post方式传递数据
            "fnServerData": function ( sSource, aoData, fnCallback ) {
            $.ajax( {
            "dataType": 'json',
            "type": "POST",
            "url": sSource,
            "data": aoData,
            "success": fnCallback
            } );
            }
//            "oLanguage": {
//            "sUrl": "cn.txt"
//            },
//            "aoColumns": [
//            { "searchContent": $("#searchContent").val() },
//            { "gender": $("#gender").val() },
//            { "orgId": $("#orgId").val() }
//            ]//$_GET['sColumns']将接收到aoColumns传递数据

        });

        jQuery('#sample_2_wrapper .dataTables_filter input').addClass("form-control input-small"); // modify table search input
        jQuery('#sample_2_wrapper .dataTables_length select').addClass("form-control input-small"); // modify table per page dropdown
        jQuery('#sample_2_wrapper .dataTables_length select').select2(); // initialize select2 dropdown

        $('#sample_2_column_toggler input[type="checkbox"]').change(function(){
            var iCol = parseInt($(this).attr("data-column"));
            var bVis = oTable.fnSettings().aoColumns[iCol].bVisible;
            oTable.fnSetColumnVis(iCol, (bVis ? false : true));
        });
    }
    return {
        init: function () {
            if (!jQuery().dataTable) {
                return;
            }
            initTable2();
        }
    };
}();*/
/*function retrieveData( sSource, aoData, fnCallback, oSettings ) {    
    // 将客户名称加入参数数组  
//	if(current_page==null||current_page==""){
//		current_page=1;
//	}
//   aoData.push( { "name": "current_page", "value": current_page } );//添加自己的额外参数  
//     alert(aoData[0].name);  
     //alert(JSON.stringify(list));  
	oSettings.jqXHR = $.ajax({
        "dataType": 'json', 
        "type": "POST", 
        "url": sSource, 
        "dataType" : "json",
        "data": {
        	aoData : JSON.stringify(aoData),
        	"current_page":current_page
        	}, 
//        "success": fnCallback
        "success":function(data){
//        	alert(data.page.total_size);
        	var json = new Object();
        	json.sEcho="7";
        	json.iTotalRecords=data.page.total_size;
        	json.iTotalDisplayRecords=data.page.total_size;
        	json.aaData=data.list;
        	//var json = '{"iTotalRecords":"'+data.page.totalPage+'","iTotalDisplayRecords":"'+data.page.totalPage+'","aaData":'+data.list+'}"'
        	fnCallback(json);
        }
      } );    
}   */ 
//var TableAdvanced = function () {
//    var initTable2 = function() {
//       var oTable = $('#sample_2').dataTable({
//       	 "bFilter": false,
//       	 "bLengthChange": false,
////       	 "bInfo":false,
//         "aaSorting": [[1, 'asc']],
//         "bPaginate":true,
//         "bProcessing": true,
//         "bServerSide": true,
//         "sAjaxSource": basepath + "/base/admin/user/list.xhtml?rand="+Math.random(),
//         "fnServerData": retrieveData,
////         "sAjaxDataProp":"aaData",
//         
//         "aoColumns": [
////                       {"mData": '<label><div class="checker"><span><input name="ids" id="'+list.id+'" type="checkbox" value="'+list.id+'" /></span></div></label>'},
//						{
//							"mData": null,
//							"sDefaultContent": '<label><div class="checker"><span><input name="ids" type="checkbox"/></span></div></label>'
//										},
//						{"mData":"id"},
//						{"mData":"name"},
//						{"mData":"name"},
//						{"mData":"name"},
//						{"mData":"name"},
//						{"mData":"name"},
//						{"mData":"name"},
//						{"mData":"name"},
//						{"mData":"name"},
//						{"mData":"name"},
//						{"mData":"name"},
//						{"mData":"name"},
//						{
//							"mData": null,
//							"sDefaultContent": '<input name="ids" />'
//										}
//                       ],
//
//         "oLanguage": {
//        	 "sLengthMenu": "每页显示 _MENU_ 条记录",
//        	 "sZeroRecords": "抱歉， 没有找到",
//        	 "sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
//        	 "sInfoEmpty": "没有数据",
//        	 "sInfoFiltered": "(从 _MAX_ 条数据中检索)",
//        	 "oPaginate": {
//        	 "sFirst": "首页",
//        	 "sPrevious": "前一页",
//        	 "sNext": "后一页",
//        	 "sLast": "尾页"
//        	 }}
//       });
//       jQuery('#sample_2_wrapper .dataTables_filter input').addClass("form-control input-small"); // modify table search input
//       jQuery('#sample_2_wrapper .dataTables_length select').addClass("form-control input-small"); // modify table per page dropdown
//       jQuery('#sample_2_wrapper .dataTables_length select').select2(); // initialize select2 dropdown
//
//       $('#sample_2_column_toggler input[type="checkbox"]').change(function(){
//           var iCol = parseInt($(this).attr("data-column"));
//           var bVis = oTable.fnSettings().aoColumns[iCol].bVisible;
//           oTable.fnSetColumnVis(iCol, (bVis ? false : true));
//       });
//   }
//   return {
//       init: function () {
//           if (!jQuery().dataTable) {
//               return;
//           }
//           initTable2();
//       }
//   };
//}();


function showTable(page){
		
}
/*
 * 定义初始化table
 * */
//var oTable=$('#sample_2').dataTable({
//	"bLengthChange": false,
//	"bInfo":false,
//	"bPaginate":false,
//	"bFilter": false,
//	"bSort":false
//});

/*
 * 重新初始化datatables
 * */
function reinit_datatables(){
	$('#sample_2_column_toggler input[type="checkbox"]').each(function(){
		if($(this).parent().attr("class")=="checked"){
			var iCol = parseInt($(this).attr("data-column"));//定义第几列的编号
			$('#sample_2').find("tr").each(function(){
				$(this).find("td:nth-child("+iCol+"), th:nth-child("+iCol+")").show();
			});
		}else{
			var iCol = parseInt($(this).attr("data-column"));//定义第几列的编号
			$('#sample_2').find("tr").each(function(){
				$(this).find("td:nth-child("+iCol+"), th:nth-child("+iCol+")").hide();
			});
		}
	});
}

/*
 * 绑定隐藏功能
 * */
/*function bind_hiden(){
	$('#sample_2_wrapper .dataTables_filter input').addClass("form-control input-small"); // modify table search input
    $('#sample_2_wrapper .dataTables_length select').addClass("form-control input-small"); // modify table per page dropdown
    $('#sample_2_wrapper .dataTables_length select').select2(); // initialize select2 dropdown

    $('#sample_2_column_toggler input[type="checkbox"]').change(function(){
        var iCol = parseInt($(this).attr("data-column"));
        var bVis = oTable.fnSettings().aoColumns[iCol].bVisible;
        oTable.fnSetColumnVis(iCol, (bVis ? false : true));
    });
    
}*/
function bind_hidden(){
	$('#sample_2_column_toggler input[type="checkbox"]').change(function(){
		var o = $(this);
		var table= $('#sample_2');
		hidden_cloumn(o,table,flag);
	});
}
/*
 * 重写隐藏列方法
 * */

function hidden_cloumn(o,table,flag){
	var flags = $(o).is("checked");
	var iCol = parseInt($(o).attr("data-column"));//定义第几列的编号
	$(table).find("tr").each(function(){
		$(this).find("td:nth-child("+iCol+"), th:nth-child("+iCol+")").toggle();
	});
}

/**
 * 用户账号绑定情况导出
 */
function exportUser(fieldId){
	var html=[];
	var divId = "table_list";
	var banding = $("#banding").val();
	
	var attentionstatus = $("#attentionstatus").val();
	var order = getOrder(divId, fieldId);
	var max = $("#"+divId+" #page_max").val();
	$.ajax({
		type: "POST",
		url:  basepath+"/base/admin/xeroxuser/exportuser.json",
		data : {"gender":$("#gender").val(), "orgId":$("#orgId").val(), 
			"searchContent":$("#searchContent").val(),
			 "r":Math.random(),"banding":banding,
			"orderField":order.orderField, "orderDirection":order.orderDirection,"attentionstatus":attentionstatus },
		success:function(data){
			if (data.flag){
				html.push("<div style='width:300px;height:80px;text-align:center;'>");
				html.push("<div><span style='font-size: 14px;'>"+data.message+"</span></div>");
				html.push("<div><span class='btn btn-success'>");
				html.push("<a href='"+basepath+"/"+data.userexcelpath+"' style='color: white;text-decoration: none;'>点击下载</a>");
				html.push("</span></div></div>");
			}else{
				html.push("<div style='width:300px;height:80px;text-align:center;'>");
				html.push("<span style='font-size: 14px;'>"+data.message+"</span></div>");
			}
			
			easyDialog.open({
				  container : {
				    header : "提示",
				    content :html.join("")
				  },
				});
		},
		error: function(data){
			html.push("<div style='width:300px;height:80px;text-align:center;'>");
			html.push("<span style='font-size: 14px;'>"+data.message+"</span></div>");
			easyDialog.open({
				  container : {
				    header : "提示",
				    content :html.join("")
				  },
				autoClose : 3000
				});
		}
	}); 
}










