$(function(){
	//Tai
	$(".question-title").one("blur",function(){
		var _id = $(this).closest(".item").attr("data");
		var title =  $(this).html();
		if(typeof(_id)=="undefined"){
			return;
		}
		updateQuestionTitleToDb(_id,title);
	});
	
	$("#survey_title").blur(function(){
		var title =  $(this).html();
		updateTitleToDb(title);
		
	});
	
	$("#survey_remark").blur(function(){
		var remark = $(this).html();
		updateRemarkToDb(remark);
	});
	
	var t1=$(window).scrollTop();
	if(t1>=50){
			$(".leftnav").css({"position":"fixed","top":"0px","margin-top":"0px"});
			}else{
				$(".leftnav").css({"position":"static","margin-top":"10px"});		
				}
	$(window).bind("scroll",function(){
		var t=$(window).scrollTop();
		if(t>=50){
			$(".leftnav").css({"position":"fixed","top":"0px","margin-top":"0px"});
			}else{
				$(".leftnav").css({"position":"static","margin-top":"10px"});		
				}
		});
	$(".cover").mouseover(function(){
		$(".postercontrol").show();
		}).mouseout(function(){
			$(".postercontrol").hide();
			});	
	$("body").click(function(){	
			clickBody();
		});		
	$(".item").bind("mouseover mouseout",function(){
			checkShow(this);		
		});				
	$(".question-title").click(function(event){		
			clickQTitle(this,event);		
	});
	//选项点击显示高级编辑
	$(".doitem").click(function(event){
			clickOption(this,event)		
		});	
		
	$("td.ed1").click(function(event){
			clickTdEdit1(this,event)		
		});
		
	$("td.ed2").click(function(event){
			clickTdEdit2(this,event)		
		});
		
	$("td.ed").click(function(event){
			clickTdEdit(this,event)		
		});
			
	$("input").click(function(event){
			event.stopPropagation();		
		});
	$(".navitem").click(function(event){
			addItem(this,event);			
		});
	$("#globalSet").click(function(event){
			$(".menuBox").toggle(200);	
			$(".menuBox1").hide(200);	
		});
	$("#globalSet1").click(function(event){
			//读取添加逻辑到menuBox
			$(".menuBox1").find("ul").html("");
			addLogicTomenuBox1();
			$(".menuBox1").toggle(200);	
			$(".menuBox").hide(200);	
		});
	$(".menuBox").click(function(event){		
			event.stopPropagation();
		});
	$(".menuBox1").click(function(event){			
			event.stopPropagation();
		});
	$(".menuBox ul li").click(function(event){
			var judge = $(this).attr("setType");
			$(this).addClass("cur").siblings("li").removeClass("cur");
			var ad=$(".menuBox").find("."+judge)
			$(".menuBox").find("."+judge).css({"display":"block"}).siblings("div").css({"display":"none"});
			event.stopPropagation();
		});
	$("#use_pwd").click(function(){
		if($(this).is(":checked")){		
			$("#pwd").show();		
		}else{
			$("#pwd").hide();
			$("#pwd").focus();
			$("#warn").hide();
		}
	});
	
	$("#pwd").blur(function(){
		var reg = /^[0-9a-zA-Z]{4}$/;
		var temp = $.trim($(this).val());
		if(!reg.test(temp) && !($(this).is(":hidden"))){
			$("#warn").show();
		}else{
			$("#warn").hide();
		}
	}); 
	
	$('#datePicker').Zebra_DatePicker();	
	setLogicNum();
});

//body被点击时
function clickBody(){
	$("div").removeClass("editable");
	$(".superdo").hide();
	$(".set").hide();
	saveTdChange();
	}

//隐藏全局收集设置
function hideMenuBox(_this,event){
	$(_this).closest(".menuBox,.menuBox1").hide(200);
	event.stopPropagation();
	}

//题目被点击时
function clickQTitle(_this,event){	
	$("div").removeClass("editable");
	$("td.set").hide();
	$(".superdo").hide();
	saveTdChange();
	$(_this).attr("contenteditable","true").focus().addClass("editable");
	$(_this).parent().find(".superdo").show();
	event.stopPropagation(); 
	}


//判断是否显示所有一级功能
function checkShow(_this){
	$(_this).mouseover(function(){
		var judge=isShow(_this);
		if(!judge){
			$(_this).find(".control").show().end().find(".ud_arrow").show();
			}	
	});		 
	$(_this).mouseout(function(){
		var judge=isShow(_this);
		if(judge){
			$(_this).find(".control").show().end().find(".ud_arrow").show();
			}else{
				$(_this).find(".control").hide().end().find(".ud_arrow").hide();
				}			
	});					
	}
	
//获取是否恒定显示一级功能的判定值
function isShow(_this){
	var count=0;
	var judge=false;
	var arr=$(_this).find(".set_box");
	if(arr.length>0){
		for(var i=0;i<arr.length;i++){
			if($(arr[i]).css("display")=="block"){
				count++;
				}	
		}	
		}
	if(count>0){
		judge=true;
		}	
	return judge;
	}

/*点击标题，显示高级编辑对话框*/
function showdialogedit(_this){			
    var callFn = function(){		
        ue.destroy();
    };
	var temp;	
	//保存标题修改
	var saveTtl=function(){
		temp=ue.getContent();
		var content = temp;
		var parent=_this.parentNode;
		var a=$("div.question-title",parent);
		a.html(temp);
		$(a).blur().removeClass("editable");
		ue.destroy();
		//Tai
		if('survey_title'==$(_this).next().attr("id")){
			updateTitleToDb(content);
		}else if('survey_remark'==$(_this).next().attr("id")){
			updateRemarkToDb(content);
		}else if(('undefined'!=typeof($(_this).closest(".item").attr("data")))&&('undefined'==typeof($(_this).closest(".doitem").attr("data")))){
			
			var id = $(_this).closest(".item").attr("data");
			updateQuestionTitleToDb(id,content);
		}
	};
    var html = [];
    var oldinner = $(_this).parent().find(".question-title").html() ;//现在的内容	
    //加载编辑器的容器
    html.push('<div class="dialogedite"><textarea id="container" name="content" type="text/plain">'+oldinner+'</textarea></div>');
    easyDialog.open({
        container : {
            header : "高级模式" ,
            content : html.join(""),
            noFn : callFn,
			yesFn: saveTtl,
			yesText: "保存",
			noText: "取消",			
        },
		overlay: true,
        callback : callFn
    });	
	var ue = UE.getEditor('container'); 
}

/*放大图片预览*/
function magnify(_this){
    var html = [];
    html.push('<img src="'+$(_this).parents(".rightcontainer").find("img").attr("src")+'" style="width:580px;padding:10px;">')
    easyDialog.open({
        container : {
            header : "封面预览" ,
            content : html.join("")
        }
    });
}
/*更换图片*/
function changeposter(_this){
    var html = [];
    html.push('<div style="width: 360px;height: 100px;padding: 10px;"><div id="uploadify"></div></div>')
    easyDialog.open({
        container : {
            header : "更换封面" ,
            content : html.join("")
        }
    });
    $("#uploadify").uploadify({
    	'formData'     : {
			'token'     : token,
		},
        'height'        : 30,
        'buttonText' :"请选择封面",
        'swf'           : basepath +'/static/survey/plugins/uploadify/uploadify.swf',
        'type': 'post',
        'uploader': 'http://up.qiniu.com/',
        'fileObjName'  : 'file',
        'width': 120,
        'auto': true,
        'multi': false,
        'onUploadSuccess' : function(file,data,response){
			var result = eval("("+data+")");
			easyDialog.close();
			$("#image_cover").html("<img  src = '"+qiniuImageBasePath+result.hash+coverSuffix+"' class='poster'>");
			//文件长传完成之后，在本地保存一份文件信息的数据
			saveFile(result.hash);
		}
    });
	
}

/*题目选项操作*/
//增加一行
function addOption(_this,event){
	var temp=$(_this).closest(".item").attr("qType");
	var jzL=0;
	var str="";
	var i;
	var hIndex;
	var dfLiW,dfLiT;
	if(temp == "danxuan"){
		hIndex = $(_this).closest(".radioitem").prev(".radioitem").find(":radio").attr("hIndex");
		if(!!hIndex){
			hIndex = 1 + parseInt(hIndex);
			}else{
				hIndex = 1;
			}
		$(_this).closest(".radioitem").before('<span class="radioitem doitem" onClick="clickOption(this,event);"><input type="radio" hIndex="'+hIndex+'" /><span>选项'+hIndex+'</span></span>');
			//Tai
			var question_id=$(_this).closest(".item").attr("data");
			var content = "选项"+hIndex;
			$.ajax({
				type:"POST",
				url:basepath+"/mgr/survey/option/add.json",
				data:{"question_id":question_id,"content":content},
				success:function(data){
					if (data.result) {
						console.log("选项添加成功");
						$(_this).parent().prev().attr("data",data.id);
					}else{
						console.log("选项添加失败");
					}
				},
				error:function(data){
					alert('保存失败');
				}
			});
		
		}else if(temp == "duoxuan"){
			hIndex = $(_this).closest(".radioitem").prev(".radioitem").find(":checkbox").attr("hIndex");
			if(!!hIndex){
				hIndex = 1 + parseInt(hIndex);
				}else{
					hIndex = 1;
				}
			$(_this).closest(".radioitem").before('<span class="radioitem doitem" onClick="clickOption(this,event);"><input type="checkbox" hIndex="'+hIndex+'" /><span>选项'+hIndex+'</span></span>');
			
			//Tai
			var question_id=$(_this).closest(".item").attr("data");
			var content = "选项"+hIndex;
			$.ajax({
				type:"POST",
				url:basepath+"/mgr/survey/option/add.json",
				data:{"question_id":question_id,"content":content},
				success:function(data){
					if (data.result) {
						console.log("选项添加成功");
						$(_this).parent().prev().attr("data",data.id);
					}else{
						console.log("选项添加失败");
					}
				},
				error:function(data){
					alert('保存失败');
				}
			});
			
		}else if(temp == "dafen"){
			hIndex = $(_this).closest(".radioitem").prev(".dafen2").find("td.ed:last").attr("hIndex");
			jzL=$(_this).closest(".radioitem").prev("div.dafen2").find("tbody tr:eq(1) ul li").length;
			dfLiW = Math.floor($(_this).closest(".radioitem").prev("div.dafen2").find("tbody tr:eq(1) ul li").width());
			dfLiT = parseInt($(_this).closest(".radioitem").prev("div.dafen2").find("tbody tr:eq(1) ul li:first").text());
			if(!!hIndex){
				hIndex = 1 + parseInt(hIndex);
				}else{
					hIndex = 1;
				}
			if(!!jzL){
				for(i = 0;i < jzL;i++){
					str += '<li style="width:'+dfLiW+'px">'+(i+dfLiT)+'</li>';	
					}
					$(_this).closest(".radioitem").prev().find("tbody").append('<tr><td class="ed" hIndex="'+hIndex+'"><span>选项'+hIndex+'</span></td><td class="fen"><ul>'+str+'</ul></td><td>分</td></tr>');
				}else{
					$(_this).closest(".radioitem").prev().find("tbody").append('<tr><td class="ed" hIndex="'+hIndex+'"><span>选项'+hIndex+'</span></td><td class="fen"><ul><li>1</li><li>2</li><li>3</li><li>4</li><li>5</li></ul></td><td>分</td></tr>');
					}
			//Tai
			var question_id=$(_this).closest(".item").attr("data");
			var content = "选项"+hIndex;
			$.ajax({
				type:"POST",
				url:basepath+"/mgr/survey/option/add.json",
				data:{"question_id":question_id,"content":content},
				success:function(data){
					if (data.result) {
						console.log("选项添加成功");
						$(_this).closest(".radioitem").prev().find("tr:last").attr({"data":data.id});
					}else{
						console.log("选项添加失败");
					}
				},
				error:function(data){
					alert('保存失败');
				}
			});
			
			}else if(temp == "jzdanxuan"){
				hIndex = $(_this).closest(".radioitem").prev(".tableBox").find("tr:last").find(".ed2").attr("hIndex");
				jzL=$(_this).closest(".radioitem").prev("div.tableBox").find("tbody tr:first td").length-1;
				if(!!hIndex){
				hIndex = 1 + parseInt(hIndex);
				}else{
					hIndex = 1;
				}
				for(i = 0;i < jzL;i++){
					str += '<td><input type="radio" /></td>';
					}
				$(_this).closest(".radioitem").prev("div.tableBox").find("tbody").append('<tr><td class="ed2" hIndex="'+hIndex+'"><span>矩阵行'+hIndex+'</span></td>'+str+'</tr>');
				}else if(temp == "jzduoxuan"){
					hIndex = $(_this).closest(".radioitem").prev(".tableBox").find("tr:last").find(".ed2").attr("hIndex");
					jzL=$(_this).closest(".radioitem").prev("div.tableBox").find("tbody tr:first td").length-1;
					if(!!hIndex){
					hIndex = 1 + parseInt(hIndex);
					}else{
						hIndex = 1;
					}
					for(i = 0;i < jzL;i++){
						str += '<td><input type="checkbox" /></td>';
						}
					$(_this).closest(".radioitem").prev("div.tableBox").find("tbody").append('<tr><td class="ed2" hIndex="'+hIndex+'"><span>矩阵行'+hIndex+'</span></td>'+str+'</tr>');					
					}
					$(".question-title").click(function(event){		
						clickQTitle(this,event);		
					});	
					$("td.ed2").click(function(event){
						clickTdEdit2(this,event)		
					});
					$("td.ed").click(function(event){
						clickTdEdit(this,event)		
					});
					if(temp == "jzduoxuan"||temp=="jzdanxuan"){
						//Tai
						var content = $(_this).closest(".radioitem").prev(".tableBox").find("tr:last").find(".ed2 span").html();
						var q_id = $(_this).closest(".item").attr("data");
						$.ajax({
							type:"POST",
							url:basepath+"/mgr/survey/option/add_matrix_option.json",
							data:{"question_id":q_id,"content":content},
							success:function(data){
								if (data.result) {
									console.log("添加行成功");
									$(_this).closest(".radioitem").prev(".tableBox").find("tr:last").find(".ed2").attr("data",data.id);
								}else{
									console.log("选项添加失败");
								}
							},
							error:function(data){
								alert('保存失败');
							}
						});
					}
		}	
