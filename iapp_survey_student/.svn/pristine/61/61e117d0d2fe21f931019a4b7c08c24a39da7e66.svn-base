//删除回答信息
function delanswer(answerid,questionid){
var url=basepath+"/iask/answer/delanswer";
	if(!confirm("确定要删除吗？")){
		return ;
	}
	$.ajax({
		type:"post",
		url:url,
		data:{id:answerid},
		dataType:"json",
		success:function(data){
			 if(data){
                 alert("删除成功！");
                 window.location.href=basepath+"/iask/question/detail?id="+questionid;
                 return;
			 }else{
			 alert("删除失败！");
			 return;
			 }
		}
});
}
//最佳答案
function bestanswer(answerid){
	var url=basepath+"/iask/answer/bestanswer";
	$.ajax({
		type:"post",
		url:url,
		data:{id:answerid},
		dataType:"json",
		success:function(data){
			if(data){
				alert("设置成功");
				$("#bestanswer_"+answerid).hide();
				$("#best_"+answerid).html("最佳答案");
				return;
			}else{
				alert("设置失败");
				return;
			}
		}
	});
	
}

