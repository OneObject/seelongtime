/**
 * ask_answer_base.js集合了6个经过封装的功能模块
 * browserUtil  浏览器终端检测
 * lightDialog  自定义的对话框
 * lightBlock  自定义的信息提示色块
 * dialogSelector  对话框模式的选择列表
 * swipeAjax  向上滑动异步加载
 * simpleRichEditor  简单的富文本编辑器
 */

/**
 * browserUtil，封装了几个常用的浏览器检测函数
 */
var browserUtil = (function () {
    'use strict';
    var isWeChat, isIos, isAndroid, isPc;

    isWeChat = function () {//是否是微信，如果是，返回true
        if (/(MicroMessenger)/i.test(navigator.userAgent)) {
            return true;
        }
        return false;
    };

    isIos = function () {//是否是ios系列，如果是，返回true
        if (/(iPhone|iPad|iPod|iOS)/i.test(navigator.userAgent)) {
            return true;
        }
        return false;
    };

    isAndroid = function () {//是否是android系统，如果是，返回true
        if (/(Android)/i.test(navigator.userAgent)) {
            return true;
        }
        return false;
    };

    isPc = function () {//是否是pc，如果是，返回true
        if (!/AppleWebKit.*Mobile.*/i.test(navigator.userAgent)) {
            return true;
        }
        return false;
    };

    return {
        isWeChat: isWeChat,
        isIos: isIos,
        isAndroid: isAndroid,
        isPc: isPc
    };
}());

/**
 * lightDialog  可自定义的对话框
 */
var lightDialog = (function () {
    'use strict';
    var createHtml, showLightDialog;
    var handleClickSure, handleClickCancel;
    var actionSure, actionCancel;
    var remove;
    var configMap = {//可选配置参数
        isShowHeader: true,  //设置对话框是否包含标题
        headerText: '提示',  //设置标题内容
        btnModel: 2,  //设置对话框按钮的数目，可配置为1或2
        contentText: '暂无内容',  //设置对话框提示内容
        footerText: ['取消', '确定'],  //设置按钮上文字
        width: 280  //设置对话框宽度
    };
    var myConfigMap;
    var domMap = {
        dialog: null
    };

    createHtml = function () {
        var html = [];
        var div = document.createElement('div');
        div.className = 'dialog-wrapper';
        div.id = 'dialog-wrapper';
        html.push('<div class="dialog-box" style="width:'+ myConfigMap.width +'px;">');
        if (myConfigMap.isShowHeader) {
            html.push('<div class="dialog-header set-color set-bd-color">'+ myConfigMap.headerText +'</div>');
        }
        html.push('<div class="dialog-content">'+ myConfigMap.contentText +'</div>');
        if (myConfigMap.btnModel === 2) {
            html.push('<div class="dialog-footer"><span class="set-color" id="dialog-cancel">'+ myConfigMap.footerText[0] +'</span><span  class="set-color" id="dialog-sure">'+ myConfigMap.footerText[1] +'</span></div>');
        } else if (myConfigMap.btnModel === 1) {
            html.push('<div class="dialog-footer cols-1"><span class="set-color"  id="dialog-sure">'+ myConfigMap.footerText[0] +'</span></div>');
        }
        html.push('</div>');
        div.innerHTML = html.join('');
        domMap.dialog = div;
        return div;
    };

    showLightDialog = function (initMap, sureCallBack, cancelCallBack) {//initMap：对话框的配置参数，sureCallBack:点击确认时的回调函数，cancelCallBack：点击取消时的回调函数
        if (!initMap) {
            myConfigMap = configMap;
        }
        if (typeof initMap === 'string') {
            configMap.contentText = initMap;
            myConfigMap = configMap;
        } else if (initMap && typeof initMap === 'object') {
            myConfigMap = $.extend(true, {}, configMap, initMap);  //这一行代码依赖了jQuery,可优化
        }
        if (sureCallBack && typeof sureCallBack === 'function') {
            actionSure = sureCallBack;
        } else {
            actionSure = remove;
        }
        if (cancelCallBack && typeof cancelCallBack === 'function') {
            actionCancel = cancelCallBack;
        } else {
            actionCancel = remove;
        }
        document.body.appendChild(createHtml());
        if (myConfigMap.btnModel === 2) {
            document.getElementById('dialog-sure').addEventListener('click', handleClickSure, false);
            document.getElementById('dialog-cancel').addEventListener('click', handleClickCancel, false);
        } else if (myConfigMap.btnModel === 1) {
            document.getElementById('dialog-sure').addEventListener('click', handleClickSure, false);
        }
    };

    handleClickSure = function (e) {
        actionSure();
    };

    handleClickCancel = function (e) {
        actionCancel();
    };

    remove = function () {
        document.body.removeChild(domMap.dialog);
    };

    return {//外部可调用的接口函数
        show: showLightDialog,  //弹出对话框
        remove: remove  //移除对话框
    };
}());

