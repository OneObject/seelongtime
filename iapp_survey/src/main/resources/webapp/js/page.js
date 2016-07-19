// curr_index, 当前页码. 
// page_count, 当前的数据的总页数.
// page_size 每页条数
// total  总条数
// callbackName 回调函数名
function showPage(curr_index,page_count,page_size,total,callbackName , divid){
	
	if(page_count==1){
		return ;
	}
	// $start, 显示时的起始页码.
	// $end, 显示时的终止页码.
	// $link_count, 链接数量.
	if (callbackName==null){
		callbackName="goPageTest";
	}
	var link_count = 7;
	
	start = Math.max(1, curr_index  - parseInt(link_count/2));
	end = Math.min(page_count, start + link_count - 1);
	start = Math.max(1, end - link_count + 1);	
	//alert(start + " " +end);
	var html = [];
	html.push('<ul class="pagination">');
	if(start>1){
		html.push('<li><a href="javascript:'+callbackName+'(1,'+page_size+')">1</a></li>');
	}
	if (start>2) {
		html.push('<li class="disable"><a href="#">...</a></li>');
	}
	for (var i = start; i <= end; i++) {
		if(i==curr_index){
			html.push('<li class="active"><a href="#">'+curr_index+'</a></li>');
		}else{
			html.push('<li><a href="javascript:'+callbackName+'('+i+','+page_size+')">'+i+'</a></li>');
		}		
	}

	if(end+1<page_count){
		html.push('<li class="disable"><a href="#">...</a></li>');
	}

	if(end<page_count){
		html.push('<li><a href="javascript:'+callbackName+'('+page_count+','+page_size+')">'+page_count+'</a></li>');
	}
	
		
	html.push('</ul>');
	$("#"+divid).html(html.join(""));
 
}

function goPageTest (pageNum,pageSize) {
	// body...
	alert(pageNum + " " +pageSize);
}