//增加一列
function addColumn(_this,event){
	var temp=$(_this).closest(".item").attr("qType");
	var jzH;
	var str="";
	var i;
	var lIndex;
	if(temp == "jzdanxuan"){
		lIndex = $(_this).closest(".addli").next("div.tableBox").find("tr:first td.ed1:last").attr("lIndex");
		jzH=$(_this).closest(".addli").next("div.tableBox").find("tr");
		if(!!lIndex){
				lIndex = 1 + parseInt(lIndex);
				}else{
					lIndex = 1;
				}
		for(i = 0;i < jzH.length;i++ ){
			if(i == 0){
				str='<td class="ed1" lIndex="'+lIndex+'"><span>矩阵列'+lIndex+'</span></td>';
				$(jzH[i]).append(str);
				}else{
					str='<td><input type="radio" /></td>';
					$(jzH[i]).append(str);
					}		
			}
		}else if(temp == "jzduoxuan"){
			lIndex = $(_this).closest(".addli").next("div.tableBox").find("tr:first td.ed1:last").attr("lIndex");
			jzH=$(_this).closest(".addli").next("div.tableBox").find("tr");
			if(!!lIndex){
				lIndex = 1 + parseInt(lIndex);
				}else{
					lIndex = 1;
				}
			for(i = 0;i < jzH.length;i++ ){
				if(i == 0){
					str='<td class="ed1" lIndex="'+lIndex+'"><span>矩阵列'+lIndex+'</span></td>';
					$(jzH[i]).append(str);
					}else{
						str='<td><input type="checkbox" /></td>';
						$(jzH[i]).append(str);
						}		
				}						
			}
			$("td.ed1").click(function(event){
							clickTdEdit1(this,event)		
						});							
			scrollTable($(_this).closest(".addli").next("div.tableBox"));
			//Tai
			var content = $(_this).closest(".addli").next("div.tableBox").find("tr:first td.ed1:last span").html();
			var q_id = $(_this).closest(".item").attr("data");
			$.ajax({
				type:"POST",
				url:basepath+"/mgr/survey/option/add.json",
				data:{"question_id":q_id,"content":content},
				success:function(data){
					if (data.result) {
						console.log("添加列成功");
						$(_this).closest(".addli").next("div.tableBox").find("tr:first td.ed1:last").attr("data",data.id);
					}else{
						console.log("选项添加失败");
					}
				},
				error:function(data){
					alert('保存失败');
				}
			});
}

//元素滚动条重定位
function scrollTable(_this){
$(_this)[0].scrollLeft=$(_this)[0].scrollWidth;	
}

//选项被点击
function clickOption(_this,e){
		var inner = $(_this).find("input+span").html();	
		var html = [];
		var hIndex;
		var qType = $(_this).closest(".item").attr("qType"); 
		$("div").removeClass("editable");
		$(".superdo").hide();
		$("td.set").hide();
		$("td.set",_this).show();
		saveTdChange();
		if(!!inner){		
				html.push('<div class="edit_box">');
				html.push('<table class="edit_box_table">');
				html.push('<tr>');
				//单选，多选判断
				if(qType == "danxuan"){
					hIndex = $(_this).find(":radio").attr("hIndex");
					html.push('<td><input type="radio" hIndex="'+hIndex+'"></td>');
					}else{
						hIndex = $(_this).find(":checkbox").attr("hIndex");
						html.push('<td><input type="checkbox" hIndex="'+hIndex+'"></td>');
						}
				html.push('<td><div class="change">'+inner+'</div></td><td class="set"><span><i class="fa fa-angle-up" title="向上移动" onClick="upOption(this,event);"></i></span><span><i class="fa fa-angle-down" title="向下移动" onClick="downOption(this,event);"></i> </span><span><i class="fa fa-times" title="删除该项" onClick="delOption(this,event);"></i></span><span><i class="fa fa-pencil" title="高级编辑"  onClick="moreOption(this,event);"></i></span><span><i class="fa fa-cog" title="选项编辑" onClick="edOption(this,event);"></i></span></td>');
				html.push('</tr>');
				html.push('</table>');
				html.push('</div>');
				$(_this).html(html.join(""));
				$(_this).find("div:not('.edit_box')").attr("contenteditable","true").focus().addClass("editable");	
			}else{
				$(_this).find("div:not('.edit_box')").attr("contenteditable","true").focus().addClass("editable");
			}
		
		//Tai
		//单选 多选  题目更改
		$(".editable").one("blur",function(event){
				var question_id = $(this).closest(".item").attr("data");
				var option_title =  $(this).html();
				var option_id = $(_this).attr("data");
				if(typeof(question_id)=="undefined"){
					return;
				}else{
					updateOptionTitleToDb(question_id,option_title,option_id);
			}
				event.stopPropagation();
	
		});
		
		e.stopPropagation();
	}
	
//删除一个选项
function delOption(_this,e){
	var temp = $(_this).closest(".item");
	$(_this).closest("span.doitem,label.doitem").remove();
	//Tai
	var temp_id = $(_this).closest(".doitem").attr("data");
	var qid = $(temp).attr("data");
	if (temp_id.length) {
		$.ajax({
			type:"POST",
			url:basepath + "/mgr/survey/option/delete.json",
			data:{"id":temp_id,"qid":qid},
			success:function(data){
				if (data) {
					console.log("选项删除成功！");
				}else{
					console.log("选项删除失败！");
				}
			},
			error:function(data){
				console.log("选项删除失败！");
			}
		});
	}
	sortHIndex(temp);
	e.stopPropagation();	
	}

//选项上移
function upOption(_this,e){
	var pre=$(_this).closest("span.doitem").prev();	
	if($(pre).is(".doitem")){
		$(_this).closest("span.doitem").insertBefore(pre);
			//Tai
			var up_id = $(pre).attr("data");
			var down_id = $(_this).closest("span.doitem").attr("data");
			var qid = $(_this).closest(".item").attr("data");
			$.ajax({
				type: "POST",
				url:  basepath+"/mgr/survey/option/order/swap.json",
				data:{"up_id":up_id,"down_id":down_id,"qid":qid},
				success:function(data){
					if(data){
						console.log("选项排序成功");
					}else{
						console.log("选项排序失败");
					}
				},
				error: function(data){
					alert('保存失败');
				}
			});
		
		}else{
			blockTishi("已是第一项！");
			}
	sortHIndex(_this);	
	e.stopPropagation();
	}

//选项下移
function downOption(_this,e){
	var next=$(_this).closest("span.doitem").next();
	if($(next).is(".doitem")){
		$(_this).closest("span.doitem").insertAfter(next);
		//Tai
		var up_id = $(next).attr("data");
		var down_id = $(_this).closest("span.doitem").attr("data");
		var qid = $(_this).closest(".item").attr("data");
		$.ajax({
			type: "POST",
			url:  basepath+"/mgr/survey/option/order/swap.json",
			data:{"up_id":up_id,"down_id":down_id,"qid":qid},
			success:function(data){
				if(data){
					console.log("选项排序成功");
				}else{
					console.log("选项排序失败");
				}
			},
			error: function(data){
				alert('保存失败');
			}
		});
		}else{
			blockTishi("已是最后一项！");
			}
	sortHIndex(_this);				
	e.stopPropagation();
	}

//点击打分选项
function clickTdEdit(_this,event){
	var inner = $("span",_this).html();
	var html;
	var temp;
	$("p").removeClass("editable");
	$(".superdo").hide();
	$("td.set").hide();
	saveTdChange();
	$("span",_this).hide();
	if(!!inner){
		html = '<div class="tdEd"><div contenteditable="true">'+inner+'</div><span><i class="fa fa-angle-up" title="向上移动" onclick="upFenTd(this,event);"></i></span><span><i class="fa fa-angle-down" title="向下移动" onclick="downFenTd(this,event);"></i> </span><span><i class="fa fa-times" title="删除该项" onclick="delFenTd(this,event);"></i></span><span><i class="fa fa-pencil" title="高级编辑" onclick="moreOption(this,event);"></i></span></div>';
		$(_this).append(html);
		$(_this).find("div:not('.tdEd')").attr("contenteditable","true").focus().addClass("editable");
		$(_this).find(".tdEd").bind("click",function(event){
			event.stopPropagation();
			});
		$("body").click(function(event){
				saveTdChange();
			});		
			}
		$(".editable").one("blur",function(event){
			var question_id = $(this).closest(".item").attr("data");
			var option_title =  $(this).html();
			var option_id = $(_this).closest("tr").attr("data");
			if(typeof(question_id)=="undefined"){
				return;
			}else{
				updateOptionTitleToDb(question_id,option_title,option_id);
			}
		});
	event.stopPropagation();
	}

//打分题，选项上移
function upFenTd(_this,event){
	var pre=$(_this).closest("tr").prev();	
	if(!!$(pre).find(".ed").length){
		$(_this).closest("tr").insertBefore(pre);
		//Tai
		var id1 = $(_this).closest("tr").attr("data");
		var id2 = $(pre).attr("data");
		var qid = $(_this).closest(".item").attr("data");
		$.ajax({
			type: "POST",
			url:  basepath+"/mgr/survey/option/order/swap.json",
			data:{"up_id":id1,"down_id":id2,"qid":qid},
			success:function(data){
				if(data){
					console.log("选项排序成功");
				}else{
					console.log("选项排序失败");
				}
			},
			error: function(data){
				alert('保存失败');
			}
		});
		}else{
			blockTishi("已是第一项！");
			}
	sortHIndex(_this);	
	e.stopPropagation();
	
	}
	
//打分题，选项下移
function downFenTd(_this,event){
	var next=$(_this).closest("tr").next();	
	if(!!$(next).find(".ed").length){
		$(_this).closest("tr").insertAfter(next);
		//Tai
		var id1 = $(_this).closest("tr").attr("data");
		var id2 = $(next).attr("data");
		var qid = $(_this).closest(".item").attr("data");
		$.ajax({
			type: "POST",
			url:  basepath+"/mgr/survey/option/order/swap.json",
			data:{"up_id":id1,"down_id":id2,"qid":qid},
			success:function(data){
				if(data){
					console.log("选项排序成功");
				}else{
					console.log("选项排序失败");
				}
			},
			error: function(data){
				alert('保存失败');
			}
		});
		
		}else{
			blockTishi("已是最后一项！");
			}
	sortHIndex(_this);	
	e.stopPropagation();	
	}

//打分题，选项删除
function delFenTd(_this,event){
	var temp = $(_this).closest(".item");
	var option_id = $(_this).closest("tr").attr("data");
	var qid = $(_this).closest(".item").attr("data");
	$(_this).closest("tr").remove();
	sortHIndex(temp);
	//Tai
	$.ajax({
		type:"POST",
		url:basepath + "/mgr/survey/option/delete.json",
		data:{"id":option_id,"qid":qid},
		success:function(data){
			if (data) {
				console.log("选项删除成功！");
			}else{
				console.log("选项删除失败！");
			}
		},
		error:function(data){
			console.log("选项删除失败！");
		}
	});
	e.stopPropagation();
	}

