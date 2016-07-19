/**
 * 添加课程
 */
function addcourse(){
	//课程分类
    var categoryId=$("#categoryId").val();
    //课程名称
    var coursename=$("#name").val();
    //讲师姓名
    var lecturername=$("#lecturername").val();
    //是否支持移动端
    var supportmobile=$("#myswitch").val();
    //是否包含视频
    var includevideo=$("#myswitch2").val();
    //是否公开
    var openstate=$("#myswitch3").val();
    //课程时长
    var length=$("#length").val();
    //学习时长要求
    var completepercent=$.trim($("#completepercent").val());
    //得到图片信息
    var cover=$("#cover").val();
    //课程简介
    var jianjie=$("#jianjie").val();
    
    var id=$("#hid_id").val();
    

    
    
    if(coursename==null || coursename==""){
    	$("#tip_name").addClass("has-error").focus();
    	return;
    }
    
   var params="coursename="+coursename;
   
   params=params+"&lecturername="+lecturername;
   
   if(categoryId!=null && categoryId!=""){
	   params=params+"&categoryId="+categoryId;
   }
    
   params=params+"&supportmobile="+supportmobile;
   
   params=params+"&includevideo="+includevideo;
   
   params=params+"&openstate="+openstate;
   
   if(completepercent==null || completepercent==""){
	   completepercent=100;
   }
   var reg1 = /^(100|[1-9]\d|\d)$/;
   if(!reg1.test(completepercent)){
	   $("#tip_completepercent").addClass("has-error").focus();
	   return;
   }
   
   $("#tip_completepercent").removeClass("has-error");
   params=params+"&completepercent="+completepercent;
   
   var reg = new RegExp("^[0-9]*$");
    if(!reg.test(length)){
        $("#tip_length").addClass("has-error").focus();
        return;
    }
    $("#tip_length").removeClass("has-error");
   if(length!=null && length!=""){
	   params=params+"&length="+length;
   }
   
   
   if(cover!=null && cover!=""){
	   params=params+"&cover="+cover;
   }
  // if(jianjie!=null && jianjie!=""){
	   params=params+"&jianjie="+jianjie;
  // }
   
   if(id!=null && id!=""){
	   params=params+"&id="+id;
   }
   
   
    $.ajax({
    	 type:"POST",
    	 url:basepath+"/mgr/course/addcourse.json",
    	 data:params,
    	 success:function(data){
    		 if(data!=null && data.id!=null){
    			 next2(data.id);
    		 }else{
    			 alert("信息添加失败");
    		 }
    	 }
    });
}

function opencoursebox() { 
	$("#search").val("");
	coursewarelist(1);
	var type = $("input[name='coursetype']:checked").val();
	if (type == 3) {
		easyDialog.open({
			container : 'easyDialogWrapper2',
			fixed : false
		});
	} else if (type == 4) {
		easyDialog.open({
			container : 'easyDialogWrapper4',
			fixed : false
		});
	} else if (type == 5) {
		easyDialog.open({
			container : 'easyDialogWrapper5',
			fixed : false
		});
	}
	 else { 
		easyDialog.open({
			container : 'easyDialogWrapper1',
			fixed : false
		});
	} 
}

function closecoursebox() {
	var type = $("input[name='coursetype']:checked").val();
	if (type == 3) {
		easyDialog.close({
			container : 'easyDialogWrapper2',
			fixed : false
		});
	} else if (type == 4) {
		easyDialog.close({
			container : 'easyDialogWrapper4',
			fixed : false
		});
	} else if (type == 5) {
		easyDialog.open({
			container : 'easyDialogWrapper5',
			fixed : false
		});
	} else {
		easyDialog.close({
			container : 'easyDialogWrapper',
			fixed : false
		});
	}
}
/**
 * 课件列表
 * 
 * @param i
 */
