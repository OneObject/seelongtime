<%@page import="org.apache.commons.lang.math.RandomUtils"%>
<%@ page import="com.longtime.ajy.student.config.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
        <meta name="format-detection" content="telephone=no" />
		<title>栏目管理</title>
		<link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/css/module.css" />
        <link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/css/font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/css/guidance.2.0.css?v=22cc" />
        <style>
            body{
                background: #f8f8f8;
            }
        </style>
	</head>
	<body>
        <header>
            <span class="btn btn-left" id="btn-back">
                <i class="fa fa-angle-left"></i>
            </span>
            <span class="btn btn-right btn-width-70" onclick="save()">
                    保存
            </span>
            <div class="title title-2">
                栏目管理
            </div>
        </header>
        <section class="wrapper-static margin-top-50" id="wrapper-static">
            <div class="drag-sort-head">
                已选择栏目 <label>点击红叉直接删除，按住拖动排序</label>
            </div>
            <div class="drag-sort-box" id="added-category-box">
            	 <c:if test="${not empty choosed }">
            	<c:forEach items="${choosed }" var="it" varStatus="i">
            		<c:if test="${ not empty canDel[it.columnidname] }">
            		 	<span class="category disable-del"  data-name="${it.columnname }" data-id="${it.columnid }" data-type="${empty it.columntype ? 'o':it.columntype }">
			                    <span class="category-handle">${it.columnname }</span>
			              </span>
		            </c:if>
		            <c:if test="${ empty canDel[it.columnidname] }">
		                <span class="category"  data-name="${it.columnname }" data-id="${it.columnid }" data-type="${empty it.columntype ? 'o':it.columntype  }">
		                    <span class="category-handle">${it.columnname }</span>
		                    <label class="delete-btn" onclick="removeCategory(this);">x</label>
		                </span>
	                </c:if>
	            </c:forEach>
	            </c:if>
            </div>
            <div class="drag-sort-head">
                更多栏目
            </div>
            <div class="drag-sort-box" id="category-box">
	          	<c:forEach items="${notChoose }" var="item" varStatus="i">
	          		<c:if test="${org.id ne item.columnid }">
	                <span class="category" data-name="${item.columnname }" data-id="${item.columnid }" data-type="${empty item.columntype ? 'o':item.columntype  }" onclick="createCategory(this);">
	                    <span class="category-handle">${item.columnname }</span>
	                </span>
	                </c:if>
                </c:forEach>
            </div>
        </section>

        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.2.0.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/sortable.js"></script>
        <script type="text/javascript">
            $(function () {
                var $btnBack = $('#btn-back');
                $btnBack.bind('click', function () {
                    window.history.go(-1);
                });
                
                var addedCategoryBox = document.getElementById("added-category-box");
                var addedCategorySort = new Sortable(addedCategoryBox, {
                    animation: 150,
                    draggable: '.category',
                    handle: '.category-handle',
                    group: "category",
                    filter: '.delete-btn',
                    onFilter: function (event) {
                        removeCategory(event.item);
                    }
                });

            });

            function save(){
            	lightDialog.show("是否保存设置？",
	                    function(){
	                		lightDialog.remove();
		              		var $temp = $("#added-category-box").find('.category');
	                    	var obj = new Object();
	                    	obj.type = '${param.type}';
	                    	obj.items = new Array();
	                    	
	                    	for(var i=0;i<$temp.length;i++){
	                    		var opt = new Object();
	                    		opt.columntype = $($temp[i]).data('type');
	                    		opt.columnid = $($temp[i]).data('id');
	                    		opt.columnname = $($temp[i]).data('name');
	                    		opt.weight = i+1;
	                    		obj.items[i]  = opt;
	                    	}
	                    	showHandling();
	                		 $.ajax({
								type:"POST",
								url:"${basepath}/m/ext/enn/column/save.json",
								data: JSON.stringify(obj),
								dataType:"json",
								cache:false,
								contentType: "application/json; charset=utf-8",
								success:function(map){
									if(map.flag){
										lightBlock.show('保存成功!');
										window.history.go(-1);
									}
								},
								error:function(){
								}
							});
	                    },
	                    function(){
	                    	lightDialog.remove();
	                    });
            }
            
            function createCategory(_this) {
                var $temp = $(_this);
                var name = $temp.data('name');
                var id = $temp.data('id');
				var type = $temp.data('type');
                $temp.remove();
                $('#added-category-box').append('<span class="category" data-name="'+ name +'" data-id="'+ id +'" data-type="'+ type +'" ><span class="category-handle">'+ name +'</span><label class="delete-btn" onclick="removeCategory(this);">x</label></span>');
            }
            function removeCategory(_this) {
                var $temp = $(_this).closest('.category');
                var name = $temp.data('name');
                var id = $temp.data('id');
				var type = $temp.data('type');
                $temp.remove();
                resumeCategory(name,id,type);
            }
            function resumeCategory(name, id,type) {
                $('#category-box').append('<span class="category" data-name="'+ name +'" data-id="'+ id +'" data-type="'+ type +'"  onclick="createCategory(this);"><span class="category-handle">'+ name +'</span></span>');
            }
        </script>
	</body>
</html>
