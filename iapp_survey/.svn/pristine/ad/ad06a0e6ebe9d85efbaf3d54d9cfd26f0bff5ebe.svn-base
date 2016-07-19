$(function (){
	page(1);
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
	var data = {"page":i, "max":max, "r":Math.random()};
	var url = basepath+"/mgr/include/keywordsrulelist.list";
	$("#"+divId).load(encodeURI(url), data, function(){
//		App.initUniform();//加载复选框样式
	});
	
}

/** 添加 */
function insertEntity(){
	window.location.href = basepath+"/mgr/ixin/power/add.xhtml";
}

/** 详情 */
function detailEntity(id){
	window.location.href = basepath+"/mgr/ixin/power/detail.xhtml?id="+id;
}

/** 修改 */
function updateEntity(id){
	window.location.href = basepath+"/mgr/ixin/power/update.xhtml?id="+id;
}

/** 图文消息 */
function detailMatter(id){
	window.location.href = basepath+"/mgr/ixin/power/update.xhtml?id="+id;
}

/**
 * 返回列表页
 */
function backToList(){
	window.location.href = basepath + "/mgr/ixin/power/index.xhtml";
}

/**
 * 详情页中删除
 * @param id
 */
function deleteSingleInDetail(id){
	var tempFn = function (){
    	$.post(basepath+"/mgr/ixin/power/delete.xhtml", {id:id }, function (ret){
    		if(ret.flag){
    			var html="<div style='width:300px;text-align:center;'>"+ret.message+"</div>";
    			easyDialog.open({
    				container : {
    				    header : '提示',
    					content : html
    				},
    				autoClose : success_time,
    				callback : function(){window.location.href = basepath+"/mgr/ixin/power/index.xhtml";}
    			});
    		} else{
				var html="<div style='width:400px;text-align:center;'>"+ret.message;
				var failNames = "";
				/*for(var i=0;i<ret.failList.length;i++){
					var s = ret.failList[i];
					if(i!=ret.failList.length-1){
						failNames+= $("#name_"+s).text()+"<br>";
					} else{
						failNames+= $("#name_"+s).text();
					}
				}*/
				html += failNames+"</div>";
    			easyDialog.open({
    				container : {
    				    header : '提示',
    					content : html
    					,yesFn : function (){
    						return true;
    					}
    				}
//    				,autoClose : fail_msg_time
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
 * 单个删除
 * @param id
 */
function deleteSingle(id){
	var tempFn = function (){
    	$.post(basepath+"/mgr/ixin/power/delete.xhtml", {id:id }, function (ret){
    		if(ret.flag){
    			var html="<div style='width:300px;text-align:center;'>"+ret.message+"</div>";
    			easyDialog.open({
    				container : {
    				    header : '提示',
    					content : html
    				},
    				autoClose : success_time,
    				callback : function(){page(1);}
    			});
    		} else{
				var html="<div style='width:400px;text-align:center;'>"+ret.message;
				var failNames = "";
				/*for(var i=0;i<ret.failList.length;i++){
					var s = ret.failList[i];
					if(i!=ret.failList.length-1){
						failNames+= $("#name_"+s).text()+"<br>";
					} else{
						failNames+= $("#name_"+s).text();
					}
				}*/
				html += failNames+"</div>";
    			easyDialog.open({
    				container : {
    				    header : '提示',
    					content : html
    					,yesFn : function (){
    						return true;
    					}
    				}
//    				,autoClose : fail_msg_time
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
 * 批量删除
 */
function deleteGroup(){
	var items = $("input[name='ids']:checked");
	var tempFn = function (){
		$.post(basepath+"/mgr/ixin/power/delete.xhtml", $.param(items), function (ret){
			if(ret.flag){
				var html="<div style='width:300px;text-align:center;'>"+ret.message+"</div>";
				easyDialog.open({
					container : {
					    header : '提示',
						content : html
					},
					autoClose : success_time,
					callback : function(){
						page(1);
					}
				});
			}
			else{
				var html="<div style='width:400px;text-align:center;'>"+ret.message;
				var failNames = "";
				if(items.length > 1){
					for(var i=0;i<ret.failList.length;i++){
						var s = ret.failList[i];
						if(i!=ret.failList.length-1){
							failNames+= $("#name_"+s).text()+"<br>";
						} else{
							failNames+= $("#name_"+s).text();
						}
					}
				}
				html += failNames+"</div>";
				easyDialog.open({
    				container : {
    				    header : '提示',
    					content : html
    					,yesFn : function (){
    						if(ret.sucNO > 0){
    							page(1);
    						}
    						return true;
    					}
    				}
//    				,autoClose : fail_msg_time
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
			autoClose : warn_time
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

/**
 * 全部选中
 */
function checked_all(obj){
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
function insertTextNews(){
	var html = [];
	html.push('<div style="width:500px;height:130px;">');
	html.push('	<div class="form-group" id="con_AppId">');
	html.push('		<textarea rows="6" id="msg" onblur="nameValidate(this)" cols="70"></textarea>');
	html.push('		<span id="tip_msg" class="help-block hidden">文本不能为空！</span>');
	html.push('	</div>');
	html.push("</div>");
	easyDialog.open({
	  container : {
	    header : '创建文本消息',
	    content : html.join(""),
	    yesFn : btnFn,
	    noFn : true

	  }
	});
}
function btnFn(){
	if(!nameValidate($("#msg"))){
		addError("msg");
		return false;
	}
	var msgVal = $('#msg').val();
	$.ajax({
		type: "POST",
		url:  basepath+"/mgr/fodder/saveattresp.xhtml",
		data: {"content":msgVal,"type":"text"},
		success:function(data){
			location=basepath+"/mgr/ixin/power/index.xhtml?a=fodder";
		},
		error: function(data){
			alert('保存失败');
		}
	});
}

function nameValidate(obj){
	if($.trim($(obj).val()) != ""){
		removeError($(obj).attr("id"));
		return true;
	}else{
		addError($(obj).attr("id"));
		return false;
	}
}
function addError(id){
	$("#con_"+id).addClass("has-error");
	$("#tip_"+id).removeClass("hidden");
}
function removeError(id){
	$("#con_"+id).removeClass("has-error");
	$("#tip_"+id).addClass("hidden");
}

function insertFodder(){
	location=basepath+"/mgr/fodder/add.xhtml?columnType=respNews"
}

function attResp(){
	$.get(basepath+"/mgr/include/getrespmsg.xhtml",function(data){
		if(data.extType=='fodder'){
			$('#attRespCreateBotton').css({"display":"none"});
			var innerHtmlBody = new Array();
			innerHtmlBody.push('<div class="clo-lg-4 ixin_item ">');
			innerHtmlBody.push('<div class="appmsg ">');
			innerHtmlBody.push('<div class="appmsg_content">');
			innerHtmlBody.push('<h4 class="appmsg_title">');
			innerHtmlBody.push('<h4 class="appmsg_title">');
			innerHtmlBody.push('<a href="'+basepath+'/protal/fodder/detail.xhtml?id='+data.id+'" target="other">'+data.title+'</a>');
			innerHtmlBody.push('</h4>');
			innerHtmlBody.push('<div class="appmsg_info">');
			innerHtmlBody.push('<em class="appmsg_date">');
			var dateObj = new Date(data.modifyTime);
			innerHtmlBody.push(dateObj.Format("yyyy/MM/dd"));
			innerHtmlBody.push('</em>');
			innerHtmlBody.push('</div>');
			innerHtmlBody.push('<div class="appmsg_thumb_wrp">');
			innerHtmlBody.push('<img src="'+qiniuImageBasePath+data.coverPath+coverSuffix+'" alt="" class="appmsg_thumb">');
			innerHtmlBody.push('</div>');
			innerHtmlBody.push('<p class="appmsg_desc">');
			innerHtmlBody.push($.trim(data.summary)!=""?data.summary:data.content);
			innerHtmlBody.push('</p>');
			innerHtmlBody.push('</div>');
			innerHtmlBody.push('<div class="appmsg_opr">');
			innerHtmlBody.push('<ul>');
			innerHtmlBody.push('<li class="appmsg_opr_item with2">');
			innerHtmlBody.push('<a class="js_edit" href="javascript:void(0);" onclick="detail(\''+data.id+'\');">');
			innerHtmlBody.push('<i class="icon18_common edit_gray">编辑</i>');
			innerHtmlBody.push('</a>');
			innerHtmlBody.push('</li>');
			innerHtmlBody.push('<li class="appmsg_opr_item with2 no_extra">');
			innerHtmlBody.push('<a class="js_del no_extra" data-id="10001081" href="javascript:void(0);" onclick="del(\''+data.ext1+'\')">');
			innerHtmlBody.push('<i class="icon18_common del_gray">删除</i>');
			innerHtmlBody.push('</a>');
			innerHtmlBody.push('</li>');
			innerHtmlBody.push('</ul>');
			innerHtmlBody.push('</div>');
			innerHtmlBody.push('</div>');
			innerHtmlBody.push('</div>');
			
			$('#AttMsgBody').html(innerHtmlBody.join(''));
		}else if(data.extType == 'text'){
			$('#attRespCreateBotton').css({"display":"none"});
			$('#AttMsgBody').html(data.content+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="del(\''+data.ext1+'\')">删除</a>');
		}
		//console.debug(JSON.stringify(data));
	});
	
}

Date.prototype.Format = function(fmt)   
{ //author: meizz   
  var o = {   
    "M+" : this.getMonth()+1,                 //月份   
    "d+" : this.getDate(),                    //日   
    "h+" : this.getHours(),                   //小时   
    "m+" : this.getMinutes(),                 //分   
    "s+" : this.getSeconds(),                 //秒   
    "q+" : Math.floor((this.getMonth()+3)/3), //季度   
    "S"  : this.getMilliseconds()             //毫秒   
  };   
  if(/(y+)/.test(fmt))   
    fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));   
  for(var k in o)   
    if(new RegExp("("+ k +")").test(fmt))   
  fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
  return fmt;   
}  

function detail(id){
	location = basepath+"/mgr/fodder/update.xhtml?id="+id+"&columnType=respNews";
}
function del(attId){
	$.post(basepath+"/mgr/ixin/power/delattresp.xhtml",{"attId":attId},function(){
		$('#attRespCreateBotton').css({"display":"block"});
		$('#AttMsgBody').html("");
	});
}










