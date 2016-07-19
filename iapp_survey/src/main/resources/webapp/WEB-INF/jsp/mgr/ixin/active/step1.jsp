<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<%@page language="java" import="com.longtime.app.config.Constants"%>
<!DOCTYPE html>
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>编辑活动</title>
<meta name="menu_path" content="active.menu_activity" />
 <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<script src="${basepath }/static/ixin/js/jquery.uploadify.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${basepath }/static/ixin/css/uploadify.css">
<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
  <link rel="stylesheet" href="${basepath}/static/public/easydialog-v2.0/easydialog.css">
  <link rel="stylesheet" href="${basepath}/static/css/active.css">
  <link rel="stylesheet" media="screen" href="${basepath}/static/ixin/css/appmsg_editor.css" type="text/css">
  <link rel="stylesheet" type="text/css" href="${basepath}/static/plugins/bootstrap-switch-master/docs/bootstrap-switch.css">
  <script src="${basepath}/static/public/easydialog-v2.0/easydialog.min.js"></script>
  <script src="${basepath}/static/js/activity/active.js"></script>
  <script type="text/javascript"  src="${basepath }/static/public/My97DatePicker/WdatePicker.js"></script>
  <script type="text/javascript" src="${basepath }/static/ixin/plugin/ueditor1_3_6-utf8-jsp/ueditor.config.js"></script>
  <script type="text/javascript" src="${basepath }/static/ixin/plugin/ueditor1_3_6-utf8-jsp/ueditor.all.min.js"></script>
  <script type="text/javascript" src="${basepath}/static/plugins/bootstrap-switch-master/docs/bootstrap-switch.js" ></script>
  <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=OaZUVZtADX1RBUiVMD5GsQ9Q"></script>
  <script type="text/javascript">
$(document).ready(function(){
	$('#file_upload').uploadify({
		    'formData'  : {
			'token': '${uptoken}',
		},
		'fileObjName'  : 'file',
		'swf'      : basepath+'/static/ixin/css/uploadify.swf',
		//'uploader' : 'http://up.qiniu.com/',
		'uploader' : uploadurl,
		'buttonText':'<i class="fa fa-upload"></i>&nbsp;上传封面',
		'onUploadSuccess' : function(file,data,response){
			var result = eval("("+data+")");
			var path=$("#path").val()+result.hash;
			$("#active-poster").attr("src",path);
			$("#cover").val(result.hash);
		}
	});
});

