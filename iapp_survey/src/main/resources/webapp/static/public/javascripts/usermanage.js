
$(function (){
	page(1);
	bind_hidden();
});

var flag = true;
/**
 * 分页+搜索
 */
function page(i, isPart,fieldId) {
	flag = true;
	var divId = "table_list";
	var banding = $("#banding").val();
	
	var attentionstatus = $("#attentionstatus").val();
	var order = getOrder(divId, fieldId);
	var max = $("#"+divId+" #page_max").val();
	//AJAX提示
//	loading(divId);

	var data = {"gender":$("#gender").val(), "orgId":$("#orgId").val(), 
			"searchContent":$("#searchContent").val(),
			"page":i, "max":max, "r":Math.random(),"banding":banding,
			"orderField":order.orderField, "orderDirection":order.orderDirection,"attentionstatus":attentionstatus };
	var url = basepath+"/base/admin/user/list.list";
	$("#"+divId).load(encodeURI(url), data, function(){
		//reinit_datatables();
		App.initUniform();
		if(isPart&&(($("#searchContent").val())!=''))//isPart  按条件导出时导出按钮的样式
		{
			//alert(($("#searchContent").val())=='');
			$(".common_add").html('<i class="glyphicon glyphicon-plus">'+'</i>导出');
		}
		else if($("#orgId").val()!=$("#orgRootId").val())
		{
			$(".common_add").html('<i class="glyphicon glyphicon-plus">'+'</i>导出');
		}
		else if($("#gender").val()!='')
		{
			$(".common_add").html('<i class="glyphicon glyphicon-plus">'+'</i>导出');
		}
		else if($("#banding").val()!='-1')
		{
			$(".common_add").html('<i class="glyphicon glyphicon-plus">'+'</i>导出');
		}
		else if($("#attentionstatus").val()=='0' ||$("#attentionstatus").val()=='1'||$("#attentionstatus").val()=='-1')
		{
			$(".common_add").html('<i class="glyphicon glyphicon-plus">'+'</i>导出');
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
		  url:basepath+"/base/admin/user/cancelbind.json",
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
				  url:basepath+"/base/admin/user/forbidaccount.json",
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
				  url:basepath+"/base/admin/user/enableaccount.json",
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
	window.location.href = basepath+"/base/admin/user/updateuser.xhtml?id="+id;
}
/**
 * 新增用户
 */
function addUser(){
	window.location.href = basepath+"/base/admin/user/adduser.xhtml";
}

/**
 * 批量导入用户
 */
function batchUser(){
	window.location.href=basepath+"/base/admin/user/loadindex.xhtml";
}

/**
 * 返回列表页
 */
function backToList(){
	window.location.href = basepath + "/base/admin/user/usermanage.xhtml";
}

/**
 * 删除用户
 * @param id
 */
function deleteSingleInDetail(id){
	var tempFn = function (){
    	$.post(basepath+"/base/admin/user/delete.xhtml", {ids:id }, function (ret){
    		if(ret.flag){
    			var html="<div style='width:300px;text-align:center;'>删除成功！</div>";
    			easyDialog.open({
    				container : {
    				    header : '提示',
    					content : html
    				},
    				autoClose : 1000,
    				callback : function(){window.location.href = basepath+"/base/admin/user/usermanage.xhtml";}
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
    	$.post(basepath+"/base/admin/user/delete.xhtml", {ids:id }, function (ret){
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


$(".attentionstatus").find(".check_item").each(function(){
	$(this).click(function (){
		$(this).parent().find("li").removeClass("item_checked");
		$(this).addClass("item_checked");
		$("#attentionstatus").val($(this).find("input").val());
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
		$.post(basepath+"/base/admin/user/delete.xhtml", $.param(items), function (ret){
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


function showTable(page){
		
}

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
		data : {"gender":$("#gender").val(), "orgId":$("#orgId").val(), 
				"searchContent":$("#searchContent").val(),
				 "r":Math.random(),"banding":banding,
				"orderField":order.orderField, "orderDirection":order.orderDirection,"attentionstatus":attentionstatus },
		url:  basepath+"/base/admin/user/exportuser.json",
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



function attend(){
	var items = $("input[name='ids']:checked");
	if($.param(items)=="" || $.param(items) == null){
		return;
	}
	var tempFn = function (){
		$.post(basepath+"/base/admin/user/attend.xhtml", $.param(items), function (ret){
			if(ret.flag){
				flag = true;
				var html="<div style='width:300px;text-align:center;'>邀请请求发送成功！</div>";
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
				var html="<div style='width:300px;text-align:center;'>邀请失败！</div>";
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


var f = 0;
/**
 * 发送邮件
 * @param uids 发送用户ID，多个用户用英文逗号隔开
 * @param type 邮件类别，如0用户账号开通通知
 * @param tosendtime 定时发送时间，为空表示立即发送
 * @param remark 备注信息
 */
function sendEmail(){
	
	easyDialog.open({
		container : 'timedialog',
		fixed : false
	});
	
}


function addError(id){
	$("#con_"+id).addClass("has-error");
	$("#tip_"+id).removeClass("hidden");
}
function removeError(id){
	$("#con_"+id).removeClass("has-error");
	$("#tip_"+id).addClass("hidden");
}

function addEmail(){
	
	var sendtime = $("#sendtime").val();
	if(sendtime==null || sendtime==""){
		addError("sendtime");
		return;
	}else{
		removeError("sendtime");
	}
	
	var type = 0;
	var remark = "开通账号";
	if(f == 1){
		return;
	}
	f = 1;
	
	var $items = $("input[name='ids']:checked");
	if($.param($items)=="" || $.param($items) == null){
		showDialog("请选择用户");
		f = 0;
		return;
	}
	var uids = "";
	$items.each(function(){
		uids = uids + $(this).val()+",";
	});
	
	var yesBtn = function(){
		$.ajax({
			type:"POST",
			url:basepath+"/mgr/email/add.json",
			data:{"uids":uids,"type":type,"tosendtime":sendtime,"remark":remark},
			success:function(data){
				f = 0;
				if(data == "1"){
					showDialog("提交成功，请去邮件发送管理内查看");
				} else if(data == "2"){
					showDialog("发送参数不完整，提交失败");
				} else if(data == "3"){
					showDialog("邮件模板不存在，提交失败");
				} else if(data == "4"){
					var html="<div style='width:350px;text-align:center;'>提交失败,未设置服务邮箱</div><div style='width:350px;text-align:center;'>请在\"系统管理－>企业配置－>邮件配置\"内设置</div>";
					easyDialog.open({
						container : {
						    header : '提示',
							content : html
							,yesFn : function (){return true; }
						}
					});
				}else {
					showDialog("提交失败,请重新尝试");
				}
			},
			error:function(date){
				f = 0;
				showDialog("提交失败,请重新尝试");
			}
		});
	}
	var htmll="<div style='width:350px;text-align:center;'>确定提交发送邮件吗？</div>";
	easyDialog.open({
		container : {
		    header : '提示',
			content : htmll,
			yesFn : yesBtn,
			noFn : function(){f=0;return true;}
		}
	});
	
}

function showDialog(msg){
	$("#easyDialogcontent").html(msg);
	easyDialog.open({
		container : 'dialogbank',
		fixed : false
	});
}


function toemail(){
	window.location.href=basepath+"/mgr/email/index.xhtml";
}

