/**
 * Created by sallon on 2014/5/30.
 */
$(function(){
    lt.launch();
    if(browser.versions.mobile && (!browser.versions.ios||!browser.versions.iPhone)){
        $("input[type='tel'],input[type='text'],input[type='number'],textarea").focus(function(){
            var mao = $(this); //获得锚点
            if (mao.length > 0) {//判断对象是否存在
                var pos = mao.offset().top;//该输入框距离顶部的距离
                var overheight = $(".container").scrollTop();
//        $(".container").scrollTop(-30);
                setTimeout(function(){
                    console.log(overheight - pos)
                    $(".container").css("padding-bottom","200px;");
                    $(".container").scrollTop(overheight+pos-50);
                },0)//距离顶部的位置
            }
        });
        $(window).resize(function(){
            if($(".container").css("padding-bottom") == "200px;"){
                $(".container").css("padding-bottom","50px;")
            }
        });
    }
})
//$(window).resize(function(){
//    initLayout();
//});
/*页面框架的初始化*/
//var wrapper;
function initLayout(){
    if($("section").find("header").length != 0){
        if($("section").find("footer").length != 0){
            $(".container").height(window.innerHeight-102);
        }else{
            $(".container").height(window.innerHeight-51);
        }
        $(".container").css("margin-top","51px");
    }else{
        if($("section").find("footer").length != 0){
            $(".container").height(window.innerHeight-51);
        }else{
            $(".container").height(window.innerHeight);
        }
    }
}
//$('input[type="tel"],input[type="email"],input[type="number"],input[type="text"],textarea').focus(function () {
//    setTimeout(function(){
//        location.hash=$(this).attr("id")+"";
//    },0);
//
//});
/*
 * 智能机浏览器版本信息:
 *
 */
var browser={
    versions:function(){
        var u = navigator.userAgent, app = navigator.appVersion;
        return{//移动终端浏览器版本信息
            trident: u.indexOf('Trident') > -1,//IE内核
            presto: u.indexOf('Presto') > -1,//opera内核
            webKit: u.indexOf('AppleWebKit') > -1,//苹果、谷歌内核
            gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核
            mobile: !!u.match(/AppleWebKit.*Mobile.*/)||!!u.match(/AppleWebKit/),//是否为移动终端
            ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/),//ios终端
            android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或者uc浏览器
            iPhone: u.indexOf('iPhone') > -1 || u.indexOf('Mac') > -1, //是否为iPhone或者QQHD浏览器
            iPad: u.indexOf('iPad') > -1,//是否iPad
            webApp: u.indexOf('Safari') == -1//是否web应该程序，没有头部与底部
        };
    }(),
    language:(navigator.browserLanguage || navigator.language).toLowerCase()
}
//document.writeln("语言版本: "+browser.language);
//document.writeln(" 是否为移动终端: "+browser.versions.mobile);
//document.writeln(" ios终端: "+browser.versions.ios);
//document.writeln(" android终端: "+browser.versions.android);
//document.writeln(" 是否为iPhone: "+browser.versions.iPhone);
//document.writeln(" 是否iPad: "+browser.versions.iPad);
//document.writeln(navigator.userAgent);
/*初始化input等的输入框
* 如果默认的给了id则使用自身的id
* 如果没有给id的情况下会自动给定一个临时的id，但是这个id是在失去交点之后就移除掉的，所以不能通过这个id来取值赋值
* */



/*页面按钮的初始化*/
function btninit(){
    $(".button").attr("ontouchstart","javascript:touchS(this)");
    $(".button").attr("ontouchend","javascript:touchE(this)");
}
function touchS(o){
    $(o).css("color","#ffffff");
    $(o).css("background-color","#529bea");
}
function touchE(o){
    $(o).css("color","#529bea");
    $(o).css("background-color","#EEEEEE");
}
var LongTime = lt ={
    settings : {

    },
    hasMenuOpen : false,
    //是否有打开的弹出框
    hasPopupOpen : false,
    launch:function(){
        initLayout();
        btninit();
    }
};
/**
 * 提供一些简单的模板，及artTemplate的渲染
 */
