		/** 添加错误信息 */
		function addError(id){
			$(id).addClass("has-error").focus();
//			myShow("tip_"+id);
//			obj.focus();
		}
		function removeError(id){
			$(id).removeClass("has-error");
//			myHide("tip_"+id);
		}
		

		
		
		
function add(){
	 var id=$("#hid_id").val();
	//活动名称
	var activename=$.trim($("#active-name").val());
	//封面
	var cover=$("#cover").val();
	//简介
	var jianjie=$.trim($("#active-synopsis").val());
	//开始时间
	var begintime=$.trim($("#active-starttime").val());
	//结束时间
	var endtime=$.trim($("#active-endtime").val());
	//主办方
	var domainname=$.trim($("#active-user").val());
	//活动地址
	var address=$.trim($("#active-address").val());
	//关键词
	var key=$.trim($("#active-key").val());
	
	var hasLimit = $("input[name='hasLimit']:checked").val();
	
	//是否在详情页显示map
	var showInDetail=$("#myswitch").val();
	//是否公开
	var isopen=$("#myswitch2").val();
	//活动地址的坐标
	var coordinate=$("#hid_coordinate").val();
	//活动内容
	var content=editor.getContent();
		
	if(activename==null || activename==""){
		$("#active-name").addClass("has-error").focus();
		return;
	}
	
	
	var params = {};
	params["activename"]=activename;
	if(cover!=null && cover!=""){
		params["cover"]=cover;
	}
	if(jianjie!=null && jianjie!=""){
		params["jianjie"]=jianjie;
	}
	if(begintime!=null && begintime!=""){
		params["begintime"]=begintime;
	}
	if(endtime!=null && endtime!=""){
		params["endtime"]=endtime;
	}
	if(domainname!=null && domainname!=""){
		params["domainname"]=domainname;
	}
	if(address!=null && address!=""){
		params["address"]=address;
	}
	if(key!=null && key !=""){
		params["key"]=key;
	}
	if(hasLimit==null || hasLimit == ""){
		hasLimit = "0";
	}
	params["haslimit"] = hasLimit;
	
	if(content!=null && content!=""){
		params["content"]=content;
	}
	if(showInDetail!=null && showInDetail!=""){
		params["showInDetail"]=showInDetail;
	}
	
	if(isopen!=null && isopen!=""){
		params["isopen"]=isopen;
	}
	
	
	if(id!=null && id!=""){
		params["id"]=id;
	}
	
	if(coordinate!=null && coordinate!=""){
		params["coordinate"]=coordinate;
	}
	validateFindKey("active-key",params);
}
function updatestep2(id){

	//是否需要报名
	var apply=$('input[name="apply"]:checked').val();
	//报名截止日期
	var lastApplyDate=$.trim($("#lastApplyDate").val());
	$.ajax({
		type: "POST",
		url: basepath+"/mgr/activity/update.json",
		data: {"id":id,"apply":apply,"lastApplyDate":lastApplyDate},
		success: function(data){
			if(data==null){
				alert("信息添加失败");
			}else{
				next3(id);
			}
		}
	});
}
function updatestep3(id){
	var obj = $("#signinCode");
	var signin = $('input[name="signin"]:checked').val();
	var signinCode = $.trim($("#signinCode").val());
	var startSignLocation=$("#myswitch").val();
	if (signin == 1){
		var re = /^\d{4}$/;
		
		if(!re.test(signinCode)){
			obj.focus();
			addError("#con_signinCode");
			return;
		}
		if(signinCode<1000){
			addError("#con_signinCode");
			return;
		}
		removeError("#con_signinCode");
	}
	$.ajax({
		type: "POST",
		url: basepath+"/mgr/activity/updatesignin.json",
		data: {"id":id,"signinCode":signinCode,"signin":signin,"startSignLocation":startSignLocation},
		success: function(data){
			if(!data){
				alert("信息添加失败");
			}else{
				next4(id);
			}
		}
	});
}

function updatestep4(id){
	var afterSignIn = $('input[name="afterSignIn"]:checked').val();
	if(afterSignIn == null || afterSignIn==""){
		afterSignIn = "0";
	}
	
	var showTopic=$('input[name="showtopic"]:checked').val();
	if(showTopic==null || showTopic==""){
		showTopic="0";
	}
	
	var showQuestion=$('input[name="showquestion"]:checked').val();
	if(showQuestion==null || showQuestion==""){
		showQuestion="0";
	}
	
	$.ajax({
		type: "POST",
		url: basepath+"/mgr/activity/updatestep4.json",
		data: {"id":id,"afterSignIn":afterSignIn,"showTopic":showTopic,"showQuestion":showQuestion},
		success: function(data){
			if(!data){
				alert("信息添加失败");
			}else{
				next5(id);
			}
		},
		error:function(data){
			alert("系统异常，请稍后尝试");
		}
	});
}

function update5(id){
	var module=$('input[name="module"]:checked').val();
	if(module==0){
		module="time";
	}else if(module==1){
		module="series";
	}else if(module==2){
		module="stemp";
	}
	$.ajax({
		type: "POST",
		url: basepath+"/mgr/activity/update5.json",
		data: {"id":id,"module":module},
		success: function(data){
			if(!data){
				alert("更新失败");
			}else{
				window.location.href=basepath+"/mgr/activity/index.xhtml";
			}
		}
	});
	
	
}



/**
 * 第一步
 * @param id
 */
function next1(id){
	window.location.href=basepath+"/mgr/activity/step1.xhtml?id="+id;
}
/**
 * 第二步
 * @param id
 */
function next2(id){
	window.location.href=basepath+"/mgr/activity/step2.xhtml?id="+id;
}
/**
 * 第三步
 * @param id
 */
function next3(id){
	
	window.location.href=basepath+"/mgr/activity/step3.xhtml?id="+id;
}

/**
 * 第四步
 * @param id
 */
function next4(id){
	
	window.location.href=basepath+"/mgr/activity/step4.xhtml?id="+id;
}
/**
 * 第五步
 * @param id
 */
function next5(id){
	
	window.location.href=basepath+"/mgr/activity/step5.xhtml?id="+id;
}

/** 验证关键字 */
function validateFindKey(id,params){
	var obj = $("#"+id);
	var value = $.trim(obj.val());
	var hid_findkey=$("#hid_findkey").val();
	if(value==hid_findkey){
		$.ajax({
			   type: "POST",
			   url: basepath+"/mgr/activity/add.json",
			   data: params,
			   success: function(data){
				   if(data==null){
					   alert("信息添加失败");
				   }else{
					   next2(data.id);
				   }
			   }
			});
	}else if(value!=null && value!=""){
	$.ajax({
		type:"post",
		url:basepath+"/mgr/ixinrule/validateaddfindkey.json",
		data:{"skey":value},
		success:function(data){
			var skeyIsExist = data;
			if(skeyIsExist){
				$("#tip_findKeys").html("关键字已存在");
				obj.focus();
				addError("#con_keywords");
			}
			if(!skeyIsExist){
				$("#tip_findKeys").html("");
				removeError("#con_keywords");
				$.ajax({
					   type: "POST",
					   url: basepath+"/mgr/activity/add.json",
					   data: params,
					   success: function(data){
						   if(data==null){
							   alert("信息添加失败");
						   }else{
							   next2(data.id);
						   }
					   }
					});
			}
		}
	});
	}else{
		$.ajax({
			   type: "POST",
			   url: basepath+"/mgr/activity/add.json",
			   data: params,
			   success: function(data){
				   if(data==null){
					   alert("信息添加失败");
				   }else{
					   next2(data.id);
				   }
			   }
			});
	}
}


