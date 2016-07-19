/*
 * @author yubo
 * @time 2013-10-11
 * 这个插件式基于bootstrap的分页样式写成的分页功能,至于样式看bootstrap中文网
 * http://v3.bootcss.com/components/#pagination
 */
/*
 * 功能说明,这个版本里面只能是做一个简单的分页,更多功能后续再加
 * 参数说明：
 * current_page:当前页面,1,2,3,4····
 * count_page:总页数,10,20`````
 * before_count:前面显示几个：
 * after_count:后面显示几个
 * 默认的情况下,少于十页全部显示,多于10页,前面显示4页,后面显示4页,中间的都是省略号···· 
 * fun_name:获取数据的方法名（字符串类型）
 * where_id：显示位置的id
 * 需要先在页面上面写一个容器<div class="pagination" id="tab2cutpage"></div>
 * id是唯一的,如果你的页面上面有两个以上的分页,哪么这个就有作用了。
 */

var currentPage = 0;
var countPage = 0;
var beforeCount= 0;
var afterCount = 0;
var funtionName='';
var whereId = '';

function sallon_cutpage(current_page,count_page,before_count,after_count,fun_name,where_id){
	sallon_format_data(current_page,count_page,before_count,after_count,fun_name,where_id);
	if(countPage >1){
		sallon_write_html();
	}
	sallon_add_class();
}
function sallon_write_html(){
	var html = [];
	if(currentPage <= 1){
		html.push("<li title='上一页'><a href='javascript:void(0);'>&laquo;</a></li>");
	}else{
		html.push("<li title='上一页'><a href='javascript:"+funtionName+"("+(currentPage-1)+");'>&laquo;</a></li>");
	}
	if(countPage <=10){
		//总页数小于10页
		for(i=1;i<=countPage;i++){
			html.push('<li><a href=\'javascript:'+funtionName+'('+i+')\'>'+i+'</a></li>');
		}
	}else if(countPage>10){//beforeCount == 4 && afterCount == 4
		//大于10页
		for(i=1;i<=beforeCount;i++){
			html.push('<li><a href=\'javascript:'+funtionName+'('+i+')\'>'+i+'</a></li>');
		}
		html.push('<li><span>······</span></li>');
		for(i=(countPage-afterCount);i<=afterCount;i++){
			html.push('<li><a href=\'javascript:'+funtionName+'('+i+')\'>'+i+'</a></li>');
		}
	}
	if(currentPage >= countPage){
		html.push("<li title='下一页'><a href='javascript:void(0);'>&raquo;</a></li>");
	}else{
		html.push("<li title='下一页'><a href='javascript:"+funtionName+"("+(currentPage+1)+");'>&raquo;</a></li>");
	}
	$("#"+whereId).html(html.join(""));
}
/*
 * 得到当前页，添加相对应的样式
 * */
function sallon_add_class(){
	if(currentPage<=1){
		$("#"+whereId).find("li:first").attr("style","color:#999;");
	}
	if(currentPage >= countPage){
		$("#"+whereId).find("li:last").attr("style","color:#999;");
	}
	$("#"+whereId).find("li:nth-child("+(currentPage+1)+")").addClass("active");
	
}
//格式化参数
function sallon_format_data(current_page,count_page,before_count,after_count,fun_name,where_id){
	//上面的参数都是必须的,如果你给的参数不够就会报错
	currentPage = parseInt(current_page);
	countPage = parseInt(count_page);
	if(before_count == 0){
		beforeCount = 4
	}else{
		beforeCount = parseInt(before_count);
	}
	if(after_count == 0){
		afterCount = 4
	}else{
		afterCount = parseInt(after_count);
	}
	funtionName=fun_name;
	whereId = where_id;
}
