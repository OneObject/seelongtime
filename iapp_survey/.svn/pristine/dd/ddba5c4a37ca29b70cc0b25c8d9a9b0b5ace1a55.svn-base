/**
       * 全部选中
       */
      var flag = true;//没有选中的情况下是true
      function checked_all(){
      	if(flag){
      		$("input[name='ids']").each(function(){
      			$(this).attr("checked","checked");
      			$(this).parent().addClass("checked");
      		});
      		flag = false;
      	}else{
      		$("input[name='ids']").each(function(){
      			$(this).removeAttr("checked");
      			$(this).parent().removeClass("checked");
      		});
      		flag = true;
      	}
      	
      }
      /*弹出添加题库层*/
      function add_questionBank(){
//    	  var html = $.parseJSON($("#addbank"));
    	  easyDialog.open({
    		  container : 'addbank',
    		  fixed : false
    		}); 
      }
      function submit_bank(){
    	  /*提交方法*/
      }
      function openfile(){
    	  $("#openfile").click();
      }
      /*单选题----添加选项*/
      function add_single_item(){
    	  
      }
      /*点击选择考试试卷*/
      function choose_paper(){
    	  easyDialog.open({
    		  container : 'choosePaper',
    		  fixed : false
    		});
      }
      /*选择试题*/
      function chooseQuestion(){
    	  easyDialog.open({
    		  container : 'chooseQuestion',
    		  fixed : false
    		});
      }
      /*弹出导入试题概况的方法*/
      function openSurvey(){
    	  easyDialog.open({
    		  container : 'logDetail',
    		  fixed : false
    		});
      }
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      