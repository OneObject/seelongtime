var editor;
KindEditor.ready(function(K) {
	editor = K.create('textarea[name="supplement"]', {
		resizeType : 0,
		allowPreviewEmoticons : false,
		allowImageUpload : false,
		items : [ 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor',
				'bold', 'italic', 'underline', 'removeformat', '|',
				'justifyleft', 'justifycenter', 'justifyright',
				'insertorderedlist', 'insertunorderedlist', '|', 'emoticons',
				'image', 'link' ]
	});
});
/*
 * 赞和踩
 */
function iask_zan(obj,id){
	var flag = $("#zan_"+id).val();
	var view = 0;
	if(flag=="true"){
		view = 1;
	}else{
		view = 2;
	}
	$.ajax({
		type:"POST",
		url:basepath+"/iask/answer/review.xhtml",
		data:{"id":id,"view":view},//1 赞同 2取消赞同 3反对 4 取消反对
		success:function(data){//data==agreeNum
			if(data!=-1){
				if(flag =="true"){
					$(obj).addClass("zan_active");
					$(obj).next().next().removeClass("cai_active");
					$(obj).html(data);
					$("#zan_"+id).val("false");
					$("#cai_"+id).val("true");
				}else{
					$(obj).removeClass("zan_active");
					$(obj).next().next().removeClass("cai_active");
					$(obj).html(data);
					$("#zan_"+id).val("true");
				}
			}else{
				alert("对不起投票失败！");
			}
		}
	});
}
function iask_cai(obj,id){
	var flag = $("#cai_"+id).val();
	var view = 0;
	if(flag =="true"){
		view = 3;
	}else{
		view = 4;
	}
	$.ajax({
		type:"POST",
		url:basepath+"/iask/answer/review.xhtml",
		data:{"id":id,"view":view},//1 赞同 2取消赞同 3反对 4 取消反对
		success:function(data){//data==agreeNum
			if(data!=-1){
				if(flag == "true"){
					$(obj).addClass("cai_active");
					$(obj).prev().prev().html(data);
					$(obj).prev().prev().removeClass("zan_active");
					$("#cai_"+id).val("false");
					$("#zan_"+id).val("true");
				}else{
					$(obj).removeClass("cai_active");
					$(obj).prev().prev().html(data);
					$(obj).prev().prev().removeClass("zan_active");
					$("#cai_"+id).val("true");
				}
			}else{
				alert("对不起投票失败！");
			}
		}
	});
}
//打开评论
function open_rfr(id){
	//alert(id);
	$.ajax({
		type:"GET",
		url:basepath+"/iask/comment/listbysid.xhtml",
		data:{"sid":id},
		success:function(data){
//			alert(JSON.stringify(data));
			var html=[];
			for(i=0;i<data.length;i++){
				html.push('<li>');
				html.push('<div class="one_rfr">');
				html.push('<span class="rfr_name">'+data[i].author_name+'</span>');
				/*html.push('<span class="huifumuren">&nbsp;&nbsp;回复&nbsp;&nbsp;</span>');
				html.push('<span class="rfr_name">'+data[i].source_author_name+'</span>');*/
				/*<time class="timeago" datetime="${ltfun:dateLongToStringFormat(entity.entityMetaInfo.dateCreated,'yyyy-MM-dd hh:mm:ss') }"></time>*/
				html.push('<span class="rfr_time"><time class="timeago" datetime="'+getFormatDateByLong(data[i].entityMetaInfo.dateCreated, "yyyy-MM-dd hh:mm:ss")+'"></time></span>');
				html.push('<div class="rfr_content">'+data[i].content+'</div>');
				html.push('</div></li>');
				html.push('<li><hr></li>');
			}
			$("#rfr_"+id).find(".rfr_list").html(html.join(""));
			$('.timeago').timeago('refresh');
		}
	});
	$("#rfr_"+id).slideToggle();
}

/**
 * 提交对评论的回复
 */
