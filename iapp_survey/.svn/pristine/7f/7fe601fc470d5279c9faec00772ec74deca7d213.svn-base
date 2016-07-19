$(function() {
	page(1);
});

/**
 * 分页+搜索
 */
function page(i, fieldId) {
	var divId = "table_list";

	var order = getOrder(divId, fieldId);
	var max = $("#" + divId + " #page_max").val()

	// AJAX提示
	loading(divId);
	var data = {
		"page" : i,
		"max" : max,
		"r" : Math.random(),
		"searchContent" : $("#searchContent").val(),
		"status" : $("#status").val(),
		"orderField" : order.orderField,
		"orderDirection" : order.orderDirection
	};
	var url = basepath + "/base/admin/itest/practice/list.list";
	$("#" + divId).load(encodeURI(url), data, function() {
		App.initUniform();// 加载复选框样式
	});

}

/** 添加 */
function insertEntity() {
	window.location.href = basepath + "/mgr/itest/practice/step1.xhtml";
}

/** 详情 */
function detailEntity(id) {
	window.location.href = basepath
			+ "/base/admin/itest/practice/detail.xhtml?id=" + id;
}
/** 发布 */
function updateReleaseStatusSingle(tid, n) {
	var tempFn = function() {
		if (n == 1) {

			$
					.ajax({
						type : "POST",
						url : basepath
								+ "/mgr/itest/practice/checkrelease.json",
						data : {
							"tid" : tid
						},
						success : function(data) {
							if (data) {
								$
										.ajax({
											type : "GET",
											url : basepath
													+ "/mgr/itest/practice/torelease.json",
											data : {
												id : tid,
												status : n
											},
											success : function(data) {
												var html = "<div style='width:400px;text-align:center;'>"
														+ data.message
														+ "</div>";
												easyDialog.open({
													container : {
														header : '提示',
														content : html
													},
													autoClose : success_time,
													callback : page(1)
												});
											}
										});
							} else {
								showMsgDialog("该练习步骤没有完成，不能发布！");
							}
						},
						error : function(data) {
							showMsgDialog("系统错误，请稍后尝试！");
						}

					});
		} else {
			$.ajax({
				type : "GET",
				url : basepath + "/mgr/itest/practice/torelease.json",
				data : {
					id : tid,
					status : n
				},
				success : function(data) {
					var html = "<div style='width:400px;text-align:center;'>"
						+ data.message
						+ "</div>";
				easyDialog.open({
					container : {
						header : '提示',
						content : html
					},
					autoClose : success_time,
					callback : page(1)
				});
				}
			});
		}
	}

	var html = "<div style='width:300px;height:50px;text-align:center;'>确定要发布吗？</div>";
	easyDialog.open({
		container : {
			header : '提示',
			content : html,
			yesFn : tempFn,
			noFn : true
		}
	});
}

/** 修改 */
function updateEntity(id) {
	// window.location.href =
	// basepath+"/base/admin/itest/examination/update.xhtml?id="+id;
	window.location.href = basepath + "/mgr/itest/practice/step1.xhtml?id="
			+ id;
}

/** 发布 */
function release(id) {
	var tempFn = function() {
		$
				.get(
						basepath
								+ "/base/admin/itest/practice/release.xhtml?id="
								+ id,
						function(ret) {
							if (ret.flag) {
								var html = "<div style='width:400px;text-align:center;'>"
										+ ret.message + "</div>";
								easyDialog.open({
									container : {
										header : '提示',
										content : html
									},
									autoClose : success_time,
									callback : page(1)
								});
							}
						});
	}

	var html = "<div style='width:300px;height:50px;text-align:center;'>确定要发布吗？</div>";
	easyDialog.open({
		container : {
			header : '提示',
			content : html,
			yesFn : tempFn,
			noFn : true
		}
	});
}
/**
 * 返回列表页
 */
function backToList() {
	window.location.href = basepath
			+ "/base/admin/itest/practice/practice.xhtml";
}

/**
 * 详情页中删除
 * 
 * @param id
 */
