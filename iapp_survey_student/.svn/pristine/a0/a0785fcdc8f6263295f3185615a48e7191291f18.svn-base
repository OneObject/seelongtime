<%@page import="org.apache.commons.lang.math.RandomUtils"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>编辑头像</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="${basepath }/static/css/320.css">
    <link rel="stylesheet" href="${basepath}/static/m_h5/css/common.css" >
    <link rel="stylesheet" href="${basepath}/static/m_h5/css/color.css" >
    <style>
    .addClass {margin-top:20px;height:36px;line-height:36px;font-size:16px;text-align:center;border-radius:3px;color:#fff;display:block;width:100%;cursor:pointer;}
    .bootStrapHeader{height:50px;}
    </style>
<%-- 页面风格设置 --%>
<%@ include file="/WEB-INF/include/m_h5_setting.jsp"%>    
     <style type="text/css">
     .loadImgBox{width:156px;height:156px;box-sizing: border-box;position:relative;border:1px solid #ccc;padding:2px;line-height: 152px;text-align:center;font-size:32px;color:#fff;margin:18px auto 2px auto;background: url(${basepath}/static/m_h5/img/upload_bg.png) center center no-repeat;background-size:152px 152px;}
	.loadImgBox .num{position:relative;z-index:10;margin:0px;}
	.loadImgBox img{width:152px;height:152px;position:absolute;top:1px;left:1px;}
	.loadImgBox .perBox{width:152px;height:152px;background:rgba(0,0,0,0.6);position:absolute;z-index:5px;top:1px;left:1px;}
	.active{animation: 2s linear 0s normal none infinite running per;-webkit-animation:per 2s linear infinite;}
	.loadImgBox .perBox span{display: inline-block;height:152px;background-color:rgba(204,204,204,0.8);float:left;transition: width 0.6s ease 0s;}
	.per{background-image:linear-gradient(-45deg, hsla(0, 0%, 100%, 0.15) 25%, hsla(0, 0%, 0%, 0) 25%, hsla(0, 0%, 0%, 0) 50%, hsla(0, 0%, 100%, 0.15) 50%, hsla(0, 0%, 100%, 0.15) 75%, hsla(0, 0%, 0%, 0) 75%, hsla(0, 0%, 0%, 0));background-size: 60px 60px;}
	@keyframes per{
		0% {background-position: -60px 0px;}
		100% {background-position: 0px 0px;}
	}
	@-moz-keyframes per{
		0% {background-position: -60px 0px;}
		100% {background-position: 0px 0px;}
	}
	@-webkit-keyframes per{
		0% {background-position: -60px 0px;}
		100% {background-position: 0px 0px;}
	}
	@-o-keyframes per{
		0% {background-position: -60px 0px;}
		100% {background-position: 0px 0px;}
	}
	
	.uploadBtn{width:288px;height:34px;line-height: 34px;color:#fff;background-color:#d8d8d8;font-size:16px;text-align: center;margin:0 auto;box-shadow: 1px 1px 2px #ccc;border-radius: 2px;cursor: pointer;}
	.uploadBtn1{background-color:#028bcf;}
	#cx{font-size:15px;width:54px;top:6px;cursor:pointer;}
     </style>  
</head>
<body>
<header  class="bootStrapHeader ctl_header">
      <div class="back"><a href="${basepath}/m/h5/usercenter/detail.xhtml"><i class="fa fa-angle-left"></i></a></div>
       	编辑头像
      <div class="home" id="cx" style="display: none;" onclick="cexiao()">撤销</div>
</header>

<article class="scroll ctl_cont" >
<section class="task-detail-box">
		<div id="preview">
		<div class="uploadify-queue-item" style="width: 100%; text-align: center;">
			<div class="funjian-item">
			<div class="imgbox" style="margin:auto;">
			<img src="${basepath}/user/avatar/${uid}.xhtml?style=80x80&color=gray&r=<%=RandomUtils.nextInt()%>">
			</div>
			</div>
			</div>
		</div>	
    <div id="submit">
	     <div id="upload">
	    </div>
	    <input type="hidden" id="cuur_avatar" value='${ava}' >
	    <label style="font-size: 12px;color:#999;font-weight: normal;" id="notice">* 点击加号上传头像</label>
	    <span class="addClass"  onclick="submit();">提交</span>
    </div>
</section>
</article>

<script type="text/javascript" src="${basepath }/static/plugins/Huploadify/jquery.Huploadify2.js"></script>
<script type="text/javascript" src="${basepath}/static/m_h5/js/common.js"></script>
<script type="text/javascript">
	var bgImgPath = '${basepath}/static/m_h5/img/upload_bg.png';
	var obj = new Object();
	var i=1;
    $(function(){
        $('#upload').Huploadify({
            auto:true,
            fileTypeExts:'*',
            multi:false,
            formData:{'token':'${uptoken}'},
            fileSizeLimit:1024*1024,
            showUploadedPercent:true,//是否实时显示上传的百分比，如20%
            showUploadedSize:false,
            removeTimeout:60*60*1000,
            uploader:'<%=Constant.QINIU_SERVER%>',
            onUploadStart:function(){
               // alert('开始上传');
            	 $('#upload').find('.uploadify-button').hide();
            	 $('#notice').hide();
            	 $('#preview').html(' ');
            	 $("#cuur_avatar").val('uploading');
         		 //alert($.trim($("#cuur_avatar").val()));
            },
            onInit:function(){
                //alert('初始化');
            },
            onUploadComplete:function(file,data,response){
            	$("#progress_fileupload_1_1").show();
            	$("#progress_fileupload_1_1").html("100%");
            	var result = eval("("+data+")");
				var path = result.url;
				var name = result.name;
				var extStart=name.lastIndexOf(".");
				var ext=name.substring(extStart,name.length).toUpperCase();
				if(ext==".BMP" || ext==".PNG" || ext==".GIF" || ext==".JPG" || ext==".JPEG"){
					var url="<%=Constant.IMG_SERVER_DOWNLOAD%>"+path;
					$(".loadImgBox img")[0].src= url+"-80x80";
					$("#pic_fileupload_1_1").attr("src",url+"-80x80");
					
				}
				$("#name_fileupload_1_1").html(name.substring(0,6)+"...");
				$("#cuur_avatar").val(path);
				
				$(".perBox,.num").remove();
				$("#cx").show();
				//alert($.trim($("#cuur_avatar").val())+ "success");
				i++;
            },
            onDelete:function(file){
            	$('#upload').find('.uploadify-button').show();
            	$("#cuur_avatar").val('${ava}');
            	//alert($.trim($("#cuur_avatar").val())+ "还原了 ");
            },
            onCancel:function(){
            	$('#upload').find('.uploadify-button').show();
            	$('#preview').html('<div class="uploadify-queue-item" style="width: 100%; text-align: center;"><div class="funjian-item"><div class="imgbox" style="margin:auto;"><img src="${basepath}/user/avatar/${uid}.xhtml?style=80x80&color=gray&r=<%=RandomUtils.nextInt()%>"></div></div></div></div>');
            	$('#notice').show();
            	$("#cuur_avatar").val('${ava}');
            	//alert($.trim($("#cuur_avatar").val())+ "还原了 ");
              }
        });

    });
    function cexiao(){
    	$('#upload').find('.uploadify-button').show();
    	$('#preview').html('<div class="uploadify-queue-item" style="width: 100%; text-align: center;"><div class="funjian-item"><div class="imgbox" style="margin:auto;"><img src="${basepath}/user/avatar/${uid}.xhtml?style=80x80&color=gray&r=<%=RandomUtils.nextInt()%>"></div></div></div></div>');
    	$('#notice').show();
    	$("#cuur_avatar").val('${ava}');
    	$('.loadImgBox').remove();
    	$("#cx").hide();
        }
    function submit(){
			var ava = $.trim($("#cuur_avatar").val());
        	if(ava=='uploading')
            {
        		alert('头像在上传，请稍后操作 ');
        		return;
            }
        	$.ajax({
    		url:"${basepath}/m/h5/usercenter/updateavatar.json",
    		type:"POST",
    		data:{"avatar":ava},
    		success:function(data){
    			if(data){
    				location.href="${basepath}/m/h5/usercenter/detail.xhtml";
    			} else {
    				showTishi('保存失败，请稍后执行...');
    			}
    		},
    		error: function(data){
    			showTishi('保存失败，请稍后执行...');
    		}
    	}); 
    }
</script>
</body>
</html>