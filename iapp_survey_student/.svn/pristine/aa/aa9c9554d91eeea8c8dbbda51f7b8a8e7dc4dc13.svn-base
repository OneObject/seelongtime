<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<! DOCTYPE html >
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="format-detection" content="telephone=no" />
    
    <link rel="stylesheet"  href="${basepath}/static/plugins/font-awesome-4.1.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="${basepath}/static/m_h5/css/common.css" >
     <link rel="stylesheet" href="${basepath}/static/m_h5/css/NewSurvey.css" >
    <link rel="stylesheet" href="${basepath}/static/m_h5/css/color.css" >
	<title>调研</title>
    <style type="text/css">
		.survey section.subing span{color:#999;border-color:#999;}
    </style>
    <script type="text/javascript">
    	var basepath='${basepath}';
    	var surveyid='${survey.id}'
    </script>
</head>
<body>
    <article class="survey">
    	
        <section class="infoBox">
        	<ul>
            	<li>${survey.title }</li>
                <li>参与时间：2014-06-11 11:00&nbsp;~&nbsp;2014-08-11 11:00</li>
                <li>${survey.remark}</li>
            </ul>
        </section>
            <div id="mycontainer" >  <!--放题目的容器 -->
            
            	
				
            </div> 
       
    </article> 
    <input type="hidden" id="pagenum" vaule="${survey.page_num}"> 
    <footer class="ctl_footer"></footer>
 	<script type="text/javascript" src="${basepath}/static/m_h5/js/jquery-2.1.1.min.js"></script>
 	<script type="text/javascript" src="${basepath}/static/m_h5/js/common.js"></script>
    <script type="text/javascript">
    	$(function(){
    		toPage();
			var orientationEvent;
			var supportsOrientationChange = "onorientationchange" in window;	  
			orientationEvent = supportsOrientationChange ? "orientationchange" : "resize";   
			window.addEventListener(orientationEvent, function() {

			}, false); 
			//setPageProgress();
			
			//单选题
			$("dl.sel_dan dd").click(function(event){
				var $op=$("span.select",this);
				if($op.is(".dan")){
					$op.removeClass("dan");	
					$op.find(":radio").attr("checked",false);		
					}else{
						$op.addClass("dan").closest("dd").siblings("dd").find("span.select").removeClass("dan").find(":radio").attr("checked",false);	
						$op.find(":radio").attr("checked",true);
						}
						event.stopPropagation();		
				});
			//多选题
			$("dl.sel_duo dd").click(function(event){
				var $op=$("span.select",this);
				if($op.is(".duo")){
					$op.removeClass("duo");	
					$op.find(":checkbox").attr("checked",false);		
					}else{
						$op.addClass("duo").find(":checkbox").attr("checked",true);	
						}
						event.stopPropagation();		
				});
			$("dl.sel_dan dd > input,dl.sel_duo dd > input").click(function(event){
					event.stopPropagation();
				});
			//文本域自适应高度		
			$("dl textarea").bind("propertychange input",function(){
					this.style.height=this.scrollHeight+'px';
				});			
			//新打分题	
			$("dl.dafen li.star span").bind("click",function(event){
				var init = parseInt($(this).closest(".dafen").attr("fen"));				
				var fen,html;
				var temp = $(this).closest("dd");
				$(this).addClass("cur").prevAll("span").addClass("cur").end().nextAll("span").removeClass("cur");
				fen = temp.find("span.cur").length + init -1;
				html = "<label class='fen'>"+fen+"分</label>";
				temp.find("label.fen").remove().end().prepend(html);
				});
			//矩阵单选题
			$("dl.jzdanxuan ul li").click(function(event){
				var $op=$("span.select",this);
				if($op.is(".dan")){
					$op.removeClass("dan");	
					$op.find(":radio").attr("checked",false);		
					}else{
						$op.addClass("dan").closest("li").siblings("li").find("span.select").removeClass("dan").find(":radio").attr("checked",false);	
						$op.find(":radio").attr("checked",true);
						}
						event.stopPropagation();		
				});	
				
			//矩阵多选题
			$("dl.jzduoxuan ul li").click(function(event){
				var $op=$("span.select",this);
				if($op.is(".duo")){
					$op.removeClass("duo");	
					$op.find(":checkbox").attr("checked",false);		
					}else{
						$op.addClass("duo").find(":checkbox").attr("checked",true);	
						}
						event.stopPropagation();		
				});
			//ios文本框获得焦点时，fixed bug
			if (/ipad|iphone/i.test(navigator.userAgent)){
				$("dd textarea").focus(function(){
					$("header").css({"position":"absolute"});			
					});
				$("dd textarea").blur(function(){
					$("header").css({"position":"fixed"});			
					});
			}			
			
			//文本域获得焦点时，安卓手机页面重新定位				
			if (/android/i.test(navigator.userAgent)){
				var judge=isWeiXin();	
				if(!judge){
					$("html,body").css({"width":"100%","height":"100%","overflow":"scroll"});
					$("article.survey section.submit").css({"padding-bottom":"60px"});
					$("textarea,dl.sel_dan dd > input,dl.sel_duo dd > input").bind("focus",function(event){
					var h=$(this).offset().top-80;
					$("html,body").animate({scrollTop:h},1000);
					event.stopPropagation();
					});	
					}else{
						//微信，重定位 未测试
						$("textarea,dl.sel_dan dd > input,dl.sel_duo dd > input").bind("focus",function(event){
						var h=$(this).offset().top-60;
						$("html,body").animate({scrollTop:h},1000);
						event.stopPropagation();	
						});		
						}	
				}						
			});	
		//上一页下一页的跳转  只有下一页的时候才会会提交数据
		function toPage(page,isNext){
			if(isNaN(page)){
				page = 1;
			}
			if(isNext){
				submitSurvey();//提交本页调研
			}
			$("#mycontainer").load("${basepath}/m/h5/newsurvey/questionlist.list?page="+page+"&surveyid=${survey.id}");
		}
			
		function isWeiXin(){
			var ua = window.navigator.userAgent.toLowerCase();
			if(ua.match(/MicroMessenger/i) == 'micromessenger'){
				return true;
			}else{
				return false;
			}
		}
		function submitSurvey(){
			var questions = $("#pagenum").prevAll("dl");
			var _data = new Object();
			for(var i =0 ;i<questions.length;i++){
				var qtype,qid,selectoid,exts,answer;
				qtype = $(questions[i]).attr("qtype");
				qid =  $(questions[i]).attr("data");
				switch(qtype){
				case 'danxuan':
					selectoid = $(questions[i]).find(".dan").find(":radio").attr("value");
					if($("#"+selectoid+"_input").length){
						exts = $("#"+selectoid+"_input").val();
						if(typeof(exts)=='undefined'){
								exts='';
							}
						selectoid = selectoid+","+exts;
						}
					alert(selectoid);
					_data[qid]=selectoid;
					break;
				case 'duoxuan':
					var selectoptions =$(questions[i]).find(".duo").find(":checked");
					var allselectedid = '';
					
					for(var j=0;j<selectoptions.length;j++){
						selectoid='';
						selectoid = $(selectoptions[j]).val();
						if($("#"+selectoid+"_input").length){
							exts = $("#"+selectoid+"_input").val();
							selectoid = selectoid+","+exts;
							}
						allselectedid = allselectedid+selectoid+'_';
						}
					_data[qid]=allselectedid;
					break;
				case 'dafen':
					var selectfen = "";
					var opts = $(questions[i]).find("dl");
					for(var j=0;j<opts.length;j++){
						var oidA = $(opts[j]).find("ul");
						var fenA = $(opts[j]).find(".fen");
						var oid =  $(oidA[0]).attr("data");
						var fen =  $(fenA[0]).attr("data");
						if(typeof(fen)=="undefined"){
								continue;
							}
						selectfen= selectfen+oid+","+fen+"_";
					}
					alert(selectfen);
					_data[qid]=selectfen;
					break;
				case 'wenda':
					var id ="#"+qid;
					if($(id).length){
						answer=$(id).val();
					}
					_data[qid]=answer;
					break;
				case 'jzdanxuan':
					var selection = new Object();
					var checkes = $(questions[i]).find("input:radio:checked");
					for(var j=0;j<checkes.length;j++){
						var cid =  $(checkes[j]).val();
						var oid = cid.split(",");
						selection[oid[0]]=oid[1]; 
					}
					_data[qid]=selection;
					break;
				case 'jzduoxuan':
					var selection = new Object();
					var checkes = $(questions[i]).find("input:checkbox:checked");
					for(var j=0;j<checkes.length;j++){
						var cid =  $(checkes[j]).val();
						var oid = cid.split(",");
						if(typeof(selection[oid[0]])=='undefined') {
							selection[oid[0]]=oid[1];
						}else{
							selection[oid[0]] = selection[oid[0]]+","+oid[1];
						}
					}
					_data[qid]=selection;
					break;
				}//switch end
			}//for end
			console.log(_data);
			$.ajax({
					type:"POST",
					url:basepath+"/m/h5/newsurvey/saveanswer.json",
					data:{"surveyid":surveyid,"answer":JSON.stringify(_data)},
					success:function(data){
						
					},error:function(data){
						
					}
				});
		}
    </script>
</body>
</html>
