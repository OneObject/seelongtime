/*打开新的窗口的方法
* Str：链接地址
* */
function openwindow(Str){
    window.open(Str);
}
/*考试界面的js*/
/*根据点击的给定相应的样式*/
//$(document).ready(function(){
//    $(".question-item-content").find(".question-item-o").each(function(){
//        $(this).on("tap",function(e){
//            if($(this).find("input").attr("type")=="radio"){
//                //单选的操作
//                $(this).parents(".question-item-content").find(".question-item-o").each(function(){
//                    $(this).removeClass("latcive");
//                    $(this).find("input[type='radio']").removeAttr("checked");
//                });
//                $(this).addClass("latcive");
//                $(this).find("input[type='radio']").attr("checked","true");
//            }else{
//                //多选题的操作
////                if($(this).find("input[type='checkbox']").checked){
////                    $(this).find("input[type='checkbox']").removeAttr('checked');
////                    $(this).removeClass("latcive");
////                }else{
////                    $(this).children("input[type='checkbox']").attr('checked',"true");
////                    $(this).addClass("latcive");
////                }
//            	if($(this).attr("class") == "question-item-o latcive"){
//            		$(this).removeClass("latcive");
//            	}else{
//            		$(this).addClass("latcive");
//            	}
//            	
//            }
//
//        });
//    });
//    
//    //controlbox();
//});

var current = 1;
/*需要传进来一个参数，就是题目的总数*/
/*
    count:题目总数
*/
function next(count){
    //这里缺少最后一题的判断
    if(current==count){
    	hideNext();
    }else{
        current++;
        if(current == count){
        	hideNext();
        } else {
        	showNext();
        }
        $("#tNum").html(current);
        showquestion();
    }

    if(current != 1){
		showPrev();
	} else {
		hidePrev();
	}
    //controlbox();
}

function prev(count){
    if(current ==1 ){
    	hidePrev();
    }else{
        current--;
        $("#tNum").html(current);
        if(current == 1){
        	hidePrev();
        } else {
        	showPrev();
        }
        showquestion()
    }
    
    if(current != count){
		showNext();
	} else {
		hideNext();
	}
    //controlbox();
}

function showPrev(){
	 $("#prevButton").html('<i class="fa fa-arrow-left"></i>上一题');
	 //$("#prevButton").attr("class","li-show");
}

function showNext(){
	$("#nextButton").html('下一题<i class="fa fa-arrow-right"></i>');
	//$("#nextButton").attr("class","li-show");
}

function hidePrev(){
	$("#prevButton").html('&nbsp;');
	//$("#prevButton").attr("class","");
}

function hideNext(){
	$("#nextButton").html(' ');
	//$("#nextButton").attr("class","");
}

function showquestion(){
    $(".questionbox").find(".question-item").each(function(){
        $(this).hide();
    });
    $("#"+current+"question").show();

}
/*c查看详情*/
function detail(){
    easyDialog.open({
        container : 'card'
    });
}
/*在答题卡显示答案
* 传参数：题目的id
* */
function add_card(id){
    $("#card").find("#tm"+id).find("span").addClass("sured");
}

/*确定提交答案*/
function yesbtn(){
	$("#submitButton").attr("onclick","");
	$("#submitButton").html("提交中");
	$("#form").submit();
}
/*提交试卷*/
function submitForm(){
	var preview = $("#preview").val();
	if(preview == "1"){
		easyDialog.open({
	        container : {
	            header : '提示',
	            content : '<div style="background-color: #ffffff;width:260px;height:40px;">预览时不允许提交。</div>'
	        },
	        autoClose:1000
	    });
	} else {
		easyDialog.open({
	        container : {
	            header : '提示',
	            content : '<div style="background-color: #ffffff;width:260px;height:40px;">您确定提交吗？</div>',
	            yesFn : yesbtn,
	            noFn : true
	        }
	    });
	}
	
}
/*控制宽度*/
function controlbox(){
	var length = $("#controlbox").find(".li-show").length;
	if(length == 2){
		$("#submitButton").attr("style","width:50%;");
		$(".li-show").attr("style","width:50%;");
	}else if(length == 1){
		$("#submitButton").attr("style","width:100%;");
		$("#nextButton").attr("style","");
		$("#prevButton").attr("style","");
	}else if(length == 3){
		$("#submitButton").attr("style","");
		$("#nextButton").attr("style","");
		$("#prevButton").attr("style","");
	}
}