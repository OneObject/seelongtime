<%@page contentType="text/html; charset=utf-8"%>
<%@ page import="com.longtime.app.config.Constants"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]>
<html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]>
<html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>抽奖管理</title>
<meta name="menu_path" content="active.menu_ggk" />
<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/ixin.css" type="text/css">
	<link rel="stylesheet" type="text/css" href="${basepath }/static/ixin/css/uploadify.css">
</head>
<body>

	<!-- 页面顶部-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
				<li><span href="#">抽奖管理</span></li>
			</ul>
			<!-- END PAGE TITLE & BREADCRUMB-->
		</div>
	</div>
	<!-- END PAGE HEADER-->
	<div class="row" style="display: none;">
		<div class="col-md-12  stepbox">
			<img src="${basepath }/static/ixin/img/step.png">
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="portlet box green">
				<div class="portlet-title">
					<div class="caption">
						<i class="glyphicon glyphicon-plus"></i><span >创建抽奖</span>
					</div>
				</div>
				<div class="portlet-body main_bd box">
					<!--  =====================strart======================== -->
					<div class="row">
						<div class="col-md-12">
							<div class="col-md-5" style="min-width: 400px;">
									<div class="preview">
										<div class="title">
											<a href="#" id="titleName">活动即将开始</a>
										</div>
										<div class="datetime">
											2014.01.02-2014.03.06
										</div>
										<div class="img">
											<img src="${basepath }/static/ixin/img/weikaishi.png" id="imgForLook">
										</div>
										<div class="description">
											&nbsp;&nbsp;&nbsp;&nbsp;亲，请点击进入抽奖活动页面，祝您好运哦！ 
										</div>
									</div>
							</div>
							<div class="col-md-6">
								<div class="edit">
									<div class="form">
											<form role="form" id="form1" action="${basepath }/mgr/scratchcard/addRewardFirstStep.xhtml">
												<div class="form-body">
													<div class="form-group" id="con_title1">
														<label for="title1" class="control-label">活动标题<span class="required">*</span></label>
														<input type="text" class="form-control" data-required="1" id="title1" name="title1" placeholder="请输入title">
														<span class="help-block">
														</span>
													</div>
													<div class="form-group" id="con_picUrl1">
														<label for="picUrl1" class="control-label">活动图片必须上传一张图片（350*200）<span class="required">*</span></label>
														<div class="upload_box">
															<div class="upload_area">
																<input type="hidden" name="picUrl1" id="picUrl1">
																<input type="file" name="file_upload" id="file_upload" />
																<ul class="upload_file_box" style="display: none;" id="queue"></ul>
															</div>
															<p class="js_cover upload_preview" >
																<div style="display: none;" id="small_prev">
																	<span id="image_cover"></span><a class="js_removeCover" href="javascript:void(0);"
																	onclick="delete_pic()">删除</a>
																</div>
															</p>
														</div>
														
													</div>
													<div class="form-group" id="con_content1">
														<label for="content1" class="control-label">活动说明<span class="required">*</span></label>
														<textarea class="form-control" rows="3" name="content1" id="content1"></textarea>
														<span class="help-block">
														</span>
													</div>
													<div class="form-group" id="con_content1">
														<label for="title">活动时间</label>
														<table>
															<tr>
																<td>从</td><td><input type="text" id="startDate" class="form-control" name="startDate"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',maxDate:'#F{$dp.$D(\'endDate\')}'})" class="form-control Wdate" /></td>
																<td>到</td><td><input type="text" id="endDate" class="form-control" name="endDate"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm', minDate:'#F{$dp.$D(\'startDate\')}'})" class="form-control Wdate"/></td>
															</tr>
														</table>
														<span class="help-block">
														</span>
													</div>
													<%-- 
														 <div class="form-group" id="con_apply">
                       								 <label>
                           								 <input type="radio" checked="checked" name="rewardType" value="0" > 刮刮卡
                        							</label>
                        							&nbsp;&nbsp;
                        							<label>
                            							<input  type="radio" name="rewardType" value="1" > 摇一摇
                       								</label>   
                    								</div>
													--%>
														<div class="form-group" id="con_findKeys">
																	<div class="form-group">
																	<label>回复关键词</label>
																	<input type="text" class="form-control" id="findKeys" name="keys" placeholder="请输入关键词">
																	</div>
																	<div class="col-md-3">
																	<span id="tip_findKeys" for="findKeys" class="help-block " style=""></span>
															</div>
													</div>
													<input type="hidden" id="hid_replyContent" name="hid_replyContent" value="抽奖机会已经用完了" />
													<div class="form-group" id="con_content">
														<label for="title" class="control-label">兑奖说明<span class="required">*</span></label>
														<textarea class="form-control" rows="3" id="content" name="content"></textarea>
														<span class="help-block">
														</span>
													</div>
				                                   <%-- 
													<div class="form-group" id="con_replyContent">
														<label for="replyContent" class="control-label">超过次数回复</label>
														<input type="text" class="form-control" id="replyContent" name="replyContent" placeholder="请输入回复信息">
													</div>--%>
												</div>
											</form>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<a href="#" onclick="validateAll()"><span class="btn green btn-block"><i class="glyphicon glyphicon-arrow-right"></i>&nbsp;下一步</span></a>
					</div>
					<!--  =====================end========================= -->
				</div>
			</div>
		</div>

	</div>
