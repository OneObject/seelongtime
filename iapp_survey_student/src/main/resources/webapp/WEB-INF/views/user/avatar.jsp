<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%><%--需重再一次导入 --%>
<!DOCTYPE html>
<html>
<head>
<title><fmt:message key="avatar.title" bundle="${bundle}"/></title>
<meta name="menu_edit" content="edit"><%--当前菜单选中设置 --%>
<link rel="stylesheet" href="${basepath}/static/css/uploadify.css">
<link rel="stylesheet" href="${basepath}/static/plugins/tapmodo-Jcrop/css/jquery.Jcrop.css">
<style type="text/css">
	#upload-queue{
	display: none;
	}
</style>
</head>
<body>
<section class="main-home">

<ol class="breadcrumb">
    <li><a href="${basepath}/"><fmt:message key="menu.home" bundle="${bundle}"/></a></li>
    <li ><a href="${basepath}/user/center.xhtml"><fmt:message key="menu.usercenter" bundle="${bundle}"/></a></li>
     <li class="active"><fmt:message key="avatar.title" bundle="${bundle}"/></li>
</ol>


    <div class="edit-box">
        <form role="form" action="${basepath}/user/edit.xhtml" method="post">
            <div class="form-group">
                <label><fmt:message key="avatar.upload_and_cut" bundle="${bundle}"/></label>
                <div class="clearbox">
                    <div class="artwork">
                        <!--原图-->
                       <!--  <c:if test="${not empty avatar}">
                        <img id="artwork" src="${imgpath}/${avatar}">
                        </c:if> -->
                        <div class="imgfather">
                         <img id="artwork" src="${basepath}/static/img/user/avatar.png"></div>
                        <input class="form-control" type="file" id="upload">
                        <input type="hidden" id="avatar" name="avatar" value="${avatar}">
                    </div>
                    <div class="imgpreview">
                        <!--头像预览-->
                        <ul>
                            <li>
                                <!--正方形-->
                                <div  style="width:100px;height:100px;overflow:hidden;">
                                <c:if test="${not empty avatar}">
		                        <img style="width:100px;height:100px;" id="preview-quadrate" src="${imgpath}/${avatar}">
		                        </c:if>
		                         <c:if test="${ empty avatar}">
		                          <img style="width:100px;height:100px;" id="preview-quadrate" src="${basepath}/static/img/user/avatar.png" >
		                         </c:if>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="form-group" style="text-align: right">
                <button type="button" class="btn btn-danger"  onclick="submitform(this)"><fmt:message key="avatar.submit" bundle="${bundle}"/></button>
            </div>
            <input type="hidden" name="action" value="avatar"/>
            <input type="hidden"  id="x1" name="x1" />
			<input type="hidden"  id="y1" name="y1" />
			<input type="hidden"  id="w" name="w" />
			<input type="hidden"  id="h" name="h" />
			<input type="hidden"  id="show_w" name="show_w" />
			<input type="hidden"  id="show_h" name="show_h" />
			
			<input type="hidden" id="actual_w" name="actual_w" />
			<input type="hidden" id="actual_h" name="actual_h" />
            
        </form>

    </div>
</section>
	<script type="text/javascript" src="${basepath}/static/plugins/tapmodo-Jcrop/js/jquery.min.js"></script>
    <script src="${basepath}/static/plugins/tapmodo-Jcrop/js/jquery.Jcrop.js"></script>
    <script src="${basepath}/static/js/jquery.uploadify.min.js"></script>
        <script type="text/javascript">
            jQuery(function($){
            	var jcrop_api,boundx,boundy;
            	
                //初始化上传插件
            	$('#upload').uploadify({
        			'formData'     : {
        				'token'     : '${uptoken}',
        			},
        			'fileSizeLimit' : '5MB',
        			'fileTypeDesc' : 'Image Files',
        	        'fileTypeExts' : '*.gif; *.jpg; *.png;*.bmp',
        			'fileObjName'  : 'file',
        			'buttonText' : '<i class="fa fa-upload"></i><fmt:message key="avatar.upload" bundle="${bundle}"/>',
        			'buttonClass' : 'upload_access',
        			'swf'      : '${basepath}/static/css/uploadify.swf',
        			//'uploader' : 'http://up.qiniu.com/',
        			'uploader' : '<%=Constant.IMG_SERVER_UPLOAD%>',
        			'onUploadSuccess' : function(file,data,response){
        				var result = eval("("+data+")");
        				$('#artwork').attr("src","${imgpath}/"+result.hash);
        				$('#preview-quadrate').attr("src","${imgpath}/"+result.hash);
        				$("#avatar").val(result.hash);
        				$("#actual_w").val(result.w);
        				$("#actual_h").val(result.h);
        				initJcrop();
        			},
        			'onUploadStart' : function(file) {
        	            //alert('开始上传 ' + file.name);
        				$('#artwork').attr("src","");
        				//$('#preview-quadrate').attr("src","");
        				cleanCoords();
        				if(null!=jcrop_api){jcrop_api.destroy();}
        	        }
        		});
                
                
                function initJcrop(){
                    $("#artwork").Jcrop({
                        onChange:updatePreview,
                        onSelect:updatePreview,
                        aspectRatio:1
                    },function(){
                        // Use the API to get the real image size
                        var bounds=this.getBounds();
                        boundx=bounds[0];
                        boundy=bounds[1];
                        // Store the API in the jcrop_api variable
                        jcrop_api=this;
                    });

                }
                
            	
                function updatePreview(c){
                    if(parseInt(c.w)>0){
                        var rx=100/c.w;
                        var ry=100/c.h;
                        $("#preview-quadrate").css({
                            width:Math.round(rx*boundx)+"px",
                            height:Math.round(ry*boundy)+"px",
                            marginLeft:"-"+Math.round(rx*c.x)+"px",
                            marginTop:"-"+Math.round(ry*c.y)+"px"
                        });
                        
                       //console.log(jcrop_api.getScaleFactor());
                    };
                    showCoords(c);
                };
                
                function showCoords(c){
                	$("#x1").val(c.x);
                	$("#y1").val(c.y);
                	$("#w").val(c.w);
                	$("#h").val(c.h);
                	console.log(jcrop_api.getBounds());
                	$("#show_w").val(jcrop_api.getBounds()[0]);
                	$("#show_h").val(jcrop_api.getBounds()[1]);

                };
                function cleanCoords(){
                	$("#x1").val(-1);
                	$("#y1").val(-1);
                	$("#w").val(-1);
                	$("#h").val(-1);
                };
                
                <c:if test="${ not empty avatar}">
                	//initJcrop();
                </c:if>

            });
           
             function submitform(_this){
                	$("form").submit();
                	$(_this).attr('disabled','disabled');
                }
        </script>
        
        
        </body>
        </html>