//矩阵题型，行点击
function clickTdEdit1(_this,event){
	var inner = $("span",_this).html();
	var html;
	var temp;
	var num = $(_this).closest("tr").find("td.ed1").length;
	var judge = parseInt($(_this).attr("lIndex"));
	$("div").removeClass("editable");
	$(".superdo").hide();
	$("td.set").hide();
	saveTdChange();
	$("span",_this).hide();
	if(!!inner){
		html = '<div class="tdEd"><div contenteditable="true">'+inner+'</div><span><i class="fa fa-angle-left" title="向左移动" onclick="leftTd(this,event);"></i></span><span><i class="fa fa-angle-right" title="向右移动" onclick="rightTd(this,event);"></i> </span><span><i class="fa fa-times" title="删除该项" onclick="delTd1(this,event);"></i></span><span><i class="fa fa-pencil" title="高级编辑" onclick="moreOption(this,event);"></i></span></div>';
		$(_this).append(html);
		$(_this).find("div:not('.tdEd')").attr("contenteditable","true").focus().addClass("editable");
		if(judge === num){
			scrollTable($(_this).closest("div.tableBox"));
			}	
		$(_this).find(".tdEd").bind("click",function(event){
			event.stopPropagation();
			});
		$("body").click(function(event){
			saveTdChange();
			});	
		}
	$(".editable").one("blur",function(event){
		var question_id = $(this).closest(".item").attr("data");
		var option_title =  $(this).html();
		var option_id = $(_this).attr("data");
		if(typeof(question_id)=="undefined"){
			return;
		}else{
			updateOptionTitleToDb(question_id,option_title,option_id);
		}
	});
	event.stopPropagation();
	}

//列左移动
function leftTd(_this,e){
	var pre=$(_this).closest("td").prev();
	var left_id = $(pre).attr("data");
	var right_id = $(_this).closest("td").attr("data");
	var qid = $(_this).closest(".item").attr("data");
	if($(pre).is(".ed1")){
		$(_this).closest("td").insertBefore(pre);
		$.ajax({
			type: "POST",
			url:  basepath+"/mgr/survey/option/order/swap.json",
			data:{"up_id":left_id,"down_id":right_id,"qid":qid},
			success:function(data){
				if(data){
					console.log("列排序成功");
				}else{
					console.log("列排序失败");
				}
			},
			error: function(data){
				alert('保存失败');
			}
		});
		}else{
			blockTishi("已是第一项！");
			}
	sortLIndex(_this);	
	e.stopPropagation();
	}

//列右移动
function rightTd(_this,e){
	var next=$(_this).closest("td").next();
	//Tai
	var left_id = $(next).attr("data");
	var right_id=$(_this).closest("td").attr("data");
	var qid = $(_this).closest(".item").attr("data");
	if($(next).is(".ed1")){
		$(_this).closest("td").insertAfter(next);
		$.ajax({
			type: "POST",
			url:  basepath+"/mgr/survey/option/order/swap.json",
			data:{"up_id":left_id,"down_id":right_id,"qid":qid},
			success:function(data){
				if(data){
					console.log("列排序成功");
				}else{
					console.log("列排序失败");
				}
			},
			error: function(data){
				alert('保存失败');
			}
		});
		}else{
			blockTishi("已最后一项！");
			}
	sortLIndex(_this);	
	e.stopPropagation();
	}

//列删除
function delTd1(_this,e){
	//Tai
	var that = $(_this).closest(".item");
	var temp = $(_this).closest("table").find("tr");
	var temp_id = $(temp[0]).find("td.ed1:last").attr("data");
	$(_this).closest("td").remove();
	for(var i = 1;i < temp.length;i++ ){
		$(temp[i]).find("td:last").remove();		
		}
	sortLIndex(that);
	e.stopPropagation();
	//Tai
	var qid = $(that).attr("data");
		if (temp_id.length) {
			$.ajax({
				type:"POST",
				url:basepath + "/mgr/survey/option/delete.json",
				data:{"id":temp_id,"qid":qid},
				success:function(data){
					if (data) {
						console.log("列删除成功！");
					}else{
						console.log("列删除失败！");
					}
				},
				error:function(data){
					console.log("列删除失败！");
				}
			});
		}
	}
	
//矩阵题型，列点击
function clickTdEdit2(_this,event){
	var inner = $("span",_this).html();
	var html;
	var temp;
	$("div").removeClass("editable");
	$(".superdo").hide();
	$("td.set").hide();
	saveTdChange();
	$("span",_this).hide();
	if(!!inner){
		html = '<div class="tdEd"><div contenteditable="true">'+inner+'</div><span><i class="fa fa-angle-up" title="向上移动" onclick="upTd(this,event);"></i></span><span><i class="fa fa-angle-down" title="向下移动" onclick="downTd(this,event);"></i> </span><span><i class="fa fa-times" title="删除该项" onclick="delTd2(this,event);"></i></span><span><i class="fa fa-pencil" title="高级编辑" onclick="moreOption(this,event);"></i></span></div>';
		$(_this).append(html);
		$(_this).find("div:not('.tdEd')").attr("contenteditable","true").focus().addClass("editable");
		$(_this).find(".tdEd").bind("click",function(event){
			event.stopPropagation();
			});
		$("body").click(function(event){
				saveTdChange();
			});		
		}
	$(".editable").one("blur",function(event){
		var question_id = $(this).closest(".item").attr("data");
		var option_title =  $(this).html();
		var option_id = $(_this).attr("data");
		if(typeof(question_id)=="undefined"){
			return;
		}else{
			updateOptionTitleToDb(question_id,option_title,option_id,"yes");
		}
	});
	event.stopPropagation();
	}
	
//行上移动
function upTd(_this,e){
	var pre=$(_this).closest("tr").prev();
	//Tai
	var up_id = $(pre).find("td.ed2").attr("data");
	var down_id =$(_this).closest("tr td.ed2").attr("data");
	var qid =$(_this).closest(".item").attr("data");
	if(!!$(pre).find(".ed2").length){
		$(_this).closest("tr").insertBefore(pre);
			$.ajax({
				type: "POST",
				url:  basepath+"/mgr/survey/matrix_option/order/swap.json",
				data:{"up_id":up_id,"down_id":down_id,"qid":qid},
				success:function(data){
					if(data){
						console.log("列排序成功");
					}else{
						console.log("列排序失败");
					}
				},
				error: function(data){
					alert('保存失败');
				}
			});
		}else{
			blockTishi("已是第一项！");
			}
	sortHIndex(_this);	
	e.stopPropagation();
	}
	
//行下移动
function downTd(_this,e){
	var next=$(_this).closest("tr").next();
	//Tai
	var up_id = $(next).find("td.ed2").attr("data");
	var down_id=$(_this).closest("tr td.ed2").attr("data");
	var qid = $(_this).closest(".item").attr("data");
	if(!!$(next).find(".ed2").length){
		$(_this).closest("tr").insertAfter(next);
		$.ajax({
			type: "POST",
			url:  basepath+"/mgr/survey/matrix_option/order/swap.json",
			data:{"up_id":up_id,"down_id":down_id,"qid":qid},
			success:function(data){
				if(data){
					console.log("列排序成功");
				}else{
					console.log("列排序失败");
				}
			},
			error: function(data){
				alert('保存失败');
			}
		});
		}else{
			blockTishi("已是最后一项！");
			}
	sortHIndex(_this);	
	e.stopPropagation();
	}

//行删除
function delTd2(_this,e){
	//Tai
	var temp = $(_this).closest(".item");
	var temp_id = $(_this).closest("tr td.ed2").attr("data");
	$(_this).closest("tr").remove();
	sortHIndex(temp);
	e.stopPropagation();
	var qid = $(temp).attr("data");
		if (temp_id.length) {
			$.ajax({
				type:"POST",
				url:basepath + "/mgr/survey/option/delete_matrix_option.json",
				data:{"id":temp_id,"qid":qid},
				success:function(data){
					if (data) {
						console.log("行删除成功！");
					}else{
						console.log("行删除失败！");
					}
				},
				error:function(data){
					console.log("行删除失败！");
				}
			});
		}
	}
	
//行hIndex重新排序
function sortHIndex(_this){
	var temp;
	var qType;
	var arr = [];
	var i,j;
	if($(_this).closest(".item").length){
		temp = $(_this).closest(".item");
		}else{
		temp = _this;
		}
	qType = $(temp).attr("qType");
	if(qType == "danxuan" || qType == "duoxuan"){
		arr =  $(temp).find(".rightcontainer .doitem");
		for(i = 0; i < arr.length; i++){
			j = i + 1;
			$(arr[i]).find(":input").attr({"hIndex":j});			
			}
		}
	if(qType == "dafen"){
		arr =  $(temp).find(".dafen2 tr");
		for(i = 0; i < arr.length; i++){
			$(arr[i]).find("td.ed").attr({"hIndex":i});			
			}				
		}
	if(qType == "jzdanxuan" || qType == "jzduoxuan"){
		arr =  $(temp).find(".tableBox tr");
		for(i = 0; i < arr.length; i++){
			$(arr[i]).find("td.ed2").attr({"hIndex":i});			
			}	
		}	
	}

//列lIndex重新排序
function sortLIndex(_this){
	var temp;
	var qType;
	var arr = [];
	var i,j;
	if($(_this).closest(".item").length){
		temp = $(_this).closest(".item");
		}else{
		temp = _this;
		}
	qType = $(temp).attr("qType");
	if(qType == "jzdanxuan" || qType == "jzduoxuan"){
		arr =  $(temp).find(".tableBox tr:first td.ed1");
		for(i = 0; i < arr.length; i++){
			j = i + 1;
			$(arr[i]).attr({"lIndex":j});			
			}	
		}
	}

//矩阵模块更改暂存
function saveTdChange(){
	var temp = $("div.tdEd").closest("td");
	var txt = "";
	var html;
	var judge = $("div.tdEd > div").length;
	if(!!judge){
		txt = $("div.tdEd > div").html();
		html = '<span>'+txt+'</span>';
		}else{
			}
	$(temp).html(html);	
	}
	
//easyDialog提示对话框
function showTishi(_txt){
	var callFn=function(){};
	var html='<span style="display:inline-block;padding:10px;font-size:16px;width:250px;text-align:center">'+_txt+'</span>';
	easyDialog.open({
		container:{
			header:"提示",
			content:html,
			yesFn:callFn,
			yesText:"知道了"
			},		
		overlay: true,
        callback : callFn	
		});
	}

//easyDialog选项编辑对话框
function edOption(_this,event){
	var option_id = $(_this).closest(".doitem").attr("data");
	var question_id = $(_this).closest(".item").attr("data");
	var callFn=function(){
		var has_input = $("#has_input").is(":checked")?1:0;
		$.ajax({
			type:"POST",
			url:basepath+"/mgr/survey/option/setting/update.json",
			data:{"option_id":option_id,"question_id":question_id,"has_input":has_input},
			success:function(data){
				if(data){
					console.log("修改选项设置成功");
				}else{
					console.log("修改选项设置失败");
				}
			},error:function(data){
				console.log("修改选项设置失败");
			}
		});
		};
		var html='<span style="display:inline-block;padding:10px;font-size:16px;width:250px;text-align:center;"><input type="checkbox" class="addJudge" style="margin-right:5px;" id="has_input" /><label for="has_input" style="font-size:16px;font-weight:normal;" >在该选项后增加填空框</label></span>';
		$.ajax({
			type:"POST",
			url:basepath+"/mgr/survey/option/setting.json",
			async:false,
			data:{"option_id":option_id,"question_id":question_id},
			success:function(data){
				if(data.result){
					console.log("选项设置信息获取ok");
					if(data.has_input_field=='1'){
						 html='<span style="display:inline-block;padding:10px;font-size:16px;width:250px;text-align:center;font-size:16px;"><input type="checkbox" checked="checked"  class="addJudge" style="margin-right:5px;" id="has_input" /><label for="has_input" style="font-size:16px;font-weight:normal;" >在该选项后增加填空框</label></span>';
					}
				}else{
				console.log("选项设置信息获取失败");	
				}
			},
			error:function(data){
				console.log("选项设置信息获取失败");
			}
		});
		
	easyDialog.open({
		container:{
			header:"选项编辑",
			content:html,
			yesFn:callFn,
			yesText:"保存"
			},		
		overlay: true,

		});
	}
	