/**
 * lightBlock  可自定义的提示色块
 */
var lightBlock = (function () {
    'use strict';
    var showLightBlock;
    var configMap = {//可选配置参数
        text: '请输入提示文字',  //设置提示文本
        time: 2,  //设置提示色块几秒后消失
        bottom: 55,  //设置提示色块，距离页面底部的距离，单位px
        isVerticalMiddle: false,  //设置是否在垂直方向上，居中提示色块
        isStaticWidth: false,  //设置是否固定提示色块的宽度
        width: 120,  //设置提示色块的宽度
        isVerticalTop: false,  //设置是否在垂直方向上，依据页面头部布局
        top: 5,  //设置提示色块，距离页面头部的距离，单位px
        bgColor: '#000',  //设置提示色块背景色
        color: '#fff'  //设置提示色块文字颜色
    };
    var stateMap = {
        block: null
    };
    var myConfigMap;

    showLightBlock = function (initMap) {
        var div;
        if (!initMap) {
            myConfigMap = configMap;
        }
        if (typeof initMap === 'string') {
            configMap.text = initMap;
            myConfigMap = configMap;
        }
        if (initMap && typeof initMap === 'object') {
            myConfigMap = $.extend(true, {}, configMap, initMap);
        }
        div = document.createElement('div');
        div.id = 'light-block';
        div.className = 'light-block';
        if (myConfigMap.isVerticalMiddle) {
            div.style.bottom = '50%';
            div.style.webkitTransform = 'translate3d(-50%, 50%, 0)';
            div.style.transform = 'translate3d(-50%, 50%, 0)';
        } else if (myConfigMap.isVerticalTop) {
            div.style.bottom = 'auto';
            div.style.top = myConfigMap.top + 'px';
        } else {
            div.style.bottom = myConfigMap.bottom + 'px';
        }
        if (myConfigMap.isStaticWidth) {
            div.style.width = myConfigMap.width + 'px';
        }
        div.style.backgroundColor = myConfigMap.bgColor;
        div.style.color = myConfigMap.color;
        div.innerHTML = myConfigMap.text;
        document.body.appendChild(div);
        stateMap.block = div;
        setTimeout(function () {
            document.body.removeChild(div);
        }, myConfigMap.time * 1000);
    };

    return {//外部可调用的接口函数
        show: showLightBlock  //弹出提示色块
    };
}());

/**
 * dialogSelector  对话框模式的选择列表（目前用于让用户选择题目的奖励分数）
 */
