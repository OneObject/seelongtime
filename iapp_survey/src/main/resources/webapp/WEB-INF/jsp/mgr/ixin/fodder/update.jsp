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
<c:set var="title" value="素材管理"/>
<c:if test="${columnId eq 'ixinstudy' }">
	<c:set var="title" value="学习创建"/>
	<c:set var="menu_path" value="ixin.menu_study"/>
</c:if>
<c:if test="${columnId eq 'respNews' }">
	<c:set var="title" value="关键词回复素材"/>
	<c:set var="menu_path" value="ixin.menu_keywrods"/>
</c:if>
<c:if test="${columnId eq 'ixinnotice' }">
	<c:set var="title" value="通知公告"/>
	<c:set var="menu_path" value="ixin.menu_notice"/>
</c:if>
<c:if test="${empty columnId }">
	<c:set var="menu_path" value="ixin.menu_matter"/>
</c:if>

<title>${title}</title>

<meta name="menu_path" content="${menu_path}" />
<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/ixin.css" type="text/css">
	<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/base.css" type="text/css">
	<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/appmsg_edit.css" type="text/css">
	<link rel="stylesheet" media="screen"
	href="${basepath}/static/ixin/css/appmsg_editor.css" type="text/css">
	<link rel="stylesheet" type="text/css" href="${basepath }/static/ixin/css/uploadify.css">