</body>
</html>
<content tag="pageCore"> 
<%-- 输入验证 --%>
<script src='${basepath }/static/public/javascripts/commonValidate.js' type='text/javascript' ></script> 
<script src='${basepath }/static/public/javascripts/easydialog-static-params.js' type='text/javascript' ></script>
<script src="${basepath }/static/ixin/js/jquery.uploadify.min.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript" src="${basepath }/static/public/My97DatePicker/WdatePicker.js"></script>
</content>
<content tag="pageInit"> <!-- 初始化窗口 --> 
<script type="text/javascript">
  $(document).ready(function(){
	  $("#title1").keydown(function(){
		  var title=$.trim($("#title1").val());
          $("#titleName").html(title);
		  });
	  $("#title1").change(function(){
		  var title=$.trim($("#title1").val());
          $("#titleName").html(title);
		  });

      $("#content1").change(function(){
          var content=$.trim($("#content1").val());
          $(".description").html(content);
          });
      $("#content1").keydown(function(){
          var content=$.trim($("#content1").val());
           $(".description").html(content);
          });
      $("#endDate").focusout(function(){
          var startdate=$("#startDate").val();
          var enddate=$("#endDate").val();
          var time="";
          if(startdate!=null && startdate!=""){
                  time=time+startdate+"-";
               }
          if(enddate!=null && enddate!=""){
                  if(time.length>1){
                  time=time+enddate;
                  }else{
                       time=enddate;
                      }
              }
          if(time.length>0){
               $(".datetime").html(time);
              }
          });

      $("#startDate").focusout(function(){
          var startdate=$("#startDate").val();
          var enddate=$("#endDate").val();
          var time="";
          if(startdate!=null && startdate!=""){
                  time=time+startdate+"-";
               }
          if(enddate!=null && enddate!=""){
                  if(time.length>1){
                  time=time+enddate;
                  }else{
                       time=enddate;
                      }
              }else{
                  if(time.length>1){
                      time=startdate;
                      }
                  }
          if(time.length>0){
               $(".datetime").html(time);
              }
          });
	  });

        //删除图片
		function delete_pic(){
			$("#image_cover").html("");
			$("#small_prev").hide();
			$("#imgForLook").attr("src",basepath+"/static/ixin/img/weikaishi.png");
		}
</script>
<script type="text/javascript">
		var basePathUrl = "${basepath}";
		//var qiniuImageBasePath = "http://img0.aijiayou.com/";
		var qiniuImageBasePath = "<%=Constants.IMG_SERVER_DOWNLOAD%>";
        $(document).ready(function(){
        	$('#file_upload').uploadify({
				'formData'     : {
					'token'     : '${uptoken}',
				},
				'fileObjName'  : 'file',
				'buttonText' : '<i class="glyphicon glyphicon-open"></i>上传',
				'buttonClass' : 'upload_access',
				'swf'      : '${basepath}/static/ixin/css/uploadify.swf',
				//'uploader' : 'http://up.qiniu.com/',
				'uploader' : uploadurl,
				'onUploadSuccess' : function(file,data,response){
					var result = eval("("+data+")");
					$('#picUrl1').val(result.hash);
					$('#showImage').attr("src",qiniuImageBasePath+result.hash);
					$('#showImage').show();
					$("#image_cover").html("<img style='max-width:100px;max-height:200px;' src = '" + qiniuImageBasePath + result.hash+"'>");
					$("#imgForLook").attr("src",qiniuImageBasePath+result.hash+"-80x80");
					$("#small_prev").show();
					saveFile(file,result);
				}
			});
           
        })
        
        function submit() {
        	$("#form1").submit();
        }
        
        function validateAll(){
			var flag1,flag2,flag3,flag4,flag5;
			flag1 = validate('title1');
			flag2 = validate('picUrl1');
			flag3 = validate('content1');
			flag4 = validate('hid_replyContent');
			flag5 = validate('content');//兑奖说明
			if(flag1 & flag2 & flag3 & flag4 & flag5){
				validateFindKey('findKeys');
				
			}
		}
        /** 验证关键字 */
		function validateFindKey(id){
			var obj = $("#"+id);
			var value = $.trim(obj.val());
			if(isBlank(value)){
				removeError(id);
				$("#tip_findKeys").html("");
				$("#form1").submit();
			}
			$.ajax({
				type:"post",
				url:basepath+"/mgr/ixinrule/validateaddfindkey.json",
				data:{"skey":value},
				success:function(data){
					var skeyIsExist = data;
					if(skeyIsExist){
						$("#tip_findKeys").html("关键字已存在");
						obj.focus();
						addError(id);
					}
					if(!skeyIsExist){
						$("#tip_findKeys").html("");
						removeError(id);
						$("#form1").submit();
					}
				}
			});
		}
		/** 验证分类 */
		function validate(id){
			var obj = $("#"+id);
			var value = $.trim(obj.val());
			if(isBlank(value)){
				obj.focus();
				addError(id);
				return false;
			}
			removeError(id);
			return true;
		}
		/** 添加错误信息 */
		function addError(id){
			$("#con_"+id).addClass("has-error").focus();
//			myShow("tip_"+id);
//			obj.focus();
		}
		function removeError(id){
			$("#con_"+id).removeClass("has-error");
//			myHide("tip_"+id);
		}
    </script> 
</content>

