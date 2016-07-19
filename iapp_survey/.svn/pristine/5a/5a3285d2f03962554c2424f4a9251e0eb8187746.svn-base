<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
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
<title>自定义站点管理</title>
			<meta name="menu_path" content="ext.ext_index"/>
<link rel="stylesheet" media="screen" href="${basepath}/static/ixin/css/ixin.css" type="text/css">
<link rel="stylesheet" type="text/css" href="${basepath }/static/ixin/css/uploadify.css">	
</head>
<body>

	<!-- 页面顶部-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
				<li><a href="${basepath }/base/admin/diyindex/index.xhtml">自定义站点管理</a></li>
			</ul>
			<!-- END PAGE TITLE & BREADCRUMB-->
		</div>
	</div>
	<!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-lg-12">
			<div class="portlet box green">
				<div class="portlet-title">
					<div class="caption">
						<i class="fa fa-bar-chart-o"></i><span>编辑</span> 
					</div>
				</div>
				<div class="portlet-body main_bd box">
					<!-- 添加 start -->
					<div class="mauto">
					<div class="col-md-12">
						<!-- 创建 start-->
						<div class="form" >
							<form role="form" id="questionForm" enctype="multipart/form-data" method="post">
								<div class="form-body">
									
									<div id="voteContent">
										<div class="form-group" id="con_name">
											<label style="font-size: 20px">名称</label>
											<input type="text" class="form-control" name="name" id="name" placeholder="名称" onchange="v_questionTitle();" value="${vo.name}">
											<!-- 
											<span class="help-block hidden" id="tip_questionTitle">题目名称不能为空</span>
											 -->
										</div>
										
										<div class="row">
											<div class="col-md-2"><label style="font-size: 20px">顶图</label></div>
											<div class="col-md-3"><span class="help-block" id="tip_coverPath_0">比例16:9 推荐大小640*360</span></div>
										</div>
										<div class="frm_input_box" style="border:1px solid #e5e5e5; padding-top:3px; margin-bottom:6px; padding-bottom:-5px;padding-left:10px;">
													<div class="upload_box">
														<div class="upload_area">
															<input type="file" id="file_upload_0" />
															<ul class="upload_file_box" style="display: none;" id="queue"></ul>
														</div>
													</div>
													<div style="display: none;margin-bottom:20px;" id="small_prev_0">
														<span id="image_cover_0"></span>
														<a class="js_removeCover" href="javascript:void(0);" onclick="deleteCover('0');">删除</a>
														<input type="hidden" id="fileId_0"  value="${vo.fileid }"/>
														<input type="hidden" id="coverPath_0" value="${vo.cover }"/>
													</div>
													<span class="help-block hidden" id="tip_coverPath_0" style="color: red;">图片不能为空</span>
													
										</div>
									
										
										<div class="form-group " id="vote_options">
												<br/><br/>
												<label style="font-size: 20px">板块</label>
										<c:choose>
											<c:when test="${empty vo }">
											<div class="input-group mt5" id="option_1">
												<label>图片（比例1:1 推荐大小180*180）</label>
												<input type="hidden" id="optionId_1" value=""/>
												<div class="frm_input_box" style="border:1px solid #e5e5e5; padding-top:3px; margin-bottom:6px; padding-bottom:-5px;padding-left:10px;">
													<div class="upload_box">
														<div class="upload_area">
															<input type="file" id="file_upload_1" />
															<ul class="upload_file_box" style="display: none;" id="queue"></ul>
														</div>
													</div>
													<div style="display: none;margin-bottom:20px;" id="small_prev_1">
														<span id="image_cover_1"></span>
														<a class="js_removeCover" href="javascript:void(0);" onclick="deleteCover('1');">删除</a>
														<input type="hidden" id="fileId_1"  value=""/>
														<input type="hidden" id="coverPath_1" value=""/>
													</div>
													<span class="help-block hidden" id="tip_coverPath_1" style="color: red;">图片不能为空</span>
												</div>
												
												<label>标题（字数超过6个时会影响显示效果）</label>
												<input type="text" class="form-control" id="option_title_1">
												
												<label>链接（以http://开头）</label>
												<input type="text" class="form-control" id="option_url_1">
												<span class="input-group-btn ">
													<button class="btn red" type="button"  onclick="removethis(this)"><i class="fa fa-times" style="font-size: 18px;"></i></button>
												</span>
											</div>
											
											<br/><br/>
											<div class="input-group mt5" id="option_2" >
											<label>图片（比例1:1 推荐大小180*180）</label>
												<input type="hidden" id="optionId_2" value=""/>
												<div class="frm_input_box" style="border:1px solid #e5e5e5; padding-top:3px; margin-bottom:6px; padding-bottom:-5px;padding-left:10px;">
													<div class="upload_box">
														<div class="upload_area">
															<input type="file" id="file_upload_2" />
															<ul class="upload_file_box" style="display: none;" id="queue"></ul>
														</div>
													</div>
													<div style="display: none;margin-bottom:20px;" id="small_prev_2">
														<span id="image_cover_2"></span>
														<a class="js_removeCover" href="javascript:void(0);" onclick="deleteCover('2');">删除</a>
														<input type="hidden" id="fileId_2"  value=""/>
														<input type="hidden" id="coverPath_2" value=""/>
													</div>
													<span class="help-block hidden" id="tip_coverPath_2" style="color: red;">图片不能为空</span>
												</div>
												<label>标题（字数超过6个时会影响显示效果）</label>
												<input type="text" class="form-control" id="option_title_2" >
												
												<label>链接（以http://开头）</label>
												<input type="text" class="form-control" id="option_url_2">
												<span class="input-group-btn">
													<button class="btn red" type="button"  onclick="removethis(this)"><i class="fa fa-times" style="font-size: 18px;"></i></button>
												</span>
											</div>
											</c:when>
											<c:otherwise>
												<c:forEach var="item"  items="${vo.models}" varStatus="v">
												${ v.index+1 !=1 ?'<br/><br/>':''}
													<div class="input-group mt5" id="option_${v.index+1 }">
												<label>图片（比例1:1 推荐大小180*180）</label>
												<input type="hidden" id="optionId_${v.index+1 }" value=""/>
												<div class="frm_input_box" style="border:1px solid #e5e5e5; padding-top:3px; margin-bottom:6px; padding-bottom:-5px;padding-left:10px;">
													<div class="upload_box">
														<div class="upload_area">
															<input type="file" id="file_upload_${v.index+1  }" />
															<ul class="upload_file_box" style="display: none;" id="queue"></ul>
														</div>
													</div>
													<div style="display: none;margin-bottom:20px;" id="small_prev_${v.index+1   }">
														<span id="image_cover_${v.index+1   }"></span>
														<a class="js_removeCover" href="javascript:void(0);" onclick="deleteCover('${v.index+1   }');">删除</a>
														<input type="hidden" id="fileId_${v.index+1   }"  value="${item.fileid }"/>
														<input type="hidden" id="coverPath_${v.index+1   }" value="${item.cover }"/>
													</div>
													<span class="help-block hidden" id="tip_coverPath_${v.index+1   }" style="color: red;">图片不能为空</span>
												</div>
												
												<label>标题（字数超过6个时会影响显示效果）</label>
												<input type="text" class="form-control" id="option_title_${v.index+1  }" value="${item.title }">
												
												<label>链接（以http://开头）</label>
												<input type="text" class="form-control" id="option_url_${v.index+1  }" value="${item.url }">
												<span class="input-group-btn ">
													<button class="btn red" type="button"  onclick="removethis(this)"><i class="fa fa-times" style="font-size: 18px;"></i></button>
												</span>
											</div>
												</c:forEach>
											</c:otherwise>
										</c:choose>
											
										</div>
										<!-- 单选多选题选项 end-->
										
										
										
										
										<div class="form-group" style="text-align: center;">
											<div class = "btn btn-success" onclick="addOption()" id="addoptions" style="width:45%"><i class="fa fa-plus"></i>&nbsp;添加板块</div>
										</div>
									</div>
								</div>
							</form>
		                    <div class="btngroup">
	                            <div class="btn btn-block btn-success" onclick="save('${vo.id}')">保存</div>
	                        </div>
						</div>
						
						<!-- 创建 end-->
					</div>
						
					</div>
					
					<!-- 添加 end -->
				</div>
			</div>
		</div>

	</div>
</body>
</html>
<content tag="pageCore"> 
</content>
<content tag="pageInit"> <!-- 初始化窗口 --> 
<script type="text/javascript">

var token = "${result.uploadToken}";
var qiniuImageBasePath = "${result.qiniuImageBasePath}";
var coverSuffix = "${result.coverSuffix}";
var id = $("#vote_options").find("input:last").attr("id");
var count = parseInt(id.substring(11));//记录动态产生选项的个数
$(document).ready(function(){
	
});







</script>
<script src="${basepath }/static/ixin/js/jquery.uploadify.min.js" type="text/javascript"></script>
 <script src="${basepath }/static/public/javascripts/diyindex.js"></script>
<script type="text/javascript">
</script>

 </content>