//显示高级编辑对话框
function moreOption(_this,e){			
    var callFn = function(){		
        ue.destroy();
    };
	var temp;
	var tempTd;
	var tempTr;
	//保存标题修改
	var saveOption=function(){
		temp=ue.getContent();
		var option_title =  temp;
		var insert=$(temp).html();			
		var parent=$(_this).closest(".doitem");
		var p=$(parent).find("div.change");
		$(p).html(insert);		
		ue.destroy();	
		//Tai  单选多选题  选项题目编辑
		if(('undefined'!=typeof($(_this).closest(".doitem").attr("data")))&&typeof(('undefined'==$(_this).closest("td").attr("data")))){
			var question_id =$(_this).closest(".item").attr("data");
			var option_id = $(_this).closest(".doitem").attr("data");
			updateOptionTitleToDb(question_id,option_title,option_id);
		}
	};
	//保存单元格修改
	var saveTd=function(){
		temp=ue.getContent();
		var insert='<span>'+$(temp).html()+'</span>';				
		$(tempTd).html(insert);						
		ue.destroy();
		//Tai 矩阵选项题目编辑
		if(('undefined'!=typeof($(tempTd).attr("data")))){
			var option_id = $(tempTd).attr("data");
			var class_ = $(tempTd).attr("class");
			var question_id = $(tempTd).closest(".item").attr("data");
			if(class_=='ed1'){
				updateOptionTitleToDb(question_id,temp,option_id);
			}else if (class_=='ed2') {
				updateOptionTitleToDb(question_id,temp,option_id,"yes");
			}
		}
		//打分题目编辑
		if(('undefined'!=typeof($(tempTr).attr("data")))){
			var option_id = $(tempTr).attr("data");
			var question_id = $(tempTd).closest(".item").attr("data");
			updateOptionTitleToDb(question_id,temp,option_id)
		}
	};
    var html = [];
    var oldinner = $(_this).parents(".doitem").find("div.change").html() ;//现在的内容
	var oldinner1 = $(_this).closest(".tdEd").find("div").html();
	
	var qType = $(_this).closest(".item").attr("qType");
	
	if(qType == "dafen" || qType == "jzdanxuan" || qType == "jzduoxuan" || qType == "jzdafen"){
		tempTd=$(_this).closest("td");
		tempTr=$(_this).closest("tr");
		//加载编辑器的容器
		html.push('<div class="dialogedite"><textarea id="container" name="content" type="text/plain">'+oldinner1+'</textarea></div>');
		easyDialog.open({
			container : {
				header : "高级模式" ,
				content : html.join(""),
				noFn : callFn,
				yesFn: saveTd,
				yesText: "保存",
				noText: "取消"			
			},
			overlay: true,
			callback : callFn
		});			
		}else{			
			//加载编辑器的容器
			html.push('<div class="dialogedite"><textarea id="container" name="content" type="text/plain">'+oldinner+'</textarea></div>');
			easyDialog.open({
				container : {
					header : "高级模式" ,
					content : html.join(""),
					noFn : callFn,
					yesFn: saveOption,
					yesText: "保存",
					noText: "取消"			
				},
				overlay: true,
				callback : callFn
			});	
			}
	
	var ue = UE.getEditor('container');
	e.stopPropagation();
}


/*左侧设置模块*/
//左侧设置模块,显示高级设置弹出层
function showQSet(_this,event){
	if(!$(_this).children(".set_box").length){
			$("body .set_box").detach();
		}	
	if($(_this).is(".fa-gears")){
			addNSet(_this);
			$(".set_box input,.set_box select").bind("click",function(event){
			event.stopPropagation();		
			});
		}else if($(_this).is(".fa-link")){
			addLSet(_this);
			$(".set_box input,.set_box select").bind("click",function(event){
			event.stopPropagation();					
			});
		}
	event.stopPropagation();	
	}
	
//截取题目名称
function sliceTtl(_ttl){
	var len=10;//规定截取字符数
	var ttl=_ttl;
	var temp;
	var arr=[];
	for(var i=0;i<ttl.length;i++){
			temp=ttl[i].substr(0,len);
			arr.push(temp);	
		}
	return arr;	
	}

//遍历题目所有选项
function  mapOptions(_this){
	var ops=$(_this).closest(".item").find(".rightcontainer").children(".doitem");
	var arr=[];
	var temp;
	for(var i=0;i<ops.length;i++){
		if($(ops[i]).children(".edit_box").length){
			temp=$("div.change",ops[i]).text();	
			}else{
				temp=$("span",ops[i]).text();	
				}			
			arr.push(temp);		
		}
	return arr;	
	}

//遍历题目所有选项的ID
function  mapOptionsId(_this){
	var ops=$(_this).closest(".item").find(".rightcontainer").children(".doitem");
	var arr=[];
	var temp;
	for(var i=0;i<ops.length;i++){
		temp = $(ops[i]).attr("data");
		arr.push(temp);		
		}
	return arr;	
	}
		
//过滤掉已选择的选项
function filterOptions(num){
	var arr = [];
	var temp = $(".item[qNum="+num+"]");
	var logArr = $(temp).find(".set_box div.logic");
	var i;
	var val;
	for(i = 0; i < logArr.length; i++){
		val = $(logArr[i]).find("select.a").val();
		if(val != 0 && val != 10000 && val != 10001){
			arr.push(val);
			}
		}
	return arr;
		
	}
//得到题目排序值
function getNum(_this){
	var num=parseInt($(_this).closest(".item").attr('qNum'));
	return num;	
	}
	
//遍历所有题目，取得本题之后的所有题目
function  mapItems(_n){
	var items=$(".mainboxbody div.item:not('.page')");
	var arr=[];
	var temp;
	for(var i=_n;i<items.length;i++){
			temp=$("div.question-title",items[i]).text();
			arr.push(temp);		
		}
	return arr;	
	}
//遍历所有题目，取得本题之后的所有题目的id
function  mapItemIds(_n){
	var items=$(".mainboxbody div.item:not('.page')");
	var arr=[];
	var temp;
	for(var i=_n;i<items.length;i++){
			temp = $(items[i]).attr("data");
			arr.push(temp);		
		}
	return arr;	
	}

//遍历所有页面，设置页码
function setPageNum(){
	var items=$(".mainboxbody div.page");
	var num=$(".mainboxbody div.page").length;
	var i;
	var j;
	for(i = 0;i < items.length;i++){
		j = i + 1;
		$(items[i]).find("label.a").text(j);
		$(items[i]).find("label.b").text(num);		
		}	
	}
		
//题目一般设置模块
function addNSet(_this){
	var type=$(_this).closest(".item").attr("qType");
	var qid = $(_this).closest(".item").attr("data");
	var allow_skip,op_random,min_score,max_score,left_tip,middle_tip,right_tip ;
	if(type=="duanluo"){ return ;}
	if(!$(_this).children(".set_box").length){
		$.ajax({
			type:"POST",
			url:basepath+"/mgr/survey/question/detail.json",
			async:false,
			data:{"qid":qid},
			success:function(data){
				console.log(data);
				allow_skip = data.allow_skip;
				op_random = data.op_random;
				min_score = data.min_score;
				max_score = data.max_score;
				left_tip = data.left_tip==null?'':data.left_tip;
				middle_tip = data.middle_tip==null?'':data.middle_tip;
				right_tip = data.right_tip==null?'':data.right_tip;
			},
			error:function(data){
				console.log("获取当前问题失败！");
			}
		});
		var html=[];
		html.push('<div class="set_box">');
		html.push('<div class="l_arr"><i class="fa fa-angle-double-left"></i></div>');
		html.push('<div class="r_set"><div class="s_header">');
		html.push('<span>题目设置</span><span class="close"><i class="fa fa-times" onClick="hideQSet(this,event);"></i></span></div><div class="s_container">');
		if (allow_skip==0) {
			html.push('<span><input type="checkbox"  id="allow_skip"/>该题可跳过不回答</span>');
		}else if (allow_skip==1){
			html.push('<span><input type="checkbox" checked="checked" id="allow_skip"/>该题可跳过不回答</span>');
		}
		
		if(type=="danxuan"){
			html.push('<span><input type="checkbox" id="changetype"/>变为多选题</span>');
				if(op_random==0){
					html.push('<span><input type="checkbox" id="op_random"/>选项随机排列</span>');
				}else if(op_random==1){
					html.push('<span><input type="checkbox" checked="checked" id="op_random"/>选项随机排列</span>');
				}
			}else if(type=="duoxuan"){
				html.push('<span><input type="checkbox"  id="changetype"/>变为单选题</span>');
					if(op_random==0){
						html.push('<span><input type="checkbox" id="op_random"/>选项随机排列</span>');
					}else if(op_random==1){
						html.push('<span><input type="checkbox" checked="checked" id="op_random"/>选项随机排列</span>');
					}
				}
		if(type=="dafen"){
				if(op_random==0){
					html.push('<span><input type="checkbox" id="op_random"/>选项随机排列</span>');
				}else if(op_random==1){
					html.push('<span><input type="checkbox" checked="checked" id="op_random"/>选项随机排列</span>');
				}
			html.push('<span class="dafen-a">最低分<input class="min" type="text" value="'+min_score+'" style="width:50px;margin-left:5px;padding:2px;" /></span>');
			html.push('<span class="dafen-b">最高分<input class="max" type="text"  value="'+max_score+'" style="width:50px;margin-left:5px;padding:2px;" /></span>');
			html.push('<span class="dafen-c">左边分数对应的文字<input type="text" value="'+left_tip+'"   style="width:100px;margin-left:5px;padding:2px;" /></span>');
			html.push('<span class="dafen-d">右边分数对应的文字<input type="text"  value="'+middle_tip+'" style="width:100px;margin-left:5px;padding:2px;" /></span>');
			html.push('<span class="dafen-e">中间分数对应的文字<input type="text" value="'+right_tip+'"  style="width:100px;margin-left:5px;padding:2px;" /></span>');
			}			
		if(type=="jzdanxuan"){
			html.push('<span><input type="checkbox" id="changetype"/>变为矩阵多选题</span>');
				if(op_random==0){
					html.push('<span><input type="checkbox" id="op_random"/>选项随机排列</span>');
				}else if(op_random==1){
					html.push('<span><input type="checkbox" checked="checked" id="op_random"/>选项随机排列</span>');
				}
			}
		if(type=="jzduoxuan"){
			html.push('<span><input type="checkbox" id="changetype"/>变为矩阵单选题</span>');
				if(op_random==0){
					html.push('<span><input type="checkbox" id="op_random"/>选项随机排列</span>');
				}else if(op_random==1){
					html.push('<span><input type="checkbox" checked="checked" id="op_random"/>选项随机排列</span>');
				}
			}
		html.push('</div><div class="s_footer"><span onClick="saveQSet(this,event);">保存</span></div></div></div>');	
		$(_this).append(html.join("")); 		
		}	
	}
	
//题目逻辑设置模块
function addLSet(_this){
	var type=$(_this).closest(".item").attr("qType");
	var questionid =$(_this).closest(".item").attr("data");
	
	if(!$(_this).children(".set_box").length){
		
			$.ajax({
				type:"POST",
				url:basepath+"/mgr/survey/strategy/detail.json",
				data:{"survey_id":surveyId,"question_id":questionid},
				async:false,
				success:function(data){
					addlogicItem(_this,type,data.jumpList);
				},erroe:function(data){
					
				}
			});
		}	                               
	}
	
//取消事件冒泡，通用版
function stopPro(event){
	event.stopPropagation();
	}

//左侧设置模块,隐藏高级设置弹出层
function hideQSet(_this,event){
	$(_this).closest(".set_box").detach();
	event.stopPropagation();
	}
	
//左侧设置模块,删除按钮被点击！
function delItem(_this,c){
	if(c==1){
		blockTishi("至少保留一页！");
		return;
	}
	var type = $(_this).closest(".item").attr("qType");
	var prev_ = $(_this).closest(".item").prev(".item");
	var prev_id = $(prev_).attr("data");
	var Haslocgic = $(prev_).find(".n").find("label").html();
	
	var callFn=function(){};
	var delFn=function(){
		var id = $(_this).closest(".item").attr("data");
		var next_all =$(_this).closest(".item").nextAll(".item");
		$(_this).closest(".item").remove();
		sortQ(true);
		setPageNum();
		var data_;
		//Tai
		if(type=="fenye"&&(Haslocgic>0)){
			data_ = {"surveyid":surveyId,"id":id,"prev_id":prev_id};
			var hide_ = $(prev_).find(".logicNum");
			hide_.hide();
		}else{
			data_ = {"surveyid":surveyId,"id":id};
		}
		$.ajax({
			type:"POST",
			url:basepath+"/mgr/survey/question/delete.json",
			data:data_,
			success:function(data){
				if (data) {
					console.log("删除成功！");
				}else{
					console.log("删除失败！");
				}
			},
			error:function(data){
				console.log("删除失败！");
			}
		});
		};
	var html='<span style="display:inline-block;padding:10px;font-size:16px;width:250px;">确定删除吗？</span>';
	if(type=="fenye"&&(Haslocgic>0)){
		html='<span style="display:inline-block;padding:10px;font-size:16px;width:250px;"><p style="font-size:13px;">该分页是由逻辑跳转产生,删除逻辑跳转将失效</p>'
			+'确定删除吗？</span>';
	}
	easyDialog.open({
        container : {
            header : "确定删除？",
            content : html,
			yesFn: delFn,
            noFn : callFn,
			yesText: "确定",
			noText: "取消"			
        },
		overlay: true,
        callback : callFn
    });
	}	
	
/*右侧设置模块*/
//将题目向上移动一位
function upItem(_this,event){
	var prev=$(_this).closest(".item").prev();
	var id1 = $(_this).closest(".item").attr("data");
	var id2 = $(prev).attr("data");
	var qtype = $(_this).closest(".item").attr("qType");
	var pages_num = $("body div.page").length;
	if (qtype=='fenye'&&pages_num==1) {
		return;
	}
	var h;
	var h1=$(_this).closest(".item").height()/2;
	var d;
	if(!prev.is(".judge")||typeof(prev)=='undefined'){
		$(_this).closest(".item").insertBefore(prev);
		h=$(_this).offset().top;
		d=h-h1;
		$("html,body").animate({scrollTop:d},1000);
		sortQ();
		$.ajax({
			type:"POST",
			url:basepath+"/mgr/survey/question/order/swap.json",
			data:{"id1":id1,"id2":id2},
			success:function(data){
				if (data) {
					console.log('问题排序成功!');
				}else{
					console.log('问题排序失败!');
				}
			},
			error:function(data){
				console.log('问题排序失败!');
			}
		});
		}else{
			blockTishi("已经是第一题！");
			}
		setPageNum();
	}

