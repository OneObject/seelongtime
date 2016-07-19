<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/include/taglibs.jsp"%>
<%@page import="com.longtime.ajy.student.config.Constant"%>
<!DOCTYPE html>
<html>
	<head>
		<title>描述问题</title>
        <link rel="stylesheet" type="text/css" href="${basepath}/static/m/ext/enn/css/module.css?v=222324" />
        <style type="text/css">
	        body{
	        	-webkit-user-select:auto !important;
	    		-webkit-touch-callout:default !important;
	        }
        </style>
	</head>
	<body>
        <div class="wrapper-box" id="wrapper-box-1">
            <header id="header-1">
                <span class="btn btn-left" id="btn-left-1">
                    <i class="fa fa-angle-left"></i>
                </span>
                <span class="btn btn-right btn-width-70"  id="btn-right-1">
                    下一步
                </span>
                <div class="title title-2">
                    描述你的问题
                </div>
            </header>
            <section class="wrapper-static margin-top-50" id="wrapper-static">
                <div class="wrapper-text-editor" id="wrapper-text-editor">
                    <div class="simple-rich-editor" id="simple-rich-editor"  contenteditable="true" style="margin-top:100px;border:none;" ></div>
                </div>
            </section>
            <section style="top:50px;" class="block-fixed-func" id="block-fixed-func">
                <span class="btn-image" id="btn-insert-image">
                    <i class="fa fa-picture-o"></i>
                </span>
                <span class="btn-at" id="btn-at">
                    <i class="fa fa-at"></i>
                </span>
                <%--
                <span class="btn-anonymous" id="btn-anony">
                    <label><i class="fa fa-check"></i></label>匿名
                </span>
                 --%>
                <span class="btn-reward" id="btn-reward" data-score="0" data-status="closed">
                    <label class="bg-coin"></label>
                </span>
            </section>
            <section class="block-score-box" id="block-score-box" style="display: none;">
                <div class="score-title">
                    请选择悬赏值
                </div>
                <div class="score-list" id="score-list">
                    <span><label ${credit >= 5 ? "":"class='unable'" } data-score="5">5</label></span>
                    <span><label ${credit >= 10 ? "":"class='unable'"} data-score="10">10</label></span>
                    <span><label ${credit >= 15 ? "":"class='unable'"} data-score="15">15</label></span>
                    <span><label ${credit >= 20 ? "":"class='unable'"} data-score="20" >20</label></span>
                </div>
                <div class="score-info">
                    您可用的财富值：<label id="totalcredit">${credit }</label>
                </div>
                <div class="score-footer">
                    提高悬赏，更容易吸引高手为你解答
                </div>
            </section>

            <section class="block-search-box" id="block-search-box" style="display: none;">

            </section>

        </div>
        <div class="wrapper-box" id="wrapper-box-2" style="display: none;">
            <header>
                <span class="btn btn-left"  id="btn-left-2">
                    <i class="fa fa-angle-left"></i>
                </span> 
                <span class="btn btn-right btn-width-70" id="btn-right-2">
                    确定
                </span>
                <div class="title title-2">
                    @某人
                </div>
            </header>
            <section class="wrapper-static margin-top-50">
                <div class="module-at-somebody">
                
                    <div class="block-search">
                        <span class="search" id="search-2" onclick="atlist(true);"><i class="fa fa-search set-color"></i></span>
                        <form onsubmit="atlist(true);return false;">
                        	<input class="set-bd-color" type="search" id="input-2" placeholder="请输入人名">
                        </form>
                        <span class="delete" id="delete-2"><i class="fa fa-times set-color"></i></span>
                    </div>
                 
                    <div class="block-selected-people" id="block-selected-people" style="display: none;">
                        <div class="head-line">已选择的人</div>
                        <div class="people-box" id="people-box">

                        </div>
                        <input type="hidden" id="uids" value="" />
                    </div>
                    <div id="atlist">
                    
                    </div>
                    
                    
                    
                    
                </div>
            </section>

        </div>
        <div class="wrapper-box" id="wrapper-box-3" style="display: none;">
            <header>
                <span class="btn btn-left"  id="btn-left-3">
                    <i class="fa fa-angle-left"></i>
                </span>
                <span class="btn btn-right btn-width-70"  id="btn-right-3">
                    提交
                </span>
                <div class="title title-2">
                    为问题添加标签
                </div>
            </header>
            <section class="wrapper-static margin-top-50">
                <div class="module-add-tag">
                    <div class="block-search">
                        <span class="search" id="search-3"><i class="fa fa-search set-color"></i></span>
                        <form onsubmit="taglist(1,true);return false;">
                        	<input  class="set-bd-color" type="search" id="input-3" placeholder="请输入标签名">
                        </form>
                        <span class="delete" id="delete-3"><i class="fa fa-times set-color"></i></span>
                    </div>
                    <div class="block-selected-tag" id="block-selected-tag"  style="display: none;">
                        <div class="head-line">已添加的标签</div>
                        <div class="tag-box">
                        </div>
                        <input type="hidden" value="" id="tagids" />
                    </div>
                    <%--
                    <div class="block-tag-list">
                        <div class="head-line">常用标签</div>
                        <div class="selected-tag-list">
                            <div class="tag" data-name="金融" data-id="t1" data-href="abc">
                                <label><i class="fa fa-check"></i></label>
                                <div>金融</div>
                            </div>
                            <div class="tag" data-name="投资" data-id="t2" data-href="abc">
                                <label><i class="fa fa-check"></i></label>
                                <div>投资</div>
                            </div>
                            <div class="tag" data-name="能源" data-id="t3" data-href="abc">
                                <label><i class="fa fa-check"></i></label>
                                <div>能源</div>
                            </div>

                        </div>
                    </div>
                     --%>

                    <div class="block-tag-list">
                        <div class="head-line">全部标签</div>
                        <div class="selected-tag-list" id="tag-list-total">
                          
                            <div class="loading">上滑加载更多</div>
                        </div>
                    </div>


                </div>
            </section>
        </div>
	   	<input type="hidden" id="credit" value="0">
	    <input type="hidden" id="anonymous" value="0" />
	    
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/plupload/plupload.full.min.js"></script>
        <script type="text/javascript" src="${basepath}/static/m/ext/enn/js/guidance.2.0.js?v=222324"></script>
        <script type="text/javascript">
            var tagpage = 1;
            var tagtotal =0;
            var tagcurrent = 0;
            var searchContentFlag = true;
            var _baseImagePath = '${basepath}/static/m/ext/enn/img';
            var isIos = browserUtil.isIos();
            var windowSize = [window.innerWidth, window.innerHeight];
            $(function () {
                var $wrapperBox1 = $('#wrapper-box-1');
                var $wrapperBox2 = $('#wrapper-box-2');
                var $wrapperBox3 = $('#wrapper-box-3');
                var $btnLeft1 = $('#btn-left-1');
                var $btnRight1 = $('#btn-right-1');
                var $btnLeft2 = $('#btn-left-2');
                var $btnRight2 = $('#btn-right-2');
                var $btnLeft3 = $('#btn-left-3');
                var $btnRight3 = $('#btn-right-3');
                var $btnSearch2 = $('#search-2');
                var $input2 = $('#input-2');
                var $btnDelete2 = $('#delete-2');
                var $btnSearch3 = $('#search-3');
                var $input3 = $('#input-3');
                var $btnDelete3 = $('#delete-3');
                var $btnInsertImage = $('#btn-insert-image');
                var $btnAt = $('#btn-at');
                var $btnAnony = $('#btn-anony');
                var $btnReward = $('#btn-reward');
                var $blockScoreBox = $('#block-score-box');
                var $blockSearchBox = $('#block-search-box');
                var $scoreList = $('#score-list label');
                var $blockFixedFunc = $('#block-fixed-func');
                var $loading;


                var $simpleRichEditor = $('#simple-rich-editor');
                var $wrapperStatic = $('#wrapper-static');


                /*if (isIos) {
                    $simpleRichEditor.height(windowSize[1] - 125);
                }*/
                $simpleRichEditor.bind('keyup', function () {
                    var status = $btnReward.data('status');
                    $blockSearchBox.hide();
                    if (status !== 'closed') {
                        $btnReward.data('status', 'closed');
                        $blockScoreBox.hide();
                        $blockFixedFunc.css({
                            'bottom': 0
                        });
                    }

                    checkLength($simpleRichEditor.text().length);





                });


                function checkLength(length){
                    if(length>=3 && length <=10 && searchContentFlag){
                        searchContentFlag = false;
                        $blockSearchBox.hide();

                        $.ajax({
                            type : "POST",
                            url : "${basepath}/m/ext/enn/ask/listquestionlike.json",
                            cache : true,
                            data : {searchContent: $.trim($simpleRichEditor.text()),page:1,size:5},
                            success : function(data) {
                                showSearchQuestion(data);
                            },
                            error : function() {
                            }
                        });
                    }

                }

                function showSearchQuestion(data){
                    var htmlheader = "<ul>";
                    var htmlbody = "";
                    for(var i=0;i<data.length;i++){
                        htmlbody=htmlbody+'<li><a href="javascript:void(0)" onclick="todetail(\''+data[i].id+'\');">'+data[i].title+'</a><label>浏览量'+data[i].visitnum+'人</label><label>'+data[i].answer_num+'人回答</label></li>';
                    }
                    var htmlfooter = "</ul>";

                    var searchContent = htmlheader+htmlbody+htmlfooter;

                    $blockSearchBox.children().remove();
                    $blockSearchBox.append(searchContent);
                    $blockSearchBox.show();
                    searchContentFlag = true;
                }







                $btnLeft1.bind('click', function () {
                    window.history.go(-1);
                });

                $btnRight1.bind('click', function () {
                    //alert(simpleRichEditor.getText());

                    //提示内容
                    var title = $.trim(simpleRichEditor.getText());

                    if(title==null || title ==""){
                        lightBlock.show("请填写问题！");
                        return;
                    }
                    if(title.length < 5){
                        lightBlock.show("问题描述不少于5个字！");
                        return;
                    }


                    ctlWrapperShow($wrapperBox3);
                    taglist(1);
                });

                $btnLeft2.bind('click', function () {
                    setTimeout(function () {
                        ctlWrapperShow($wrapperBox1);
                    }, 400);
                });

                $btnRight2.bind('click', function () {
                    setTimeout(function () {
                        ctlWrapperShow($wrapperBox1);
                    }, 400);
                    //at列表，保存
                });

                $btnLeft3.bind('click', function () {
                    setTimeout(function () {
                        ctlWrapperShow($wrapperBox1);
                    }, 400);
                });

                $btnRight3.bind('click', function () {//提交
                    //问题
                    var title = $.trim(simpleRichEditor.getText());
                    //是否匿名
                    var anonymous = $("#anonymous").val();
                    //标签ids
                    var tagids = $("#tagids").val();
                    //悬赏积分
                    var credit = $("#credit").val();
                    //@的用户id
                    var uids = $("#uids").val();
                    //问题说明
                    var remark = simpleRichEditor.getHtml();

                    if(tagids==null || tagids ==''){
                        lightBlock.show("请选择标签！");
                        return;
                    }

                    if(title==null || title ==""){
                        lightBlock.show("请填写问题！");
                    }else{
                        lightDialog.show("确定提交吗？",
                                function(){
                                    lightDialog.remove();
                                    showHandling();
                                    $.ajax({
                                        type : "POST",
                                        url : "${basepath}/m/ext/enn/ask/addquestion.json",
                                        cache : false,
                                        data : {
                                            title : title,
                                            anonymous : anonymous,
                                            score : credit,
                                            tagids : tagids,
                                            uids : uids,
                                            remark : remark,
                                            coachid:"${param.coachid}"
                                        },
                                        success : function(data) {
                                            var coachid = "${param.coachid}";
                                            if(coachid != "" && coachid != null  ){
                                                window.location.href="${basepath}/m/ext/enn/coach/chat.xhtml?coachid="+coachid;
                                            }else{
                                                window.location.href="${basepath}/m/ext/enn/ask/index.xhtml";
                                            }
                                        },
                                        error : function() {
                                        }
                                    });
                                },
                                function(){
                                    lightDialog.remove();
                                });

                    }
                });

                $btnDelete2.bind('click', function () {
                    $input2.val('');
                    atlist(true);
                });

                $btnSearch2.bind('click', function () {
                    //搜索好友
                });

                $input2.bind('focus', function () {
                    $btnDelete2.show();
                });


                $btnDelete3.bind('click', function () {
                    $input3.val('');
                    taglist(1,true);
                });

                $btnSearch3.bind('click', function () {
                    taglist(1,true);
                });

                $input3.bind('focus', function () {
                    $btnDelete3.show();
                });


                /*
                 $btnInsertImage.bind('click', function () {
                 //插入图片
                 });
                 */
                simpleRichEditor.createUploader(document.getElementById('btn-insert-image'), $blockFixedFunc[0], '<%=Constant.QINIU_SERVER%>', '${uptoken}', '<%=Constant.IMG_SERVER_DOWNLOAD%>');

                $btnAt.bind('click', function () {
                    ctlWrapperShow($wrapperBox2);
                    atlist(false);
                });

                $btnAnony.bind('click', function () {
                    var $temp = $(this);
                    var credit = parseInt($("#credit").val());
                    var rncredit = parseInt('${rncredit}');
                    var totalcredit = parseInt($("#totalcredit").html());
                    if ($temp.is('.checked')) {
                        $temp.find('label').removeClass();
                        $temp.removeClass('checked');
                        $("#anonymous").val(0);
                        $("#totalcredit").html(totalcredit+rncredit);

                        totalcredit = parseInt($("#totalcredit").html());
                        $scoreList.each(function(){
                            var thi = $(this);
                            var score = parseInt(thi.data("score"));
                            if(  score > totalcredit){
                                thi.addClass("unable");
                            }else{
                                thi.removeClass("unable");
                            }
                        });

                    } else {
                        if((totalcredit-credit)<rncredit){
                            lightBlock.show("当前用户财富值不足，无法匿名提问！");
                            return;
                        }
                        $temp.find('label').addClass('checked');
                        $temp.addClass('checked');
                        $("#anonymous").val(1);
                        $("#totalcredit").html(totalcredit-rncredit);

                        totalcredit = parseInt($("#totalcredit").html());
                        $scoreList.each(function(){
                            var thi = $(this);
                            var score = parseInt(thi.data("score"));
                            if(  score > totalcredit){
                                thi.addClass("unable");
                            }else{
                                thi.removeClass("unable");
                            }
                        });
                    }
                });

                $btnReward.bind('click', function () {
                    var $temp = $(this);
                    var status = $temp.data('status');
                    if (status === 'closed') {
                        $blockFixedFunc.css({
                            'bottom': '182px'
                        });
                        $blockScoreBox.show();
                        $temp.data('status', 'opened');
                    } else {
                        $temp.data('status', 'closed');
                        $blockScoreBox.hide();
                        $blockFixedFunc.css({
                            'bottom': 0
                        });
                    }

                });

                $scoreList.bind('click', function () {
                    var $temp = $(this);
                    var score;
                    if ($temp.is('.unable')) {
                        return;
                    }
                    if ($temp.is('.selected')) {
                        $temp.removeClass('selected');
                        $btnReward.data('score', 0);
                        $("#credit").val(0);
                        $btnReward.html(' <label class="bg-coin"></label>');
                        setTimeout(function () {
                            $btnReward.data('status', 'closed');
                            $blockScoreBox.hide();
                            $blockFixedFunc.css({
                                'bottom': 0
                            });
                        }, 300);
                        return;
                    }
                    $temp.addClass('selected').closest('span').siblings().find('label').removeClass('selected');
                    score = $temp.data('score');
                    $btnReward.data('score', score);
                    $btnReward.html('<label>'+ score +'</label>');
                    $("#credit").val(score);
                    setTimeout(function () {
                        $btnReward.data('status', 'closed');
                        $blockScoreBox.hide();
                        $blockFixedFunc.css({
                            'bottom': 0
                        });
                    }, 300);
                });



                simpleRichEditor.init('simple-rich-editor', ' 别着急，试着将问题尽可能清晰、详尽的描述出来，这样回答者们才能完整、更高质量的为你解答');

                swipeAjax.bindTapEvent(document, function () {//上滑回调
                    var $loading = $('#tag-list-total .loading');
                    if (!$loading.length) {
                        return;
                    }
                    if (tagtotal <= tagcurrent) {
                        swipeAjax.setAjaxCount(0); //这一行必须加
                        return;
                    }
                    tagpage = tagpage+1 ;
                    taglist(tagpage,true);
                });

                function ctlWrapperShow($obj) {
                    $obj.show().siblings('.wrapper-box').hide();
                }
            });



            var tagflag = 0 ;

            function taglist(i,issearch) {
                var $tagloading = $('#tag-list-total .loading');



                var $tagList;
                var tList;

                if(tagflag > 0 && !issearch){
                    return;
                }else{
                    $tagloading.html('<i class="fa fa-spinner fa-pulse"></i>正在加载...');
                }

                tagflag = tagflag + 1;
                tagpage = i ;
                var url = "${basepath}/m/ext/enn/ask/taglist.list";
                $.ajax({
                    type : "GET",
                    url : url,
                    cache : false,
                    data : {
                        content : $.trim($("#input-3").val()),
                        page : i ,
                        size : 100,
                        filterQuestionChoose:true
                    },
                    success : function(html) {
                        if(i==1){
                            $("#tag-list-total").html(html);
                            $("#tag-list-total").append('<div class="loading">上滑加载更多</div>');
                            $tagloading = $('#tag-list-total .loading');
                        }else{
                            $tagloading.before(html);
                        }
                        if(tagtotal>tagcurrent){
                            $tagloading.html('上滑加载更多');
                        }else if(tagtotal!=1&&tagcurrent!=1){
                            $tagloading.html('已无更多');
                        }else if(tagtotal == 0 || tagtotal== 1 ){
                            $tagloading.html("");
                        }

                        $tagList = $('.selected-tag-list .tag');
                        tList = getTagList();
                        for (var n = 0; n < tList.length; n++) {
                            for (var j = 0; j < $tagList.length; j++) {
                                if ($($tagList[j]).data('id') === tList[n]) {
                                    $($tagList[j]).addClass('selected');
                                }
                            }
                        }

                        swipeAjax.setAjaxCount(0);  //这一行必须加
                    },
                    error : function() {
                    }
                });
            }

            function getTagList() {
                var arr = [];
                var $spanList = $('.tag-box').find('span');
                for (var i = 0; i < $spanList.length; i++) {
                    arr.push($($spanList[i]).data('id'));
                }
                return arr;
            }


            function clickTagItem(_this) {
                var temp = $(_this);
                var objTemp;
                var dataStr = '';
                var html;
                var ids = $("#tagids").val();
                objTemp = temp.data();

                if (temp.is('.selected')) {
                    temp.removeClass('selected');
                    $('#tid' + objTemp['id']).remove();
                    ids = ids.replace(objTemp['id']+",","");
                    $("#tagids").val(ids);
                } else {
                    //标签数最多为三个
                    var tlist = getTagList();
                    /* if(tlist.length==3){
                     lightBlock.show("最多只能选择3个标签");
                     return;
                     } */
                    if(tlist.length>0){
                        lightBlock.show("只能选择1个标签");
                        return;
                    }


                    temp.addClass('selected');
                    if ($('#tid' + objTemp['id']).length !== 0) {
                        return;
                    }
                    for(var prop in objTemp) {
                        if (objTemp.hasOwnProperty(prop)) {
                            dataStr += ' data-' + prop + '="'+ objTemp[prop] +'"';
                        }
                    }
                    html = '<span class="set-color" id="tid'+ objTemp['id'] +'"'+ dataStr +'>'+ objTemp['name'] +'</span>';
                    $('#block-selected-tag .tag-box').append(html);
                    ids = ids + objTemp['id'] +",";
                    $("#tagids").val(ids);

                }
                if ($('.tag-box span').length === 0) {
                    $('#block-selected-tag').hide();
                } else {
                    $('#block-selected-tag').show();
                }
            }

            var atflag = 0 ;
            function atlist(issearch) {
                if(atflag > 0 && !issearch){
                    return;
                }else{
                    $("#atlist").html('<div class="loading"><i class="fa fa-spinner fa-pulse"></i>正在加载...</div>');
                }
                atflag = atflag + 1;
                var url = "${basepath}/m/ext/enn/ask/atlist.list";
                $.ajax({
                    type : "GET",
                    url : url,
                    cache : false,
                    data : {
                        content:$.trim($("#input-2").val()),
                    },
                    success : function(html) {
                        $(".module-at-somebody .loading").remove();
                        $("#atlist").html(html);
                        //绑定事件初始化
                        $('.block-group-line').bind('click', function () {
                            var temp = $(this);
                            if (temp.is('.closed')){
                                temp.prop('class', 'block-group-line opened');
                                temp.find('i').prop('class', 'fa fa-angle-up');
                                temp.next('.block-friend-list').slideDown(300);
                            } else {
                                temp.prop('class', 'block-group-line closed');
                                temp.find('i').prop('class', 'fa fa-angle-down');
                                temp.next('.block-friend-list').slideUp(300);
                            }
                        });

                        $(".block-friend-list .someone").bind('click', function () {//@好友
                            var temp = $(this);
                            var objTemp;
                            var dataStr = '';
                            var html;
                            var ids = $("#uids").val();
                            objTemp = temp.data();
                            if (temp.is('.selected')) {
                                temp.removeClass('selected');
                                $('#aid' + objTemp['id']).remove();
                                ids = ids.replace(objTemp['id']+",","");
                                $("#uids").val(ids);
                            } else {
                                temp.addClass('selected');
                                if ($('#aid' + objTemp['id']).length !== 0) {
                                    return;
                                }
                                for(var prop in objTemp) {
                                    if (objTemp.hasOwnProperty(prop)) {
                                        dataStr += ' data-' + prop + '="'+ objTemp[prop] +'"';
                                    }
                                }
                                html = '<span id="aid'+ objTemp['id'] +'"'+ dataStr +'>'+ objTemp['name'] +'</span>';
                                $('#block-selected-people .people-box').append(html);
                                ids = ids + objTemp['id'] +",";
                                $("#uids").val(ids);

                            }
                            if ($('.people-box span').length === 0) {
                                $('#block-selected-people').hide();
                            } else {
                                $('#block-selected-people').show();
                            }
                        });

                        var userlist = getAtList();
                        var $someoneList = $(".someone");
                        for (var n = 0; n < userlist.length; n++) {
                            for (var j = 0; j < $someoneList.length; j++) {
                                if ($($someoneList[j]).data('id') === userlist[n]) {
                                    $($someoneList[j]).addClass('selected');

                                }
                            }
                        }

                    },
                    error : function() {
                    }
                });
            }


            function todetail(id){
                //window.location.href="${basepath}/m/ext/enn/ask/detail.xhtml?id="+id;
                //alert(api);
                if (typeof(api) == "undefined"){
                    window.open("${basepath}/m/ext/enn/ask/detail.xhtml?id="+id);
                }

                api.openWin({
                    animation:{
                        type:"none"               //动画类型（详见动画类型常量）
                    },
                    delay:400,
                    slidBackEnabled:false,
                    name: 'question_detail',
                    url: "${basepath}/m/ext/enn/ask/detail.xhtml?id="+id+"&openwin=true",
                    pageParam: {name: 'test'}
                });
                //window.open("${basepath}/m/ext/enn/ask/detail.xhtml?id="+id);
            }


            function getAtList() {
                var arr = [];
                var $spanList = $('#people-box').find('span');
                for (var i = 0; i < $spanList.length; i++) {
                    arr.push($($spanList[i]).data('id'));
                }
                return arr;
            }

            function deleteImage(_this) {
                $(_this).closest('.temp-image-box').remove();
            }
        </script>
	</body>
</html>
