<%@page contentType="text/html; charset=utf-8"%>
<%@include file="/WEB-INF/jsp/include/admin/taglibs.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<title>评论管理</title>
    <c:if test="${restype eq 3}">
        <meta name="menu_path" content="system.ask"/>
    </c:if>
    <c:if test="${empty restype }">
	<meta name="menu_path" content="system.comment"/>
	</c:if>
	<link rel="stylesheet" type="text/css" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/select2/select2_metro.css" />
   <link rel="stylesheet" href="${basepath }/static/public/metronic.bootstrap/assets/plugins/data-tables/DT_bootstrap.css" />
	<link rel="stylesheet" media="screen" href="${basepath }/static/public/stylesheets/course.css">
	<link rel="stylesheet" href="${basepath }/static/public/easydialog-v2.0/easydialog.css" type="text/css">
</head>
<body>
	<!-- 面包屑开始-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PAGE TITLE & BREADCRUMB-->
			<ul class="page-breadcrumb breadcrumb">
                  <li><i class="icon-home"></i><a href="${basepath }">首页</a><i class="icon-angle-right"></i></li>
                  <li><span href="javascript:void(0)">评论管理</span></li>
               </ul>
			<!-- END PAGE TITLE & BREADCRUMB-->
		</div>
	</div>
	<!-- 面包屑结束-->
	  <!-- 页头-->
         <div class="row">
            <div class="col-md-12">
               <!--search box-->
              <div class="col-md-12 search_box">
                  <div class="col-md-12">
                   <!--全局搜索框-->
                   <div class="col-md-6 search_container">
                       <div class="input-group">
                          <input type="text" class="form-control" id="searchContent" placeholder="评论对象/评论内容">
                          <span class="input-group-btn">
                           <button  onclick="search1();" class="btn btn-danger" type="button">
                              <i class="icon-search"></i>
                           </button>
                          </span>
                        </div>
                        </div>                  
                  </div>
              </div>
            </div>
         </div>
        <div class="row" id="search2">
              <div class="col-md-12">
                <div class="search_condition">
                    <div class="row">
                        <span class="condition_title">类别</span>
                        <ul class="condition_item ">
                            <li class="check_item item_checked" id="topics" onclick="itemselect1(this);" t="2">
                                <span >话题</span>
                            </li>
                             <li class="check_item" id="course" t="1" onclick="itemselect2(this);">
                                <span>课程</span>
                            </li>
                            <li class="check_item " id="answer" onclick="itemselect3(this);" t="3">
                                <span >问答</span>
                            </li>
                        </ul>
                    </div>
                </div>
              </div>
         </div>
	<!-- 页面头部结束-->
         <div class="row">
              <div class="col-md-12">
               <!-- BEGIN EXAMPLE TABLE PORTLET-->
               <div class="portlet box blue">
                  <div class="portlet-title">
                     <div class="caption" ><i class="icon-globe"></i><span id="commenttitle">评论列表</span></div>
                  </div>
                  <div class="portlet-body" style="overflow: hidden;padding-bottom: 100px;">
                  <div class="row">
                            <span class="btn btn-success table_add" onclick="batchdel()">
                               <i class="glyphicon glyphicon-remove"></i>批量删除
                            </span>
                      </div>
                      <%-- 表格内容 --%>
                      <div id="table_list" style="margin-top:10px;"></div>
                    
                  </div>
               </div>
               <!-- END EXAMPLE TABLE PORTLET-->
             </div>
         </div>
</body>
</html>
<content tag="pageCore">
<script type="text/javascript" src="${basepath }/static/public/easydialog-v2.0/easydialog.min.js"></script>
<script type="text/javascript" src="${basepath}/static/qqface/jquery.qqFace-huati.js"></script>
<script type="text/javascript">
var restype="${restype}";
var resid="${resid}";
if(restype=="" || restype==null){
}else{
   $("#search2").hide();
}
page(1);
function page(i){
    
	if(restype!=null && restype!=""){
	}else{
		restype=$("#search2").find(".item_checked").attr("t");
	}

    
    var params="currPage="+i+"&resid=${resid}&restype="+restype;

    var searchval=$.trim($("#searchContent").val());

    if(searchval==null || searchval==""){
           
        }else{
               params=params+"&searchval="+searchval;
            }
	
	$('#table_list').load("${basepath}/mgr/comment/commentlist.list?"+params,function(){
		replace_one();
	});
}