function coursewarelist(i) {
	var type = $("input[name='coursetype']:checked").val();
	if (type == 4) {// 文档
		var max = $("#choosecourse4 #page_max").val();
		var data = {
			"page" : i,
			"max" : max,
			"r" : Math.random()
		};
		var url = basepath + "/base/admin/mgr/document/documentlist.json";
		$
				.ajax({
					type : "POST",
					url : url,
					data : data,
					success : function(data) {
						if (data != null && data.items != null
								&& data.items.length > 0) {
							var html = "";
							for ( var i = 0; i < data.items.length; i++) {
								var filemanage = data.items[i];
								var j = i + 1;
								html = html
										+ '<tr><td>'
										+ j
										+ '</td><td>'
										+ filemanage.originalname
										+ '</td><td><span class="btn btn-primary btn-sm btn-block" t="'
										+ filemanage.id
										+ '" k="'
										+ filemanage.originalname
										+ '"  onclick="choice(this);">选择</span></td></tr>';
							}
							$("#selectcourse4").html(html);
							// 导入分页页面
							var pageurl = basepath
									+ "/mgr/course/pageinit.list?currentpage="
									+ data.page.current_page + "&pagesize="
									+ data.page.page_size + "&totalsize="
									+ data.page.total_size
									+ "&pageFn=coursewarelist";
							$("#pageinit4").load(pageurl);
						} else {

						}
					}
				});
	} else if (type == 5) {// 素材
		var search = $("#search").val();
		var max = $("#choosecourse4 #page_max").val();
		var data = {
			"page" : i,
			"max" : max,
			"search": search,
			"r" : Math.random()
		};
		var url = basepath + "/mgr/fodder/fodderwarelist.json";
		$.ajax({
					type : "POST",
					url : url,
					data : data,
					success : function(data) {
						var html = "";
						if (data != null && data.items != null
								&& data.items.length > 0) {
							for ( var i = 0; i < data.items.length; i++) {
								var filemanage = data.items[i];
								var j = i + 1;
								
								html = html
										+ '<tr><td>'
										+ j
										+ '</td><td>'
										+ filemanage.title
										+ '</td><td><span class="btn btn-primary btn-sm btn-block" t="'
										+ filemanage.id
										+ '" k="'
										+ filemanage.title
										+ '"  onclick="choice(this);">选择</span></td></tr>';
	                                 
							}
							// 导入分页页面
							var pageurl = basepath
									+ "/mgr/course/pageinit.list?currentpage="
									+ data.page.current_page + "&pagesize="
									+ data.page.page_size + "&totalsize="
									+ data.page.total_size
									+ "&pageFn=coursewarelist";
							$("#pageinit5").load(pageurl);
						} else {
							
                                html=html+'<span style="padding: 20px 30px;margin-top:40px;margin-left:100px;margin-bottom:40px;display:block;text-align: center;border:1px solid #ccc;background-color:#eee;font-size:24px;color:#999;border-radius:5px!important; ">没有内容</span>';
                                $("#pageinit5").hide();
						}
						$("#selectfodder").html(html);
						
						
					}
				});
	} else if (type != 3) {
		var max = $("#choosecourse #page_max").val();
		var data = {
			"page" : i,
			"max" : max,
			"r" : Math.random()
		};
		var url = basepath + "/mgr/course/coursewarelist.json";
		$
				.ajax({
					type : "POST",
					url : url,
					data : data,
					success : function(data) {
						if (data != null && data.items != null
								&& data.items.length > 0) {
							var html = "";
							for ( var i = 0; i < data.items.length; i++) {
								var filemanage = data.items[i];
								var j = i + 1;
								html = html
										+ '<tr><td>'
										+ j
										+ '</td><td>'
										+ filemanage.name
										+ '</td><td><span class="btn btn-primary btn-sm btn-block" t="'
										+ filemanage.id
										+ '" k="'
										+ filemanage.name
										+ '"  onclick="choice(this);">选择</span></td></tr>';
							}
							$("#selectcourse").html(html);
							// 导入分页页面
							var pageurl = basepath
									+ "/mgr/course/pageinit.list?currentpage="
									+ data.page.current_page + "&pagesize="
									+ data.page.page_size + "&totalsize="
									+ data.page.total_size
									+ "&pageFn=coursewarelist";
							$("#pageinit").load(pageurl);
						} else {

						}
					}
				});
	} else {
		var max = $("#choosevideo #page_max").val();
		var data = {
			"page" : i,
			"max" : max,
			"r" : Math.random()
		};
		var url = basepath + "/base/admin/ivideo/videolist.json";
		$
				.ajax({
					type : "POST",
					url : url,
					data : data,
					success : function(data) {
						if (data != null && data.items != null
								&& data.items.length > 0) {
							var html = "";
							for ( var i = 0; i < data.items.length; i++) {
								var video = data.items[i];
								var j = i + 1;
								html = html
										+ '<tr><td>'
										+ j
										+ '</td><td>'
										+ video.name
										+ '</td><td><span class="btn btn-primary btn-sm btn-block" t="'
										+ video.id
										+ '" k="'
										+ video.name
										+ '"  onclick="choice(this);">选择</span></td></tr>';
							}
							$("#selectvideo").html(html);

							// 导入分页页面
							var pageurl = basepath
									+ "/mgr/course/pageinit.list?currentpage="
									+ data.page.current_page + "&pagesize="
									+ data.page.page_size + "&totalsize="
									+ data.page.total_size
									+ "&pageFn=coursewarelist";
							$("#pageinit2").load(pageurl);

						} else {

						}
					}
				});

	}
}