var dialogSelector = (function () {
    'use strict';
    var showDialogSelector;
    var createHtml;
    var configMap = {//可选配置参数
        scoreList: [1, 2, 5, 10]  //通过传入一个数组，设置各选项的分数
    };
    var myConfigMap;
    var domMap = {
        dialogSelector: dialogSelector
    };
    var stateMap = {
        score: 0
    };
    var delayTime = 300;
    var remove;
    var handleClickBox, handleClickWrapper;
    var getScore;
    var selectedCallBack;

    createHtml = function () {
        var html = [];
        var div = document.createElement('div');
        var i = 0;

        div.id = 'dialog-selector-wrapper';
        div.className = 'dialog-selector-wrapper';
        html.push('<div class="dialog-selector-box">');
        html.push('<ul>');
        for (i = 0; i < myConfigMap.scoreList.length; i++ ) {
            if (stateMap.score === 0) {
                if (i === 0) {
                    html.push('<li class="selected" data-score="'+ myConfigMap.scoreList[i] +'"><label>'+ myConfigMap.scoreList[i] +'</label>分<span><i></i></span></li>');
                } else {
                    html.push('<li data-score="'+ myConfigMap.scoreList[i] +'"><label>'+ myConfigMap.scoreList[i] +'</label>分<span><i></i></span></li>');
                }
            } else {
                if (stateMap.score === myConfigMap.scoreList[i]) {
                    html.push('<li class="selected" data-score="'+ myConfigMap.scoreList[i] +'"><label>'+ myConfigMap.scoreList[i] +'</label>分<span><i></i></span></li>');
                } else {
                    html.push('<li data-score="'+ myConfigMap.scoreList[i] +'"><label>'+ myConfigMap.scoreList[i] +'</label>分<span><i></i></span></li>');
                }
            }
        }
        html.push('</ul>');
        html.push('</div>');
        div.innerHTML = html.join('');
        document.body.appendChild(div);
        domMap.dialogSelector = div;
        $('.dialog-selector-box li').bind('click', handleClickBox);
        $('#dialog-selector-wrapper').bind('click', handleClickWrapper);
    };

    handleClickBox = function (e) {
        var temp = $(this);
        temp.addClass('selected').siblings('li').removeClass('selected');
        stateMap.score = temp.data('score');
        setTimeout(function () {

            selectedCallBack();
        }, delayTime);
        e.stopPropagation();
    };

    handleClickWrapper = function (e) {
        remove();
        e.stopPropagation();
    };

    selectedCallBack = function () {
        remove();
    };

    remove = function () {
        document.body.removeChild(domMap.dialogSelector);
    };

    getScore = function () {
        return stateMap.score;
    };

    showDialogSelector = function (initMap, callback) {//initMap：配置参数，callback：用户选择某选项时的回调函数
        if (!initMap) {
            myConfigMap = configMap;
        }
        if (initMap && typeof initMap === 'object' && initMap.length) {
            configMap.scoreList = initMap;
            myConfigMap = configMap;
        } else {
            myConfigMap = configMap;
        }
        if (callback && typeof callback === 'function') {
            selectedCallBack = callback;
        }
        createHtml();
    };

    return {//外部可调用的接口函数
        show: showDialogSelector,  //弹出选择对话框
        remove: remove,  //移除选择对话框
        getScore: getScore  //得到用户选择的分数
    };
}());

/**
 * swipeAjax  向上滑动异步加载
 */