function deleteSingleInDetail(id) {
	var tempFn = function() {
		$.post(basepath + "/base/admin/itest/practice/delete.xhtml", {
			ids : id
		}, function(ret) {
			if (ret.flag) {
				var html = "<div style='width:300px;text-align:center;'>"
						+ ret.message + "</div>";
				easyDialog.open({
					container : {
						header : '提示',
						content : html
					},
					autoClose : success_time,
					callback : function() {
						window.location.href = basepath
								+ "/base/admin/itest/practice/practice.xhtml";
					}
				});
			} else {
				var html = "<div style='width:400px;text-align:center;'>"
						+ ret.message;
				var failNames = "";
				html += failNames + "</div>";
				easyDialog.open({
					container : {
						header : '提示',
						content : html,
						yesFn : function() {
							return true;
						}
					}
				// ,autoClose : fail_msg_time
				});
				return false;
			}
		});
	}
	var html = "<div style='width:300px;height:50px;text-align:center;'>确定要删除吗？</div>";
	easyDialog.open({
		container : {
			header : '提示',
			content : html,
			yesFn : tempFn,
			noFn : true
		}
	});
}

/**
 * 单个删除
 * 
 * @param id
 */
function deleteSingle(id) {
	var tempFn = function() {
		$.post(basepath + "/base/admin/itest/practice/delete.xhtml", {
			ids : id
		}, function(ret) {
			if (ret.flag) {
				var html = "<div style='width:300px;text-align:center;'>"
						+ ret.message + "</div>";
				easyDialog.open({
					container : {
						header : '提示',
						content : html
					},
					autoClose : success_time,
					callback : function() {
						page(1);
					}
				});
			} else {
				var html = "<div style='width:400px;text-align:center;'>"
						+ ret.message;
				var failNames = "";
				html += failNames + "</div>";
				easyDialog.open({
					container : {
						header : '提示',
						content : html,
						yesFn : function() {
							return true;
						}
					}
				});
				return false;
			}
		});
	}
	var html = "<div style='width:300px;height:50px;text-align:center;'>确定要删除吗？</div>";
	easyDialog.open({
		container : {
			header : '提示',
			content : html,
			yesFn : tempFn,
			noFn : true
		}
	});
}

/**
 * 批量删除
 */
function deleteGroup() {
	var items = $("input[name='ids']:checked");
	var tempFn = function() {
		$.post(basepath + "/base/admin/itest/practice/delete.xhtml", $
				.param(items), function(ret) {
			if (ret.flag) {
				var html = "<div style='width:300px;text-align:center;'>"
						+ ret.message + "</div>";
				easyDialog.open({
					container : {
						header : '提示',
						content : html
					},
					autoClose : success_time,
					callback : function() {
						page(1);
					}
				});
			} else {
				var html = "<div style='width:400px;text-align:center;'>"
						+ ret.message;
				var failNames = "";
				if (items.length > 1) {
					for ( var i = 0; i < ret.failList.length; i++) {
						var s = ret.failList[i];
						if (i != ret.failList.length - 1) {
							failNames += $("#name_" + s).text() + "<br>";
						} else {
							failNames += $("#name_" + s).text();
						}
					}
				}
				html += failNames + "</div>";
				easyDialog.open({
					container : {
						header : '提示',
						content : html,
						yesFn : function() {
							if (ret.sucNO > 0) {
								page(1);
							}
							return true;
						}
					}
				// ,autoClose : fail_msg_time
				});
			}
		});
	}

	if (items.length == 0) {
		var html = "<div style='width:300px;text-align:center;'>您没有选中任何记录！</div>";
		easyDialog.open({
			container : {
				header : '提示',
				content : html
			},
			autoClose : warn_time
		});
	} else {
		var html = "<div style='width:300px;height:50px;text-align:center;'>确定要删除"
				+ items.length + "条记录吗？</div>";
		easyDialog.open({
			container : {
				header : '提示',
				content : html,
				yesFn : tempFn,
				noFn : true
			}
		});
	}

}

/**
 * 全部选中
 */
function checked_all(obj) {
	if ($(obj).attr("checked") == "checked") {
		$("input[name='ids']").each(function() {
			$(this).attr("checked", "checked");
			$(this).parent().addClass("checked");
		});
	} else {
		$("input[name='ids']").each(function() {
			$(this).removeAttr("checked");
			$(this).parent().removeClass("checked");
		});
	}

}

function showMsgDialog(content) {
	easyDialog
			.open({
				container : {
					header : '提示',
					content : '<div style="background-color: #ffffff;width:320px;height:60px;text-align:center;">'
							+ content + '</div>'
				},
				autoClose : 1000
			});
}