/**
 * 点击课件选择
 * 
 * @param id
 */
function choice(thi) {
	var id = $(thi).attr("t");
	var name = $(thi).attr("k");
	$("#fileid").val(id);
	$("#courseware_name").val(name);
	init_cwname = name;
	easyDialog.close();
}

var params = {
	fileInput : $("#uploadfile").get(0),
	dragDrop : $("#uploadscourse").get(0),
	upButton : $("#fileSubmit").get(0),
	url : basepath + '/base/admin/course/courseware/savefiles.xhtml',
	filter : function(files) {
		var arrFiles = [];
		for ( var i = 0, file; file = files[i]; i++) {
			if (/^.*.zip$/.test(file.name) /* for IE10 */) {
				if (file.size >= 104857600) {
					sureDlg('文件"' + file.name + '"过大，应小于100M');
				} else {
					arrFiles.push(file);
				}
			} else {
				sureDlg('文件"' + file.name + '"不是zip文件。');
			}
		}
		return arrFiles;
	},
	onSelect : function(files) {
		var html = '', i = 0;
		$("#preview_con").html('<div class="upload_loading"></div>');
		var funAppendImage = function() {
			file = files[i];
			if (file) {
				var reader = new FileReader();
				reader.onload = function(e) {
					html = html + '<div class="preview" id="uploadList_' + i
							+ '">';
					html = html + '<span class="imageHolder">';
					html = html
							+ '<img src="'
							+ basepath
							+ '/images/zip.png" style="width:40px;height:40px;margin-top:5px;margin-left:5px;"/>';
					html = html + '<span class="uploaded">'
							+ getSubstr(file.name) + '</span>&nbsp;&nbsp;';
					html = html
							+ '<a href="javascript:void(0);" class="upload_delete" title="删除" data-index="'
							+ i + '">删除</a>';
					html = html + '<span id="uploadProgress_' + i
							+ '" style="margin-left:100px;"></span>';
					html = html + '</span></div>';
					i++;
					funAppendImage();
				};
				reader.readAsDataURL(file);
				var body = "";
				body = body
						+ '<tr><td>'
						+ file.name
						+ '</td><td><span class="btn btn-primary btn-sm btn-block" style="display:none;" id="uploadchoose" k="'
						+ file.name
						+ '" t="" onclick="choice(this)">选择</span></td></tr>';
				$("#uploadcourse").html(body);

			} else {
				$("#preview_con").html(html);
				if (html) {
					// 删除方法
					$(".upload_delete").click(
							function() {
								ZXXFILE.funDeleteFile(files[parseInt($(this)
										.attr("data-index"))]);
								return false;
							});
					// 提交按钮显示
					$("#fileSubmit").show();
				} else {
					// 提交按钮隐藏
					$("#fileSubmit").hide();
				}
			}
		};
		funAppendImage();
	},
	onDelete : function(file) {
		$("#uploadfile").val("");
		$("#uploadList_" + file.index).fadeOut();
	},
	onProgress : function(file, loaded, total) {
		$("#fileSubmit").hide();
		var eleProgress = $("#uploadProgress_" + file.index);
		var percent = (loaded / total * 100).toFixed(2) + '%';
		eleProgress.html(percent);
	},
	onSuccess : function(file, response) {
		// 解析出id
		var begin = response.indexOf("id") + 5;
		var end = response.indexOf(",") - 1;
		var id = response.substring(begin, end);
		$("#uploadcourse #uploadchoose").attr("t", id);
	},
	onFailure : function(file) {
	},
	onComplete : function() {
		// 提交按钮隐藏
		$("#fileSubmit").hide(10000);
		$("#uploadfile").val("");
		$("#uploadchoose").show();
	}
};
//ZXXFILE = $.extend(ZXXFILE, params);
//ZXXFILE.init();