</head>
<body>

	<!-- 页面顶部-->
	<div class="row">
		<div class="col-md-12">
			<ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
				<li><span href="#">${title}</span></li>
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
						<i class="fa fa-comments"></i><span>修改单图文消息</span>
						<!-- 扩展字段 -->
						<input type="hidden" id="columnId" value="${columnId }"/>
						<!-- 草稿素材ID -->
						<input type="hidden" id="id" value="">
						<!-- 正式素材ID -->
						<input type="hidden" id="baseId" value="${vo.id }">
						<!-- 封面路径 -->
						<input type="hidden" id="coverPath" value="${vo.ext }">
						<!-- 封面文件ID -->
						<input type="hidden" id="fileId" value="${vo.fileId }">
						
						<input type="hidden" id="cId" value="${cId }">
					</div>
				</div>
				<div class="portlet-body main_bd box">
					<!-- 添加单图文素材 start -->
					<div class="media_preview_area">
						<div class="appmsg  editing">
							<div id="js_appmsg_preview" class="appmsg_content">
								<div id="appmsgItem1" data-fileid="" data-id="1"
									class="js_appmsg_item ">

									<h4 class="appmsg_title">
									<span>${vo.title }</span>
										
									</h4>
									<div class="appmsg_info">
										<em class="appmsg_date"></em>
									</div>
									<div class="appmsg_thumb_wrp">
										<img class="js_appmsg_thumb appmsg_thumb"  id="showImage" src="${vo.coverPath }"> <i
											class="appmsg_thumb default" id="coverDefault">封面图片</i>
									</div>
									<%-- <p class="appmsg_desc" id="matter_desc">${vo.summary }</p> --%>

								</div>
							</div>
						</div>
					</div>
					<div id="js_appmsg_editor" class="media_edit_area">
						<div class="appmsg_editor" style="margin-top: 0px;">
							<div class="inner">
								<div class="appmsg_edit_item">
									<label for="" class="frm_label">标题</label> <span
										class="frm_input_box"><input type="text" id="title"
										class="frm_input js_title" value="${vo.title }" onkeyup="autoSyncContent(this,'single_title');"  onblur="autoSave(false);"></span>
								</div>
								<div class="appmsg_edit_item">
									<label for="" class="frm_label"> <strong class="title">作者</strong>
										<p class="tips l">（选填）</p>
									</label> <span class="frm_input_box"><input type="text" id="author"
										class="frm_input js_author " value="${vo.author }" onblur="autoSave(false);"></span>
								</div>
								<div class="appmsg_edit_item">
									<label for="" class="frm_label"> <strong class="title">封面</strong>
										<p class="js_cover_tip tips r">建议尺寸：360像素 * 200像素</p>
									</label>
									<div class="frm_input_box">
										<div class="upload_box">
											<div class="upload_area">
												<input type="file" name="file_upload" id="file_upload" />
												<ul class="upload_file_box" style="display: none;" id="queue"></ul>
											</div>
										</div>
											<div style="display: none;margin-bottom:20px;" id="small_prev">
												<span id="image_cover"></span><a class="js_removeCover" href="javascript:void(0);"
												onclick="deleteCover();">删除</a>
											</div>
									</div>
									<p class="frm_tips">
										<label for=""	class="frm_checkbox_label js_show_cover_pic selected">
											<input type="checkbox" <c:if test="${vo.coverShowInText ==1 }">checked=checked</c:if> id="checkbox_info" > 封面图片显示在正文中
										</label>
									</p>
								</div>

								<p>
									<a class="js_addDesc" href="javascript:void(0);"
										onclick="$('#zhaiyao').show()">添加摘要</a>
								</p>
								<c:if test="${empty vo.summary }">
								<div class="js_desc_area dn appmsg_edit_item"
									style="display: none;" id="zhaiyao">
									<label for="" class="frm_label">摘要</label> <span
										class="frm_textarea_box"><textarea id="summary"
											class="js_desc frm_textarea" onblur=""  onkeyup="">${vo.summary }</textarea></span>
								</div>
								</c:if>
								<c:if test="${not empty vo.summary }">
								<div class="js_desc_area dn appmsg_edit_item"
									style="" id="zhaiyao">
									<label for="" class="frm_label">摘要</label> <span
										class="frm_textarea_box"><textarea id="summary"
											class="js_desc frm_textarea" onblur=""  onkeyup="autoSyncContent(this,'matter_desc')">${vo.summary }</textarea></span>
								</div>
								</c:if>
								<div id="js_ueditor" class="appmsg_edit_item content_edit">
									<a href="javascript:void(0);"
										class="icon16_common close jsClose" onclick="return false;">关闭</a>
									<label for="" class="frm_label"> <strong class="title">正文</strong>
										<p class="tips r">
											<em id="js_auto_tips" class="material_saveInfo" style="display:none;">自动保存：<span class="material_saveTime">2014/01/09 17:03:24</span></em> <a
												id="js_cancle" style="display: none;"
												href="javascript:void(0);" onclick="return false;">取消</a>
										</p>
									</label>
									<!--  
									<div id="loading">
										<img alt="正在初始化编辑器，请稍候···" src="${basepath }/static/ixin/img/loading.gif">正在初始化编辑器，请稍候···
									</div>
									-->
									<textarea name="后台取值的key" id="myEditor" style="border: #f8f8f8;background-color: #f8f8f8;">${vo.content }</textarea>
								</div>
								<div class="appmsg_edit_item">
									<label for="" class="frm_label">跳转链接</label> <span
										class="frm_input_box"><input type="text" id="gotoUrl"
										class="js_gotourl frm_input" onblur="" value="${vo.gotoUrl }"></span>
								</div>
								<p>
									<a class="js_addURL" href="javascript:void(0);"
										onclick="$('#lianjie').show()">添加原文链接</a>
								</p>
								<c:if test="${empty vo.sourceUrl }">
								<div class="js_url_area dn appmsg_edit_item"
									style="display: none;" id="lianjie">
									<label for="" class="frm_label">原文链接</label> <span
										class="frm_input_box"><input type="text" id="sourceUrl"
										class="js_url frm_input" onblur=""></span>
								</div>
								</c:if>
								<c:if test="${not empty vo.sourceUrl }">
								<div class="js_url_area dn appmsg_edit_item"
									style="" id="lianjie">
									<label for="" class="frm_label">原文链接</label> <span
										class="frm_input_box"><input type="text" id="sourceUrl"
										class="js_url frm_input" onblur="" value="${vo.sourceUrl }"></span>
								</div>
								</c:if>
							</div>
							<i class="arrow arrow_out" style="margin-top: 0px;"></i> <i
								class="arrow arrow_in" style="margin-top: 0px;"></i>
							<div class="mask" style="display: none;"></div>
						</div>
					</div>
					<!-- 添加单图文素材 end -->
					<div class="tool_area">
						<div class="tool_bar">
							<!-- <span id="js_preview" class="btn btn_input btn_primary"><button>预览</button></span> -->
							<span id="js_submit" class="btn btn_input btn_primary"><button>保存</button></span>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
		<!-- 	保存获取的视频url与视频图片   -->
		<input type="hidden" id="videourl" value="">
		<input type="hidden" id="posterurl" value="">
		<!-- 	保存获取的文档相关信息   -->
		<input type="hidden" id="pagenum"	value=""> 
		<input type="hidden" id="docpath" value="">
		<input type="hidden" id="docid" value="">
		<input type="hidden" id="imgtype" value="">