//将题目向下移动一位
function downItem(_this,event){
	var next=$(_this).closest(".item").next();
	var id1 = $(_this).closest(".item").attr("data");
	var id2 = $(next).attr("data");
	var h;
	var h1=$(_this).closest(".item").height()/2;
	var d;
	var qtype = $(_this).closest(".item").attr("qType");
	var pages_num = $("body div.page").length;
	if (qtype=='fenye'&&pages_num==1) {
		return;
	}
	if(next.length||typeof(prev)=='undefined'){
		$(_this).closest(".item").insertAfter(next);
		h=$(_this).offset().top;
		d=h-h1-10;
		$("html,body").animate({scrollTop:d},1000);
		sortQ();
		$.ajax({
			type:"POST",
			url:basepath+"/mgr/survey/question/order/swap.json",
			data:{"id1":id1,"id2":id2},
			success:function(data){
				if (data) {
					console.log('问题排序成功!');
				}else{
					console.log('问题排序失败!');
				}
			},
			error:function(data){
				console.log('问题排序失败!');
			}
		});
		}else{
			blockTishi("已经是最后一题！");
			}
		setPageNum();
	}
			
/*set_box内部操作*/
//删除一条逻辑
function delLog(_this,event){
	var id = $(_this).closest("div.logic").attr("data");
	if(typeof(id)=='undefined'){
		$(_this).closest("div.logic").remove();
	}else{
		$.ajax({
			type:"POST",
			url:basepath+"/mgr/survey/strategy/delete.json",
			data:{"id":id},
			success:function(data){
				if(data){
					$(_this).closest("div.logic").remove();
					console.log("逻辑删除成功");
				}
				console.log("逻辑删除失败");
			},error:function(data){
				console.log("逻辑删除失败");
			}
		});
	}
	event.stopPropagation();		
	}
			
//增加一条逻辑
function addLog(_this,event){
	var type=$(_this).closest(".item").attr("qType");
	var logicNum = $(_this).parent().prevAll(".logic").length;
	if (type!="danxuan"&&type!="duoxuan"&&logicNum>0) {
		blockTishi("该题仅可设置一条逻辑");
		return;
	}
	var html=[];
	var filter = [];
	var temp,ops,i,j,num,items,a,b,last,selA,selB,n,opsid;
	num=getNum(_this);
	html.push('<div class="logic"><span>如果本题选项选中</span>');
	html.push('<select class="a"  onChange="allowSelect(this,event);"><option value="0" selected>-请选择选项-</option>');
	if(type=="danxuan" || type=="duoxuan" ){
		ops=mapOptions(_this);
		opsid = mapOptionsId(_this);
		for(i=0;i<ops.length;i++){
				j=i+1;				
				html.push('<option id="'+opsid[i]+'" value="'+j+'">选项'+j+':&nbsp;'+ops[i]+'...</option>');
			}
		html.push('<option id="any" value="10000">任意选项</option>');			
		}else{
			html.push('<option  id="any" value="10001">显示</option>');	
			}				
	html.push('</select><span>则跳转到</span><select  class="b c" disabled="false">');
	html.push('<option selected value="0">-请选择题目-</option>');
	items=mapItems(num);
	itemsid = mapItemIds(num);
	for(a=0;a<items.length;a++){
			b=a+1+num;				
			html.push('<option  id="'+itemsid[a]+'" value="'+b+'">Q'+b+':&nbsp;'+items[a]+'...</option>');
		}	
	html.push('<option id="over" value="10000">正常结束（计入结果）</option></select>');
	html.push('<span class="del"><i class="fa fa-times" title="删除该行" onClick="delLog(this,event);"></i></span></div>');
	$(_this).closest("span.add").before(html.join(""));	
	last = $(_this).closest(".set_box").find("div.logic:last");
	selA = $(last).find("select.a");
	selB = $(last).find("select.b");
	filter = filterOptions(num);
	if(!!filter.length){
		for(n = 0; n < filter.length; n++){
			$(selA).find("option[value="+filter[n]+"]").remove();			
		}
		}
	event.stopPropagation();	
	}
	
//设置class为b的selection	的可选性
function allowSelect(_this,event){
	if(_this.value==10000){
		$(_this).closest(".logic").nextAll("span.add").hide();
		$(_this).next().next().val("0").removeAttr("disabled").removeClass("b");
		}else{
			$(_this).closest(".logic").nextAll("span.add").show();
			if(_this.value!=="-请选择选项-"){
				$(_this).next().next().val("0").removeAttr("disabled").removeClass("b");				
				}else{
					$(_this).next().next().val("0").prop("disabled","true").addClass("b");						
					}			
			}		
	event.stopPropagation();
	}

/*左侧添加题目模块*/
//题目重排序
function sortQ(savetoDb){
	var arr=$("body div.item:not('.page')");
	var len=arr.length;
	var temp;
	for(var i=0;i<len;i++){
		var index = i+1;
		$(arr[i]).attr({"qNum":index});
		//Tai
		$(arr[i]).attr({"id":"question"+index});
		temp=$("div.leftcontrol label:first",arr[i]);
		if(i<9){
			temp.text("Q:00"+(i+1));			
			}else if(i>=9 && i<100){
				temp.text("Q:0"+(i+1));
				}else{
					temp.text("Q:"+(i+1));
					}
			if (savetoDb) {
				var id = $(arr[i]).attr("data");
				if (typeof(id)!='undefined') {
					$.ajax({
						type:"POST",
						url:basepath+"/mgr/survey/question/update/title_num.json",
						data:{"id":id,"title_num":index},
						success:function(data){
							if(data){
								console.log("问题更改序号成功！");
							}else{
								console.log("问题更改序号失败！");
							}
						},error:function(data){
							console.log("问题更改序号失败！");
						}
					});
				}
			}
		}
	}
	
//点击，增加题目，页面滚动
function scrollPage(_this){
	var h;
	var h1=$(_this).height()/2;
	h=$(_this).offset().top;
	d=h-h1;
	$("html,body").animate({scrollTop:d},1000);
	}
	
//根据选择，增加题目  添加题目 绑定数据存储操作
function addItem(_this,event){
	var that;
	var html=[];
	var last=$(".sortBox .item:last");
	html = creatHtml(_this);	
	if(last.length<1){
		$(".sortBox").prepend(html.join(""));
		}else{
			$(html.join("")).insertAfter(last);
			}            	
	$(".item").bind("mouseover mouseout",function(){
			checkShow(this);		
		});
	$(".question-title").click(function(event){		
			clickQTitle(this,event);		
		});	
	$(".doitem").click(function(event){
			clickOption(this,event)		
		});
	$("td.ed1").click(function(event){
			clickTdEdit1(this,event)		
		});	
	$("td.ed2").click(function(event){
			clickTdEdit2(this,event)		
		});
	$("td.ed").click(function(event){
			clickTdEdit(this,event)		
		});		
	sortQ();
	setPageNum();		
	that = last;
	if(!!that.length){
		scrollPage(that);		
	}

	var just_index=$("body div.item:not('.page')").length;
	var qType = $(_this).attr("qType");
	var _id = "#question"+just_index;
	
	page_num = $(_id).prevAll(".page").length;
	//Tai
	if(qType=='danxuan'||qType=="duoxuan"||qType=="wenda"||qType=="dafen"||qType=="jzdanxuan"||qType=="jzduoxuan"||qType=="duanluo"){
		$.ajax({
			type: "POST",
			url:  basepath+"/mgr/survey/question/add.json",
			data:{"id":surveyId,"title_num":just_index,"type":qType,"page_num":page_num+1},
			success:function(data){
				if(data.result){
					if($(_id).length){
						$(_id).attr("data",data.id);
					}
					if (qType=='danxuan'||qType=='duoxuan') {
						var doitem = $(_id).find(".doitem");
						$(doitem[0]).attr("data",data.option1);
						$(doitem[1]).attr("data",data.option2);
					}else if(qType=='dafen'){
						var q_iterm = $(_id).find("tr");
						$(q_iterm[1]).attr("data",data.option1);
						$(q_iterm[2]).attr("data",data.option2);
					}else if(qType=='jzdanxuan'||qType=='jzduoxuan'){
						var q_Column = $(_id).find(".ed1");
						var q_Row = $(_id).find(".ed2");
						$(q_Column[0]).attr("data",data.option1);
						$(q_Column[1]).attr("data",data.option2);
						$(q_Row[0]).attr("data",data.matrixoption1);
						$(q_Row[1]).attr("data",data.matrixoption2);
					}
					console.log("添加题目成功");
				}else{
					alert("添加失败");
				}
			},
			error: function(data){
				alert('保存失败');
			}
		});
	}else  if (qType=='fenye'){
		var page_num = $("body div.page").length -1;
		addFenYeToDb(page_num);
	}
	
	//Tai
	//题目编辑完毕失去焦点时
	$(".question-title").blur(function(){
		var _id = $(this).closest(".item").attr("data");
		var title =  $(this).html();
		if(typeof(_id)=="undefined"){
			return;
		}
		updateQuestionTitleToDb(_id,title);
	});
}

