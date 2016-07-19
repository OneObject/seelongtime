//得到问题详情
function detail(questionid){
	$("#titlename_"+questionid).attr("href",basepath+"/iask/question/detail.xhtml?id="+questionid);
}
//删除问题
function del(questionid){
	var url=basepath+"/iask/question/delete.xhtml";
	
	if(!confirm("确定要删除吗？")){
		return ;
	}
	$.ajax({
		type:"post",
		url:url,
		data:{id:questionid},
		dataType:"json",
		success:function(data){
			 if(data){
                 alert("删除成功！");
                 window.location.href=basepath+"/iask/question/list.xhtml";
                 return;
			 }else{
			 alert("删除失败！");
			 return;
			 }
		}
});
}