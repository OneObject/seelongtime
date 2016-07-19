<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>活动地址</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <style type="text/css">
        html{height:100%}
        body{height:100%;margin:0px;padding:0px}
        #container{height:90%}
        .footer{
        height:48px;
        border-top:1px solid #ccc;
        }
        .footer>a{
        display: block;
        line-height: 48px;
        text-align: left;
        font-size: 32px;
        padding-left: 10px;
        }
    </style>
    <script type="text/javascript" src="${basepath }/static/js/easydialog.js"></script>
    <script type="text/javascript">
	function backBtn(id){
         location.href=basepath+"/m/ixin/activity/back.xhtml?id="+id;
		}
   </script>
</head>
<body >
<div id="container" ></div>
<div class="footer">
<a href="javascript:backBtn('${id}')"><i class="fa fa-angle-left"></i></a>
</div>
<!-- <div><span class="btn btn-success" style="margin-left:80%;margin-top:5px;" onclick="backBtn('${id}')">返回</span></div> -->
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=OaZUVZtADX1RBUiVMD5GsQ9Q"></script>
<script>
var map=new BMap.Map("container");
var myCity=new BMap.LocalCity();
 myCity.get(myFun);
var cityName;
var marker;
var coordinate="${coordinate}";
lookMap();
//得到城市名称
function myFun(result){
    cityName = result.name;
}
//city 所查的城市 ,map 地图实例
function initMap(city,map){
    map.enableScrollWheelZoom();//使用鼠标滚轮将地图放大缩小
    map.centerAndZoom(city);
    map.addControl(new BMap.NavigationControl());  //添加默认缩放平移控件
    map.addControl(new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_RIGHT, type: BMAP_NAVIGATION_CONTROL_SMALL}));  //右上角，仅包含平移和缩放按钮
    //map.addControl(new BMap.NavigationControl({anchor: BMAP_ANCHOR_BOTTOM_LEFT, type: BMAP_NAVIGATION_CONTROL_PAN}));  //左下角，仅包含平移按钮
    //map.addControl(new BMap.NavigationControl({anchor: BMAP_ANCHOR_BOTTOM_RIGHT, type: BMAP_NAVIGATION_CONTROL_ZOOM}));  //右下角，仅包含缩放按钮
}

function lookMap(){
    var zb=coordinate.split(",");
    var lng=zb[0];
    var lat=zb[1];
    initMap(cityName,map);
    var point=new BMap.Point(lng,lat);
    map.centerAndZoom(point,16);
    map.panTo(point);
    marker = new BMap.Marker(point);
    map.addOverlay(marker);
}

</script>
</body>
</html>