//生成html
function creatHtml(_this){
	var qType = $(_this).attr("qType");
	var html=[];
	if(qType=="danxuan"){
		html.push('<div class="item" qType="danxuan" qNum="-1"><div class="leftcontrol"><label>Q:</label>');
		html.push('<ul class="gearslist control"><li title="题目设置"><i class="fa fa-gears pos" onClick="showQSet(this,event);"></i></li>');
		html.push('<li title="逻辑设置"><i class="fa fa-link pos" onClick="showQSet(this,event);"></i></li>');
		html.push('<li title="删除"><i class="fa fa-times" onclick="delItem(this)"></i></li></ul></div>');
		html.push('<div class="rightcontainer"><div class="superdo" style="display:none;" onclick="showdialogedit(this)">');
		html.push('<i class="fa fa-pencil" title="高级编辑"></i></div><div class="question-title">请输入该单选题题目名称</div>');
		html.push('<span class="radioitem doitem"><input type="radio" hIndex="1" /><span>选项1</span></span>');
		html.push('<span class="radioitem doitem"><input type="radio" hIndex="2" /><span>选项2</span></span>');
		html.push('<span class="radioitem control" style="display: none;"><i class="fa fa-plus-square" title="增加一行" onClick="addOption(this,event);"></i>&nbsp;</span></div>');
		html.push('<ul class="ud_arrow">');
		html.push('<li><i class="fa fa-angle-up" title="上一题" onClick="upItem(this,event);"></i></li><li><i class="fa fa-angle-down" title="下一题" onClick="downItem(this,event);"></i></li>');
		html.push('</ul>');
		html.push('<div class="logicNum"><span class="i"><i class="fa fa-link"></i></span><span class="n"><label>0</label></span></div></div>');
		}
	if(qType=="duoxuan"){
		html.push('<div class="item" qType="duoxuan" qNum="-1"><div class="leftcontrol"><label>Q:</label>');
		html.push('<ul class="gearslist control"><li title="题目设置"><i class="fa fa-gears pos" onClick="showQSet(this,event);"></i></li>');
		html.push('<li title="逻辑设置"><i class="fa fa-link pos" onClick="showQSet(this,event);"></i></li>');
		html.push('<li title="删除"><i class="fa fa-times" onclick="delItem(this)"></i></li></ul></div>');
		html.push('<div class="rightcontainer"><div class="superdo" style="display:none;" onclick="showdialogedit(this)">');
		html.push('<i class="fa fa-pencil" title="高级编辑"></i></div><div class="question-title">请输入该多选题题目名称</div>');
		html.push('<span class="radioitem doitem"><input type="checkbox" hIndex="1" /><span>选项1</span></span>');
		html.push('<span class="radioitem doitem"><input type="checkbox" hIndex="2" /><span>选项2</span></span>');
		html.push('<span class="radioitem control" style="display: none;"><i class="fa fa-plus-square" title="增加一行" onClick="addOption(this,event);"></i>&nbsp;</span></div>');
		html.push('<ul class="ud_arrow">');
		html.push('<li><i class="fa fa-angle-up" title="上一题" onClick="upItem(this,event);"></i></li><li><i class="fa fa-angle-down" title="下一题" onClick="downItem(this,event);"></i></li>');
		html.push('</ul>');
		html.push('<div class="logicNum"><span class="i"><i class="fa fa-link"></i></span><span class="n"><label>0</label></span></div></div>');
		}
	if(qType=="wenda"){
		html.push('<div class="item" qType="wenda" qNum="-1"><div class="leftcontrol"><label>Q:</label>');
		html.push('<ul class="gearslist control"><li title="题目设置"><i class="fa fa-gears pos" onClick="showQSet(this,event);"></i></li>');
		html.push('<li title="逻辑设置"><i class="fa fa-link pos" onClick="showQSet(this,event);"></i></li>');
		html.push('<li title="删除"><i class="fa fa-times" onclick="delItem(this)"></i></li></ul></div>');
		html.push('<div class="rightcontainer"><div class="superdo" style="display:none;" onclick="showdialogedit(this)">');
		html.push('<i class="fa fa-pencil" title="高级编辑"></i></div><div class="question-title">请输入该问答题题目名称</div>');
		html.push('<span class="radioitem"><input type="text" class="form-control" /></span>');
        html.push('</div>');
		html.push('<ul class="ud_arrow">');
		html.push('<li><i class="fa fa-angle-up" title="上一题" onClick="upItem(this,event);"></i></li>');
		html.push('<li><i class="fa fa-angle-down" title="下一题" onClick="downItem(this,event);"></i></li></ul>');
		html.push('<div class="logicNum"><span class="i"><i class="fa fa-link"></i></span><span class="n"><label>0</label></span></div></div>');                 
		}
	if(qType=="dafen"){
		html.push('<div class="item" qType="dafen" qNum="-1"><div class="leftcontrol"><label>Q:</label>');
		html.push('<ul class="gearslist control"><li title="题目设置"><i class="fa fa-gears pos" onClick="showQSet(this,event);"></i></li>');
		html.push('<li title="逻辑设置"><i class="fa fa-link pos" onClick="showQSet(this,event);"></i></li>');
		html.push('<li title="删除"><i class="fa fa-times" onclick="delItem(this)"></i></li></ul></div>');
		html.push('<div class="rightcontainer"><div class="superdo" style="display:none;" onclick="showdialogedit(this)">');
		html.push('<i class="fa fa-pencil" title="高级编辑"></i></div><div class="question-title">请输入该打分题题目名称</div>');				
		html.push('<div class="dafen2">');
        html.push('<table><tr class="fir"><td></td><td class="label3"><label class="a"></label><label class="b"></label><label class="c"></label></td><td></td></tr>');
		html.push('<tr><td class="ed" hIndex="1"><span>选项1</span></td><td class="fen"><ul><li>1</li><li>2</li><li>3</li><li>4</li><li>5</li></ul></td><td>分</td></tr>');
		html.push('<tr><td class="ed" hIndex="2"><span>选项2</span></td><td class="fen"><ul><li>1</li><li>2</li><li>3</li><li>4</li><li>5</li></ul></td><td>分</td></tr>');
		html.push('</table></div>');
		html.push('<label class="radioitem control" style="display: none;">');
		html.push('<i class="fa fa-plus-square" title="增加一行" onClick="addOption(this,event);"></i>&nbsp;');
		html.push('</label></div>');						
		html.push('<ul class="ud_arrow">');
		html.push('<li><i class="fa fa-angle-up" title="上一题" onClick="upItem(this,event);"></i></li>');
		html.push('<li><i class="fa fa-angle-down" title="下一题" onClick="downItem(this,event);"></i></li></ul>');
		html.push('<div class="logicNum"><span class="i"><i class="fa fa-link"></i></span><span class="n"><label>0</label></span></div></div>');                                                                   
		}
	if(qType=="jzdanxuan"){
		html.push('<div class="item" qType="jzdanxuan" qNum="-1"><div class="leftcontrol"><label>Q:</label>');
		html.push('<ul class="gearslist control"><li title="题目设置"><i class="fa fa-gears pos" onClick="showQSet(this,event);"></i></li>');
		html.push('<li title="逻辑设置"><i class="fa fa-link pos" onClick="showQSet(this,event);"></i></li>');
		html.push('<li title="删除"><i class="fa fa-times" onclick="delItem(this)"></i></li></ul></div>');
		html.push('<div class="rightcontainer"><div class="superdo" style="display:none;" onclick="showdialogedit(this)">');
		html.push('<i class="fa fa-pencil" title="高级编辑"></i></div><div class="question-title">请输入该矩阵单选题题目名称</div>');		
		html.push('<div class="addli control" style="display: none;">');
        html.push('<i class="fa fa-plus-circle" title="增加一列" onClick="addColumn(this,event);"></i>');
		html.push('</div>');
		html.push('<div class="tableBox">');
		html.push('<table class="table table-bordered table-responsive mytable">');		
		html.push('<tr><td><span>&nbsp;</span></td><td class="ed1" lIndex="1"><span>矩阵列1</span></td><td class="ed1" lIndex="2"><span>矩阵列2</span></td></tr>');
		html.push('<tr><td class="ed2" hIndex="1"><span>矩阵行1</span></td><td><input type="radio"></td><td><input type="radio"></td></tr>');
		html.push('<tr><td class="ed2" hIndex="2"><span>矩阵行2</span></td><td><input type="radio"></td><td><input type="radio"></td></tr>');
		html.push('</table></div>');
		html.push('<label class="radioitem control" style="display: none;">');
		html.push('<i class="fa fa-plus-square" title="增加一行" onClick="addOption(this,event);"></i>&nbsp;</label></div>');						
		html.push('<ul class="ud_arrow">');
		html.push('<li><i class="fa fa-angle-up" title="上一题" onClick="upItem(this,event);"></i></li>');
		html.push('<li><i class="fa fa-angle-down" title="下一题" onClick="downItem(this,event);"></i></li></ul>');
		html.push('<div class="logicNum"><span class="i"><i class="fa fa-link"></i></span><span class="n"><label>0</label></span></div></div>');	             
		}
	if(qType=="jzduoxuan"){
		html.push('<div class="item" qType="jzduoxuan" qNum="-1"><div class="leftcontrol"><label>Q:</label>');
		html.push('<ul class="gearslist control"><li title="题目设置"><i class="fa fa-gears pos" onClick="showQSet(this,event);"></i></li>');
		html.push('<li title="逻辑设置"><i class="fa fa-link pos" onClick="showQSet(this,event);"></i></li>');
		html.push('<li title="删除"><i class="fa fa-times" onclick="delItem(this)"></i></li></ul></div>');
		html.push('<div class="rightcontainer"><div class="superdo" style="display:none;" onclick="showdialogedit(this)">');
		html.push('<i class="fa fa-pencil" title="高级编辑"></i></div><div class="question-title">请输入该矩阵多选题题目名称</div>');		
		html.push('<div class="addli control" style="display: none;">');
        html.push('<i class="fa fa-plus-circle" title="增加一列" onClick="addColumn(this,event);"></i>');
		html.push('</div>');
		html.push('<div class="tableBox">');
		html.push('<table class="table table-bordered table-responsive mytable">');		
		html.push('<tr><td><span>&nbsp;</span></td><td class="ed1" lIndex="1"><span>矩阵列1</span></td><td class="ed1" lIndex="2"><span>矩阵列2</span></td></tr>');
		html.push('<tr><td class="ed2" hIndex="1"><span>矩阵行1</span></td><td><input type="checkbox"></td><td><input type="checkbox"></td></tr>');
		html.push('<tr><td class="ed2" hIndex="2"><span>矩阵行2</span></td><td><input type="checkbox"></td><td><input type="checkbox"></td></tr>');
		html.push('</table></div>');
		html.push('<label class="radioitem control" style="display: none;">');
		html.push('<i class="fa fa-plus-square" title="增加一行" onClick="addOption(this,event);"></i>&nbsp;</label></div>');						
		html.push('<ul class="ud_arrow">');
		html.push('<li><i class="fa fa-angle-up" title="上一题" onClick="upItem(this,event);"></i></li>');
		html.push('<li><i class="fa fa-angle-down" title="下一题" onClick="downItem(this,event);"></i></li></ul>');
		html.push('<div class="logicNum"><span class="i"><i class="fa fa-link"></i></span><span class="n"><label>0</label></span></div></div>');           
		}
	if(qType=="duanluo"){
		html.push('<div class="item" qType="duanluo" qNum="-1"><div class="leftcontrol"><label>Q:</label>');
		html.push('<ul class="gearslist control"><li title="题目设置"><i class="fa fa-gears pos" onClick="showQSet(this,event);"></i></li>');
		html.push('<li title="逻辑设置"><i class="fa fa-link pos" onClick="showQSet(this,event);"></i></li>');
		html.push('<li title="删除"><i class="fa fa-times" onclick="delItem(this)"></i></li></ul></div>');
		html.push('<div class="rightcontainer"><div class="superdo" style="display:none;" onclick="showdialogedit(this)">');
		html.push('<i class="fa fa-pencil" title="高级编辑"></i></div><div class="question-title">请输入该段落说明的内容</div></div>');					
		html.push('<ul class="ud_arrow">');
		html.push('<li><i class="fa fa-angle-up" title="上一题" onClick="upItem(this,event);"></i></li>');
		html.push('<li><i class="fa fa-angle-down" title="下一题" onClick="downItem(this,event);"></i></li></ul>');
		html.push('<div class="logicNum"><span class="i"><i class="fa fa-link"></i></span><span class="n"><label>0</label></span></div></div>');
		}
	if(qType=="fenye"){
		html.push('<div class="item page" qType="fenye" qNum="-1"><div class="leftcontrol">');
		html.push('<ul class="gearslist control"><li title="删除"><i class="fa fa-times" onclick="delItem(this,event);"></i></li></ul></div>');
		html.push('<div class="pageDrag"><span>页码:&nbsp;&nbsp;<label class="a">?</label>/<label class="b">?</label></span></div>');			
		html.push('<ul class="ud_arrow">');
		html.push('<li><i class="fa fa-angle-up" title="上一题" onClick="upItem(this,event);"></i></li>');
		html.push('<li><i class="fa fa-angle-down" title="下一题" onClick="downItem(this,event);"></i></li></ul>');
		html.push('</div>');
		}	
	return html;
	}
		
//全局逻辑设置
//设置逻辑条数
function setLogicNum(){
	var num =  $(".menuBox1 ul li").length;
	$(".menuLogic > span label").text(num);		
	}

//设置题目逻辑状态
function setLogAble(_this){
	var temp =  $(_this).closest(".item");
	var arr = $(temp).find(".set_box .logic select.c");
	var ops;
	var qType = $(temp).attr("qType");
	var i;
	var num = 0;
	if(qType == "danxuan" || qType == "duoxuan"){
		ops = $(temp).find(".doitem input").length;
		for(i = 0; i < arr.length; i++){
			if($(arr[i]).val() != 0){
				num++;
				}
			}
		}else{
				ops = 1;
				for(i = 0; i < arr.length; i++){
				if($(arr[i]).val() != 0){
					num++;
					}
				}			
			}	
	if(num === ops){
		$(temp).attr({"logable":"false","lognum":num});
		}else{
			$(temp).attr({"logable":"true","lognum":num});
			}
	if(num !== 0){
		$(temp).find("div.logicNum").css({"display":"block"}).find("span.n label").text(num);
		}else{
			$(temp).find("div.logicNum").css({"display":"none"}).find("span.n label").text(0);		
			}
	}
	
//设置全局逻辑  select.a
function setFirstSel(){
	var items = $(".item:not('[logable=false],.page')");
	return items;	
	}
	
//设置全局逻辑  select.b
function setSecondSel(num){
	var q = $(".item[qNum="+num+"]");
	var qType = $(q).attr("qType");
	var arr = [];
	var str = "one";
	if(qType == "danxuan" || qType == "duoxuan"){
		arr = $(q).find(".rightcontainer .doitem");
		return arr;	
		}
	return str;	
	}


//增加一条全局逻辑
function addMenuLog(_this,event){
	var html = [];
	var str1,str2,str3;
	var arr1,arr2,arr3;
	var i,j,n;
	var val,txt;
	html.push('<li>如果<select class="a" onChange="selAChange(this,event);"><option value="0" selected>-请选择题目-</option>');
	arr1 = setFirstSel();
	for(i = 0; i < arr1.length; i++){
		val = $(arr1[i]).attr("qNum");
		txt = $(arr1[i]).find(".question-title").text();
		html.push('<option value="'+val+'">Q'+val+':&nbsp;'+txt+'</option>');
		}
	html.push('</select>选择了<select class="b u" disabled onChange="selBChange(this,event);"><option value="0">-请选择选项-</option>');
	html.push('</select>则跳转到<select class="c u" disabled onChange="selCChange(this,event);"><option value="0">-请选择题目-</option>');
	html.push('</select><i class="fa fa-times" title="删除该条" onclick="delMenuLog(this,event);"></i></li>');
	$(".menuBox1 ul").append(html.join(""));	
	$(_this).hide();
	event.stopPropagation();	
	}

//删除一条全局逻辑
function delMenuLog(_this,event){
//	$(_this).closest(".menuBox1").find(".addL i").show();
	var id = $(_this).closest("li").attr("data");
	$.ajax({
		type:"POST",
		url:basepath+"/mgr/survey/strategy/delete.json",
		data:{"id":id},
		success:function(data){
			if(data){
				var qnum = $(_this).closest("li").attr("qnum");
				var item = $(".item[qnum="+qnum+"]");
				var q_logNum = item.find(".logicNum .n label").html()-1;
				if(0==q_logNum){
					item.find(".logicNum").hide();
				}else{
					item.find(".logicNum .n label").html(q_logNum);
				}
				$(_this).closest("li").remove();
				var num = $("#alllogic_num").html()-1;
				$("#alllogic_num").html(num);
				console.log("逻辑删除成功！");
			}else{
				console.log("逻辑删除失败！");
			}
		},error:function(data){
			console.log("逻辑删除失败！");
		}
	});
	
	
	event.stopPropagation();
	}
	
