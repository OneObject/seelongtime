<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>
<style type="text/css">
.one-a .hidexbox{
    display: none;
}
.one-a:hover .hidexbox{
    display: block;
    cursor: pointer;
}
.select-active{
    width: 300px;
    height: 260px;
    position: absolute;
    border-radius: 5px;
    z-index: 10;
    background-color: rgba(0,0,0,0.6)!important;
    color: #009900;
    font-size: 72px;
    text-align: center;
    line-height: 260px;
    filter: progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr='#99000000',endcolorstr='#99000000');
}
.active-poster img{
    width: 100%;
}
.active-poster .edite-img{
    width: 700px;
    display: block;
    border-radius: 5px;
    position: absolute;
    z-index: 10;
    background-color: rgba(0,0,0,0.6)!important;
    filter: progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr='#99000000',endcolorstr='#99000000');
    cursor: pointer;
    font-size: 36px;
    color: #ffffff;
    text-align: center;
    vertical-align: middle;
}
.active-poster .myhide{
    display: none;
}
.active-poster:hover .myhide{
 display: inline;
}

.one-active{
    width: 300px;
    height: 260px;
    border-radius: 5px;
    border: 1px solid #eaeaea;
    float: left;
    padding: 10px 20px;
    display: block;
    overflow: hidden;
}
.cactive .hidexbox{
    display: block;
    cursor: pointer;
}
.sucailist{
	width:100%;
}
.sucailist li{
	margin-right:30px;
	margin-bottom:30px;
}
.one-active h4{
margin: 0px;
padding: 0px;
font-size: 14px;
}
.one-active h4 a{
text-decoration: none;
color:#000;
}
.activetime{
font-size: 12px;
display: block;
margin: 10px 0px;
color:#999;
}
.one-active img{
width:260px;
height:146px;
}
</style>
<!-- 素材管理内容 start -->
<c:if test="${empty list }">
	<div style="margin-left:50%; margin-top:25%">暂无素材</div>
</c:if>

<c:if test="${not empty list }">

<div class="portlet-body box" style="position: absolute; height:500px;overflow-y:scroll;overflow-x:hidden;" >
<ul class="sucailist" style="width:700px;">
<c:if test="${add}">
<li class="one-a">
 <div class="one-active" onclick="build(0);" style="font-size: 140px;color:#eaeaea;text-align: center;cursor: pointer;" title="新增素材">
 	<i class="fa fa-plus" style="margin-top: 60px;"></i>
 </div>
</li>
</c:if>

<c:forEach items="${list }" var="info" varStatus="num">

<li id="info_${info.id}" class="one-a <c:if test='${idsMap[info.id]}'>cactive</c:if>" h="${info.id}">
 <div class="one-active">
            <h4>
                <a href="${basepath }/mgr/include/fodderdetail.xhtml?id=${info.id }" target="other">${info.title }</a>
            </h4>
                <span class="activetime">
                <d:formatDate currentTime="${info.modifyTime }" format="yyyy/MM/dd"/>
                </span>
                <img src="${info.coverPath }" >
            <p class="">
                <c:if test="${not empty info.summary }">${info.summary }</c:if>
                <c:if test="${empty info.summary }">${info.content }</c:if>
            </p>
</div>
<div class="select-active hidexbox" onclick="chooseselect(this);" >
   <i class="glyphicon glyphicon-ok" style="margin-top:80px;"></i>
 </div>
</li>

</c:forEach>
<c:if test="${ multi}">
<script type="text/javascript">
  function chooseselect(thi){
	  if($(thi).parent("li").attr("class") == "one-a cactive" || $(thi).parent("li").attr("class") == "cactive one-a"||$(thi).parent("li").attr("class") == "one-a  cactive" || $(thi).parent("li").attr("class") == "cactive  one-a" ){
	        $(thi).parent("li").removeClass("cactive");
	        doDelete(thi);
	  }else{
            $(thi).parent("li").addClass("cactive");
            onSave(thi);
		  }

	  }
  function build(id){
	  window.location.href=basepath+"/mgr/fodder/add.xhtml?id=0";
	  }
</script>
</c:if>
<c:if test="${ multi eq false }">
<script type="text/javascript">
  function chooseselect(thi){
	  if($(thi).parent("li").attr("class") == "one-a cactive" || $(thi).parent("li").attr("class") == "cactive one-a" ){
	        $(thi).parent("li").removeClass("cactive");
	  }else{
		    //清除其他已选择的信息
		    $(".sucailist").find(".cactive").each(function(){
			    $(this).removeClass("cactive");
			    });
            $(thi).parent("li").addClass("cactive");
            onSave(thi);
		  }

	  }
  function build(id){
	  window.location.href=basepath+"/mgr/fodder/add.xhtml?id=0";
	  }
</script>
</c:if>
</ul>	
</div>
</c:if>
<!-- 素材管理内容 end -->
<div style="position: absolute;bottom:0px;">
<jsp:include page="/WEB-INF/jsp/mgr/ixin/include/pager.jsp"></jsp:include>
</div>

<div>

 <c:if test="${not empty forsingle }">
<script type="text/javascript">
   for(var i=1;i<=100;i++){
	   $("#judge_"+i).attr("class","");
	   }
  </script>
  </c:if>
</div>