var swipeAjax = (function ($) {
    'use strict';
    var startY;
    var endY;
    var gap;
    var ajaxCount = 0;  //一次滑动请求次数，防止多次ajax请求
    var getAjaxCount, setAjaxCount;
    var tapstart, tapmove, tapend;
    var handleTap;
    var bindTapEvent;
    var handleUpAjax;
    var handleDownAjax;
    var stateMap = {
        'clientWidth': window.innerWidth,
        'clientHeight': window.innerHeight
    };
    var domMap = {
        node: document.body
    };

    if (typeof window.ontouchstart !== 'undefined') {
        tapstart = 'touchstart';
        tapmove = 'touchmove';
        tapend = 'touchend';
    } else if (typeof window.onmspointerdown !== 'undefined') {
        tapstart = 'MSPointerDown';
        tapmove = 'MSPointerMove';
        tapend = 'MSPointerUp';
    } else {
        tapstart = 'mousedown';
        tapmove = 'mousemove';
        tapend = 'mouseup';
    }

    handleTap = function (e) {
        switch (e.type) {
            case 'mousedown':
            case 'MSPointerDown':
            case 'touchstart':
                startY = e.touches ? e.touches[0].screenY : e.screenY;
                endY = startY;
                break;
            case 'mousemove':
            case 'MSPointerMove':
            case 'touchmove':
                endY = e.touches ? e.touches[0].screenY : e.screenY;
                gap = endY - startY;
                if (stateMap.clientHeight + domMap.node.scrollTop  + 50 >= domMap.node.scrollHeight) {
                    if (gap < -5) {
                        ajaxCount++;
                        if (ajaxCount === 1) {
                            handleUpAjax && handleUpAjax();
                        }
                    }
                }
                if (domMap.node.scrollTop < 10) {
                    if (gap > 5) {
                        ajaxCount++;
                        if (ajaxCount === 1) {
                            handleDownAjax && handleDownAjax();
                        }
                    }                	
                }
                break;
            case 'mouseup':
            case 'MSPointerCancel':
            case 'MSPointerUp':
            case 'touchcancel':
            case 'touchend':
                break;
        }
    };

    bindTapEvent = function (node, upCallback, downCallback) {//node：绑定touch事件的节点，callback：事件发生时回调函数
        if (node && node !== document) {
            node.addEventListener(tapstart, handleTap, false);
            node.addEventListener(tapmove, handleTap, false);
            node.addEventListener(tapend, handleTap, false);
            stateMap.clientWidth = node.clientWidth;
            stateMap.clientHeight = node.clientHeight;
            domMap.node = node;
        } else {
            document.addEventListener(tapstart, handleTap, false);
            document.addEventListener(tapmove, handleTap, false);
            document.addEventListener(tapend, handleTap, false);
        }
        if (upCallback) {
            handleUpAjax = upCallback;
        }
        if (downCallback) {
        	handleDownAjax = downCallback;
        }
    };

    getAjaxCount = function () {
        return ajaxCount;
    };

    setAjaxCount = function (num) {
        ajaxCount = num;
    };

    return {//外部可调用的接口函数
        bindTapEvent: bindTapEvent,  //为某节点
        getAjaxCount: getAjaxCount,  //得到当前的ajax请求数目
        setAjaxCount: setAjaxCount  //重置ajax请求，用于清零，防止多次ajax请求
    };
}(jQuery));

/**
 * simpleRichEditor  简单的富文本编辑器（@功能，上传图片功能）
 */