/**
 * 第一步
 * 
 * @param id
 * @returns
 */
function next1(id) {
	window.location.href = basepath + "/mgr/course/step1.xhtml?id=" + id;
}
/**
 * 第二步
 * 
 * @param id
 * @returns
 */
function next2(id) {
	window.location.href = basepath + "/mgr/course/step2.xhtml?id=" + id;
}
/**
 * 第三步
 * 
 * @param id
 * @returns
 */
function next3(id) {
	window.location.href = basepath + "/mgr/course/step3.xhtml?id=" + id;
}
/**
 * 第四步
 * 
 * @param id
 * @returns
 */
function next4(id) {
	window.location.href = basepath + "/mgr/course/step4.xhtml?id=" + id;
}

/**
 * 第五步
 * 
 * @param id
 * @returns
 */
function next5(id) {
	window.location.href = basepath + "/mgr/course/step5.xhtml?id=" + id;
}

function update2(id) {
	var type = $("input[name='coursetype']:checked").val();
	var coursewareid = $("#coursewareid").val();
	var indexaddress = $("#indexaddress").val();
	var resid = $.trim($("#fileid").val());
	if (resid != "") {
		if (indexaddress == null || indexaddress == "") {
			$("#indexaddress").addClass("has-error").focus();
			return;
		}
		$.ajax({
			type : "POST",
			url : basepath + "/mgr/course/update2.json",
			data : {
				"id" : id,
				"coursewareid" : coursewareid,
				"indexaddress" : indexaddress,
				"type" : type,
				"resid" : resid,
				"startPage" : indexaddress
			},
			success : function(data) {
				if (data.flag) {
					showMsgDialog(data.msg);
				} else {
					next3(data.course.id);
				}
			}
		});
	} else {
		if($.trim($("#courseware_name").val())!="")
			{
				//showMsgDialog("当前课件不存在或被修改，请重新选择");
				next3(id);
				return;
			}
		showMsgDialog("请选择课件");
	}

}

/**
 * 第三步更新
 */
function update3(id) {
	var ischecked = $("#myswitch3").is(':checked');// 是否需要添加练习
	var practiceid = $("#practiceid").val();
	var checkval = $("#myswitch3").val();
	if (ischecked) {// 选中添加练习
		var practicename = $.trim($("#practicename").val());
		if (practicename == null || practicename == "") {
			// alert("请选择练习");
			 showMsgDialog("请选择练习");
			return false;
		}
	}
	
	var isexamchecked = $("#myswitch4").is(':checked');// 是否需要添加练习
	var tid = $("#tid").val();
	var examcheckval = $("#myswitch4").val();
	if (isexamchecked) {// 选中添加练习
		var examename = $.trim($("#examname").val());
		if (examename == null || examename == "") {
			 showMsgDialog("请选择考试");
			return false;
		}
	}
	
	$.ajax({
		type : "GET",
		url : basepath + "/mgr/course/update3.json",
		data : "step=3&id=" + id + "&practiceid=" + practiceid
				+ "&hasPractice=" + checkval+"&tid="+tid+"&hasExam="+examcheckval,
		success : function(data) {
			if (data) {
				window.location.href = basepath + "/mgr/course/step4.xhtml?id="
						+ id;
			}
		}
	});
}