function replay_to_comment(id){
	var source_id = id;
	var content = $("#rfr_"+id).find("input[type='text']").val();
	if(content == ""){
		alert("评论内容不能为空！");
		$("#rfr_"+id).focus();
		return;
	}
	var is_comment_theme = false;
	var source_author_id =$("#rfr_"+id).find(".authorid").val();
	var source_author_name =$("#rfr_"+id).find(".authorname").val();
	$.ajax({
		type:"post",
		url:basepath+"/iask/comment/add.xhtml",
		data:{"source_id":source_id,"content":content,"is_comment_theme":is_comment_theme,"source_author_id":source_author_id,"source_author_name":source_author_name},
		success:function(data){
			var html=[];
			html.push('<li>');
			html.push('<div class="one_rfr">');
			html.push('<span class="rfr_name">'+data.author_name+'</span>');
			/*html.push('<span class="huifumuren">&nbsp;&nbsp;回复&nbsp;&nbsp;</span>');
			html.push('<span class="rfr_name">'+data.source_author_name+'</span>');*/
			/*<time class="timeago" datetime="${ltfun:dateLongToStringFormat(entity.entityMetaInfo.dateCreated,'yyyy-MM-dd hh:mm:ss') }"></time>*/
			html.push('<span class="rfr_time"><time class="timeago" datetime="'+getSmpFormatDate(new Date(data.entityMetaInfo.dateCreated), true)+'"></time></span>');
			html.push('<div class="rfr_content">'+data.content+'</div>');
			html.push('</div></li>');
			html.push('<li><hr></li>');
			$("#rfr_"+id).find(".rfr_list").append(html.join(""));
			$("#rfr_"+id).find("input[type='text']").val("");
			$('.timeago').timeago('refresh');
		}
	});
}
/*删除对原问题的回答*/
function delete_answer(id){
	if(!confirm("确定要删除该回答吗？")){
		return;
	}
	$.ajax({
		type:"post",
		url:basepath+"/iask/answer/delete.xhtml",
		data:{"id":id},
		success:function(data){
			if(data){
				//删除成功
				alert("删除成功");
				$(".one_"+id).attr("style","display:none;");
			}else{
				//删除不成功
				alert("对不起，删除回答失败！");
			}
		}
	});
}
//对问题进行回答
$("#replay_submit").click(function(){
	var question_id = $("input[name='question_id']").val();
	var content = editor.html();
	if(content == ""){
		alert("回答内容不能为空！");
		editor.focus();
		return;
	}
	$.ajax({
		type:"post",
		url:basepath+"/iask/answer/add.xhtml",
		data:{"question_id":question_id,"content":content},
		success:function(data){
			var html = [];
			html.push('<li class="one_'+data.id+'"><!-- 一条回复信息 -->');
			html.push('<ul class="one_replay">');
			html.push('<li><span class="zan" onclick="javascript:iask_zan('+data.id+');">'+data.agree_num+'</span>');
			html.push('<span class="cai" onclick="javascript:iask_cai('+data.id+');"></span></li>');
			html.push("<li>");
			html.push('<div class="replay_for_quondam">');
			if(data.author_name == null || data.author_name =="null"){
				html.push('<span class="replayer_name"></span>')
			}else{
				html.push('<span class="replayer_name">'+data.author_name+'</span>')
			}
			html.push('<div class="replay_content">'+data.content+'</div>');
			html.push('<div class="replay_detail">');
			/*<time class="timeago" datetime="${ltfun:dateLongToStringFormat(entity.entityMetaInfo.dateCreated,'yyyy-MM-dd hh:mm:ss') }"></time>*/
			html.push('<span class="replay_time"><time class="timeago" datetime="'+getSmpFormatDate(new Date(data.entityMetaInfo.dateCreated), true)+'"></time></span>');
			html.push('<span class="glyphicon glyphicon-comment iask_color_green iask_mr5 iask_ml5"></span>');
			html.push('<span class="replay_btn" onclick="open_rfr(\''+data.id+'\')">评论('+data.comment_num+')</span>');
			html.push('<span onclick="delete_answer(\''+data.id+'\')" class="replay_btn"><i class="glyphicon glyphicon-trash iask_color_green iask_mr5 iask_ml5"></i>删除</span>');
			//对评论回复-start
			html.push('<div class="replay_for_replay" id="rfr_'+data.id+'" style="display: none;">');
			html.push('<input type="text" class="replaying_for_replay">');
			html.push('<span class="btn btn-success submit_replaying_for_replay" onclick="replay_to_comment(\''+data.id+'\')">提交</span>');
			html.push('<ul class="rfr_list"></ul>');
			html.push('</div>');
			//--end
			html.push('</div></div></li></ul></li>');
			html.push('<li class="one_'+data.id+'"><!-- 分割线 --><span class="split_up_down"></span></li>');
			$(".replay_list ul:first").append(html.join(""));
			$('.timeago').timeago('refresh');
			//alert(JSON.stringify(data));
			editor.html("");
			//alert(data.entityMetaInfo.dateCreated);
			//alert(getSmpFormatDate(new Date(data.entityMetaInfo.dateCreated), true));
		}
	});
});

	
/**
 * 下面的代码为转换时间格式的
 */
