<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%
String domain = MwebHelper.getCurrentDomain();
%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>${empty category ? '分类课程' : category.name }</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no"/>
    <style type="text/css">
        html,body{
            margin: 0px;
            padding: 0px;
            color: #53575E;
        }
        .container{
            width: 100%;
            display: block;
            overflow: hidden;
        }
        .courselist{
            margin: 0px;
            padding: 0px;
            display: block;
            overflow: hidden;
            clear:left;
            margin-top:8px;
        }
        .courselist>li{
            list-style: none;
        }
        .courseitem{
            width: 100%;
            padding: 8px;
            min-height: 48px;
            padding: 8px;
            border-bottom:1px solid #CCCCCC ;
        }
        .courseitem>img{
            height: 48px;;
            width:  85.3px;
        }
        .courseitem>span{
            min-height: 48px;
            padding-left: 90px;
            display: block;
            margin-top: -48px;
            font-size: 16px;
            padding-right: 8px;
        }
        .cutpage{
            min-height: 48px;
            clear: both;
            display: block;
        }
        .cutpage>div>a{
            display: block;
            overflow: hidden;
            height: 32px;
            line-height: 32px;
            width: 82px;
            font-size: 16px;
            float: left;
            text-align: center;
            text-decoration: none;
            color: #53575E;
        }
        .cutpage>div{
            width: 252px;
            margin: 8px auto;
        }
        .cutpage>div>.button{
            border: 1px solid #CCCCCC;
            border-radius: 5px;
            -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
        }
		
		.searching{padding:8px;box-sizing:border-box;width:100%;border-bottom:1px #e0e0e0 solid;overflow:hidden;}
		.searching div{border-radius:5px;border:1px solid #eee;height:26px;background:#fff;position:relative;}
		.searching div input{border-radius:5px;height:26px;width:100%;display:block;padding:5px;box-sizing:border-box;border:none;color:#999;font-size:16px;}
		.searching div span{width:18px;height:18px;position:absolute;right:5px;top:5px;}
		.searching div span img{width:18px;height:18px;cursor:pointer;}        
    </style>
    
    <script>
    	 var totalPage =  ${rs.pageable.totalPages};
    	 var pageindex=${rs.pageable.pageNumber};
    	 var pageSize =  ${rs.pageable.pageSize};
    	 
    	function search(){
			var name = document.getElementById("name").value;
			window.location.href="${basepath}/m/nmystudy/mycourse_page.xhtml?name="+name+"&categoryid=${categoryid}";
		}
    	 
		 function courseDetail(cid){
	     	window.location.href="${basepath}/study/detail.xhtml?cid="+cid;
	     }
		
		 function downPage(){
			
			 if(pageindex>=totalPage){
				 return;
			}else{
				pageindex++;
				window.location.href="${basepath}/m/nmystudy/mycourse_page.xhtml?page="+pageindex+"&size="+pageSize+"&categoryid=${categoryid}&name=${name}";
			}
		 }
		 function upPage(){ 
			 if(pageindex == 1){
				 return;
			 }else{
				 pageindex--;
				window.location.href="${basepath}/m/nmystudy/mycourse_page.xhtml?page="+pageindex+"&size="+pageSize+"&categoryid=${categoryid}&name=${name}";
				 }
			}
		 function openDetail(courseId){
			 window.location.href="${basepath}/m/study/detail/"+courseId+".xhtml?fdomain=${current_domain}&v="+Math.random();
				
			 //window.open("${basepath}/m/study/detail/"+courseId+".xhtml?v="+Math.random());
		 }
		 
		//去掉右上角选项
	    document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
	    	WeixinJSBridge.call('hideOptionMenu');
	    });
		 
	</script>
    
</head>
<body>
    <div class = "container">
    	<%
			if("tlzb".equals(domain)){
		%>
			<c:if test="${categoryid eq 'f3da8e12-b9be-48cf-850e-cdf701fb28f9' }"><!-- 产品类 -->
			<img src="${basepath}/static/img/c_tlzb/c_cpl.jpg" width="100%"/>
			</c:if>
			<c:if test="${categoryid eq '77906514-6e02-42f0-adfb-8ca6d898c2cb' }"><!-- 销售技能类 -->
			<img src="${basepath}/static/img/c_tlzb/c_xsjn.jpg" width="100%"/>
			</c:if>
			<c:if test="${categoryid eq '4b6aa72d-39dd-42e1-b8a3-caa4c68f49e8'}"><!-- 管理类 -->
			<img src="${basepath}/static/img/c_tlzb/c_gll.png" width="100%"/>
			</c:if>
				
		<%		
			}
    	%>
    	<div class="searching">
    		<form action="#" method="post" onsubmit="search();return false;" >
        	<div>
            	<input id="name" value="${name}" type="search" placeholder="搜索" style="width: 277px; outline: none; z-index: 0;">
                <span onclick="search();"><img src="${basepath}/static/m_h5/img/glass.png" alt=""></span>
            </div>
            </form>
        </div>
        <ul class="courselist">
	        <c:if test="${empty rs.data }">
		        <div>
			        <h3 style="text-align:center;font-size:16px;font-weight:normal;color:#999;">没有找到相关课程</h3>
			    </div>
		   	</c:if>
         	<c:forEach items="${rs.data }" var="item">
	        	<li class="courseitem" onclick="javascript:openDetail('${item.id}');">
	                <img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${item.cover}<%=Constant.QINIU_COURSE_IMG_STYLE_320_180%>"  onerror="javascript:this.src='${basepath}/static/img/study/cover_c.png'"  style="cursor: pointer;">
	                 <span>${item.name}</span>    
	            </li>
	      </c:forEach>
	      <c:if test="${rs.pageable.totalPages>1}">
            <li class="cutpage">
               <div>
                   <a class="button" href="javascript:upPage();">上一页</a>
                   <a href="javascript:void(0);">${rs.pageable.pageNumber}/${rs.pageable.totalPages}</a>
                   <a class="button" href="javascript:downPage();">下一页</a>
               </div>
            </li>
           </c:if>
        </ul>
    </div>
    </body>
</html>