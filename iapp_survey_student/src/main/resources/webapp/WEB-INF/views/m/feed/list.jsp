<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
    <head>
        <title>社区</title>
        <link rel="stylesheet" type="text/css" href="${basepath }/static/css/weixin-client-page1a1cdb.css">
        <script type="text/javascript" src="${basepath }/static/js/weixin-wxa-1.0.0.js"></script>
        <style>
            ol, ul {
                list-style-position: inside;
            }
            .pice_block{display:block;clear:both;margin:0px;padding:0px;width:100%;overflow:hidden;margin-top:5px;}
            .u_photo{width:60px;display:block;overflow:hidden;float:left;}
            .u_photo img{width:60px;height:60px;}
            .u_content{width:100%;padding-left:70px;min-height:60px;}
            .u_content .u_info{font-size:1em;display:block;overflow:hidden;width:100%;margin-bottom:5px;}
            .u_content .u_info .name{color:#3393f5;float:left;}
            .u_content .u_info .action{float:left;margin-left:8px;display:block;overflow:hidden;}
            .u_content .u_info .time{display:block;overflow:hidden;float:right;font-size:12px;color:#999;}
            .a_title{width:100%;color:#3393f5;font-size:14px;margin-bottom:7px;}
            .u_img{width:100%;}
            .u_img img{width:100%;}
            .u_control{color:#999;font-size:16px;}
            .u_said{font-size:16px;min-height:24px;}
            .spit_bar{font-size:14px;width:100%;overflow:hidden;height:12px;color:#aaa;}
            .u_content .name a{text-decoration: none;cursor: nromal;}
        </style>
    </head>
    <body>
    <body id="activity-detail">
        <div class="page-content">
        	<c:forEach items="${list }" var="item">
	        	<div class="pice_block">
	        		<div class="u_photo">
	        			<img src="${basepath}/user/avatar/${item.uid}.xhtml?style=80x80">
	        		</div>
	        		<div class="u_content">
	        			<div class="u_info">
	        				<span class="name">${item.title }</span>
	        			</div>
	        			<div class="u_said">
	        				<span class="u_said_content">${item.body }</span>
	        			</div>
	        			<div class="u_info">
	        			<span class="time">${ltfun:dataLongToSNS(item.createtime,"yyyy-MM-dd HH:mm")}</span>
	        			</div>
	        			<!-- <div class="u_control">
	        				<span>来自：微信</span>
	        				<span>转发（6）</span>
	        				<span>赞（12）</span>
	        			</div> -->
	        		</div>
	        	</div>
	        	<div class="spit_bar">
	        		<span>-----------------------------------------------------------------------------------------------</span>
	        	</div>
        	</c:forEach>
        </div>
        <script type="text/javascript" src="${basepath}/static/plugins/qqface/jquery.qqFace.js"></script>
	 <script type="text/javascript">
	 $(function(){
		 $(".page-content").find(".u_said_content").each(function(){
			 var html = replace_em($(this).html().toString());
				$(this).html(html);
		 });
	 });
	 /*将表情符转意过来*/
	 function replace_em(str){
	     str = str.replace(/\</g,'<；');
	     str = str.replace(/\>/g,'>；');
	    // str = str.replace(/\n/g,'<；br/>；');
	     str = str.replace(/\[em_([0-9]*)\]/g,'<img src="${basepath}/static/plugins/qqface/face/$1.gif" border="0" />');
	     return str;
	 }
	 </script>
    </body>
</html>

