<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.longtime.ajy.mweb.MwebHelper"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<% 
 String domain=MwebHelper.getCurrentDomain();
%>
<!DOCTYPE html>
<html>
<head>
    <title>活动详情界面</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="${basepath}/static/css/320.css">
    <link rel="stylesheet" href="${basepath }/static/css/easydialog.css">
    <style type="text/css">
    .easyDialog_wrapper .easyDialog_title {
		height: 30px;
		line-height: 30px;
		overflow: hidden;
		color: #FCF7F7;
		padding: 0 10px;
		font-size: 14px;
		border-bottom: 1px solid #e5e5e5;
		background: #389CD5;
		border-radius: 4px 4px 0 0;
		}
    </style>
    <script type="text/javascript" src="${basepath }/static/js/easydialog.js"></script>
    <script type="text/javascript" src="${basepath }/static/js/formattime.js"></script>
    <link rel="stylesheet" type="text/css" href="http://developer.amap.com/Public/css/demo.Default.css" />   
    <script type="text/javascript" src="http://webapi.amap.com/maps?v=1.2&key= 8ec74296b8f76afc3a2219284c9a9e34"></script>
   
</head>
<body>
 <div id="iCenter" style="display:none;"></div> 
  <script type="text/javascript">
   $(function(){
	   $("body").bind("touchmove",function(){
		   if(window.top.location != window.location){
			   $("header",parent.document).css({"position":"fixed"});	
		   }
		 });
		  
		   

	   });
	var coordinate="${activity.coordinate}";
	var mapObj,toolBar,locationInfo; 
	var locationX;
	var locationY;
	var isShowMap = ${activity.mapShowInDetail}; 
	if(isShowMap=='1')
		{
			mapInit();			
		}
	//初始化地图对象，加载地图  
	function mapInit(){  
	  mapObj = new AMap.Map("iCenter");  
	  mapObj.plugin(["AMap.ToolBar"],function(){ 
		  var toolbarOptions={
				  autoPosition:true
				  }       
	      toolBar = new AMap.ToolBar(toolbarOptions); //设置地位标记为自定义标记  
	      mapObj.addControl(toolBar); 
	      AMap.event.addListener(toolBar,'location',function callback(e){   
	          locationInfo = e.lnglat;
	          locationX=locationInfo.lng+0.0065;
	          locationY=locationInfo.lat+0.0060;
	        });  
	  });  
	}     
	</script>  
    <section class="active-detail">
        <header>
            <h1 style="word-wrap:break-word;">${activity.name}</h1>
            <p class="activity-info">
                <span class="activity-meta no-extra">${ltfun:dateLongToStringFormat(activity.createDate,'yyyy-MM-dd')}</span>
                <span class="activity-meta">${activity.sponsor}</span>
            </p>
        </header>
        <div class="page-content">
            <div class="media" id="media">
                <img src="<%=Constant.IMG_SERVER_DOWNLOAD%>${activity.picUrl}-320x180">
            </div>
            <div class="text">
            	<div id="operation">
	                <c:if test="${activity.apply==1}">
						<c:if test="${empty record }">
							<c:if test="${activity.lastApplyDate >= currTime ||  activity.lastApplyDate == 0}">
							    <div class="baoming"  onclick="apply()">
				                    <span style="text-decoration: none"><span class="btnGreen">我要报名</span></span>
				                </div>
						    </c:if>
						    <c:if test="${activity.lastApplyDate < currTime && activity.lastApplyDate != 0}">
							    <div class="alert alert-success">
							        <strong>报名已结束</strong> 
							        <c:if test="${activity.signin == 1 }">未报名不能进行签到</c:if>
							     </div>
						    </c:if>
					    </c:if> 
					    <c:if test="${not  empty record }">
					    	<c:if test="${activity.signin == 1 }">
						    	<c:if test="${record.isSignin eq 1 }">
							    	<div class="alert alert-success">
								        <strong>已签到</strong> 欢迎参加
								     </div>
							    </c:if>
							    <c:if test="${record.isSignin eq 0 }">
							    	<div class="baoming"  onclick="signindialog()">
					                    <span style="text-decoration: none"><span class="btnGreen">我要签到</span></span>
					                </div>
						    	</c:if>
					    	</c:if>
					    	<c:if test="${activity.signin == 0 }">
					    		<div class="alert alert-success">
							        <strong>已报名</strong>
							     </div>
					    	</c:if>
					    	
			    		</c:if>
					</c:if>
					
					<c:if test="${activity.apply == 0 && activity.signin == 1}">
						<c:if test="${not  empty record }">
					    	<c:if test="${record.isSignin eq 1 }">
					    		<div class="alert alert-success">
							        <strong>已签到</strong> 欢迎参加
							     </div>
					    	</c:if>
					    	<c:if test="${record.isSignin eq 0 }">
						    	<div class="baoming"  onclick="signindialog()">
				                    <span style="text-decoration: none"><span class="btnGreen">我要签到</span></span>
				                </div>
					    	</c:if>
				    	</c:if>
				    	<c:if test="${empty record }">
				    		<div class="baoming"  onclick="signindialog()">
			                    <span style="text-decoration: none"><span class="btnGreen">我要签到</span></span>
			                </div>
						</c:if>
					</c:if>
				</div>
             
              <c:if test="${not empty activity.descript}"> 
                <p>
                	<strong>
	                	<c:if test="${domain eq '9zhz' }">欢迎词</c:if>
	                	<c:if test="${domain ne '9zhz' }">培训班介绍</c:if>
                	</strong>
                </p>
                <p id="adesc" style="word-wrap: break-word;">${activity.descript}</p>
              </c:if>
              
              <c:if test="${domain ne '9zhz' }">
                <p><strong>培训时间</strong></p>
                <p>${ltfun:dateLongToStringFormat(activity.startDate,'yyyy-MM-dd')}~${ltfun:dateLongToStringFormat(activity.endDate,'yyyy-MM-dd')}</p>
               </c:if> 
               
              <c:if test="${not empty activity.content }">
	              <c:if test="${activity.hasLimit == 0 }">
	              	<p><strong>培训内容</strong></p>
	                <div style="display:block;overflow:hidden;width:100%;">${activity.content}</div>
	              </c:if>
	              
	              <c:if test="${activity.hasLimit == 1 }">
	              	 <c:if test="${activity.signin == 1 }">
	              	 	<div id="acontent" ${not  empty record && record.isSignin == 1 ? '' :'style="display:none;"'}>
	                	 	<p><strong>培训内容</strong></p>
	                	 	<div style="display:block;overflow:hidden;width:100%;">${activity.content}</div>
	                	</div> 
	              	 </c:if>
	              	 <c:if test="${activity.signin == 0 }">
	              	 	<div id="acontent">
	                	 	<p><strong>培训内容</strong></p>
	                	 	<div style="display:block;overflow:hidden;width:100%;">${activity.content}</div>
	                	</div> 
	              	 </c:if>
	              </c:if>
              </c:if>
              
              <c:if test="${activity.mapShowInDetail eq 1 and not empty activity.coordinate }">
              	<input type="hidden" id='isshowmap' value="1"/>
              </c:if>
              <c:if test="${not empty activity.address}">
                <p><strong>培训地点<c:if test="${activity.mapShowInDetail eq 1 and not empty activity.coordinate }">&nbsp;&nbsp;<a href="${basepath}/m/ixin/activity/lookmap.xhtml?coordinate=${activity.coordinate}&id=${activity.id}">(点击查看地图)</a></c:if></strong></p>
                <p>${activity.address }</p>
              </c:if>
              
              <c:if test="${not empty activity.remark}"> 
                <p><strong>报名须知</strong></p>
                <p>${activity.remark}</p>
              </c:if>
              	
              	
              <div id="applyList" style="${(empty records || activity.apply ==0) ? 'display:none;' : ''}">	
                <p><strong >已报名人员<span id="replaycount">${fn:length(records)}</span></strong></p>
                <table id="table1"  style="text-align: center;">
                <tr>
                   <td width="86px">姓名</td>
                   <td width="100px">报名时间</td>
                   <td width="86px"  >是否签到</td>
           		</tr>
                <c:forEach items="${records}" var="record" varStatus="s">
	                <tr>
	                	<td width="86px">${record.userName}</td>
	                	<td width="100px">${ltfun:dateLongToStringFormat(record.applyDate,'yyyy-MM-dd')}</td>
	                	<td width="86px" id="${record.baseuid }"  >
	                		<c:if test="${record.isSignin eq 1 }"><i class="fa fa-check"></i></c:if>
	                	</td>
	                </tr>
                </c:forEach>
                </table>
               </div> 
              <p></p>
            </div>
        </div>
    </section>