//扩展Date的format方法 
Date.prototype.format = function (format) {
    var o = {
        "M+": this.getMonth() + 1,
        "d+": this.getDate(),
        "h+": this.getHours(),
        "m+": this.getMinutes(),
        "s+": this.getSeconds(),
        "q+": Math.floor((this.getMonth() + 3) / 3),
        "S": this.getMilliseconds()
    }
    if (/(y+)/.test(format)) {
        format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    }
    for (var k in o) {
        if (new RegExp("(" + k + ")").test(format)) {
            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
        }
    }
    return format;
}
/**  
*转换日期对象为日期字符串  
* @param date 日期对象  
* @param isFull 是否为完整的日期数据,  
*               为true时, 格式如"2000-03-05 01:05:04"  
*               为false时, 格式如 "2000-03-05"  
* @return 符合要求的日期字符串  
*/  
function getSmpFormatDate(date, isFull) {
    var pattern = "";
    if (isFull == true || isFull == undefined) {
        pattern = "yyyy-MM-dd hh:mm:ss";
    } else {
        pattern = "yyyy-MM-dd";
    }
    return getFormatDate(date, pattern);
}
/**  
*转换当前日期对象为日期字符串  
* @param date 日期对象  
* @param isFull 是否为完整的日期数据,  
*               为true时, 格式如"2000-03-05 01:05:04"  
*               为false时, 格式如 "2000-03-05"  
* @return 符合要求的日期字符串  
*/  

function getSmpFormatNowDate(isFull) {
    return getSmpFormatDate(new Date(), isFull);
}
/**  
*转换long值为日期字符串  
* @param l long值  
* @param isFull 是否为完整的日期数据,  
*               为true时, 格式如"2000-03-05 01:05:04"  
*               为false时, 格式如 "2000-03-05"  
* @return 符合要求的日期字符串  
*/  

function getSmpFormatDateByLong(l, isFull) {
    return getSmpFormatDate(new Date(l), isFull);
}
/**  
*转换long值为日期字符串  
* @param l long值  
* @param pattern 格式字符串,例如：yyyy-MM-dd hh:mm:ss  
* @return 符合要求的日期字符串  
*/  

function getFormatDateByLong(l, pattern) {
    return getFormatDate(new Date(l), pattern);
}
/**  
*转换日期对象为日期字符串  
* @param l long值  
* @param pattern 格式字符串,例如：yyyy-MM-dd hh:mm:ss  
* @return 符合要求的日期字符串  
*/  
function getFormatDate(date, pattern) {
    if (date == undefined) {
        date = new Date();
    }
    if (pattern == undefined) {
        pattern = "yyyy-MM-dd hh:mm:ss";
    }
    return date.format(pattern);
}

//alert(getSmpFormatDate(new Date(1279849429000), true));
//alert(getSmpFormatDate(new Date(1279849429000),false));    
//alert(getSmpFormatDateByLong(1279829423000, true));
//alert(getSmpFormatDateByLong(1279829423000,false));    
//alert(getFormatDateByLong(1279829423000, "yyyy-MM"));
//alert(getFormatDate(new Date(1279829423000), "yy-MM"));
//alert(getFormatDateByLong(1279849429000, "yyyy-MM hh:mm"));     