//监听select.a
function selAChange(_this,event){
 	var val = parseInt($(_this).val());
	var temp = $(_this).closest("li");
	var html = [];
	var arr;
	var i,v,t;
	if(val !== 0){
		$(temp).find("select.b").removeAttr("disabled").removeClass("u");
		arr = setSecondSel(val);
		if(arr === "one"){
			$(temp).find("select.b").html("");
			html.push('<option value="0">-请选择选项-</option><option value="10001">显示</option>');
			}else{
				$(temp).find("select.b").html("");
				html.push('<option value="0">-请选择选项-</option>');
				if(!!arr.length){	
					for(i = 0; i < arr.length; i++){						
						v = $(arr[i]).find("input").attr("hIndex");
						
						if($(arr[i]).find("input").next("span").length){
							t =  $(arr[i]).find("input").next("span").text();	
							}else{
								t =   $(arr[i]).find("p.change").text();								
								}
						html.push('<option value="'+v+'">选项'+v+':'+t+'</option>');						
						}
						html.push('<option value="10000">任意选项</option>');
					}else{
						html.push('<option value="10000">任意选项</option>');
						}				
				}
			
			$(temp).find("select.b").append(html.join(""));
		}else{			
			$(temp).find("select.b").attr({"disabled":"true"}).addClass("u").val(0);
			$(temp).find("select.c").attr({"disabled":"true"}).addClass("u").val(0);
			}
	}


//监听select.b
function selBChange(_this,event){
	var temp = $(_this).closest("li");
	var val = parseInt($(temp).find("select.a").val());
	var val2 = parseInt($(temp).find("select.b").val());
	var arr = [];
	var html = [];
	var i,v,t;
	if(val !== 0){
		$(temp).find("select.c").removeAttr("disabled").removeClass("u");
		$(temp).find("select.c").html("");
		html.push('<option value="0">-请选择题目-</option>');
		arr = mapItems(val);
		for(i = 0; i < arr.length; i++){
			v = i+1+ val;			
			html.push('<option value="'+v+'">Q'+v+':&nbsp;'+arr[i]+'</option>');
		}	
		html.push('<option value="10000">正常结束（计入结果）</option><option value="10001">提前结束（不计入结果）</option>');
		$(temp).find("select.c").append(html.join(""));
		}
	if(val2 === 0){
			$(temp).find("select.c").attr({"disabled":"true"}).addClass("u").val(0);
		}		
	}

//有数据时监听select.b
function selBChangeWithData(_this,event,current_oid){
	var temp = $(_this).closest("li");
	var val = parseInt($(temp).find("select.a").val());
	var val2 = parseInt($(temp).find("select.b").val());
	var arr = [];
	var html = [];
	var ids =[];
	var i,v,t,id;
	if(val !== 0){
		$(temp).find("select.c").removeAttr("disabled").removeClass("u");
		$(temp).find("select.c").html("");
		html.push('<option value="0">-请选择题目-</option>');
		arr = mapItems(val);
		ids = mapItemIds(val);
		for(i = 0; i < arr.length; i++){
			v = i+1+ val;
			id = ids[i]
			if(id==current_oid){
				html.push('<option selected data="'+id+'" value="'+v+'">Q'+v+':&nbsp;'+arr[i]+'</option>');
			}else{
				html.push('<option data="'+id+'" value="'+v+'">Q'+v+':&nbsp;'+arr[i]+'</option>');
			}
			
		}
		if(current_oid=='any'){
			html.push('<option selected value="10000">正常结束（计入结果）</option>');
		}else{
			html.push('<option value="10000">正常结束（计入结果）</option>');
		}
		
		$(temp).find("select.c").append(html.join(""));
		}
	if(val2 === 0){
			$(temp).find("select.c").attr({"disabled":"true"}).addClass("u").val(0);
		}		
	}

//监听select.c
function selCChange(_this,event){
	var temp = $(_this).closest("li");
	var val = parseInt($(_this).val());
	if(val !== 0){
		$(temp).find("select").attr({"disabled":"true"}).addClass("u");
		}
	$(_this).closest(".menuBox1").find(".addL i").show();
	}
	
//辅助功能
//单选变多选
function danBianDuo(_this){
	var temp = $(_this).closest(".item");
	var qType = $(temp).attr("qType");
	if(qType == "danxuan"){
		$(temp).attr({"qType":"duoxuan"});
		}else if(qType == "jzdanxuan"){
			$(temp).attr({"qType":"jzduoxuan"});	
				}
	$(_this).closest(".item").find(".rightcontainer :radio").attr({"type":"checkbox"});
	
	}
	
//多选变单选
function duoBianDan(_this){
	var temp = $(_this).closest(".item");
	var qType = $(temp).attr("qType");
	if(qType == "duoxuan"){
		$(temp).attr({"qType":"danxuan"});
		}else if(qType == "jzduoxuan"){
			$(temp).attr({"qType":"jzdanxuan"});	
				}
	$(_this).closest(".item").find(".rightcontainer :checkbox").attr({"type":"radio"});
	}
	
//打分题保存设置
function saveDafen(_this){
	var qid = $(_this).closest(".item").attr("data"); 
	var setBox = $(_this).closest(".set_box");
	var temp = $(_this).closest(".item");
	var a,b,c,d,e,min;
	var i,gap,str;
	a = Number($(setBox).find(".dafen-a input").val());
	min = a;
	b = Number($(setBox).find(".dafen-b input").val());
	c = $(setBox).find(".dafen-c input").val();
	d = $(setBox).find(".dafen-d input").val();
	e = $(setBox).find(".dafen-e input").val();
	if(b-a > 10){
		blockTishi("最多只能设置10个分值");
		return;
	}
	if(a === 0 || b === 0||a>b){
		blockTishi("最高分应大于最低分（大于零）");	
		return;
		}else{
			str = "";
			gap = b - a;
			$(temp).find(".rightcontainer td.label3 label.a").text(c);
			$(temp).find(".rightcontainer td.label3 label.b").text(e);
			$(temp).find(".rightcontainer td.label3 label.c").text(d);
			for(i = 0; i <= gap; i++){
				str += '<li>'+a+'</li>';	
				a++;	
				}
			$(temp).find(".rightcontainer td.fen ul").html(str);
			$(temp).find(".rightcontainer td.fen ul li").css({"width":Math.floor(420/(gap+1))+"px"});
			//Tai
			$.ajax({
				type:"POST",
				url:basepath+"/mgr/survey/question/scoresetting.json",
				data:{"qid":qid,"min_score":min,"max_score":b,"left_info":c,"middle_info":d,"right_info":e},
				success:function(data){
					if (data) {
						console.log('打分题设置修改成功！');
					}
				},error:function(data){
					console.log('打分题设置修改失败！');
				}
			});
			}
	
	}

//增加逻辑时增加页
function addPage(_this){
	var temp = $(_this).closest(".item");
	var html = [];
	html.push('<div class="item page" qType="fenye"><div class="leftcontrol">');
	html.push('<ul class="gearslist control"><li title="删除"><i class="fa fa-times" onclick="delItem(this,event);"></i></li></ul></div>');
	html.push('<div class="pageDrag"><span>页码:&nbsp;&nbsp;<label class="a">?</label>/<label class="b">?</label></span></div>');			
	html.push('<ul class="ud_arrow">');
	html.push('<li><i class="fa fa-angle-up" title="上一题" onClick="upItem(this,event);"></i></li>');
	html.push('<li><i class="fa fa-angle-down" title="下一题" onClick="downItem(this,event);"></i></li></ul>');
	html.push('</div>');
	$(temp).after(html.join(""));
	setPageNum();
	$(".item").bind("mouseover mouseout",function(){
		checkShow(this);		
	});
	}	
	
//冒泡提示
function blockTishi(str){
	var html = '<div class="tishi">'+str+'</div>';
	$("body").prepend(html);
	$(".tishi").fadeIn(1000);
	setTimeout(function(){
		$(".tishi").fadeOut(1000);	
		$(".tishi").remove();
		},1500);
	clearTimeout();	
	}
	
//左侧设置模块,保存高级设置弹出层
function saveQSet(_this,event){
	var judge =  $(_this).closest("li").attr("title");
	var qType = $(_this).closest(".item").attr("qType");
	var qid = $(_this).closest(".item").attr("data");
	if(judge == "题目设置"){
			var allow_skip = $(_this).parent().prev().find("#allow_skip").is(":checked")?1:0;
			var changetype = $(_this).parent().prev().find("#changetype").is(":checked")?1:0;
			var op_random = $(_this).parent().prev().find("#op_random").is(":checked")?1:0;
			//
			if(qType === "dafen"){
				saveDafen(_this);
				}
				//Tai
			if (qType==="danxuan"||qType==="jzdanxuan") {
				if (changetype == 1) {
					danBianDuo(_this);
				}
			}
			if(qType==="duoxuan"||qType==="jzduoxuan"){
				duoBianDan(_this);
			}
			$.ajax({
				type:"POST",
				url:basepath + "/mgr/survey/question/setting.json",
				data:{"qid":qid,"allow_skip":allow_skip,"op_random":op_random,"changetype":changetype},
				success:function(data){
					if (data) {
						console.log("修改设置成功！");
					}
				},error:function(data){
					console.log("修改设置失败！");
				}
			});
			
		}else if(judge == "逻辑设置"){
			setLogAble(_this);
			//LUOJIBAOCUN
			var logicArea = $(_this).parent().prev().find("div.logic");
			
			var allquestions = $("body div.item:not('.page')");
			var questionArea = $(_this).closest(".item");
			var question_id = $(questionArea).attr("data");
			var option_id,jumpto_quesntion_id;
			var nextpagenum = $(questionArea).nextAll("div.page:eq(0)").find(".a").html();
		for ( var i = 0; i < logicArea.length; i++) {
			var a_value = $(logicArea[i]).find("select.a").val();
			var c_value = $(logicArea[i]).find("select.c").val();
			var jump_id = $(logicArea[i]).attr("data");
			if (typeof(jump_id)=='undefined'){
				jump_id='';
			}
			//只有条件结果都有的时候才会添加,并且logic的data没有值 有的话代表从数据中加载出来的
			if (a_value != '0' && c_value != '0') {
				// 单选题多选题添加逻辑设置
				if ($(questionArea).attr("qtype") == "danxuan"||$(questionArea).attr("qtype") == "duoxuan") {
					var options = $(questionArea).find(".doitem");
					if (a_value == '10000') {
						option_id = 'any'
					} else {
						for ( var j = 0; j < options.length; j++) {
							if (a_value == (j + 1)) {
								option_id = $(options[j]).attr("data");
							}
						}
					}
					}
				if ($(questionArea).attr("qtype") == "wenda"||$(questionArea).attr("qtype") == "duanluo"||$(questionArea).attr("qtype") == "duanluo") {
					option_id = 'any';
				}
					if (c_value == '10000') {
						jumpto_quesntion_id = 'over';
					} else {
						for ( var n = 0; n < allquestions.length; n++) {
							if (c_value == (n + 1)) {
								jumpto_quesntion_id = $(allquestions[n]).attr(
										"data");
							}
						}
					}
					// 该题目后面没有分页的时候添加更改分页
					if (typeof ($(questionArea).next().attr('qtype')) != "undefined"
							&& $(questionArea).next().attr("qtype") != 'fenye') {
						//后面处了尾页没有分页的时候
						if(typeof(nextpagenum)=='undefined'){
							nextpagenum = $("#endpage").html();
						}
						addPage(_this);
						addFenYeToDb(nextpagenum,question_id);
					}
					addJumpStategy(surveyId, question_id, option_id,
							jumpto_quesntion_id, _this,jump_id);
				

			}
			}
			
			}
	$(_this).closest(".set_box").detach();
	event.stopPropagation();
	}

//Tai  收集设置
function subBtn(_this){
	var use_collect = $("#use_collect").is(":checked");//使用份数据时结束
	var use_pwd = $("#use_pwd").is(":checked");//是否启用密码
	var collect_num = $.trim($("#collect_num").val());//收集的份数
	var show_person_result = $("#show_person_result").is(":checked")?1:0;//允许受访人答完问卷后查看结果
	var use_date = $("#use_date").is(":checked");//使用结束时间
	var date = $("#datePicker").val();//结束时间
	var ip_oncepnly = $("#ip_oncepnly").is(":checked")?1:0;//每个IP只能答一次
	var once_only = $("#once_only").is(":checked")?1:0;//只能参加一次
	var weixinonly = $("#weixinonly").is(":checked")?1:0;//只能通过微信回答
	var pwd =  $.trim($("#pwd").val());//密码
	if(!use_collect){
		collect_num=0;
	}
	if(!use_pwd){
		pwd="";
	}
	if(!use_date){
		date="";
	}
	if(!($("#warn").is(":hidden"))){
		return;
	}
	
	if(use_pwd&&pwd==''){
		blockTishi("请输入密码！");
		return;
	}
	
	$.ajax({
		type:"POST",
		url:basepath+"/mgr/survey/collection/setting.json",
		data:{"id":surveyId,"collect_num":collect_num,"use_pwd":use_pwd,"pwd":pwd,"show_person_result":show_person_result,"ip_oncepnly":ip_oncepnly,
			"date":date,"once_only":once_only,"weixinonly":weixinonly},
		success:function(data){
			if (data) {
				$(_this).closest(".menuBox,.menuBox1").hide(200);
				console.log('收集设置成功');
			}else{
				console.log('收集设置失败');
			}
			
		},error:function(data){
			console.log('收集设置失败');
		}
	});
	$(_this).closest(".menuBox,.menuBox1").hide(200);
}