var simpleRichEditor = (function () {
    'use strict';
    var createAtList, insertAtList, insertImage, atListStr;
    var createUploader, uploader, refreshUploader, destroyUploader;
    var handleFilesAdded, handleUploadProgress, handleFileUploaded, handleUploadComplete, handleUploadError;
    var startUpload;
    var uploadCallback;
    var init;
    var richEditor;
    var handleEditorFocus, handleEditorBlur;
    var getJson, getHtml, getText;
    var showProgress;
    var stateMap = {
        richEditorCont: '请在此输入内容'
    };
    var jqueryMap = {
        $richEditor: null,
        progressWrapper: null,
        progressLabel: null,
        progressSpan: null,
        progressCancelBtn: null
    };
    var prefixImgUrl;
    var interId;
    var isAndroid = browserUtil.isAndroid();

    /* @ 功能 */
    createAtList = function (data) {//通过传入JSON格式的数据，生成span标签
        var len, tempObj;
        var attr = '', cont ='', aid = '';
        var html = '';
        var created;
        if (!data) {
            return false;
        }
        len = data.length;
        for (var i = 0; i < len; i++) {
            tempObj = data[i];
            attr = '';
            for (var prop in tempObj) {
                if (tempObj.hasOwnProperty(prop)) {
                    if (prop === 'name') {//name 是一个约定的属性，必须含有，用于填充span标签
                        cont = tempObj[prop];
                    }
                    if (prop === 'id') {//id 是一个约定的属性，必须含有，用于标记span标签
                        aid = tempObj['id'];
                        created = jqueryMap.$richEditor.find('#aid' + aid);
                        if (created.length > 0) {
                            created.remove();
                        }
                    }
                    attr += ('data-' + prop + '="' + tempObj[prop] + '" ');
                }
            }
            html += ('<span class="set-color" id="aid'+ aid +'" ' + attr + '>@' + cont + '</span>&nbsp;');
        }
        jqueryMap.$richEditor.html(jqueryMap.$richEditor.html().replace(/(&nbsp;){2,}/g, ''));        
        atListStr = html;
        insertAtList(html);
    };

    insertAtList = function (html) {//向富文本框中插入用户@的列表
        if (richEditor.innerHTML === stateMap.richEditorCont) {
            richEditor.innerHTML = '';
        }
        jqueryMap.$richEditor.append(html);
    };

    insertImage = function (uri) {//向富文本框中插入用户上传的图片
    	var wrapperDiv;
        var tempImageBoxDiv;
        var tempWrapperImageDiv;
        var img = new Image();
        if (richEditor.innerHTML === stateMap.richEditorCont) {
            richEditor.innerHTML = '';
        }
        if (isAndroid) {
            tempImageBoxDiv = document.createElement('div');
            tempImageBoxDiv.className = 'temp-image-box';
            tempImageBoxDiv.setAttribute('contenteditable', 'false');
            tempWrapperImageDiv = document.createElement('div');
            tempWrapperImageDiv.className = 'temp-wrapper-image';
            img.src = uri+"-480x480";
            img.onload = function () {
                $(tempWrapperImageDiv).html('').append(img).append('<span class="temp-delete-btn"  onclick="deleteImage(this);"><i class="fa fa-times"></i></span>');
            };
            tempImageBoxDiv.appendChild(tempWrapperImageDiv);
            tempWrapperImageDiv.innerHTML = '<img src="'+ _baseImagePath +'/loading.png" />';
            jqueryMap.$richEditor.append(tempImageBoxDiv).append('&nbsp;');
        } else {
            wrapperDiv = document.createElement('div');
            img.src = uri+"-480x480";
            img.onload = function () {
                wrapperDiv.innerHTML = '';
                wrapperDiv.appendChild(img);
            };
            wrapperDiv.innerHTML = '<img src="'+ _baseImagePath +'/loading.png" />';
            richEditor.appendChild(wrapperDiv);
        }
        refreshUploader();  //似乎没用
    };

    handleEditorFocus = function () {
        if (richEditor.innerHTML === stateMap.richEditorCont) {
            richEditor.innerHTML = '';
        }
        richEditor.className = 'simple-rich-editor active';
        //document.documentElement.style.height = 'auto';
    };

    handleEditorBlur = function () {
        //document.documentElement.style.height = '100%';
    };

    showProgress =  function () {//显示上传进度
        var html;
        var div = document.createElement('div');
        div.id = 'upload-progress-wrapper';
        div.className = 'upload-progress-wrapper';
        
        html =
            '<div class="upload-progress-box">'
            + '<dl><dt ><label id="progress-label">0</label>%</dt>'
            + '<dd>'
            + '<span id="progress-span" style="width:1%;"></span>'
            + '</dd></dl>'
            + '<div id="progress-cancel-btn" class="progress-cancel-btn">取消</div>'
            + '</div>';

        div.innerHTML = html;
        document.body.appendChild(div);
        jqueryMap.progressWrapper = div;
        jqueryMap.progressLabel = document.getElementById('progress-label');
        jqueryMap.progressSpan = document.getElementById('progress-span');
        jqueryMap.progressCancelBtn = document.getElementById('progress-cancel-btn');
        jqueryMap.progressCancelBtn.addEventListener('click', function (e) {
            refreshUploader();
            document.body.removeChild(jqueryMap.progressWrapper);
            e.stopPropagation();
        }, false);
       
    };

    /* 上传图片功能 */
    createUploader = function (browseBtn, container, handlerUrl, tokenStr, prefixUrl) {//browseBtn：定义上传按钮，container：：定义上传按钮的父容器，handlerUrl：定义后台处理程序的地址
    	prefixImgUrl = prefixUrl;
    	uploader =  new plupload.Uploader({
            runtimes: 'html5,flash,silverlight,html4',
            browse_button: browseBtn, //可传入id
            container: container,
            url: handlerUrl,  //处理程序地址            
            flash_swf_url: 'js/plupload/Moxie.swf',
            silverlight_xap_url: 'js/plupload/Moxie.xap',
            filters: {
                max_file_size: '5mb',
                mime_types: [
                    {title: "Image files", extensions: "jpg,gif,png"}
                ]
            },
            multipart: true,
            multipart_params: {'token': tokenStr},
            multi_selection: false
        });
        uploader.bind('FilesAdded', handleFilesAdded);
        uploader.bind('UploadProgress', handleUploadProgress);
        uploader.bind('FileUploaded', handleFileUploaded);
        //uploader.bind('UploadComplete', handleUploadComplete);  //所有文件上传成功时触发
        uploader.bind('Error', handleUploadError);
        uploader.init();
    };

    handleFilesAdded = function (up, files) {//用户选择了一个文件
        var type = 'FilesAdded';
        uploadCallback(type, up, files);
    };

    handleUploadProgress = function (up, file) {//正在上传
        var type = 'UploadProgress';
        uploadCallback(type, up, file);
    };

    handleFileUploaded = function (up, file, res) {//单个文件上传成功
        var type = 'FileUploaded';
        uploadCallback(type, up, file, res);
    };

    handleUploadComplete = function (up, file) {//所有文件上传成功
        var type = 'UploadComplete';
        uploadCallback(type, up, file);
    };

    handleUploadError = function (up, err) {//上传出错
        var type = 'UploadError';
        uploadCallback(type, up, err);
    };

    startUpload = function () {//执行上传
        uploader.start();
    };

    refreshUploader = function () {//刷新uploader
        uploader.stop();
        uploader.refresh();
    };

    destroyUploader = function () {//删除uploader
        uploader.destroy();
    };

    uploadCallback = function (type, up, temp, res) {//temp可能为files,file,err
        switch (type) {
            case 'FilesAdded':
                $.each(up.files, function (i, file) {
                    if (up.files.length <= 1) {
                        return;
                    }
                    up.removeFile(file);
                });
                showProgress();
                startUpload();
                //interId = setInterval(function () {
                	//var per = uploader.files[0].percent;
	                //jqueryMap.progressLabel.innerHTML = per;
	                //jqueryMap.progressSpan.style.width = per + '%';
                //}, 30);
                break;
            case 'UploadProgress':
                jqueryMap.progressLabel.innerHTML = temp.percent;
                jqueryMap.progressSpan.style.width = temp.percent + '%';
                break;
            case 'FileUploaded':
                document.body.removeChild(jqueryMap.progressWrapper);
                //clearInterval(interId);
                insertImage(prefixImgUrl + JSON.parse(res.response).url);  //后台必须在上传成功时，返回一个包含图片URI的JSON格式的数据                
                break;
            case 'UploadComplete':
                console.log('暂无操作！');
                break;
            case 'UploadError':
				if (jqueryMap.progressWrapper) {
					document.body.removeChild(jqueryMap.progressWrapper);
				}
                //clearInterval(interId);
                console.log('Code:' + temp.code + '; Message:' + temp.message);
                break;
            default:
                console.log('it is impossible to here!');
        }
    };

    getJson = function (container, selector) {//依据传入的选择器，筛选出的相关节点，通过这些节点，生成JSON数据
        var $container = $(container);
        var objList = $container.find(selector);
        var len = objList.length;
        var resultList = [];
        if (!len) {
            return null;
        }
        for (var i = 0; i < len; i++) {
            resultList.push($(objList[i]).data());
        }
        return resultList;
    };

    getHtml = function () {//得到富文本编辑html格式的内容
    	var temp;
        if (richEditor.innerHTML === stateMap.richEditorCont) {
            richEditor.innerHTML = '';
        }
        temp = richEditor.innerHTML;
        return temp.replace(/&nbsp;/g, '');
    };
    
    getText = function () {
    	var temp;
        if (richEditor.innerHTML === stateMap.richEditorCont) {
            richEditor.innerHTML = '';
        }
        temp = $(richEditor).text();
        return temp;
    };

    init = function (id, cont) {//id：富文本编辑器的id， cont：富文本编辑器初始默认的文字内容
        richEditor = document.getElementById(id);
        jqueryMap.$richEditor = $(richEditor);
        richEditor.setAttribute('contenteditable', true);
        if (cont) {
            richEditor.innerHTML = cont;
            stateMap.richEditorCont = cont;
        } else {
            richEditor.innerHTML = stateMap.richEditorCont;
        }
        richEditor.addEventListener('focus', handleEditorFocus, false);
        richEditor.addEventListener('blur', handleEditorBlur, false);
    };

    return {//外部可调用的接口函数
        init: init,  //初始化富文本编辑器
        createAtList: createAtList,  //根据JSON格式的数据生成@列表
        createUploader: createUploader,  //初始化上传图片功能
        getJson: getJson,  //根据传入的选择器，生成JSON格式的数据
        getHtml: getHtml,  //得到富文本编辑器的HTML代码
        getText: getText
    };
}());

