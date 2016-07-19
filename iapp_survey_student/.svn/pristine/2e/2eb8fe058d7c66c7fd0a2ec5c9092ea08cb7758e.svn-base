// JavaScript Document
$(document).ready(function() {
    Cufon.replace(".cufon");
    $(".menuicon").mousedown(function() {
        $(".menuicon").hide();
        $(".course_main").animate({
            left : 221
        }, 500, function() {
            $(".menu").show();
        });
    });
    
    $("#showmain").click(function() {
        $(".course_main").animate({
            left : 0
        }, 500, function() {
            $(".menuicon").show();
        });
    });
    
    $(".learnrecord").live("click", function() {
        var Doom = $(this);
        $(Doom).removeClass("learnrecord").addClass("learnrecordnow");
        var prevDom = $(".catelognow");
        $(prevDom).removeClass("catelognow").addClass("catelog");
        $(Doom).parents("ul").next().children().hide();
        $(Doom).parents("ul").next().children().eq(1).show();
    });
    
    $(".catelog").live("click", function() {
        var Doom = $(this);
        $(Doom).removeClass("catelog").addClass("catelognow");
        var nextDom = $(".learnrecordnow");
        $(nextDom).removeClass("learnrecordnow").addClass("learnrecord");
        $(Doom).parents("ul").next().children().hide();
        $(Doom).parents("ul").next().children().eq(0).show();
    });

    $(".parentrecord a").click(function() {
        if (this.className == "haschild") {
            $(this).siblings().show();
            this.className = "childshow";
        } else {
            $(this).siblings().hide();
            this.className = "haschild";
        }
    });
    
    $("span.noline_close").live("mouseover", function() {
        $(this).addClass("this_on");
    });
    
    $("span.noline_close").live("mouseout", function() {
        $(this).removeClass("this_on");
    });
    
});
