function loading(id){
	$("#"+id).prepend('<section class="loading" id="loading" class="loading"><i class="icon-2x icon-spinner icon-spin"></i></section>');
}
function hideLoading(){
	$("#loading").hide();
}
function page(i){
	loading("table_list");
	var search = $.trim($("#searchContent").val());
	$('#table_list').load(basepath+"/mgr/include/voteactivitylist.xhtml?page="+i+"&search="+search);
}

$(document).ready(function(){
	page(1);
});	

var flag = false;
function showMsgDialog(content){
	easyDialog.open({
        container : {
            header : '提示',
            content : '<div style="background-color: #ffffff;width:260px;height:20px;text-align:center;">'+content+'</div>'
        },
        autoClose:1200
    });
}

/** 自动关闭的弹出框 */
function autoDialog(msg,time,callback,param){
	var html="<div style='width:350px;text-align:center;'>"+msg+"</div>";
	easyDialog.open({
		container : {
		    header : '提示',
			content : html
		},
		autoClose : time,
		callback : function(){
			if(null != callback){
				if(param != null){
					callback(param);
				} else {
					callback();
				}
			}
		}
	});
}

var voteActivityId = "";
var btnFn = function(){
	$.ajax({
		type: "POST",
		url:  basepath+"/mgr/voteactivity/del.json",
		data: {"id":voteActivityId},
		success:function(data){
			page(1);
			return true;
		},
		error: function(data){
			alert('删除失败');
		}
	});
	
};
/**
 * 删除调研活动
 * @param id
 */
function delVoteActivity(id){
	voteActivityId = id;
	var html = '<div style="width:350px;height:70px;text-align:center;"><h3>您确定要删除么？</h3></div>';
	easyDialog.open({
	    container : {
	    	header : '提示',
	    	content : html,
	    	yesFn : btnFn,
	    	noFn : true
	    }
	});
}

/**
 * 向上排序的操作
 */
function up(vid,weight,i){
	upateWeight(vid,weight,'up',i);
}
/**
 * 向下排序的操作
 */
function down(vid,weight,i){
	upateWeight(vid,weight,'down',i);
}

function upateWeight(vid,weight,upOrDown,i){
	$.ajax({
		type: "POST",
		url:  basepath+"/mgr/voteactivity/upateweight.json",
		data: {"vid":vid,"weight":weight,'upOrDown':upOrDown},
		//contentType: "application/json; charset=utf-8",
		success:function(data){
			page(i);
		}
		
	});
}

function insertEntity(){
	location = basepath+"/mgr/voteactivity/add.xhtml";
}

/**
 * 发布/取消发布
 * @param id
 * @param status
 */
function updaterelease(id,status){
	var url=basepath+"/mgr/voteactivity/updaterelease.json";
	var op = "发布";
	if(status == 0){
		op = "取消发布";
	}
	$.ajax({
	  type:"post",
	  url:url,
	  data:{"id":id,"status":status},
	  success:function(data){
		  if(data){
			  if(status == 1){
				  autoDialog("系统正在生成调研问卷，请耐心等候1~2分钟后刷新本页面",2500,page,1); 
			  } else {
				  autoDialog(op+"成功",1500,page,1);
			  }
		  } else{
			  showMsgDialog("操作失败"); 
		  }
	  },
	  error: function(date){
		  showMsgDialog("网络异常"); 
	  }
	});
}

function updateshowresult(id,status){
	var url=basepath+"/mgr/vote/updateshowresult.json";
	$.ajax({
		  type:"post",
		  url:url,
		  data:{"id":id,"status":status},
		  success:function(data){
			  if(data){
				  showMsgDialog("操作成功"); 
			  page(1);
			  } 
			  },
		  error: function(data){
			  showMsgDialog("操作失败"); 
			  }
		});
}