</body>
</html>
<content tag="pageCore"> 
<script type="text/javascript">
//var content="<c:out value='${vo.content}'/>" ;
</script>
	<script src="${basepath }/static/ixin/js/jquery.uploadify.min.js" type="text/javascript"></script>
	<%--
	<script type="text/javascript" src="${basepath }/static/ixin/plugin/ueditor1_3_6-utf8-jsp/ueditor.config.js"></script>
	<script type="text/javascript" src="${basepath }/static/ixin/plugin/ueditor1_3_6-utf8-jsp/ueditor.all.min.js"></script>
	 --%>
	<script type="text/javascript" charset="utf-8" src="${basepath }/static/ixin/plugin/ueditor1_4_3-utf8-jsp/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8"  src="${basepath }/static/ixin/plugin/ueditor1_4_3-utf8-jsp/ueditor.all.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="${basepath }/static/ixin/plugin/ueditor1_4_3-utf8-jsp/third-party/video-lt/videoDialog.js"></script>
	<script type="text/javascript" charset="utf-8" src="${basepath }/static/ixin/plugin/ueditor1_4_3-utf8-jsp/third-party/document-lt/documentDialog.js"></script>
		<script type="text/javascript" src="${basepath }/static/ixin/js/fodder.js"></script>
</content>
<content tag="pageInit"> <!-- 初始化窗口 --> 
<script type="text/javascript">
var basepath = "${basepath}";
var token = "${result.uploadToken}";
//var qiniuImageBasePath = "${result.qiniuImageBasePath}";
var qiniuImageBasePath = "<%=Constants.IMG_SERVER_DOWNLOAD%>";
var coverSuffix = "${result.coverSuffix}";

$('#showImage').show();

//实例化编辑器
//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
var editor = UE.getEditor('myEditor',{
	//http://ajy-test.qiniudn.com
	imageUrlPrefix:"<%=Constants.IMG_SERVER_DOWNLOAD%>" 
	//http://up.qiniu.com/
	,serverUrl:"<%=Constants.QINIU_SERVER%>" 
	,token:token
    ,imageActionName :"upload"
    ,imageFieldName :"file"
    ,imagewidth:"100%" 
    ,imageMaxSize:2*1024*1024
    //,imageSuffix:"-480x480"
    ,imageSuffix:"-imageView0h520q85"
    ,imageAllowFiles :[".png", ".jpg", ".jpeg", ".gif", ".bmp"]
    //工具栏上的所有的功能按钮和下拉框，可以在new编辑器的实例时选择自己需要的从新定义
    , toolbars:[["source","|","fontsize","bold","italic","underline","|","insertorderedlist","insertunorderedlist","|","insertimage","|",'removeformat','forecolor','backcolor'/*,"insertvideo"*/]]
	,maximumWords:100000
});

</script> 
<script type="text/javascript">
<%--每隔一段时间自动保存素材--%>
window.setInterval(function(){
	if(startAuto){
		autoSave();
	}
},1000*10); 
</script>
</content>

