<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<%@ page language="java" import="com.longtime.common.utils.Page"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>签到管理</title>
<meta name="menu_path" content="active.menu_signin" />
<link rel="stylesheet" type="text/css"
	href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
<link rel="stylesheet"
	href="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.css" />
<link rel="stylesheet" media="screen"
	href="${basepath }/static/public/stylesheets/course.css">
<script language="javascript" type="text/javascript"
	src="${basepath }/static/public/My97DatePicker/WdatePicker.js"></script>
</head>
<body>

	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i><a href="${basepath }">首页</a><i
					class="icon-angle-right"></i></li>
				<li><span href="#">签到管理</span></li>
			</ul>
			<!-- END PAGE TITLE & BREADCRUMB-->
		</div>
	
	</div>
	<ul class="nav nav-tabs">
			<li class="${param.from eq 'person' ? '':'active' } tabLi" id="li_baoming"><a href="#baoming"
				onclick="topage(this);" data-toggle="tab"> 签到人员统计 </a></li>
			<li class="${param.from eq 'person' ? 'active':'' } tabLi" id="li_person"><a href="#person"
				onclick="topage(this);" data-toggle="tab"> 指定人员 </a></li>
	</ul>
	
	<div class="tab-content">
	<div class="tab-pane ${param.from eq 'person' ? '':'active' }" id="baoming" style="position: relative;">
	<div class="row">
		<div class="col-md-12">
			<div class="search_condition">
						<div class="row" style="margin: 0;width:100%;">
							<div class="left_lable" style="width:50px;margin-top: 8px;">
								<span class="">时间段</span>
							</div>
							<div class="left_condition">
								<div class="col-md-4" style="width: 340px;">
                            		<select class="form-control select2me" data-placeholder="选择" name="time" id="time" onchange="page(1);" >
                            			<option value="">全部</option>
                                		<c:forEach var="item" items="${times}">
                                			<option value="${item.id }">
                                			<d:formatDate currentTime="${item.startTime }" format="yyyy-MM-dd HH:mm" /> 
                                			~ <d:formatDate currentTime="${item.endTime }" format="yyyy-MM-dd HH:mm" />
                                			</option>
                                		</c:forEach>
                           			 </select>
								</div>
							</div>
							<div class="left_condition" style="float:right;">
								<span class="btn btn-success table_add"
							onclick="exportResult('${id}');"> <i
							class="glyphicon glyphicon-plus"></i>导出所有记录
						</span>
							</div>
						</div>
					</div>
			<div class="portlet box blue">
				<div class="portlet-body"
					style="overflow: hidden; padding-bottom: 100px;">

					<div id="table_list" style="margin-top: 10px;">
						

					</div>

				</div>
			</div>
			<!-- END EXAMPLE TABLE PORTLET-->
		</div>
	</div>
	</div>
	
	<div class="tab-pane ${param.from eq 'person' ? 'active':'' }" id="person" style="position: relative;">
	<div class="row">
		<div class="col-md-12">
			<div class="search_condition">
						<div class="row" style="margin: 0;width:100%;">
							<div class="left_lable" style="margin-top: 8px;width:60px;">
								<span class="">签到状态</span>
							</div>
							<div class="left_condition">
								<div class="col-md-2" style="width:127px;">
                            		<select class="form-control select2me" data-placeholder="选择" name="signinstatus" id="signinstatus" onchange="page(1);" >
                                		<option value="1">全部</option>
                                		<option value="2">已签到</option>
                                		<option value="3">未签到</option>
                           			 </select>
								</div>
							</div>
							<div class="left_lable" style="margin-top: 8px;">
								<span class="">时间段</span>
							</div>
							<div class="left_condition">
								<div class="col-md-4" style="width: 340px;">
                            		<select class="form-control select2me" data-placeholder="选择" name="persontime" id="persontime" onchange="page(1);" >
                                		<c:forEach var="item" items="${times}">
                                			<option value="${item.id }">
                                			<d:formatDate currentTime="${item.startTime }" format="yyyy-MM-dd HH:mm" /> 
                                			~ <d:formatDate currentTime="${item.endTime }" format="yyyy-MM-dd HH:mm" />
                                			</option>
                                		</c:forEach>
                           			 </select>
								</div>
							</div>
							<div class="left_condition" style="float:right;">
								<span class="btn btn-success table_add"
									onclick="importExcel('${activityId}');"> <i
									class="glyphicon glyphicon-log-out"></i>人员导入
								</span>
							</div>
						</div>
					</div>
			<div class="portlet box blue">
				<div class="portlet-body"
					style="overflow: hidden; padding-bottom: 100px;">

					<div id="table_list1" style="margin-top: 10px;">
						

					</div>
				<span class="btn btn-success table_add" style="clear:both;overflow:hidden;float: left;"onclick="deleteData(0);">
                  			         删除 
                         </span>
				<span class="btn btn-info table_add" style="float: left;"onclick="addSignData(0);">
                  			         添加签到 
                         </span>
				</div>
			</div>
			<!-- END EXAMPLE TABLE PORTLET-->
		</div>
	</div>
	</div>
	</div>
	<input type="hidden" id="id" value="${id }">
	<div class="easyDialog_wrapper" id="easyDialogWrapperww">
		<div class="easyDialog_content">
			<h4 class="easyDialog_title" id="easyDialogTitle">
				<a href="javascript:void(0)" title="关闭窗口" class="close_btn"
					onclick="easyDialog.close()">&times;</a><span id="content">下载</span>
			</h4>
			<div class="easyDialog_text"
				style="width: 360px; height: 120px; display: block; overflow-x: hidden; overflow-y: scroll;">
				<!-- Tab panes -->
				<div class="tab-content" id="errorMsg">
					<a href="" class="btn btn-success table_add" id="exportUrl"
						style="width: 128px; margin-right: 100px; margin-top: 15px;">
						<i class="glyphicon glyphicon-plus"></i>下载
					</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<content tag="pageCore"> </content>