/**
 * 分页+搜索练习
 */
function pagePractice(i, fieldId) {
	var max = $("#page_max").val();
	var data = {
		"page" : i,
		"max" : max,
		"r" : Math.random()
	};
	var url = basepath + "/base/admin/itest/practice/practicelist.list";
	$.ajax({
				type : "POST",
				url : url,
				data : data,
				success : function(data) {
					if (data != null && data.items != null
							&& data.items.length > 0) {
						var html = "";
						for ( var i = 0; i < data.items.length; i++) {
							var filemanage = data.items[i];
							var j = i + 1;
							html = html
									+ '<tr><td>'
									+ j
									+ '</td><td>'
									+ filemanage.name
									+ '</td><td><span class="btn btn-primary btn-sm btn-block" t="'
									+ filemanage.id
									+ '" k="'
									+ filemanage.name
									+ '"  onclick="choicePractice(this);">选择</span></td></tr>';
						}
						$("#selectpractice").html(html);
						// 导入分页页面
						var pageurl = basepath
								+ "/mgr/course/pageinit.list?currentpage="
								+ data.page.current_page + "&pagesize="
								+ data.page.page_size + "&totalsize="
								+ data.page.total_size + "&pageFn=pagePractice";
						$("#pageinit").load(pageurl);
					} else {

					}
				}
			});
	easyDialog.open({
		container : 'easyDialogWrapperPra',
		fixed : false
	});
}
/**
 * 点击练习选择
 * 
 * @param id
 */
function choicePractice(thi) {
	var id = $(thi).attr("t");
	var name = $(thi).attr("k");
	$("#practiceid").val(id);
	$("#practicename").val(name);
	// init_cwname = name;
	easyDialog.close();
}


/**
 * 分页+搜索考试
 */
function pageExam(i, fieldId) {
	var max = $("#page_max").val();
	var status = '2,3,4';
	var data = {
		"status" : status,
		"page" : i,
		"max" : max,
		"r" : Math.random()
	};
	var url = basepath + "/base/admin/itest/examination/selectlist.list";
	$.ajax({
				type : "POST",
				url : url,
				data : data,
				success : function(data) {
					if (data != null && data.items != null
							&& data.items.length > 0) {
						var html = "";
						for ( var i = 0; i < data.items.length; i++) {
							var filemanage = data.items[i];
							var j = i + 1;
							var examname = filemanage.examName;
							if(examname.length>24){
								examname = examname.substring(0,22);
								examname += "...";
							}
							html = html
									+ '<tr><td>'
									+ j
									+ '</td><td width="60%" title="'+filemanage.examName+'">'
									+ examname
									+ '</td><td><span class="btn btn-primary btn-sm btn-block" t="'
									+ filemanage.id
									+ '" k="'
									+ filemanage.examName
									+ '"  onclick="choiceExam(this);">选择</span></td></tr>';
						}
						$("#selecttest").html(html);
						// 导入分页页面
						var pageurl = basepath
								+ "/mgr/course/pageinit.list?currentpage="
								+ data.page.current_page + "&pagesize="
								+ data.page.page_size + "&totalsize="
								+ data.page.total_size + "&pageFn=pageExam";
						$("#pageinitexam").load(pageurl);
					} else {

					}
				}
			});
	easyDialog.open({
		container : 'easyDialogWrapperTest',
		fixed : false
	});
}

/**
 * 点击考试选择
 * 
 * @param id
 */