lt.Template = (function($){
    /**
     * 背景模板
     * @param el  selector
     * @param title  显示文本
     * @param icon   图标
     */
    var background = function(el,title,icon){
        var markup = '<div class="back-mask"><div class="fa '+icon+'"></div><div>'+title+'</div></div>';
        $(el).html(markup);
    }

    /**
     * 无记录背景模板
     * @param el
     */
    var no_result = function(el){
        background(el,'没有找到相关数据','drawer');
    }
    /**
     * 加载等待背景模板
     * @param el
     */
    var loading = function(el){
        background(el,'加载中...','cloud-download');
    }

    /**
     * 借助artTemplate模板来渲染页面
     * @param containerSelector 目标容器
     * @param templateId  artTemplate模板ID
     * @param data 模板数据
     * @param type replace|add 渲染好的文档片段是替换还是添加到目标容器中
     */
    var render = function(containerSelector,templateId,data,type){
        var el =  $(containerSelector),
            type = type || 'replace';//replace  add
        if($.type(data) == 'array' && data.length == 0 ){
            no_result(el);
        }else{
            var html = $(template(templateId,data));
            if(type == 'replace'){
                el.html(html);
            }else{
                el.append(html);
            }
        }
    }
    return {
        render : render,
        background : background,
        loading : loading,
        no_result : no_result
    }
})(Zepto);
/*
 * alias func
 * 简化一些常用方法的写法
 ** /
 /**
 * 完善zepto的动画函数,让参数变为可选
 */
lt.anim  =  function(el,animName,duration,ease,callback){
    console.log(animName)
    var d, e,c;
    var len = arguments.length;
    for(var i = 2;i<len;i++){
        var a = arguments[i];
        var t = $.type(a);
        t == 'number'?(d=a):(t=='string'?(e=a):(t=='function')?(c=a):null);
    }
    $(el).animate(animName,d|| lt.settings.transitionTime,e||lt.settings.transitionTimingFunc,c);
}
/**
 * 显示loading框
 * @param text
 */
lt.showMask = function(text){
    lt.Popup.loading(text);
}
/**
 * 关闭loading框
 */
lt.hideMask = function(){
    lt.Popup.close(true);
}
/**
 *  显示消息
 * @param text
 * @param type toast|success|error|info
 * @param duration 持续时间，为0则不自动关闭
 */
lt.showToast = function(text,type,duration){
    type = type || 'toast';
    lt.Toast.show(type,text,duration);
}
/**
 * 关闭消息提示
 */
lt.hideToast = function(){
    lt.Toast.hide();
}
/**
 *  显示消息
 * @param text
 * @param type toast|success|error|info
 * @param duration 持续时间，为0则不自动关闭
 */
lt.showWarn = function(type,text,duration){
    type = type || 'warn';
    console.log("执行了")
    lt.Warn.show(type,text,duration);
}
/**
 * 关闭消息提示
 */
lt.hideWarn = function(){
    lt.Warn.hide();
}
lt.alert = function(title,content){
    lt.Popup.alert(title,content);
}
lt.confirm = function(title,content,okCall,cancelCall){
    lt.Popup.confirm(title,content,okCall,cancelCall);
}
/**
 * 弹出窗口
 * @param options
 */
lt.popup = function(options){
    lt.Popup.show(options);
}
/**
 * 关闭窗口
 */
lt.closePopup = function(){
    lt.Popup.close();
}
/**
 * 带箭头的弹出框
 * @param html [可选]
 * @param pos [可选]  位置
 * @param arrowDirection [可选] 箭头方向
 * @param onShow [可选] 显示之前执行
 */
lt.popover = function(html,pos,arrowDirection,onShow){
    lt.Popup.popover(html,pos,arrowDirection,onShow);
}
/**
 * 弹出框组件
 */