/**
 * uploadImage  上传图片
 */
var uploadImage = (function () {
    'use strict';
    var createUploader, uploader, refreshUploader, destroyUploader;
    var handleFilesAdded, handleUploadProgress, handleFileUploaded, handleUploadComplete, handleUploadError;
    var startUpload;
    var uploadCallback;
    var showProgress;
    var showIconProgress;
    var jqueryMap = {
        progressWrapper: null,
        progressLabel: null,
        progressSpan: null,
        progressCancelBtn: null,
        iconContainer: null,
        iconProgressBox: null,
        progressIconLabel: null,
        progressIconSpan: null
    };
    var prefixImgUrl;
    var isUploadIcon = false;

    showProgress =  function () {//显示上传进度
        var html;
        var div = document.createElement('div');
        div.id = 'upload-progress-wrapper';
        div.className = 'upload-progress-wrapper';

        html =
            '<div class="upload-progress-box">'
            + '<dl><dt ><label id="progress-label">0</label>%</dt>'
            + '<dd>'
            + '<span id="progress-span" style="width:1%;"></span>'
            + '</dd></dl>'
            + '<div id="progress-cancel-btn" class="progress-cancel-btn">取消</div>'
            + '</div>';

        div.innerHTML = html;
        document.body.appendChild(div);
        jqueryMap.progressWrapper = div;
        jqueryMap.progressLabel = document.getElementById('progress-label');
        jqueryMap.progressSpan = document.getElementById('progress-span');
        jqueryMap.progressCancelBtn = document.getElementById('progress-cancel-btn');
        jqueryMap.progressCancelBtn.addEventListener('click', function (e) {
            refreshUploader();
            document.body.removeChild(jqueryMap.progressWrapper);
            e.stopPropagation();
        }, false);

    };

    showIconProgress = function () {
        var html =
                '<div class="box-upload-show" id="box-upload-show">'
                + '<label id="box-percent">0%</label>'
                + '<div class="box-progress" id="box-progress" style="height:0%;">'
                + '</div>'
                + '</div>';
        jqueryMap.iconContainer.innerHTML = html;
        jqueryMap.iconProgressBox = document.getElementById('box-upload-show');
        jqueryMap.progressIconLabel = document.getElementById('box-percent');
        jqueryMap.progressIconSpan = document.getElementById('box-progress');
    };

    /* 上传图片功能 */
    createUploader = function (browseBtn, container, handlerUrl, tokenStr, prefixUrl, iconMap) {//browseBtn：定义上传按钮，container：：定义上传按钮的父容器，handlerUrl：定义后台处理程序的地址
    	prefixImgUrl = prefixUrl;
        if (iconMap && iconMap.container) {
            jqueryMap.iconContainer = iconMap.container;
            isUploadIcon = true;
        }
        uploader =  new plupload.Uploader({
            runtimes: 'html5,flash,silverlight,html4',
            browse_button: browseBtn, //可传入id
            container: container,
            url: handlerUrl,  //处理程序地址
            flash_swf_url: 'js/plupload/Moxie.swf',
            silverlight_xap_url: 'js/plupload/Moxie.xap',
            filters: {
                max_file_size: '5mb',
                mime_types: [
                    {title: "Image files", extensions: "jpg,gif,png"}
                ]
            },
            multipart: true,
            multipart_params: {'token': tokenStr},
            multi_selection: false
        });
        uploader.bind('FilesAdded', handleFilesAdded);
        uploader.bind('UploadProgress', handleUploadProgress);
        uploader.bind('FileUploaded', handleFileUploaded);
        //uploader.bind('UploadComplete', handleUploadComplete);  //所有文件上传成功时触发
        uploader.bind('Error', handleUploadError);
        uploader.init();
    };

    handleFilesAdded = function (up, files) {//用户选择了一个文件
        var type = 'FilesAdded';
        uploadCallback(type, up, files);
    };

    handleUploadProgress = function (up, file) {//正在上传
        var type = 'UploadProgress';
        uploadCallback(type, up, file);
    };

    handleFileUploaded = function (up, file, res) {//单个文件上传成功
        var type = 'FileUploaded';
        uploadCallback(type, up, file, res);
    };

    handleUploadComplete = function (up, file) {//所有文件上传成功
        var type = 'UploadComplete';
        uploadCallback(type, up, file);
    };

    handleUploadError = function (up, err) {//上传出错
        var type = 'UploadError';
        uploadCallback(type, up, err);
    };

    startUpload = function () {//执行上传
        uploader.start();
    };

    refreshUploader = function () {//刷新uploader
        uploader.stop();
        uploader.refresh();
    };

    destroyUploader = function () {//删除uploader

        uploader.destroy();
    };

    uploadCallback = function (type, up, temp, res) {//temp可能为files,file,err
        switch (type) {
            case 'FilesAdded':
                $.each(up.files, function (i, file) {
                    if (up.files.length <= 1) {
                        return;
                    }
                    up.removeFile(file);
                });
                if (!isUploadIcon) {
                    showProgress();
                } else {
                    showIconProgress();
                }
                startUpload();
                break;
            case 'UploadProgress':
                if (!isUploadIcon) {
                    jqueryMap.progressLabel.innerHTML = temp.percent;
                    jqueryMap.progressSpan.style.width = temp.percent + '%';
                } else {
                    jqueryMap.progressIconLabel.innerHTML = temp.percent + '%';
                    jqueryMap.progressIconSpan.style.height = temp.percent + '%';
                }

                break;
            case 'FileUploaded':
                if (!isUploadIcon) {
                    document.body.removeChild(jqueryMap.progressWrapper);
                } else {
                    jqueryMap.iconContainer.removeChild(jqueryMap.iconProgressBox);
                }
                insertImage(prefixImgUrl + JSON.parse(res.response).url, JSON.parse(res.response).url);
                break;
            case 'UploadComplete':
                console.log('暂无操作！');
                break;
            case 'UploadError':
                if (!isUploadIcon) {
                    jqueryMap.progressWrapper && document.body.removeChild(jqueryMap.progressWrapper);
                } else {
                    jqueryMap.iconProgressBox && jqueryMap.iconContainer.removeChild(jqueryMap.iconProgressBox);
                    jqueryMap.iconContainer.className = 'image-header upload-error';
                }
                console.log('Code:' + temp.code + '; Message:' + temp.message);
                break;
            default:
                console.log('it is impossible to here!');
        }
    };

    return {//外部可调用的接口函数
        createUploader: createUploader  //初始化上传图片功能
    };
}());

