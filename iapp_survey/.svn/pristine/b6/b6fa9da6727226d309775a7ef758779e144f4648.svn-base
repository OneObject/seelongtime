var setting = {
			view: {
				showLine: false,
				fontCss: setFontCss
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				onClick: zTreeOnClick,
				onRemove: zTreeOnRemove
			},
			hunter_head :true
		};

		var zNodes =zdata;
//		$("#test").text(JSON.stringify(zNodes));

		 //设置字体样式
        function setFontCss() {
        	return {color:"#000000",size:"14px",height: "28px",family:"微软雅黑"};
        };
        
        
        function zTreeOnClick(event, treeId, treeNode) {
        	$("#changewith").removeClass("col-md-12");
        	$("#changewith").addClass("col-md-4");
        	$(".control").find(".portlet").each(function(){
        		$(this).hide();
        	});
        	var perId = $("#perId");
        	perId.val(treeNode.id);
        	var url = basepath+"/base/admin/course/coursecategory/detail.xhtml";
        	//alert(url);
        	showdetail(treeNode.id,url);
        	removeAllError();
        } 
        
        function removeAllError(){
        	$(".has-error").removeClass("has-error");
        }
        
        function showdetail(treeId,url){
        	//alert(treeId);
        	$("#detail").show("fast",function(){
        		$.ajax({
        			url:url,
        			type:"POST",
        			data:{"treeId":treeId},
        			//contentType: "application/json; charset=utf-8",
        			success:function(data){
        				//alert(data.name);
        				$("#detail_name").html("");
        				$("#detail_name").html(data.name);
        				$("#detail_remark").html("");
        				$("#detail_remark").html(data.remark);
        				
        				if(data.isSystemType){
        					//不能删除、修改
        					$("#btn_delete_node").hide();
        					$("#btn_delete_no").show();
        					$("#btn_update_node").hide();
        					$("#btn_update_no").show();
        				} else if(!data.leaf){
        					//不能删除
        					$("#btn_delete_node").hide();
        					$("#btn_delete_no").show();
        					$("#btn_update_node").show();
        					$("#btn_update_no").hide();
        				} else{
        					$("#btn_delete_node").show();
        					$("#btn_delete_no").hide();
        					$("#btn_update_node").show();
        					$("#btn_update_no").hide();
        				}
        			}
        			
        		});
        		
//        		detail_remark
        	});
        }
        function onDetail(){
        	
        }
        
        function onAdd(){
        	var perId = $("#perId").val();
        	$("#parentId").val(perId);
        	var name = $("#detail_name").html();
        	
        	$("#parenttName").html("");
        	$("#parentName").html(name);
        	
        	$("#detail").hide("fast",function(){
        		//$("#detail_name").html("");
        		//$("#detail_remark").html("");
        		$("#add_node").show();
        	});
        }
        
        function onDelete(){
        	var tempFn = function (){
	        	var perId = $("#perId").val();
	        	$("#delete_id").val(perId);
	        	
	        	var treeObj = $.fn.zTree.getZTreeObj("whole_tree");
				var nodes = treeObj.getSelectedNodes();
				var fatherNode;
				for (var i=0, l=nodes.length; i < l; i++) {
					fatherNode = nodes[i].getParentNode();
					$("#delete_parentId").val(fatherNode.id);
				}
	        	
				document.getElementById("form_delete").submit(); 
        	}
        	var html="<div style='width:300px;height:50px;text-align:center;'>确定要删除吗？</div>";
        	easyDialog.open({
        		container : {
        		    header : '提示',
        		    content : html,
        		    yesFn : tempFn,
        		    noFn : true
        		}
        	});
        }
        
        function onUpdate(){
        	var perId = $("#perId").val();
        	$("#update_parentId").val(perId);
        	
        	var name = $("#detail_name").html();
        	var remark = $("#detail_remark").html();
        	
        	$("#update_name").val(name);
        	$("#update_remark").val(remark);
        	
        	$("#detail").hide("fast",function(){
        		//$("#detail_name").html("");
        		//$("#detail_remark").html("");
        		$("#update_node").show();
        	});
        	
        }
        
        function zTreeOnRemove(event, treeId, treeNode) {
        	alert(treeNode.tId + ", " + treeNode.name);
        }
        
        function cancelAdd(){
        	$("#detail").show();
        	$("#add_node").hide();
        }
        
        function cancelUpdate(){
        	$("#detail").show();
        	$("#update_node").hide();
        }
        

        
        
        //验证 
        //新增功能验证
        function validateAdd(){
            if(validateAddName()){
                return true;
            }
            return false;
        }
        
        //修改更能验证
        function validateUpdate(){
      	  if(validateUpdateName()){
      		  return true;
      	  }
      	  return false;
        }

        function validateAddName(){
        	var id = "add_name";
        	var obj = $("#"+id);
        	var value = $.trim(obj.val());
        	if(nameFormatCheck(value)){
                addError(id);
                return false;
        	} else{
                removeError(id);
                return true;
        	}
        }
        function validateUpdateName(){
        	var id = "update_name";
        	var obj = $("#"+id);
        	var value = $.trim(obj.val());
        	if(nameFormatCheck(value)){
        		addError(id);
        		return false;
        	} else{
        		removeError(id);
        		return true;
        	}
        }
        
        function nameFormatCheck(value){
  	   		 if(isBlank(name) || name.length<1 || name.length>15){
	             return false;
             }
             return true;
        }
        
      	/** 错误信息的显示控制 */
      	function addError(id){
      		$("#"+id+"_con").addClass("has-error");
      		$("#"+id).focus();
      	}
      	function removeError(id){
      		$("#"+id+"_con").removeClass("has-error");
      	}
      	function show1Hide2(id){
      		$("#"+id+"_tip").removeClass("hidden");
      		
      		if($("#"+id+"_tip2") != null){
      			$("#"+id+"_tip2").addClass("hidden");
      		}
      	}
      	function show2Hide1(id){
      		$("#"+id+"_tip").addClass("hidden");
      		
      		if($("#"+id+"_tip2") != null){
      			$("#"+id+"_tip2").removeClass("hidden");
      		}
      	}