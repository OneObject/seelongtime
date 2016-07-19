/*打开新的窗口的方法
* Str：链接地址
* */
function openwindow(Str){
    window.open(Str);
}
/*考试界面的js*/
/*根据点击的给定相应的样式*/
$(document).ready(function(){
    $(".question-item-content").find(".question-item-o").each(function(){
        $(this).bind("click",function(){
            if($(this).find("input").attr("type")=="radio"){
                //单选的操作
                $(this).parents(".question-item-content").find(".question-item-o").each(function(){
                    $(this).removeClass("latcive");
                    $(this).find("input[type='radio']").removeAttr("checked");
                });
                $(this).addClass("latcive");
                $(this).find("input[type='radio']").attr("checked","true");
            }else{
                //多选题的操作
                if($(this).children("input[type='checkbox']").attr('checked') == "true"){
                    $(this).children("input[type='checkbox']").removeAttr('checked');
                    $(this).removeClass("latcive");
                }else{
                    $(this).children("input[type='checkbox']").attr('checked',"true");
                    $(this).addClass("latcive");
                }
            }

        });
    });
});

var current = 1;
/*需要传进来一个参数，就是题目的总数*/
/*
    count:题目总数
*/
function next(count){
    //这里缺少最后一题的判断
    if(current==count){
        easyDialog.open({
            container : {
                header : '提示',
                content : '<div style="background-color: #ffffff">当前已经是最后一题了，请提交试卷！<br><br><span class="btn btn-block btn-success" onclick="easyDialog.close()">取消</span></div>'
            }
        });
    }else{
        current++;
        showquestion();
    }

}
function prev(){
    if(current ==1 ){
        easyDialog.open({
            container : {
                header : '提示',
                content : '<div style="background-color: #ffffff">当前已经是第一题了...<br><br><span class="btn btn-block btn-success" onclick="easyDialog.close()">取消</span></div>'
            }
        });
    }else{
        current--;
        showquestion()
    }
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