//处理中
var showHandling = function () {
    var html = '<div class="module-handling" id="module-handling"><i class="fa fa-spinner fa-pulse"></i></div>';
    $('body').append(html);
    document.getElementById('module-handling').addEventListener('touchstart', function (e) {
        return false;
    }, false);
};

//Html编码获取Html转义实体
function htmlEncode(value) {
    return $('<div/>').text(value).html();
}

//Html解码获取Html实体
function htmlDecode(value) {
    return $('<div/>').html(value).text();
}

function toUserDetail(uid) {
    window.open("/student/m/ext/enn/user/aboutsb.xhtml?uid="+uid);
}

//写cookies 

function setCookie(name,value,Days) 
{ 

	if(Days==null){
	 var Days = 30;
	}
    
    var exp = new Date(); 
    exp.setTime(exp.getTime() + Days*24*60*60*1000); 
    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString(); 
} 

//读取cookies 
function getCookie(name) 
{ 
    var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
 
    if(arr=document.cookie.match(reg))
 
        return unescape(arr[2]); 
    else 
        return null; 
} 

//删除cookies 
function delCookie(name) 
{ 
    var exp = new Date(); 
    exp.setTime(exp.getTime() - 1); 
    var cval=getCookie(name); 
    if(cval!=null) 
        document.cookie= name + "="+cval+";expires="+exp.toGMTString(); 
} 