function resizeheightforedite(o){
    $(".edite-img").height($(o).height());
    $(".edite-img").attr("style","margin-top:-"+$(o).height()+"px;height:"+$(o).height()+"px;line-height:"+$(o).height()+"px;");
}
function showother(){
    $(".othermsg").slideToggle("fast");
    $(".moremsg").slideToggle("fast");
    $(".moremsg-up").slideToggle("fast");
}
</script>
</head>
<body>

       <!-- BEGIN PAGE HEADER-->
         <div class="row" >
            <div class="col-md-12">
               <!-- BEGIN PAGE TITLE & BREADCRUMB-->
               <ul class="page-breadcrumb breadcrumb">
				<li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
				<li><span >活动管理</span></li>
				</ul>
               <!-- END PAGE TITLE & BREADCRUMB-->
            </div>
         </div>
         <!-- END PAGE HEADER-->
		<div class="col-md-12">
			<!-- BEGIN VALIDATION STATES-->
			<div class="portlet box green">
				<div class="portlet-title">
					<div class="caption">
						<i class="fa fa-bookmark-o"></i><span>基本信息</span>
					</div>
				</div>
				<div class="portlet-body form box_box">
					<div class="col-md-12" id="course_info">
						      <ul class="stemp-box">
                <li class="tep-left">
                    <img src="${basepath}/static/img/step-left.png" >
                </li>
                <li class="current-step" onclick="next1('${id}');">
                    1
                </li>
                <li class="step-xian${stepStatus['2'] ?'-lv':'' }"></li>
                <li class="${stepStatus['2'] ?'over':'nor' }-step" onclick="next2('${id}');">
                    2
                </li>
                <li class="step-xian${stepStatus['3'] ?'-lv':'' }"></li>
                <li class="${stepStatus['3'] ?'over':'nor' }-step" onclick="next3('${id}');">
                    3
                </li>
                <li class="step-xian${stepStatus['4'] ?'-lv':'' }"></li>
                <li class="${stepStatus['4'] ?'over':'nor' }-step" onclick="next4('${id}');">
                    4
                </li>
                <li class="step-xian${stepStatus['5'] ?'-lv':'' }"></li>
                <li class="${stepStatus['5'] ?'over':'nor' }-step" onclick="next5('${id}');">
                    5
                </li>
                 <li class="tep-right">
			           <img src="${basepath}/static/img/step-right${stepStatus['all'] ?'-over':'' }.png">
			     </li>
            </ul>
            <div class="preview-style">
                <div class="form-group">
                    <label for="active-name">活动名称</label>
                    <input type="hidden" id="hid_id" name="hid_id" value="${activity.id}"> 
                    <input type="text" value="${activity.name}" class="form-control" id="active-name" placeholder="活动名称">
                </div>
                <div  class="active-poster">
                    <c:if test="${empty activity.picUrl}">


                    <img src="${basepath}/static/img/activity_default.jpg" id="active-poster" class="img-responsive"  style="width:320px;height:180px;">

                    </c:if>
                    <c:if test="${not empty activity.picUrl}">
                    <img src="<%=Constants.IMG_SERVER_DOWNLOAD%>${activity.picUrl}" id="active-poster" class="img-responsive" style="width:320px;height:180px;">
                    </c:if>
                    <!-- <div class="edite-img myhide" style="display:none;"><i class="glyphicon glyphicon-pencil"></i>&nbsp;点击更换</div>-->
                    <input id="file_upload" class="form-control" name="file_upload"  type="file" >
                    <input id="cover" type="hidden" name="cover" value="">
                    <input id="path" type="hidden" name="path" value="<%=Constants.IMG_SERVER_DOWNLOAD%>">
                </div>
                <div class="form-group">
                    <label for="active-synopsis">活动简介</label>
                    <textarea class="form-control"  id="active-synopsis" style="resize: none" placeholder="活动简介">${activity.desc}</textarea>
                </div>
                
                <div class="form-group">
                <label for="active-synopsis">是否公开(公开后无需授权，所有人可参加)</label>
                 <div class="switch" >
                    <c:if test="${activity.isopen eq 1 }">
                     <input type="checkbox" checked id="myswitch2" value="1"  />
                     </c:if>
                     <c:if test="${activity.isopen eq 0 }">
                      <input type="checkbox" id="myswitch2" value="0"  />
                     </c:if>
                     <c:if test="${empty activity.isopen }">
                      <input type="checkbox" checked id="myswitch2" value="1"  />
                     </c:if>
                 </div>
                </div>
                
                
                
                <div class="form-group">
                    <span class="moremsg" onclick="showother()">展开并补全更多信息&nbsp;<i class="glyphicon glyphicon-chevron-down"></i></span>
                </div>
                <div class="othermsg" style="display: none">
                    <div class="form-group">
                        <label for="active-synopsis">开始时间</label>
                        <c:if test="${empty activity.startDate}">
                          <input type="text"  class="form-control"  id="active-starttime" name="active-starttime"  
                            onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',minDate:'%y-%M-%d %H:%m'})" class="form-control Wdate"/>
                        </c:if>
                        <c:if test="${not empty activity.startDate}">
                        	<c:if test="${activity.startDate eq 0}">
                          		<input type="text"  class="form-control"  id="active-starttime" name="active-starttime"  
                            	onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',minDate:'%y-%M-%d %H:%m'})" class="form-control Wdate"/>
                        	</c:if>
                        	<c:if test="${activity.startDate ne 0}">
                          		<input type="text"  class="form-control"  id="active-starttime" name="active-starttime" value='<d:formatDate format="yyyy-MM-dd HH:mm" currentTime="${activity.startDate }"/>' 
                            	onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',minDate:'%y-%M-%d %H:%m'})" class="form-control Wdate"/>
                        	</c:if>
                        </c:if>
                    </div>
                    <div class="form-group">
                        <label for="active-synopsis">结束时间</label>
                        <c:if test="${empty activity.endDate}">
                         <input type="text"  class="form-control"  id="active-endtime" name="active-endtime"   
                            onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',minDate:'%y-%M-%d %H:%m'})" class="form-control Wdate"/>
                    	</c:if>
                        <c:if test="${not empty activity.endDate}">
                        	<c:if test="${activity.endDate eq 0}">
                         		<input type="text"  class="form-control"  id="active-endtime" name="active-endtime" 
                           		onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',minDate:'%y-%M-%d %H:%m'})" class="form-control Wdate"/>
                    		</c:if>
                        	<c:if test="${activity.endDate ne 0}">
                         		<input type="text"  class="form-control"  id="active-endtime" name="active-endtime" value='<d:formatDate format="yyyy-MM-dd HH:mm" currentTime="${activity.endDate}"/>'  
                           		onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',minDate:'%y-%M-%d %H:%m'})" class="form-control Wdate"/>
                    		</c:if>
                    	</c:if>
                    </div>
                    <div class="form-group">
                        <label for="active-synopsis">主办方</label>
                        <input class="form-control" id="active-user" placeholder="主办方" value="${activity.sponsor}">
                    </div>
                    <div class="form-group">
                        <label for="active-synopsis">活动地址</label>
                        <input class="form-control" id="active-address" placeholder="活动地址" value="${activity.address}">
                    </div>
                    
                    <div class="form-group" >
                     <label class="active-synopsis" >是否在详情页显示地图</label>
                     <c:if test="${activity.mapShowInDetail eq 0 }">	
                     <div class="switch " >
                     <input type="checkbox"  id="myswitch" value="0"  />
                     </div>
                     </c:if>
                     
                     <c:if test="${activity.mapShowInDetail eq 1 }">
                      <div class="switch " >
                     <input type="checkbox" checked  id="myswitch" value="1"  />
                     </div>
                     </c:if>
                     
                     <c:if test="${empty activity.mapShowInDetail}">
                       <div class="switch " >
                     <input type="checkbox"   id="myswitch" value="0"  />
                     </div>
                     </c:if>
                     <a href="#" onclick="lookMap();">查看地图</a>
				    </div>
                    <div class="form-group" id="con_keywords">
                        <label for="active-synopsis">关键词</label>
                        <input class="form-control" id="active-key" placeholder="关键词" value="${activity.findKeys}">
						<span id="tip_findKeys" for="findKeys" class="help-block " style=""></span>
						
                    </div>
                    <div class="form-group" id="con_keywords">
                        <input class="form-control" id="active-has-limit" name="hasLimit" type="checkbox" value="1" ${activity.hasLimit == 1 ?'checked="checked"' : '' }>
						<label for="active-has-limit">活动内容签到后可见（活动需要签到时有效）</label>
						
                    </div>
                    
                    <div class="form-group">
                        <label for="active-synopsis">活动内容</label>
                        <textarea name="content" id="active-content"  style="border: #f8f8f8;background-color: #f8f8f8;">${activity.content}</textarea>
                    </div>
                    <div class="form-group">
                        <span class="moremsg-up" onclick="showother()" style="display: none">收起补充内容&nbsp;<i class="glyphicon glyphicon-chevron-up"></i></span>
                    </div>
                </div>
                <div class="form-group" style="text-align: right">
                    <input type="hidden" id="hid_findkey" name="hid_findkey" value="${activity.findKeys}">
                    <input type="hidden" id="hid_coordinate" name="hid_coordinate" value="${activity.coordinate}">
                    <span class="btn btn-success" onclick="add();"><i class="glyphicon glyphicon-floppy-save"></i>&nbsp;&nbsp;保存并下一步</span>
                    <!-- <span class="btn btn-success" onclick="next2();">下一步&nbsp;&nbsp;<i class="glyphicon glyphicon-arrow-right"></i></span> -->
                </div>
            </div>
					</div>
					
			</div>
		</div>

	</div>
	 <div class="easyDialog_wrapper" id="easyDialogWrapper" style="width: 667px;">
            <div class="easyDialog_content" style="height: 450px;">
                <h4 class="easyDialog_title" id="easyDialogTitle">
                    <a href="javascript:void(0)" title="关闭窗口" class="close_btn" onclick="closeBtn();">&times;</a>
                    <span id="dialogtitle"></span>
                </h4>
                <div class="easyDialog_text" style="display: block;overflow: hidden;width: 660px;height: 320px;overflow-x: hidden;overflow-y: auto;">
                    <input type="text" id="searchAddress" name="searchAddress"  class="form-control" style="width:200px;float:left;margin-top:-10px;margin-bottom:10px;"/><span class="btn btn-success" style="margin-top:-10px;margin-bottom:10px;"onclick="searchBtn();" >搜索</span>
                    <div id="activity-box" class="activity-box" style="position: absolute;width: 650px;height: 320px;overflow-x: hidden;overflow-y: auto;">
                      
                    </div>
                </div>
                <div class="easyDialog_footer" style="position: absolute;margin-top: 60px;width: 90%;">
                    <button class="btn_normal" id="cancel" >取消</button>
                    <button class="btn_highlight" id="easyDialogYesBtn">确定</button>
                </div>
            </div>
        </div>
	<!-- 弹出层显示树状结构的部门 -->
	<script type="text/javascript">
	var editor = UE.getEditor('active-content');
    $(document).ready(function(){
    $("#myswitch").bootstrapSwitch({
			onText:"显示",
			offText:"不显示"
			});

    $("#myswitch2").bootstrapSwitch({
		onText:"公开",
		offText:"不公开"
		});


	
	var cover="${activity.picUrl}";
	if(cover=="" || cover==null){
//	$("#cover").val("default/activity_default.jpg"); 
	$("#cover").val(""); 
	}else{
		$("#cover").val(cover);
	}

    $("#cancel").click(function(){
    	  marker="";
          lng="";
          lat="";
    	  easyDialog.close(); 
        });
    $("#easyDialogYesBtn").click(function(){
          var coordinate=lng+","+lat;
          $("#hid_coordinate").val(coordinate);
          marker="";
          lng="";
          lat="";
          easyDialog.close();
        });

    $("#myswitch").on('switchChange.bootstrapSwitch', function(event, state) {
		if(state.value){
			$(this).val('1');
		} else {
			$(this).val('0');
		}
	});

    $("#myswitch2").on('switchChange.bootstrapSwitch', function(event, state) {
		if(state.value){
			$(this).val('1');
		} else {
			$(this).val('0');
		}
	});


	
	
 });

  function closeBtn(){
 	   marker="";
       lng="";
       lat="";
   	  easyDialog.close(); 
        }
 </script>
 <script type="text/javascript">
 var myCity=new BMap.LocalCity();
 myCity.get(myFun);
 var cityName="";
 var marker="";
 var lng="";
 var lat="";
 //得到城市名称
 function myFun(result){
     cityName = result.name;
 }

 //city 所查的城市 ,map 地图实例
 function initMap(map){
     map.enableScrollWheelZoom();//使用鼠标滚轮将地图放大缩小
     map.addControl(new BMap.NavigationControl());  //添加默认缩放平移控件
     map.addControl(new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_RIGHT, type: BMAP_NAVIGATION_CONTROL_SMALL}));  //右上角，仅包含平移和缩放按钮
     map.addControl(new BMap.NavigationControl({anchor: BMAP_ANCHOR_BOTTOM_LEFT, type: BMAP_NAVIGATION_CONTROL_PAN}));  //左下角，仅包含平移按钮
     map.addControl(new BMap.NavigationControl({anchor: BMAP_ANCHOR_BOTTOM_RIGHT, type: BMAP_NAVIGATION_CONTROL_ZOOM}));  //右下角，仅包含缩放按钮
 }
 //解析地址   addressName 地址的名称  city 搜索的是哪个城市,map 地图实例
 function explainAddress(addressName,city,map){
     var myGeo=new BMap.Geocoder();
     myGeo.getPoint(addressName,function(point){
         if(point){
             lng=point.lng;
             lat=point.lat;
             map.centerAndZoom(point,16);
             map.panTo(point);
             marker = new BMap.Marker(point); 
             marker.enableDragging();         // 创建标注
             map.addOverlay(marker);
             markerListener(marker);
             mapListener(map);
         } else{
             alert("没有找到该地址,请重新填写地址");
         }
     },city);
 }
 //为标注添加点击事件
 function markerListener(marker){
     marker.addEventListener("dragend", function(e){
         lng=e.point.lng;
         lat=e.point.lat;
     });
 }
 function lookMap(){
     var address=$.trim($("#active-address").val());//得到地址
     if(address==null || address==""){
         alert("请先填写活动地址");
         return;
         }
     easyDialog.open({
         container:"easyDialogWrapper",
         fixed:true
     });
     var coordinate=$("#hid_coordinate").val();
     if(coordinate!=null && coordinate!=""){
    	 var map=new BMap.Map("activity-box");
    	 initMap(map);
         var zb=coordinate.split(",");
         var point2=new BMap.Point(zb[0],zb[1]);
         map.centerAndZoom(point2,16);
         map.panTo(point2);
         lng=point2.lng;
         lat=point2.lat;
         marker = new BMap.Marker(point2); 
         marker.enableDragging();         // 创建标注
         map.addOverlay(marker);
         markerListener(marker);
         mapListener(map);
     }else{
        var map2=new BMap.Map("activity-box");
        initMap(map2);
        explainAddress(address,cityName,map2);
     }
 }

 function mapListener(map){
   map.addEventListener("click",function(e){
	    map.removeOverlay(marker);
	    marker = new BMap.Marker(e.point); 
	    marker.enableDragging();         // 创建标注
	    map.addOverlay(marker);
        markerListener(marker);
	    lng=e.point.lng;
	    lat=e.point.lat;
	});
 }
 //将坐标转换成地址 lng 经度 lat 纬度
 /*function pointToaddress(lng,lat){
     var myGeo = new BMap.Geocoder();
    // 根据坐标得到地址描述
     myGeo.getLocation(new BMap.Point(lng,lat), function(result){
         if (result){
             explainAddress(result.address,cityName,map);
         }else{
             alert("该地址不存在");
         }
     });
 }*/
 function searchBtn(){
	  var address=$("#searchAddress").val();
	  if(address==null || address==""){
		  alert("还没有填写搜索地址");
		  return;
	  }
	  $("#activity-box").html("");
	  var map=new BMap.Map("activity-box");
	  initMap(map);
      explainAddress(address,cityName,map);
	  $("#searchAddress").val("");
	 }
 

 </script>
</body>
</html>