lt.Popup = (function($){
    var _popup,_mask,transition,clickMask2close,
        POSITION = {
            'top':{
                top:0,
                left:0,
                right:0
            },
            'top-second':{
                top:'44px',
                left:0,
                right:0
            },
            'center':{
                top:'50%',
                left:'5%',
                right:'5%',
                'border-radius' : '3px'
            },
            'bottom' : {
                bottom:0,
                left:0,
                right:0
            },
            'bottom-second':{
                bottom : '51px',
                left:0,
                right:0
            }
        },
        ANIM = {
            top : ['slideDownIn','slideUpOut'],
            bottom : ['slideUpIn','slideDownOut'],
            defaultAnim : ['bounceIn','bounceOut']
        },
        TEMPLATE = {
            alert : '<div class="popup-title">{title}</div><div class="popup-content">{content}</div><div id="popup_btn_container"><a data-target="closePopup" data-icon="checkmark">{ok}</a></div>',
            confirm : '<div class="popup-title">{title}</div><div class="popup-content">{content}</div><div id="popup_btn_container"><a class="cancel" data-icon="close">{cancel}</a><a data-icon="checkmark">{ok}</a></div>',
            loading : '<i class="icon spinner"></i><p>{title}</p>'
        };

    /**
     * 全局只有一个popup实例
     * @private
     */
    var _init = function(){
        $('body').append('<div id="lt_popup"></div><div id="lt_popup_mask"></div>');
        _mask = $('#lt_popup_mask');
        _popup = $('#lt_popup');
        _subscribeEvents();
    }

    var show = function(options){
        var settings = {
            height : undefined,//高度
            width : undefined,//宽度
            opacity : 0.3,//透明度
            url : null,//远程加载url
            tplId : null,//加载模板ID
            tplData : null,//模板数据，配合tplId使用
            html : '',//popup内容
            pos : 'center',//位置 {@String top|top-second|center|bottom|bottom-second}   {@object  css样式}
            clickMask2Close : true,// 是否点击外层遮罩关闭popup
            showCloseBtn : true,// 是否显示关闭按钮
            arrowDirection : undefined,//popover的箭头指向
            animation : true,//是否显示动画
            timingFunc : 'linear',
            duration : 200,//动画执行时间
            onShow : undefined //@event 在popup内容加载完毕，动画开始前触发
        }
        $.extend(settings,options);
        clickMask2close = settings.clickMask2Close;
        _mask.css('opacity',settings.opacity);
        //rest position and class
        _popup.attr({'style':'','class':''});
        settings.width && _popup.width(settings.width);
        settings.height && _popup.height(settings.height);
        var pos_type = $.type(settings.pos);
        if(pos_type == 'object'){// style
            _popup.css(settings.pos);
            transition = ANIM['defaultAnim'];
        }else if(pos_type == 'string'){
            if(POSITION[settings.pos]){ //已经默认的样式
                _popup.css(POSITION[settings.pos])
                var trans_key = settings.pos.indexOf('top')>-1?'top':(settings.pos.indexOf('bottom')>-1?'bottom':'defaultAnim');
                transition = ANIM[trans_key];
            }else{// pos 为 class
                _popup.addClass(settings.pos);
                transition = ANIM['defaultAnim'];
            }
        }else{
            console.error('错误的参数！');
            return;
        }
//        _mask.show(0,function(){
//            $(this).css('opacity',settings.opacity);
//        });
        _mask.fadeIn();
        var html;
        if(settings.html){
            html = settings.html;
        }else if(settings.url){//远程加载
            html = lt.Page.loadContent(settings.url);
        }else if(settings.tplId){//加载模板
            html = template(settings.tplId,settings.tplData)
        }

        //是否显示关闭按钮
        if(settings.showCloseBtn){
            html += '<div id="tag_close_popup" data-target="closePopup" class="fa fa-times"></div>';
        }
        //popover 箭头方向
        if(settings.arrowDirection){
            _popup.addClass('arrow '+settings.arrowDirection);
            _popup.css('padding','8px');
            if(settings.arrowDirection=='top'||settings.arrowDirection=='bottom'){
                transition = ANIM[settings.arrowDirection];
            }
        }

        _popup.html(html).show();
        //执行onShow事件，可以动态添加内容
        settings.onShow && settings.onShow.call(_popup);

        //显示获取容器高度，调整至垂直居中
        if(settings.pos == 'center'){
            var height = _popup.height();
            _popup.css('margin-top','-'+height/2+'px')
        }
        if(settings.animation){
            lt.anim(_popup,transition[0],settings.duration,settings.timingFunc);
        }
        lt.hasPopupOpen = true;
    }

    /**
     * 关闭弹出框
     * @param noTransition 立即关闭，无动画
     */
    var hide = function(noTransition){
        _mask.fadeOut();
        if(transition && !noTransition){
            lt.anim(_popup,transition[1],200,function(){
                _popup.hide().empty();
                lt.hasPopupOpen = false;
            });
        }else{
            _popup.hide().empty();
            lt.hasPopupOpen = false;
        }
    }
    var _subscribeEvents = function(){
        _mask.on('tap',function(){
            clickMask2close &&  hide();
        });
        _popup.on('tap','[data-target="closePopup"]',function(){hide();});
    }
    /**
     * alert组件
     * @param title 标题
     * @param content 内容
     */
    var alert = function(title,content,btnName){
        var markup = TEMPLATE.alert.replace('{title}',title).replace('{content}',content).replace('{ok}',btnName || '确定');
        show({
            html : markup,
            pos : 'center',
            clickMask2Close : false,
            showCloseBtn : false
        });
    }

    /**
     * confirm 组件
     * @param title 标题
     * @param content 内容
     * @param okCall 确定按钮handler
     * @param cancelCall 取消按钮handler
     */
    var confirm = function(title,content,okCall,cancelCall){
        var markup = TEMPLATE.confirm.replace('{title}',title).replace('{content}',content).replace('{cancel}','取消').replace('{ok}','确定');
        show({
            html : markup,
            pos : 'center',
            clickMask2Close : false,
            showCloseBtn : false
        });
        $('#popup_btn_container [data-icon="checkmark"]').tap(function(){
            hide();
            okCall.call(this);
        });
        $('#popup_btn_container [data-icon="close"]').tap(function(){
            hide();
            cancelCall.call(this);
        });
    }

    /**
     * 带箭头的弹出框
     * @param html 弹出框内容
     * @param pos 位置
     * @param arrow_direction 箭头方向
     * @param onShow onShow事件
     */
    var popover = function(html,pos,arrow_direction,onShow){
        show({
            html : html,
            pos : pos,
            showCloseBtn : false,
            arrowDirection : arrow_direction,
            onShow : onShow
        });
    }

    /**
     * loading组件
     * @param text 文本，默认为“加载中...”
     */
    var loading = function(text){
        var markup = TEMPLATE.loading.replace('{title}',text||'加载中...');
        show({
            html : markup,
            pos : 'loading',
            opacity : 0,
            animation : false,
            clickMask2Close : false
        });
    }

    /**
     * actionsheet组件
     * @param buttons 按钮集合
     * [{color:'red',text:'btn',handler:function(){}},{color:'red',text:'btn',handler:function(){}}]
     */
    var actionsheet = function(buttons){
        var markup = '<div class="actionsheet">';
        $.each(buttons,function(i,n){
            markup += '<button style="background-color: '+ n.color +' !important;">'+ n.text +'</button>';
        });
        markup += '<button class="alizarin">取消</button>';
        markup += '</div>';
        show({
            html : markup,
            pos : 'bottom',
            showCloseBtn : false,
            onShow : function(){
                $(this).find('button').each(function(i,button){
                    $(button).on('tap',function(){
                        if(buttons[i] && buttons[i].handler){
                            buttons[i].handler.call(button);
                        }
                        hide();
                    });
                });
            }
        });
    }

    _init();

    return {
        show : show,
        close : hide,
        alert : alert,
        confirm : confirm,
        popover : popover,
        loading : loading,
        actionsheet : actionsheet
    }
})(Zepto);