function choiceExam(thi) {
	var id = $(thi).attr("t");
	var name = $(thi).attr("k");
	$("#tid").val(id);
	$("#examname").val(name);
	easyDialog.close();
}

/**
 * 第四步更新
 */
function update4(id) {
	$.ajax({
		type : "GET",
		url : basepath + "/mgr/course/completestep.json",
		data : "step=4&id=" + id,
		success : function(data) {
			if (data) {
				window.location.href = basepath + "/mgr/course/step5.xhtml?id="
						+ id;
			}
		}

	});
}

$("input[type='radio']").bind("click", function() {
	var type = $("input[name='coursetype']:checked").val();
	if (init_type != type) {
		$("#courseware_name").val("");
		$("#indexaddress").val("index.html");
	} else {
		$("#courseware_name").val(init_cwname);
		$("#indexaddress").val(init_index);
	}

	if (type == 3 || type == 1 || type == 4 || type == 5) {
		$("#coursewareAddress").hide();
	} else {
		$("#coursewareAddress").show();
	}
});

function pcPrev() {
	var id = $("#hid_id").val();
	var student_web_root = $("#hid_root").val();
	window.open(student_web_root + "/study/toStudy.xhtml?cid=" + id, "_blank");
}

function phonepreview() {
	var id = $("#hid_id").val();
	var student_web_root = $("#hid_root").val();
	var html = "";
	html = html
			+ '<iframe style="width: 218px;height:357px;border: none; font-size: 75%; " src="'
			+ student_web_root + '/m/ixin/study/detail/' + id
			+ '.xhtml"  ready="changgefontsize(this)">';
	html = html + '</iframe>';
	$("#courseframe").prepend(html);
	easyDialog.open({
		container : "phone-preview"
	});
}

function complete() {
	var id = $("#hid_id").val();
	$
			.ajax({
				type : "GET",
				url : basepath + "/mgr/course/completestep.json",
				data : "step=5&id=" + id,
				success : function(data) {
					if (data) {
						window.location.href = basepath
								+ "/base/admin/course/course/coursemanage.xhtml?readsession=true";
					}
				}

			});
}
function release() {
	var id = $("#hid_id").val();
	$
			.ajax({
				type : "POST",
				url : basepath + "/mgr/course/checkcomplete.json",
				data : "id=" + id,
				success : function(data) {
					if (!data.flag) {
						$
								.ajax({
									type : "GET",
									url : basepath + "/mgr/course/release.json",
									data : "step=5&id=" + id
											+ "&readsession=true",
									success : function(data) {
										if (data) {
											window.location.href = basepath
													+ "/base/admin/course/course/coursemanage.xhtml?readsession=true";
										}
									}
								});
					} else {
						showMsgDialog(data.msg);
					}
				}
			});

}

$(document).ready(function() {
	var type = $("input[name='coursetype']:checked").val();
	if (type != 2) {
		$("#coursewareAddress").hide();

	}
	$("#fileDragArea").click(function() {
		$("#fileImage4").click();
	});
});