<script type="text/javascript">
$(function(){
	if(window.top.location!=window.location){
		var orientationEvent;	
		var supportsOrientationChange = "onorientationchange" in window;
		var my_w=$("header",parent.document).width()-30;
		$(".active-detail").width(my_w);		
		orientationEvent = supportsOrientationChange ? "orientationchange" : "resize";   
		window.addEventListener(orientationEvent, function() {
			var my_w=$("header",parent.document).width()-30;
			$(".active-detail").width(my_w);
		}, false); 
	}
	
});

var startSignLocation="${activity.startSignLocation}";//是否开启位置签到 0不需要1需要
function apply(){
	  var v1 = "${user.name}";
	  var v2 = "${user.temporary_mobile}";
	  var v3 = "${user.unitinfo}";
      var domain="<%=domain%>";
	  if(null==v1){
		  v1="";
	  }
	  if(null==v2){
		  v2="";
	  }
	  if(null==v3){
		  v3="";
	  }
	  var html = [];
	  html.push('<div style="width:300px;height:130px;">');
		html.push('	<div class="form-group" id="">');
		html.push('		<input type="hidden" id="userId" value="">');
		html.push('		<lable style="font-size:18px; width:25%">姓名：</lable>');
		html.push('		<input type="text" name="userName" id="text-basic" style="width:75%;height:30px;" value="'+v1+'">');
		html.push('	</div>');
		html.push('	<div class="form-group"');
		if(domain=="ENN"){
		html.push(' style="display:none;"');
		}
		html.push(' id="" >');
		html.push('		<lable style="font-size:18px; width:25%">手机：</lable>');
		html.push('		<input type="tel" name="userMobile" id="tel" style="width:75%;height:30px;" value="'+v2+'">');
		html.push('	</div>');
		html.push('	<div class="form-group" id="">');
		html.push('		<lable style="font-size:18px; width:25%">单位：</lable>');
		html.push('		<input type="text" name="userCompany" style="width:75%;height:30px;" id="text-basic" value="'+v3+'">');
		html.push('	</div>');
		html.push("</div>");
		
		easyDialog.open({
			  container : {
			    header : '请输入个人信息',
			    content : html.join(''),
			    yesFn : btnFn,
			    noFn : true
			  }
			});
		  function btnFn(){
			  var userName = $("input[name='userName']").val();
			  var userMobile = $("input[name='userMobile']").val();
			  var userCompany = $("input[name='userCompany']").val();
			  var qcorder="${qcorder}";
			  $("input[name='userName']").css({"background-color":"#fff"});
			  $("input[name='userMobile']").css({"background-color":"#fff"});
			  $("input[name='userName']").css({"border-color":"#eaeaea"});
			  $("input[name='userMobile']").css({"border-color":"#eaeaea"});
			  // $("input[name='userCompany']").css({"background-color":"#fff"});
			  if($.trim(userName) == ""){
				  $("input[name='userName']").css({"border-color":"#F84534"});
				  return false;
			  }
			  /*
			  if($.trim(userMobile) == ""){
				  $("input[name='userMobile']").css({"border-color":"#F84534"});
				  return false;
			  }*/
			  $.ajax({
				  	type:"POST",
		       		url:"${basepath}/m/ixin/activity/saveixinuserinfo.json",
		       		data:{"mobile":userMobile,"name":userName,"company":userCompany},
		       		success:function(data){
		       			if(data == 1){
		       				$.ajax({
		    				  	type:"POST",
		    		       		url:"${basepath}/m/ixin/activity/apply.json",
		    		       		data:{"activityId": "${activity.id}","baseuid":"${uid}","name":userName},
		    		       		success:function(data){
		    		       			if(data == 0) {
		    		       				var date = new Date();
		    		       				$("#applyList").show();
		    		       				$("#replaycount").html(parseInt($("#replaycount").html())+1);
										$("#table1").append("<tr><td width='86px'>"+userName+"</td><td width='100px'>"+getFormatDateByLong(date, "yyyy-MM-dd")+"</td><td></td></tr>");				
		  				    	        opendialog('报名成功');
		  				    	        var signin = "${activity.signin}";
		  				    	        if(signin == 1){//需要签到
			  				    	        if(!qcorder){//不是二维码过来的
		  				    	        	var html = '<div class="baoming"  onclick="signindialog()"><span style="text-decoration: none"><span class="btnGreen">我要签到</span></span></div>';
			  			                    $("#operation").html(html);
			  				    	        }else{
			  				    	        	autosignin();
				  				    	        }
		  				    	        }else {
		  				    	        	var html = '<div class="alert alert-success"><strong>已报名</strong></div>';
			  			                    $("#operation").html(html);
		  				    	        }
				  				     } else if(data == 1) {
				  				    	 opendialog('报名失败，已截止报名');
				  				     } else {
				  				    	opendialog('报名失败，服务器访问失败');
				  				     }
		    		       		},
		    		       		error:function(data){
		    		       			opendialog('报名失败，服务器访问失败');
		    		       		}
		    		       	});
		       			} else {
		       				opendialog('报名失败，服务器访问失败');
		       			}
		       		},
		       		error:function(data){
		       			alert("error");
		       		}
		       	});
			
		  }
	}
  var searchComplete = function (results){
    if (transit.getStatus() != BMAP_STATUS_SUCCESS){
        return ;
    }
        var plan = results.getPlan(0);
        distance= plan.getDistance(true);             //获取距离
   }
	
	function signindialog(){
		if(startSignLocation==1){
		  var currentPosition=locationX+","+locationY;//当前位置
	       $.ajax({
	             type:"GET",
	             url:"${basepath}/m/ixin/activity/getdistance.json",
	             data:{"point":coordinate,"currentPoint":currentPosition},
	             success:function(data){
	                 if(data>2000){
                         alert("不在活动现场，无法签到");
		                 }else{
		                	 easyDialog.open({
		               	      container : {
		               	        content : '<label>请输入4位数的签到码</label><br><input type="text" id="code" style="width:100%;height:30px"/>',
		               	        yesFn : signin,
		               	        noFn : btnFn
		               	      }
		               	    });
			                 }
	             }
	           });
	}else{
		 easyDialog.open({
      	      container : {
      	        content : '<label>请输入4位数的签到码</label><br><input type="text" id="code" style="width:100%;height:30px"/>',
      	        yesFn : signin,
      	        noFn : btnFn
      	      }
      	    });
		}
	}
	var signin = function() {
		var code = $("#code").val();
		easyDialog.close();
		if(code == "${activity.signinCode}") {
			$.get("${basepath}/m/ixin/activity/signin.json", { "activityId": "${activity.id}", "openId": "${openId}", "code":code,"baseuid":"${uid}"},
					   function(data){
					     if(data) {
					    	 opendialog('签到成功');
					    	 $("#${uid}").html('<i class="fa fa-check"></i>');
					    	 var html = '<div class="alert alert-success"><strong>已签到</strong> 欢迎参加</div>';
				             $("#operation").html(html);
				             $("#acontent").show();
					     } else {
					    	 opendialog('签到失败');
					     }
					   });
		} else {
			alert("请输入正确的签到码");
			if (/ipad|iphone|mac/i.test(navigator.userAgent)){
				$("header",parent.document).css({"position":"absolute"});
				$(":focus").blur();
				}

		}
		
	};
	
	var btnFn = function(){
	    easyDialog.close();
	};
    
    function autosignin(){
    	$.get("${basepath}/m/ixin/activity/autosignin.json", { "activityId": "${activity.id}", "openId": "${openId}","baseuid":"${uid}"},
				   function(data){
				     if(data) {
				    	 $("#${uid}").html('<i class="fa fa-check"></i>');
				    	 var html = '<div class="alert alert-success"><strong>已签到</strong> 欢迎参加</div>';
			             $("#operation").html(html);
			             $("#acontent").show();
				     } else {
				    	 opendialog('签到失败');
				     }
				   });
        }



	
	function opendialog(text){
	    easyDialog.open({
	      container : {
	        content : '<span style="text-algin: center;text-align: center;display: block;font-size: 24px;">'+text+'</span>',
	        yesFn : btnFn,
	        noFn : false
	      }
	    });
	}
	
	$(document).ready(function(){
		var content=$("#adesc").html(); 
		content=content.replaceAll('\n','<br/>'); 
		  
		$("#adesc").html(content);
	});
	
	String.prototype.replaceAll  = function(s1,s2){   
		return this.replace(new RegExp(s1,"gm"),s2);   
	}

	//微信图片放大
	var defaultGid = 0;
	var defaultIndex = 0;

	var imgDate = {};//二位数组，保持图片的组别，顺序和地址信息
	var imgs = document.getElementsByTagName("img");
	for ( var i = 0; i < imgs.length; i++) {
		var img = imgs[i];
		var index = img.getAttribute("data-index");//存放索引
		var gid = img.getAttribute("data-gid");//组号 data-gid 存放组号
		var dsrc = img.getAttribute("data-src");//地址
		if (index && gid && dsrc) {
			imgDate[gid] = imgDate[gid] || []; //该组不存在则创建
			imgDate[gid][index] = dsrc;//按照索引设置地址
		}else{
			//默认的组

			dsrc = img.getAttribute("data-src");
			if(!dsrc){
				dsrc=img.getAttribute("src");
			}

			img.setAttribute("data-index",defaultIndex);

			imgDate[defaultGid]=imgDate[defaultGid]||[];
			imgDate[defaultGid][defaultIndex]= dsrc;
			img.onclick = function () {
				preViewImg4Doc(defaultGid, this.getAttribute("data-index"));
			};
			defaultIndex = defaultIndex+1;
		}
	}

	//点击图片时调用，groupid组号，index索引号
	function preViewImg4Doc(groupid, index) {
		var wxJSbridge = window.WeixinJSBridge
				|| parent.window.WeixinJSBridge;
		if (typeof wxJSbridge != 'undefined') {
			wxJSbridge.invoke('imagePreview', {
				'current' : imgDate[groupid][index],//当前地址
				'urls' : imgDate[groupid] //组
			});
		} else {
			//alert("请在微信中查看", null, function(){});
			console.log(groupid + " " + index);
		}
	}

</script>


</body>
</html>