/**
 *  消息组件
 */
lt.Toast = (function($){
    var TOAST_DURATION = 3000;
    //定义模板
    var TEMPLATE = {
        toast : '<a href="#">{value}</a>',
        success : '<a href="#"><i class="fa fa-check-circle"></i>{value}</a>',
        error : '<a href="#"><i class="fa fa-times-circle"></i>{value}</a></div>',
        info : '<a href="#"><i class="fa fa-exclamation-circle"></i>{value}</a>'
    }
    var toast_type = 'toast',_toast,timer;
    var _init = function(){
        //全局只有一个实例
        $('body').append('<div id="lt_toast"></div>');
        _toast = $('#lt_toast');
        _subscribeCloseTag();
    }

    /**
     * 关闭消息提示
     */
    var hide = function(){
        lt.anim(_toast,'scaleOut',function(){
            _toast.hide();
            _toast.empty();
        });
    }
    /**
     * 显示消息提示
     * @param type 类型  toast|success|error|info
     * @param text 文字内容
     * @param duration 持续时间 为0则不自动关闭,默认为3000ms
     */
    var show = function(type,text,duration){
        if(timer) clearTimeout(timer);
        toast_type = type;
        _toast.attr('class',type).html(TEMPLATE[type].replace('{value}',text)).show();
        lt.anim(_toast,'scaleIn');
        if(duration !== 0){//为0 不自动关闭
            timer = setTimeout(hide,duration || TOAST_DURATION);
        }
    }
    var _subscribeCloseTag = function(){
        _toast.on('tap','[data-target="close"]',function(){
            hide();
        })
    }
    _init();
    return {
        show : show,
        hide : hide
    }
})(Zepto);


/**
 *  警告组件（错误信息验证等）
 */
