<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="format-detection" content="telephone=no" />
     
    <link rel="stylesheet"	href="${basepath}/static/plugins/font-awesome-4.1.0/css/font-awesome.min.css" />
	<link rel="stylesheet" href="${basepath}/static/m_h5/css/common.css">
	<link rel="stylesheet" href="${basepath}/static/m_h5/css/color.css">
	<title>${user.name }的作业</title>
</head>

<body> 
    
<header class="ctl_header">
	<div class="back"><a href="javascript:history.go(-1);"><i class="fa fa-angle-left"></i></a></div>
       ${user.name }的作业
	</header>
    <article class="zuoye ctl_cont">
    	<section class="zuoyeList" id="tasks"> 
    	
        </section>
        
      	<section class="more" style="padding-bottom:60px;" id="toload">
    		<a href="javascript:void(0);" onclick="next();">点击加载更多</a>
    	</section>
    
 		<section class="loading" id="loading" style="padding: 25px 55px 45px;">
			<i class="fa fa-spinner fa-spin"></i>
		</section>
		<section id="placeholder" class="more" style="display: none;"></section>
       	<div class="placeHolder" style="height:50px;width:100px;"></div>
    </article>
   
    <script type="text/javascript">
    var pagenumber = 1;//当前页
    var pagesize = 10;//总页数 
    var taskTotal = 0;//总数
    var currentNum = 0;//已显示数 
    $(function(){   
    	loadList();  
    }) 
    //下一页
    function next(){
    	pagenumber ++;
    	loadList();	
    }
    //问题列表
    function loadList(){
    	$("#loading").show();  //正在加载
    	$("#toload").hide();  //加载更多

    	$.ajax({
    		type : "GET",
    		url : "${basepath}/m/h5/task/tasklist.json",
    		cache:false,
    		data : { 
    			page : pagenumber,
    			size : pagesize
    		},
    		success : function(data) { 
    			taskTotal = data.pageable.total;   
    			if(taskTotal > 0 ){
    				var tasks = data.data;
    				currentNum += tasks.length;
    				var html = [];
    				for ( var i = 0; i < tasks.length; i++) {
    					var task = tasks[i];
    					html.push('<a href="javascript:void(0);" onclick="indetail(\'' + task.id +'\');")>');
    					html.push('<ul>');
    					html.push('<li>' + task.taskname );
    					if(task.status == 2 || task.status == 3){
    						html.push('<span>得分:' + task.score + '</span>');
            			}
    					html.push('</li>');
    					html.push('<li>时间：' + new Date(task.begintime).Format("yyyy-MM-dd hh:mm") + ' ~ ' +  new Date(task.endtime).Format("yyyy-MM-dd hh:mm"));
    					if(task.status == 2){//未通过
	    					html.push('<span class="a">未通过</span>');
        				}else if(task.status == 3){
	    					html.push('<span class="b">通过</span>');
            			}else if(task.status == 0){
	    					html.push('<span>未提交</span>');
               			}else if(task.status == 1){
	    					html.push('<span class="c">未批改</span>');
               			}
    					html.push('</li>');
    					html.push('</ul>'); 
    					html.push('</a>');
    				}
    				$("#tasks").html($("#tasks").html() + html.join(""))//加载
    				if (taskTotal == currentNum) {
    					$("#toload").hide();
    					$("#placeholder").show();
    				} else {
    					$("#toload").show();
    				}
    			}else{				
    				var html = [];
    					html.push('<article class="scroll">');
    					html.push('<section class="noData">');
    					html.push('<img src="${basepath }/static/img/noData.png" />');
    					html.push('</section>');
    					html.push(' </article>');
    				$("#tasks").html( html.join(""))//加载
    				$("#toload").hide();
    			}
    			$("#loading").hide();
    		},
    		error : function() {
    		}
    	});
    }

	 //用户作业的详情
    function indetail(id){
    	window.location.href="${basepath}/m/h5/task/detail.xhtml?id="+id;
    }
    </script>
    
   	<style type="text/css">
    	body{background:#f8f8f8;}
    </style> 
</body>
</html>
