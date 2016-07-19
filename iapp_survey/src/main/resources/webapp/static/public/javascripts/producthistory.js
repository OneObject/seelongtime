$(function (){
	page(1);
});

/**
 * 分页+搜索
 */
function page(i) {
	var divId = "table_list";
	var max = $("#"+divId+" #page_max").val()
	
	//AJAX提示
	loading(divId);
	var data = {"page":i, "max":max, "r":Math.random(), 
			"pid":$("#pid").val()};
	var url = basepath+"/base/admin/product/historylist.list";
	$("#"+divId).load(encodeURI(url), data, function(){
		App.initUniform();
	});
}

/**添加*/
function add(){
	$("#dialog_title").text("添加变更");
	$("#btn_con .btn").hide();
	$("#btn_add").show();
	$("#btn_cancel").show();
	
	$("#no").val("");
	$("#content").val("");
	var now = new Date(); 
	var nowStr = now.format("yyyy-MM-dd hh:mm"); 
	$("#timestamp").val(nowStr);
	
	$("#no").removeAttr("readonly");
	$("#content").removeAttr("readonly");
	
	easyDialog.open({
		container : 'dialogbank',
		fixed : false
	});
}


/**
 * 添加题库提交
 */
function submit_add(){
	if(!nameValidate("no") || !v_content() || !nameValidate("timestamp") || !nameValidate("content")){
		return;
	}
	$.post(basepath+"/base/admin/product/savehistory.json", {"pid":$("#pid").val(),"no":$("#no").val(),"timestr":$("#timestamp").val(), "content":$("#content").val()}, function (ret){
		var html="<div style='width:300px;text-align:center;'>"+ret.message+"</div>";
		if(ret.flag){
			easyDialog.open({
				container : {
					header : '提示',
					content : html,
				},
				autoClose : success_time,
				callback : function(){page(1);}
			});
		} else{
			easyDialog.open({
				container : {
				    header : '提示',
					content : html
					,yesFn : function (){
						return true;
					}
				}
//				,autoClose : fail_msg_time
			});
		}
	});
}

/**
 * 修改
 */
function update(no, content, id,timestamp){
	$("#dialog_title").text("修改变更");
	$("#btn_con .btn").hide();
	$("#btn_update").show();
	$("#btn_cancel").show();
	
	$("#no").val(no);
	$("#content").val(content);
	$("#timestamp").val(timestamp);
	$("#id").val(id);

	$("#no").removeAttr("readonly");
	$("#content").removeAttr("readonly");
	
	  easyDialog.open({
		  container : 'dialogbank',
		  fixed : false
		});
}

/**
 * 修改
 */
function submit_update(){
	if(!nameValidate("no") || !v_content() || !nameValidate("timestamp") || !nameValidate("content")){
		return;
	}
	$.post(basepath+"/base/admin/product/savehistory.json", {"id":$("#id").val(),"pid":$("#pid").val(),"no":$("#no").val(),"timestr":$("#timestamp").val(), "content":$("#content").val()}, function (ret){
		var html="<div style='width:300px;text-align:center;'>"+ret.message+"</div>";
		if(ret.flag){
			easyDialog.open({
				container : {
					header : '提示',
					content : html,
				},
				autoClose : success_time,
				callback : function(){page(1);}
			});
		} else{
			easyDialog.open({
				container : {
				    header : '提示',
					content : html
					,yesFn : function (){
						return true;
					}
				}
//				,autoClose : fail_msg_time
			});
		}
	});
}

/**
 * 输入验证
 * @returns {Boolean}
 */
function nameValidate(id){
	if(isBlank($("#"+id).val())){
		addError(id);
		return false;
	} else{
		removeError(id);
		return true;
	}
}
function v_content(){
	var max = $("#maxLength").text();
	if($("#content").val().length > max){
		addError("content");
		return false;
	} else{
		removeError("content");
		return true;
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

/**
 * 单个删除
 * @param id
 */
function deleteSingle(id){
	var tempFn = function (){
    	$.post(basepath+"/base/admin/product/deletehistory.xhtml", {id:id }, function (ret){
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
				var html="<div style='width:400px;text-align:center;'>"+ret.message+"</div>";
				/*var failNames = "";
				for(var i=0;i<ret.failList.length;i++){
					var s = ret.failList[i];
					if(i!=ret.failList.length-1){
						failNames+= $("#name_"+s).text()+"<br>";
					} else{
						failNames+= $("#name_"+s).text();
					}
				}
				html += failNames+"</div>";*/
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


Date.prototype.format = function(format){ 
	var o = { 
	"M+" : this.getMonth()+1, //month 
	"d+" : this.getDate(), //day 
	"h+" : this.getHours(), //hour 
	"m+" : this.getMinutes(), //minute 
	"s+" : this.getSeconds(), //second 
	"q+" : Math.floor((this.getMonth()+3)/3), //quarter 
	"S" : this.getMilliseconds() //millisecond 
	} 

	if(/(y+)/.test(format)) { 
	format = format.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
	} 

	for(var k in o) { 
	if(new RegExp("("+ k +")").test(format)) { 
	format = format.replace(RegExp.$1, RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length)); 
	} 
	} 
	return format; 
} 
