lt.Warn = (function($){
    var WARN_DURATION = 3000;
    //定义模板
    var TEMPLATE = {
        warn : '<a href="javascript:lt.hideWarn();">{value}</a>',
        success : '<a href="javascript:lt.hideWarn();"><i class="fa fa-times-circle"></i>{value}</a>',
        error : '<a href="javascript:lt.hideWarn();"><i class="fa fa-times-circle"></i>{value}</a></div>',
        info : '<a href="javascript:lt.hideWarn();"><i class="fa fa-times-circle"></i>{value}</a>'
    }
    var toast_type = 'warn',_warn,timer;
    var _init = function(){
        //全局只有一个实例
        $('body').append('<div id="lt_warn"></div>');
        _warn = $('#lt_warn');
        _subscribeCloseTag();
    }

    /**
     * 关闭消息提示
     */
    var hide = function(){
        lt.anim(_warn,'scaleOut',function(){
            _warn.hide();
            _warn.empty();
        });
    }
    /**
     * 显示消息提示
     * @param type 类型  toast|success|error|info
     * @param text 文字内容
     * @param duration 持续时间 为0则不自动关闭,默认为3000ms
     */
    var show = function(type,text,duration){
        console.log("chufan;e")
        if(timer) clearTimeout(timer);
        toast_type = type;
        _warn.attr('class',type).html(TEMPLATE[type].replace('{value}',text)).show();
        lt.anim(_warn,'scaleIn');
        if(duration !== 0){//为0 不自动关闭
            timer = setTimeout(hide,duration || WARN_DURATION);
        }
    }
    var _subscribeCloseTag = function(){
        _warn.on('tap','[data-target="close"]',function(){
            hide();
        })
    }
    _init();
    return {
        show : show,
        hide : hide
    }
})(Zepto);

/*
* 打开右侧菜单*/

function showmenu(){
    lt.Menu.init();
    lt.Menu.show("#menu");
}
function showrightbox(){
    lt.Menu.init();
    lt.Menu.show("#rightBox");
}
 /**
 * 侧边菜单
 */
lt.Menu = (function($){
    var $asideContainer,$sectionContainer,$sectionMask;
    var init = function(){
        $asideContainer = $('#aside_container');
        $sectionContainer = $('#section_container');
        $sectionMask = $('<div id="section_container_mask"></div>').appendTo('#section_container');
        //添加各种关闭事件
        $sectionMask.on('tap',hideMenu);
        $asideContainer.on('swipeRight','aside',function(){
            if($(this).data('position') == 'right'){
                hideMenu();
            }
        });
        $asideContainer.on('swipeLeft','aside',function(){
            if($(this).data('position') != 'right'){
                hideMenu();
            }
        });
        $asideContainer.on('tap','.aside-close',hideMenu);
    }
    /**
     * 打开侧边菜单
     * @param selector css选择器或element实例
     */
    var showMenu = function(selector){
        var $aside = $(selector).addClass('active'),
            transition = $aside.data('transition'),// push overlay  reveal
            position = $aside.data('position') || 'left',
            showClose = $aside.data('show-close'),
            width = $aside.width(),
            translateX = position == 'left'?width+'px':'-'+width+'px';
        if(showClose && $aside.find('div.aside-close').length == 0){
            $aside.append('<div class="aside-close icon close"></div>');
        }
        //aside中可能需要scroll组件
        if(transition == 'overlay'){
            lt.anim($aside,{translateX : '0%'});
        }else if(transition == 'reveal'){
            lt.anim($sectionContainer,{translateX : translateX});
        }else{//默认为push
            lt.anim($aside,{translateX : '0%'});
            lt.anim($sectionContainer,{translateX : translateX});
        }
        $('#section_container_mask').show();
        lt.hasMenuOpen = true;
    }
    /**
     * 关闭侧边菜单
     * @param duration {int} 动画持续时间
     * @param callback 动画完毕回调函数
     */
    var hideMenu = function(duration,callback){
        var $aside = $('#aside_container aside.active'),
            transition = $aside.data('transition'),// push overlay  reveal
            position = $aside.data('position') || 'left',
            translateX = position == 'left'?'-100%':'100%';

        var _finishTransition = function(){
            $aside.removeClass('active');
            lt.hasMenuOpen = false;
            callback && callback.call(this);
        };

        if(transition == 'overlay'){
            lt.anim($aside,{translateX : translateX},duration,_finishTransition);
        }else if(transition == 'reveal'){
            lt.anim($sectionContainer,{translateX : '0'},duration,_finishTransition);
        }else{//默认为push
            lt.anim($aside,{translateX : translateX},duration);
            lt.anim($sectionContainer,{translateX : '0'},duration,_finishTransition);
        }

        $('#section_container_mask').hide();
    }
    return {
        init : init,
        show : showMenu,
        hide : hideMenu
    }
})(Zepto);