var params4 = {
	fileInput : $("#fileImage4").get(0),
	dragDrop : $("#fileDragArea").get(0),
	upButton : $("#fileSubmit4").get(0),
	url : basepath + '/base/admin/mgr/document/add.xhtml',
	filter : function(files) {
		var arrFiles = [];
		for ( var i = 0, file; file = files[i]; i++) {
			// (!file.type) &&xls xlsx doc docx ppt pptx pdf
			if (/\.doc$|\.docx$|\.xls$|\.xlsx$|\.ppt$|\.pptx$|\.pdf$/
					.test(file.name)) {
				if (file.size >= 104857600) {
					sureDlg('文件"' + file.name + '"过大，应小于100M');
					$("#fileDragArea").show();
				} else {
					arrFiles.push(file);
				}
			} else {
				sureDlg('文件"' + file.name + '"文件格式不匹配');
				$("#fileDragArea").show();
			}
		}
		return arrFiles;
	},
	onSelect : function(files) {
		var html = '', i = 0;
		$("#preview_con4").html('<div class="upload_loading"></div>');
		if (files.length == 0) {
			$("#fileDragArea").show();
			return;
		}
		var funAppendImage = function() {
			file = files[i];
			if (file) {
				var reader = new FileReader();
				reader.onload = function(e) {
					html = html + '<div class="preview" id="uploadList_' + i
							+ '">';
					html = html + '<span class="imageHolder">';
					html = html
							+ '<img src="'
							+ basepath
							+ '/images/file.png" style="width:40px;height:40px;margin-top:5px;margin-left:5px;"/>';
					html = html + '<span class="uploaded"　id="documentname">'
							+ getSubstr(file.name) + '</span>&nbsp;&nbsp;';
					html = html
							+ '<a href="javascript:void(0);" class="upload_delete" title="删除" data-index="'
							+ i + '">删除</a>';
					html = html + '<span id="uploadProgress_' + i
							+ '" style="margin-left:100px;"></span>';
					html = html + '</span></div>';
					i++;
					$("#uploadcourse4").show();
					funAppendImage();
				};
				reader.readAsDataURL(file);
				var body = "";
				body = body
						+ '<tr><td>'
						+ file.name
						+ '</td><td><span class="btn btn-primary btn-sm btn-block" style="display:none;" id="uploadchoose4" k="'
						+ file.name
						+ '" t="" onclick="choice(this)">选择</span></td></tr>';
				$("#uploadcourse4").html(body);
			} else {
				$("#preview_con4").html(html);
				if (html) {
					// 删除方法
					$(".upload_delete").click(
							function() {
								ZXXFILE4.funDeleteFile(files[parseInt($(this)
										.attr("data-index"))]);
								$("#fileDragArea").show();
								return false;
							});
					// 提交按钮显示
					$("#fileSubmit4").show();
				} else {
					// 提交按钮隐藏
					$("#fileSubmit4").hide();
				}
			}
		};
		funAppendImage();
		// $("#fileDragArea").hide();//上传加号按钮隐藏
		$("#notice").hide();
	},
	onDelete : function(file) {
		$("#fileImage4").val("");
		$("#uploadcourse4").hide();
		$("#notice").show();
		$("#uploadList_" + file.index).fadeOut();
	},
	onDragOver : function() {
		$(this).addClass("upload_drag_hover");
	},
	onDragLeave : function() {
		$(this).removeClass("upload_drag_hover");
	},
	onProgress : function(file, loaded, total) {
		$("#fileSubmit4").hide();
		var eleProgress = $("#uploadProgress_" + file.index);
		var percent = (loaded / total * 100).toFixed(2) + '%';
		eleProgress.html(percent);
	},
	onSuccess : function(file, response) {
		// 解析出id
		var begin = response.indexOf("id") + 5;
		var end = response.indexOf(",") - 1;
		var id = response.substring(begin, end);
		$("#uploadcourse4 #uploadchoose4").attr("t", id);
	},
	onFailure : function(file) {
	},
	onComplete : function() {
		// 提交按钮隐藏
		$("#fileSubmit4").hide();
		// file控件value置空
		$("#fileImage4").val("");
		$("#preview_con4").val("");
		$("#uploadchoose4").show();
		$("#uploadcourse4").show();
		// backToStep2();
	}
};
//ZXXFILE4 = $.extend(ZXXFILE4, params4);
//ZXXFILE4.init();
/**
 * 返回第二步主页面
 */
function backToStep2() {
	var type = $("input[name='coursetype']:checked").val();
	init_cwname = $("#documentname").html();
	$("#courseware_name").val(init_cwname);
	init_type = type;
	closecoursebox();
}

function showMsgDialog(content) {
	easyDialog
			.open({
				container : {
					header : '提示',
					content : '<div style="background-color: #ffffff;width:320px;height:60px;text-align:center;">'
							+ content + '</div>'
				},
				autoClose : 3000
			});
}