<content tag="pageInit"> <!-- 初始化窗口 --> <script
	type="text/javascript">

	var from = '${param.from}';
	

	/**
	 * 批量删除
	 */
	function deleteData(status){
	
			var items = $("input[name='ids']:checked");
			var tempFn = function (){
				$.post(basepath+"/mgr/signin/delete_sigin_time.xhtml", $.param(items), function (ret){
					if(ret.flag){
						flag = true;
		    			var html="<div style='width:300px;text-align:center;'>删除成功！</div>";
		    			easyDialog.open({
							container : {
							    header : '提示',
								content : html
							},
							autoClose : success_time,
							callback : function(){
								flag = true;
								page(1);
							}
						});
					} else{
		    			var html="<div style='width:300px;text-align:center;'>删除失败！失败原因："+ret.message+"</div>";
		    			easyDialog.open({
		    				container : {
		    				    header : '提示',
		    					content : html
		    				},
							autoClose : 1000
						});
					}
				});
			}
			
			if(items.length == 0){
				var html="<div style='width:300px;text-align:center;'>您没有选中任何记录！</div>";
				easyDialog.open({
					container : {
					    header : '提示',
						content : html
					},
					autoClose : 1000
				});
			} else{
				var html="<div style='width:300px;height:50px;text-align:center;'>确定要删除"+items.length+"条记录吗？</div>";
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
	
	function addSignData(status){
		
		var items = $("input[name='ids']:checked");
		var uids = "";
		for(var i=0 ; i<items.length;i++){
			uids =uids + $(items[i]).data('uid') + "," ;
		}
		var tid = $("#persontime").val();
		var tempYesFn = function (){
			$.post(basepath+"/mgr/signin/addsignin.xhtml?id=${param.id}",{ids:uids,tid:tid}, function (ret){
				if(ret.flag){
					flag = true;
	    			var html="<div style='width:300px;text-align:center;'>添加签到成功！</div>";
	    			easyDialog.open({
						container : {
						    header : '提示',
							content : html
						},
						autoClose : success_time,
						callback : function(){
							flag = true;
							pageperson(1);
						}
					});
				} else{
	    			var html="<div style='width:300px;text-align:center;'>删除失败！失败原因："+ret.message+"</div>";
	    			easyDialog.open({
	    				container : {
	    				    header : '提示',
	    					content : html
	    				},
						autoClose : 1000
					});
				}
			});
		}
		
		if(items.length == 0){
			var html="<div style='width:300px;text-align:center;'>您没有选中任何记录！</div>";
			easyDialog.open({
				container : {
				    header : '提示',
					content : html
				},
				autoClose : 1000
			});
		} else{
			var html="<div style='width:300px;height:50px;text-align:center;'>确定要签到"+items.length+"条记录吗？</div>";
			easyDialog.open({
				container : {
				    header : '提示',
				    content : html,
				    yesFn : tempYesFn,
				    noFn : true
				}
			});
		}

	}
	
	
	function page(i) {
	
		if("person" == from){
			pageperson(i);
		}else{
			signpage(i);
		}
	}
	
	$(function(){
		page(1);
	});

	function pageperson(i){
		var id = $("#id").val();
		var tid = $("#persontime").val();
		var status = $("#signinstatus").val();
		$.ajax({
			type : "GET",
			url : "${basepath}/mgr/signin/personlist.list",
			data : {
				id:id,currPage:i,tid:tid,status:status
			},
			success : function(data) {
				$("#table_list1").html(data);
			},
			error : function() {
				showMsgDialog("系统异常，请刷新后重新尝试。");
			}
		});
	}
	
	function signpage(i) {
		var id = $("#id").val();
		var tid = $("#time").val();
		
		$.ajax({
			type : "GET",
			url : "${basepath}/mgr/signin/countlist.list",
			data : {
				id:id,currPage:i,tid:tid
			},
			success : function(data) {
				$("#table_list").html(data);
			},
			error : function() {
			}
		});
		

	}

	function topage(_thi){
		var tab = $(_thi).parent().attr("id");
		if("li_person" == tab){
			from = "person";
		}else{
			from = "sign";
		}
		page(1);
		return false;
		
	}


	function importExcel(){
		window.location.href="${basepath}/mgr/signin/excelload.xhtml?id=${id}";
	}


	function checked_all(_this){
		if(_this.checked){
			$("input[name='ids']").each(function(){
				$(this).attr("checked","checked");
				$(this).parent().addClass("checked");
			});
		}else{
			$("input[name='ids']").each(function(){
				$(this).removeAttr("checked");
				$(this).parent().removeClass("checked");
			});
		}
	}


	
	function exportResult(id) {
		$.ajax({
			type : "POST",
			url : "${basepath}/mgr/signin/exportresult.json",
			data : {
				"id" : id
			},
			success : function(data) {
				if (data == "fail") {
					showMsgDialog("系统异常，请刷新后重新尝试。");
				} else if (data == "empty") {
					showMsgDialog("还没有人参与，请确认后再操作。");
				} else if (data == "illegal") {
					showMsgDialog("签到已被删除，请确认后操作。");
				} else {
					$("#exportUrl").attr("href", "${basepath}/" + data);
					$("#content").html("签到结果");
					easyDialog.open({
						container : "easyDialogWrapperww"
					});
				}
			},
			error : function(data) {
				showMsgDialog("系统异常，请刷新后重新尝试。");
			}
		});

	}
	
	function showMsgDialog(content) {
		easyDialog
				.open({
					container : {
						header : '提示',
						content : '<div style="background-color: #ffffff;width:320px;height:60px;text-align:center;">'
								+ content + '</div>'
					},
					autoClose : 2000
				});
	}
</script> </content>