$("#logicSet").click(function(){
	
});
//保存封面
function saveFile(cover){
	$.ajax({
		type:"POST",
		url:basepath+"/mgr/survey/update/cover.json",
		data:{"id":surveyId,"cover":cover},
		success:function(data){
			if (data) {
				console.log("封面修改成功！");
			}else{
				console.log("封面修改失败");
			}
		},
		error:function(data){
			console.log("封面修改失败");
		}
	});
}
//向数据库添加保存分页,不是添加到最后一个的时候默认把新加的分页之后的所有的问题页码都加1
function addFenYeToDb(page_num,before_ID){
	var pages = $("body div.page");
	var behind = $(pages[page_num-1]).nextAll();
	var behindids = '';
	$.ajax({
		type:"POST",
		url:basepath+"/mgr/survey/question/add.json",
		data:{"id":surveyId,"page_num":page_num,"type":"fenye","before_ID":before_ID},
		success:function(data){
			if (data.result) {
				console.log('添加分页成功');
				$(pages[page_num-1]).attr("data",data.id);
			}else{
				console.log('添加分页失败');
			}
		},error:function(data){
			console.log('添加分页失败');
		}
	});
	if(behind.length>0){
		for ( var i = 0; i < behind.length; i++) {
			var id = $(behind[i]).attr("data");
			if(typeof(id)!='undefined'){
				behindids = behindids+','+id;	
			}
		}
		AupdatePageNum(surveyId,behindids,1);
	}
	
}
//修改调研标题
function updateTitleToDb(title){
	$.ajax({
		type:"POST",
		url:basepath+"/mgr/survey/update/title.json",
		data:{"id":surveyId,"title":title},
		success:function(data){
			if(data.result){
				console.log("选项调研标题成功!");
			}else{
				alert("修改调研标题失败！");
			}
		},
		error:function(data){
			alert("修改调研标题失败！");
		}
	});
}
//修改调研简介
function updateRemarkToDb(remark){
	$.ajax({
		type:"POST",
		url:basepath+"/mgr/survey/update/remark.json",
		data:{"id":surveyId,"remark":remark},
		success:function(data){
			if (data) {
				console.log("修改调研简介成功！");
			}else{
				alert('保存失败');
			}
		},
		error:function(data){
			alert('保存失败');
		}
	});
}
//修改题目标题
function updateQuestionTitleToDb(id,title){
	$.ajax({
		type: "POST",
		url:  basepath+"/mgr/survey/question/update/title.json",
		data:{"id":id,"title":title},
		success:function(data){
			if(data){
			}else{
				alert("保存失败！");
			}
		},
		error: function(data){
			alert('保存失败！！');
		}
	});
}
//修改选项标题
function updateOptionTitleToDb(question_id,option_title,option_id,ismatrix){
	$.ajax({
		type: "POST",
		url:  basepath+"/mgr/survey/option/update/content.json",
		data:{"question_id":question_id,"content":option_title,"option_id":option_id,"ismatrix":ismatrix},
		success:function(data){
				if(data){
					console.log("选项题目修改添加完成");
				}else{
					alert('保存失败');
				}
			},
		error: function(data){
			alert('保存失败');
			}
	});
}
//添加逻辑
function addJumpStategy(survey_id,question_id,option_id,jumpto_quesntion_id,_this,jump_id){
	$.ajax({
		type:"POST",
		url:basepath+"/mgr/survey/strategy/add.json",
		data:{"survey_id":survey_id,"question_id":question_id,"option_id":option_id,"jumpto_quesntion_id":jumpto_quesntion_id,"jump_id":jump_id},
		success:function(data){
			if (data) {
				console.log("逻辑添加成功！");
			}else{
				console.log("逻辑添加失败！");
				alert("逻辑添加失败！");
			}
		},error:function(data){
			console.log("逻辑添加失败！");
			alert("逻辑添加失败！");
		}
	});
}
//更改某个题目后面的所有问题的页码
function AupdatePageNum(survey_id,question_ids,modified){
	$.ajax({
		type:"POST",
		url:basepath+"/mgr/survey/pagenum/batchupdate.json",
		data:{"survey_id":survey_id,"question_ids":question_ids,"modified":modified},
		success:function(data){
			if(data){
				console.log('页码修改成功');
			}else{
				console.log('页码修改成功');
				alert('页码修改成功');
			}
		},error:function(data){
			console.log('页码修改成功');
			alert('页码修改成功');
		}
	});
}
//添加逻辑设置选项
function addlogicItem(_this,type,jumpList){
	var html=[];
	var ops,i,j,num,items,a,b,opsid,itemsid;
	html.push('<div class="set_box">');
	html.push('<div class="l_arr"><i class="fa fa-angle-double-left"></i></div>');
	html.push('<div class="r_set">');
	html.push('<div class="s_header">');
	html.push('<span>逻辑设置</span>');
	html.push('<span class="close"><i class="fa fa-times" onClick="hideQSet(this,event);"></i></span>');
	html.push('</div>');
	html.push('<div class="s_container"><span class="ttl">跳转条件</span>');
	//没有设置的逻辑设置时候
	if(jumpList.length==0||typeof(jumpList.length)=="undefined"){
		html.push('<div class="logic">');
		html.push('<span>如果本题选项选中</span><select class="a" onChange="allowSelect(this,event);">');
		html.push('<option selected value="0">-请选择选项-</option>');	
		num=getNum(_this);	//题目编号
		if(type=="danxuan" || type=="duoxuan" ){
			//数据填充处
			ops=mapOptions(_this);
			opsid = mapOptionsId(_this);
			for(i=0;i<ops.length;i++){
					j=i+1;
					html.push('<option id="'+opsid[i]+'" value="'+j+'">选项'+j+':&nbsp;'+ops[i]+'...</option>');
				}
			html.push('<option id="any" value="10000">任意选项</option></select>');		
			}else{
				html.push('<option id="any" value="10001">显示</option></select>');	
				}				
		html.push('<span>则跳转到</span><select  class="b c" disabled="false">');
		html.push('<option selected value="0">-请选择题目-</option>');
		//数据填充处		
		items=mapItems(num);
		itemsid = mapItemIds(num);
		for(a=0;a<items.length;a++){
				b=a+1+num;				
				html.push('<option  id="'+itemsid[a]+'" value="'+b+'">Q'+b+':&nbsp;'+items[a]+'...</option>');
			}
		html.push('<option id="over" value="10000">正常结束（计入结果）</option>');
		html.push('</select>');
		html.push('<span class="del"><i class="fa fa-times" title="删除该行" onClick="delLog(this,event);"></i></span></div>');
	}
	
	//有设置的逻辑设置时候
	for(var x = 0 ;x<jumpList.length;x++){
		console.log(jumpList[x]);
		html.push('<div class="logic" data="'+jumpList[x].id+'">');
		html.push('<span>如果本题选项选中</span><select class="a" onChange="allowSelect(this,event);">');
		html.push('<option value="0">-请选择选项-</option>');	
		num=getNum(_this);	//题目编号
		if(type=="danxuan" || type=="duoxuan" ){
			//数据填充处
			ops=mapOptions(_this);
			opsid = mapOptionsId(_this);
			for(i=0;i<ops.length;i++){
					j=i+1;
					if(jumpList[x].option_id==opsid[i]){
						html.push('<option selected id="'+opsid[i]+'" value="'+j+'">选项'+j+':&nbsp;'+ops[i]+'...</option>');
					}else{
						html.push('<option id="'+opsid[i]+'" value="'+j+'">选项'+j+':&nbsp;'+ops[i]+'...</option>');
					}
				}
			if(jumpList[x].option_id=='any'){
				html.push('<option id="any" selected value="10000">任意选项</option></select>');	
			}else{
				html.push('<option id="any" value="10000">任意选项</option></select>');
			}
			}else{
				if(jumpList[x].option_id=='any'){
					html.push('<option id="any" selected value="10001">显示</option></select>');
				}else{
					html.push('<option id="any" value="10001">显示</option></select>')
				}
			}				
		html.push('<span>则跳转到</span><select class="c" >');
		html.push('<option  value="0">-请选择题目-</option>');
		//数据填充处		
		items=mapItems(num);
		itemsid = mapItemIds(num);
		for(a=0;a<items.length;a++){
				b=a+1+num;
				if(jumpList[x].jump_to==itemsid[a]){
					html.push('<option selected id="'+itemsid[a]+'" value="'+b+'">Q'+b+':&nbsp;'+items[a]+'...</option>');
				}else{
					html.push('<option  id="'+itemsid[a]+'" value="'+b+'">Q'+b+':&nbsp;'+items[a]+'...</option>');
				}
				
			}
		if(jumpList[x].jump_to=='over'){
			html.push('<option  selected id="over" value="10000">正常结束（计入结果）</option>');
		}else{
			html.push('<option id="over" value="10000">正常结束（计入结果）</option>');
		}
		html.push('</select>');
		html.push('<span class="del"><i class="fa fa-times" title="删除该行" onClick="delLog(this,event);"></i></span></div>');
	}
	
	
	html.push('<span class="add"><i class="fa fa-plus-square" title="增加一行" onClick="addLog(this,event);"></i></span></div>');
	html.push('<div class="s_footer"><span onClick="saveQSet(this,event);">保存</span></div></div></div>');
	$(_this).append(html.join(""));
}
//加载对应的逻辑数据到整体逻辑设置
function addLogicTomenuBox1(){
	$.ajax({
		type:"POST",
		url:basepath+"/mgr/survey/strategy/detall.json",
		data:{"survey_id":surveyId},
		success:function(data){
			var html = [];
			for(x=0;x<data.list.length;x++){
				
				var qid = data.list[x].source_qid;
				var optionid = data.list[x].option_id;
				var jumptoid = data.list[x].jump_to;
				var item = $(".item[data="+qid+"]");
				var qNum = item.attr("qNum");
				var qType = item.attr("qType");
				var qTtl = item.find("div.question-title").text();
				
				var jumptoitem = $(".item[data="+jumptoid+"]");
				var jumptoqNum = jumptoitem.attr("qNum");
				var jumptoqTtl = jumptoitem.find("div.question-title").text();
				
				var opsTtl;
				
				html.push('<li data="'+data.list[x].id+'" qNum="'+qNum+'">如果<select class="a u" disabled>');
				html.push('<option  value="1" selected>Q'+qNum+':'+qTtl+'</option></select>');

				if(qType=="danxuan"||qType=="duoxuan"){
					if(optionid=='any'){
						opsTtl = '任意选项';
					}else{
						opsTtl = item.find(".doitem[data="+optionid+"]").find("input+span").text()||item.find(".doitem[data="+optionid+"]").find("div.change").text();
					}
					html.push('选择了<select class="b u" disabled><option value="0">'+opsTtl+'</option></select>则跳转到');
				}else{
				html.push('选择了<select class="b u" disabled><option value="0">显示</option></select>则跳转到');
				}
				if(jumptoid=='over'){
					html.push('<select class="c u" disabled><option  value="1" selected>正常结束</option></select>');
				}else{
					html.push('<select class="c u" disabled><option  value="1" selected>Q'+jumptoqNum+':'+jumptoqTtl+'</option></select>');
				}
				html.push('<i class="fa fa-times" title="删除该条" onclick="delMenuLog(this,event);"></i></li>');
			}
			$(".menuBox1 ul").append(html.join(""));
			setLogicNum();
		},error:function(data){
			
		}
	});
}

//发布调研
function Release(){
	var html='<span style="display:inline-block;padding:10px;font-size:16px;width:250px;">确定发布该调研吗？</span>';
	var cancelBt=function(){};
	var sureBt=function(){
		$.ajax({
			type:"POST",
			url:basepath+"/mgr/survey/do/release.json",
			data:{"surveyId":surveyId},
			success:function(data){
				if(data){
					blockTishi("发布成功！");
				}
				blockTishi("发布失败，请稍后尝试！");
			},error:function(data){
				blockTishi("发布失败，请稍后尝试！");
			}
		});
	};
	easyDialog.open({
        container : {
            header : "提示：",
            content : html,
			yesFn: sureBt,
            noFn : cancelBt,
			yesText: "确定",
			noText: "取消"			
        },
		overlay: true,
        callback : cancelBt
    });
}