/*将表情符转意过来*/
function replace_em(str){
    //str = str.replace(/\</g,'<；');
    //str = str.replace(/\>/g,'>；');
   // str = str.replace(/\n/g,'<；br/>；');
    str = str.replace(/\[em_([0-9]*)\]/g,'<img src="${basepath}/static/qqface/face/$1.gif" border="0"  style="width:24px;height:24px"/>');
    return str;
}
//逐个转意的方法
function replace_one(){
	$("#praiselist").find(".contanttext").each(function(){
		var html = replace_em($(this).html().toString());
		$(this).html(html);
	});
}

function showMsgDialog(content){
	easyDialog.open({
        container : {
            header : '提示',
            content : '<div style="background-color: #ffffff;width:260px;height:20px;text-align:center;">'+content+'</div>'
        },
        autoClose:1200
    });
}

function del(id){
	if(restype!=null && restype!=""){
	}else{
		restype=$("#search2").find(".item_checked").attr("t");
	}

	easyDialog.open({
        container : {
            header : '提示',
            content : '<div style="background-color: #ffffff;width:260px;height:20px;text-align:center;">'+'您确定要删除吗？'+'</div>',
            yesFn : function (){
            	  $.ajax({
   			      type:"POST",
   			      url:basepath+"/mgr/comment/commentdel.json",
   			      data:{"id":id,"restype":restype,"resid":resid},
   			      success:function(data){
   				       if(data){
                                 showMsgDialog("删除成功");
                                 page(1);
   					       }else{
                                 showMsgDialog("删除失败");
   						       }
   				      }
   			    });
                },
    	    noFn : true
        },
    });
}



function batchdel(){
	if(restype!=null && restype!=""){
	}else{
		restype=$("#search2").find(".item_checked").attr("t");
	}
	var items=$("input[name='ids']:checked");
    var ids="";
    $("input[name='ids']:checked").each(function(){
    	ids=ids+$(this).val()+",";
        });
	if(items.length==0){
		alert("您还没有选中任何选项");
		return;
		}else{
            easyDialog.open({
                container : {
                    header : '提示',
                    content : '<div style="background-color: #ffffff;width:260px;height:20px;text-align:center;">'+'您确定要删除这'+items.length+'条记录吗？'+'</div>',
                    yesFn : function (){
                    	$.ajax({
                            type:"POST",
                            url:basepath+"/mgr/comment/batchdelcomment.json",
                            data:{"ids":ids,"restype":restype,"resid":resid},
                            success:function(data){
                                 if(data){
                               	  showMsgDialog("删除成功");
                                     page(1);
                                     }else{
                                   	  showMsgDialog("删除失败");
                                        }
                                }
                         });
                        },
            	    noFn : true
                },
            });
			}
}

function itemselect1(thi){
	var type=$(thi).attr("t")
	$(thi).removeClass("item_checked");
	$(thi).addClass("item_checked");
	$("#course").removeClass("item_checked");
	$("#answer").removeClass("item_checked");
	restype="";
	page(1);
}
function itemselect2(thi){
	var type=$(thi).attr("t")
	$(thi).removeClass("item_checked");
	$(thi).addClass("item_checked");
	console.log($("#topics").attr("class"))
	$("#topics").removeClass("item_checked");
	$("#answer").removeClass("item_checked");
	restype=type;
	page(1);
}

function itemselect3(thi){
	var type=$(thi).attr("t")
	$(thi).removeClass("item_checked");
	$(thi).addClass("item_checked");
	$("#topics").removeClass("item_checked");
	$("#course").removeClass("item_checked");
	restype=type;
	page(1);
}

function search1(){
	page(1);
	}

</script>
</content>
<content tag="pageInit">
</content>  
